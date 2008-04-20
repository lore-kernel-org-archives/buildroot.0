From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 20 Apr 2008 07:39:51 -0700
Subject: [Buildroot] [uClibc 0002214]: fails to build toolchain with NPTL
	selected for powerpc target
Message-ID: <2d10cef1f44f0fdc67f13aa73f2f3eb3@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
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
Status:                     feedback
====================================================================== 
Date Submitted:             02-18-2008 01:14 PST
Last Modified:              04-20-2008 07:39 PDT
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

---------------------------------------------------------------------- 
 fabo - 04-20-08 07:30  
---------------------------------------------------------------------- 
The bug was reported for NPTL/powerpc usage. Not MIPS.
By the way, the bug is still valid:
fails to build toolchain with NPTL selected for powerpc target

suggesting to use linuxthreads.old implementation for pthread is a
workaround, not a bug resolution. 

---------------------------------------------------------------------- 
 carmelo73 - 04-20-08 07:39  
---------------------------------------------------------------------- 
Sorry, I was thinking to mips... anyway powerpc is not currently
implementing nptl. 

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
04-19-08 23:22  carmelo73      Resolution               open => suspended   
04-20-08 07:30  fabo           Status                   closed => feedback  
04-20-08 07:30  fabo           Resolution               suspended => reopened
04-20-08 07:30  fabo           Note Added: 0006744                          
04-20-08 07:39  carmelo73      Note Added: 0006754                          
======================================================================
