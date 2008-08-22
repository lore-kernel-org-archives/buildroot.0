From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 22 Aug 2008 06:59:06 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20080822135906.CF3E53C669@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-22 06:59:06 -0700 (Fri, 22 Aug 2008)
New Revision: 23178

Log:
gcc: only use -mfloat-abi for ARM, use -msoft-float for other archs

Patch by Wade Berrier.

Modified:
   trunk/buildroot/toolchain/gcc/Makefile.in


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Makefile.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Makefile.in	2008-08-22 11:16:52 UTC (rev 23177)
+++ trunk/buildroot/toolchain/gcc/Makefile.in	2008-08-22 13:59:06 UTC (rev 23178)
@@ -40,8 +40,12 @@
 ifeq ($(BR2_SOFT_FLOAT_FP),y)
 TARGET_SOFT_FLOAT:=-mfloat-abi=softfp
 else # no fp at all
+ifeq ($(BR2_arm),y) # only set float-abi for arm
 TARGET_SOFT_FLOAT:=-mfloat-abi=soft
+else
+TARGET_SOFT_FLOAT:=-msoft-float
 endif
+endif
 else # not gcc-4.x
 TARGET_SOFT_FLOAT:=-msoft-float
 endif
