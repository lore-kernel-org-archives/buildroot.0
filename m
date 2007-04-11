From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 11 Apr 2007 05:46:18 -0700
Subject: [Buildroot] [buildroot 0001309]: Busybox 1.5.0 build crashes when
	building miscutils/patchset.c under buildroot
Message-ID: <226d87f12595209fd96a821038362ce8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
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
Resolution:                 open
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
======================================================================
