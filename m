From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:48:00 -0800
Subject: [Buildroot] [buildroot 0000064]: ldd segfault when uclibc is build
	with security options enabled
Message-ID: <03d55c3fd424c24a05b776643e49e599@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=64 
====================================================================== 
Reported By:                babel
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   64
Category:                   Security
Reproducibility:            always
Severity:                   crash
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-27-2005 00:18 PST
Last Modified:              02-12-2007 05:47 PST
====================================================================== 
Summary:                    ldd segfault when uclibc is build with security
options enabled
Description: 
I've used the attached dot-config files to build a complete buildroot with
ldd. Enabling the security options in uClibc gives the result shown below.
Just disabling the uClibc security options and rebuild result in a working
ldd.
====================================================================== 

---------------------------------------------------------------------- 
 psm - 02-06-05 11:20  
---------------------------------------------------------------------- 
I wonder why BUILD_SSP is selected, that is only allowed for specially
patched
gcc, that is not supported by buildroot (HAS_SSP maybe be left in)
if you have patched your buildroot's gcc with the propolice patch, and 
enable HAS_SSP, you'll have 2 __guard/__stack_smash_handler, one living in
libc
the other in libgcc_s.so
Currently the *SSP*/*PROPOLICE* options are only usable in gentoo distro 

---------------------------------------------------------------------- 
 prpplague - 01-25-06 12:36  
---------------------------------------------------------------------- 
resolved in latest build 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-27-05 00:18  babel          New Issue                                    
01-27-05 00:18  babel          File Added: dot-config.tar.bz2                   

01-27-05 00:18  babel          Issue Monitored: babel                       
02-06-05 11:20  psm            Note Added: 0000043                          
03-16-05 12:13  andersen       Status                   new => assigned     
03-16-05 12:13  andersen       Assigned To               => uClibc          
01-25-06 12:36  prpplague      Note Added: 0001004                          
01-25-06 12:36  prpplague      Status                   assigned => resolved
01-25-06 12:36  prpplague      Resolution               open => fixed       
03-08-06 16:52  vapier         Status                   resolved => closed  
02-12-07 05:47  vapier         Status                   closed => assigned  
02-12-07 05:47  vapier         Assigned To              uClibc => buildroot 
======================================================================
