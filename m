From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 30 Apr 2007 04:50:37 -0700
Subject: [Buildroot] [buildroot 0001309]: Busybox 1.5.0 build crashes when
	building miscutils/patchset.c under buildroot
Message-ID: <bff4d37d79edef89ce87b85d0796a599@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The issue 0001327 has been set as DUPLICATE OF the following issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1309 
====================================================================== 
Reported By:                Ulf Samuelsson
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1309
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 no change required
Fixed in Version:           
====================================================================== 
Date Submitted:             04-11-2007 03:44 PDT
Last Modified:              04-11-2007 05:46 PDT
====================================================================== 
Summary:                    Busybox 1.5.0 build crashes when building
miscutils/patchset.c under buildroot
Description: 
It seems that there is some undefined "defines"'s in the "taskset.c"

CPU_ISSET
CPU_SETSIZE
CPU_ZERO
CPU_SET

They are supposed to be set in "include/sched.h", and they are present in


/usr/include/sched.h 

on my OpenSuse 10.2 PC, but they are not present in the linux-2.6.20.4
tarball

I could not find them in the toolchain includes...


There is a compile error at line 17 as well...

======================================================================
Relationships       ID      Summary
----------------------------------------------------------------------
has duplicate       0001327 busybox taskset.c fail to build.
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 04-11-07 05:46  
---------------------------------------------------------------------- 
1) this is not a buildroot issue.
2) read the helptext for taskset
3) if you need taskset, use uClibc-trunk 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-11-07 03:44  Ulf Samuelsson New Issue                                    
04-11-07 03:44  Ulf Samuelsson Status                   new => assigned     
04-11-07 03:44  Ulf Samuelsson Assigned To               => buildroot       
04-11-07 05:46  bernhardf      Status                   assigned => closed  
04-11-07 05:46  bernhardf      Note Added: 0002306                          
04-11-07 05:46  bernhardf      Resolution               open => no change
required
04-30-07 04:50  bernhardf      Relationship added       has duplicate 0001327
======================================================================
