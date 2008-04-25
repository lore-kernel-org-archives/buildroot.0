From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 24 Apr 2008 22:27:33 -0700
Subject: [Buildroot] [uClibc 0002214]: fails to build toolchain with NPTL
	selected for powerpc target
Message-ID: <392a1bd7c7b19b5b45fb89baf411d6c4@bugs.uclibc.org>
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
Resolution:                 reopened
Fixed in Version:           
====================================================================== 
Date Submitted:             02-18-2008 01:14 PST
Last Modified:              04-24-2008 22:27 PDT
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

---------------------------------------------------------------------- 
 carmelo73 - 04-24-08 22:27  
---------------------------------------------------------------------- 
Currently, for what I know, there are no plan to port NPTL on powerpc,
and I don't know is somebody is working on it.
So this isseu will be closed as 'won't fix'.
If you interested ito providing this support for powerpc arch, that you
are using,
feel free to start working on it and provide such patches.
Currently the nptl-branch should be your starting point. 

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
04-24-08 22:27  carmelo73      Status                   feedback => closed  
04-24-08 22:27  carmelo73      Note Added: 0007114                          
======================================================================
