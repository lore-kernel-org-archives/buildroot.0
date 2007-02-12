From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:45:00 -0800
Subject: [Buildroot] [buildroot 0000886]: awk does not call END if next is
	called on last last line of input and input file has no newline.
Message-ID: <9fa9e952381fd7ad8ee8644c3bb0d794@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=886 
====================================================================== 
Reported By:                limey
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   886
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             05-29-2006 10:27 PDT
Last Modified:              02-12-2007 05:44 PST
====================================================================== 
Summary:                    awk does not call END if next is called on last last
line of input and input file has no newline.
Description: 
The END section of my awk script does not get called if i match the final
line of the input file, call next, and the input file does not end in a
new line. If I add new lines to the end of the input file, all is well. If
I do not call next after the match, all is well.

This is differnt to the result I get with the awk program shipped with
Fedora Core 4. 

====================================================================== 

---------------------------------------------------------------------- 
 limey - 05-29-06 10:37  
---------------------------------------------------------------------- 
Should be reproducable using the attached files:

./awk -f script.awk input_newline.txt
BEGIN
matched
END

./awk -f script.awk input_no_newline.txt
BEGIN
matched


The second with the no newline input does not produce END. 

---------------------------------------------------------------------- 
 limey - 05-29-06 10:42  
---------------------------------------------------------------------- 
And to show how calling/not calling next effects this:

./awk -f script_no_next.awk input_no_newline.txt
BEGIN
matched
END


./awk -f script_no_next.awk input_newline.txt
BEGIN
matched
END


The END section gets called this time. 

---------------------------------------------------------------------- 
 vapier - 07-19-06 17:05  
---------------------------------------------------------------------- 
no idea what awk you're talking about, but assuming you're talking about
busybox's awk, busybox-1.2.0's awk works just fine with your example
scripts 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-29-06 10:27  limey          New Issue                                    
05-29-06 10:27  limey          Status                   new => assigned     
05-29-06 10:27  limey          Assigned To               => uClibc          
05-29-06 10:37  limey          Note Added: 0001387                          
05-29-06 10:38  limey          File Added: input_newline.txt                    
05-29-06 10:38  limey          File Added: input_no_newline.txt                 
  
05-29-06 10:38  limey          File Added: script.awk                       
05-29-06 10:41  limey          File Added: script_no_next.awk                   

05-29-06 10:42  limey          Note Added: 0001388                          
05-29-06 10:42  limey          Issue Monitored: limey                       
07-19-06 17:05  vapier         Note Added: 0001539                          
07-19-06 17:05  vapier         Status                   assigned => closed  
07-19-06 17:05  vapier         Resolution               open => unable to
reproduce
02-12-07 05:44  vapier         Status                   closed => assigned  
02-12-07 05:44  vapier         Assigned To              uClibc => buildroot 
======================================================================
