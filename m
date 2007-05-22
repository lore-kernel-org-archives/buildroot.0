From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 22 May 2007 04:17:44 -0700
Subject: [Buildroot] [buildroot 0001217]: PATCH: X.org won't compile with
	newer kernel headers (joystick.h)
Message-ID: <8eb7ac2d0a0b63fd7f9f0ec3f6fea456@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1217 
====================================================================== 
Reported By:                foogod
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1217
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             02-14-2007 00:43 PST
Last Modified:              05-22-2007 04:17 PDT
====================================================================== 
Summary:                    PATCH: X.org won't compile with newer kernel headers
(joystick.h)
Description: 
The X.org server has problems compiling with newer kernel headers because
joystick.h (from the kernel headers) uses __s64 which isn't defined when
gcc is invoked with the -ansi flag (which it is when compiling xorg).

The attached patch (against 17879) works around this issue by turning off
-ansi mode for the one file which includes joystick.h.
====================================================================== 

---------------------------------------------------------------------- 
 jacmet - 05-22-07 04:17  
---------------------------------------------------------------------- 
Fixed in r18667 - Thanks! 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-14-07 00:43  foogod         New Issue                                    
02-14-07 00:44  foogod         Status                   new => assigned     
02-14-07 00:44  foogod         Assigned To               => buildroot       
02-14-07 00:44  foogod         File Added: buildroot.17879.xorg_joystick_h.patch
                   
05-22-07 04:17  jacmet         Status                   assigned => closed  
05-22-07 04:17  jacmet         Note Added: 0002394                          
======================================================================
