From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 19 Apr 2008 23:22:19 -0700
Subject: [Buildroot] [uClibc 0002214]: fails to build toolchain with NPTL
	selected for powerpc target
Message-ID: <32f9d73079ece3eef1437528c49bc15a@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=2214 
====================================================================== 
Reported By:                fabo
Assigned To:                buildroot
====================================================================== 
Project:                    uClibc
Issue ID:                   2214
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             02-18-2008 01:14 PST
Last Modified:              04-19-2008 23:22 PDT
====================================================================== 
Summary:                    fails to build toolchain with NPTL selected for
powerpc target
Description: 
libpthread/linuxthreads/sysdeps/pthread/errno-loc.c:23:27: error:
sysdep-cancel.h: No such file or directory

This is reproducible for powerpc target and NPTL support option.
Switching to another thread library implementation workarounds the issue.


====================================================================== 

---------------------------------------------------------------------- 
 sjhill - 02-23-08 14:55  
---------------------------------------------------------------------- 
uClibc NPTL is not available for the PPC architecture yet. It will be a few
months before that is available. 

---------------------------------------------------------------------- 
 sjhill - 02-23-08 14:56  
---------------------------------------------------------------------- 
This is not a buildroot issue. 

---------------------------------------------------------------------- 
 carmelo73 - 04-19-08 23:22  
---------------------------------------------------------------------- 
NTPL mips is available in branch, not on the main stream.
Use branch (that is still under development) otherwise use
linuxthreads.old
implementation for pthread. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-18-08 01:14  fabo           New Issue                                    
02-18-08 01:14  fabo           Status                   new => assigned     
02-18-08 01:14  fabo           Assigned To               => buildroot       
02-18-08 01:15  fabo           Issue Monitored: fabo                        
02-23-08 14:55  sjhill         Note Added: 0005274                          
02-23-08 14:56  sjhill         Note Added: 0005284                          
02-23-08 14:57  sjhill         Project                  buildroot => uClibc 
04-19-08 23:22  carmelo73      Status                   assigned => closed  
04-19-08 23:22  carmelo73      Note Added: 0006734                          
======================================================================
