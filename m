From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:48:42 -0800
Subject: [Buildroot] [buildroot 0000334]: atomicity.h for x86
Message-ID: <3eb97a06ecc0c2c67e7e27708f0562c2@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=334 
====================================================================== 
Reported By:                Vincent
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   334
Category:                   Architecture Specific
Reproducibility:            have not tried
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-11-2005 08:50 PDT
Last Modified:              02-12-2007 05:48 PST
====================================================================== 
Summary:                    atomicity.h for x86
Description: 
__exchange_and_add() doesn't work when cross compiling in C++ using the
i386/gcc 3.4.4 toolchain from buildroot, especially with string.
The xaddl is not correctly recognized; and the function
__exchange_and_add() doesn't belong to the namespace __gnu_cxx

Here is the atomicity.h file I use, adapted from the one of slackware
10.0
(for C it seems) glibc 2.3.4 and gcc 3.3.4 
beware: there is no compare_and_swap() anymore
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-11-05 08:50  Vincent        New Issue                                    
07-11-05 08:50  Vincent        File Added: atomicity.h                      
01-26-06 08:02  prpplague      Status                   assigned => closed  
01-26-06 08:02  prpplague      Resolution               open => won't fix   
01-26-06 08:02  prpplague      Additional Information Updated                   

02-12-07 05:48  vapier         Status                   closed => assigned  
02-12-07 05:48  vapier         Assigned To              uClibc => buildroot 
======================================================================
