From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:44:57 -0800
Subject: [Buildroot] [buildroot 0000513]: New target utility: mklibs
Message-ID: <bc57c0874062b60c82731c5e2f94cbbb@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=513 
====================================================================== 
Reported By:                akvadrako
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   513
Category:                   New Features
Reproducibility:            N/A
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-28-2005 09:34 PDT
Last Modified:              02-12-2007 05:44 PST
====================================================================== 
Summary:                    New target utility: mklibs
Description: 
Mklibs has been around for a while, but it should be incorporated into the
buildroot process.  What it does is recompiles all the shared libraries
under TARGET_DIR using PIC archives in STAGING_DIR.  Currently, not many
packages provide these PIC files, but maybe in the future it could become
a buildroot policy.  If the PIC file doesn't exist it's no problem.  It
just strips the library.

This is a heavily modified version of mklibs because the old one didn't
work well with the buildroot setup.  That's why I don't use the upstream
version - the patch would about as large as the program.
====================================================================== 

---------------------------------------------------------------------- 
 akvadrako - 01-27-06 16:28  
---------------------------------------------------------------------- 
Fixes a bug where libdl is stripped beyond usability and handles more
library versioning schemes. 

---------------------------------------------------------------------- 
 andersen - 08-02-06 14:20  
---------------------------------------------------------------------- 
Applied with changes, and instead using a version of mklibs.py that was
hacked up by mjn3 and me a while back, adding uClibc support. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-28-05 09:34  akvadrako      New Issue                                    
10-28-05 09:34  akvadrako      Status                   new => assigned     
10-28-05 09:34  akvadrako      Assigned To               => uClibc          
10-28-05 09:34  akvadrako      File Added: br-mklibs.patch                    
01-27-06 16:27  akvadrako      File Added: br-mklibs-v2.patch                   

01-27-06 16:28  akvadrako      Note Added: 0001016                          
08-02-06 14:20  andersen       Note Added: 0001557                          
08-02-06 14:20  andersen       Status                   assigned => closed  
08-02-06 14:20  andersen       Resolution               open => fixed       
02-12-07 05:44  vapier         Status                   closed => assigned  
02-12-07 05:44  vapier         Assigned To              uClibc => buildroot 
======================================================================
