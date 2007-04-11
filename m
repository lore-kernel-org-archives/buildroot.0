From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 11 Apr 2007 03:44:56 -0700
Subject: [Buildroot] [buildroot 0001309]: Busybox 1.5.0 build crashes when
	building miscutils/patchset.c under buildroot
Message-ID: <73522049ddc1e4c0f202c54ea3db1027@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
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
Status:                     assigned
====================================================================== 
Date Submitted:             04-11-2007 03:44 PDT
Last Modified:              04-11-2007 03:44 PDT
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

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-11-07 03:44  Ulf Samuelsson New Issue                                    
04-11-07 03:44  Ulf Samuelsson Status                   new => assigned     
04-11-07 03:44  Ulf Samuelsson Assigned To               => buildroot       
======================================================================
