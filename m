From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:33:24 -0800
Subject: [Buildroot] [buildroot 0001069]: FLOAT: buildroot mipsel with
	soft-float does not compile libgcc with -msoft-float
Message-ID: <72fc8731a9ee46eecee63062494d6de8@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1069 
====================================================================== 
Reported By:                spblinux
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1069
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-10-2006 07:32 PDT
Last Modified:              02-12-2007 05:33 PST
====================================================================== 
Summary:                    FLOAT: buildroot mipsel with soft-float does not
compile libgcc with -msoft-float
Description: 
Buildroot toolchain gcc-4.1.0/uClibc-0.9.28 mipsel
Compilation of asterisk-1.2.1 (with openwrt patches):
- asterisk works if compiled with 
  buildroot toolchain without soft-float option
- asterisk runs but does not work properly if compiled with 
  buildroot toolchain  with -msoft-float

Issue: many embedded device do not have a fpu; so -msoft-float should be
used.

Solution: when gcc is compiled libgcc has to be compiled with
-msoft-float:
the buildroot patch
 toolchain/gcc/4.1.0/100-uclibc-conf.patch
has to add
 TARGET_LIBGCC2_CFLAGS= -fPIC -msoft-float
to gcc-4.1.0/gcc/config/t-linux-uclibc.

Credits go to  David Wuertele
(http://gcc.gnu.org/ml/gcc/2003-08/msg00634.html)
who found the solution.

It would be nice if BR2_SOFT_FLOAT=y would automagically add
-msoft-float.

Christian Ostheimer
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-10-06 07:32  spblinux       New Issue                                    
10-10-06 07:32  spblinux       Status                   new => assigned     
10-10-06 07:32  spblinux       Assigned To               => uClibc          
02-04-07 09:11  bernhardf      Summary                  buildroot mipsel with
soft-float does not compile libgcc with -msoft-float => FLOAT: buildroot mipsel
with soft-float does not compile libgcc with -msoft-float
02-12-07 05:33  vapier         Assigned To              uClibc => buildroot 
======================================================================
