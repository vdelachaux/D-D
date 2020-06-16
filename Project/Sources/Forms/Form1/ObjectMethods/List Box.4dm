C_LONGINT:C283($0)

C_BLOB:C604($x)
C_OBJECT:C1216($e)

$e:=FORM Event:C1606

Case of 
		
		  //______________________________________________________
	: ($e.code=On Begin Drag Over:K2:44)
		
		  // Put a file for test
		SET FILE TO PASTEBOARD:C975(Structure file:C489)
		
		  // Append internal flag
		TEXT TO BLOB:C554("hello world";$x)
		APPEND DATA TO PASTEBOARD:C403("com.private.listbox";$x)
		
		  //______________________________________________________
	: ($e.code=On Drag Over:K2:13)
		
		  // Test for flag
		GET PASTEBOARD DATA:C401("com.private.listbox";$x)
		
		If (OK=1)  // Internal
			
			$0:=-1  // Reject
			SET CURSOR:C469(9019)
			
		Else 
			
			  // Accept file
			$0:=Choose:C955(Length:C16(Get file from pasteboard:C976(1))>0;0;-1)
			
		End if 
		
		  //______________________________________________________
	: ($e.code=On Drop:K2:12)
		
		ALERT:C41("Drop: "+Get file from pasteboard:C976(1))
		
		  //______________________________________________________
End case 