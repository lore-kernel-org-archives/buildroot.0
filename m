From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 14 Feb 2007 00:44:00 -0800
Subject: [Buildroot] [buildroot 0001217]: PATCH: X.org won't compile with
	newer kernel headers (joystick.h)
Message-ID: <9db983e8dc388d8658fe38b43866bc36@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
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
Status:                     assigned
====================================================================== 
Date Submitted:             02-14-2007 00:43 PST
Last Modified:              02-14-2007 00:44 PST
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

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-14-07 00:43  foogod         New Issue                                    
02-14-07 00:44  foogod         Status                   new => assigned     
02-14-07 00:44  foogod         Assigned To               => buildroot       
02-14-07 00:44  foogod         File Added: buildroot.17879.xorg_joystick_h.patch
                   
======================================================================
