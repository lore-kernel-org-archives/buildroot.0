From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 21 Jan 2007 03:50:11 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070121115011.299E748584@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-21 03:50:10 -0800 (Sun, 21 Jan 2007)
New Revision: 17432

Log:
- handle all gcc-4.x for the softfloat case.


Modified:
   trunk/buildroot/toolchain/gcc/Makefile.in


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Makefile.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Makefile.in	2007-01-21 11:34:14 UTC (rev 17431)
+++ trunk/buildroot/toolchain/gcc/Makefile.in	2007-01-21 11:50:10 UTC (rev 17432)
@@ -22,6 +22,7 @@
 ifeq ($(strip $(BR2_GCC_USE_SJLJ_EXCEPTIONS)),y)
 GCC_USE_SJLJ_EXCEPTIONS:=--enable-sjlj-exceptions
 endif
+
 ifeq ($(BR2_SOFT_FLOAT),y)
 # gcc 3.4.x soft float configuration is different than previous versions.
 ifeq ($(findstring 3.4.,$(GCC_VERSION)),3.4.)
@@ -30,12 +31,9 @@
 SOFT_FLOAT_CONFIG_OPTION:=--without-float
 endif
 # again... there must be a better way
-ifeq ($(findstring 4.0.,$(GCC_VERSION)),4.0.)
+ifeq ($(findstring 4.,$(GCC_VERSION)),4.)
 SOFT_FLOAT_CONFIG_OPTION:=--with-float=soft
 endif
-ifeq ($(findstring 4.1.,$(GCC_VERSION)),4.1.)
-SOFT_FLOAT_CONFIG_OPTION:=--with-float=soft
-endif
 TARGET_SOFT_FLOAT:=-msoft-float
 ARCH_FPU_SUFFIX:=_nofpu
 else
