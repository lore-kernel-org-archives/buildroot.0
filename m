From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon,  2 Apr 2007 09:18:50 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070402161850.B5DDE48013@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-04-02 09:18:48 -0700 (Mon, 02 Apr 2007)
New Revision: 18303

Log:
- make sure that we do not confuse versions (due to how findstring works)


Modified:
   trunk/buildroot/toolchain/gcc/Makefile.in


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Makefile.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Makefile.in	2007-04-02 12:37:28 UTC (rev 18302)
+++ trunk/buildroot/toolchain/gcc/Makefile.in	2007-04-02 16:18:48 UTC (rev 18303)
@@ -25,14 +25,14 @@
 
 ifeq ($(BR2_SOFT_FLOAT),y)
 # gcc 3.4.x soft float configuration is different than previous versions.
-ifeq ($(findstring 3.4.,$(GCC_VERSION)),3.4.)
+ifeq ($(findstring x3.4.,x$(GCC_VERSION)),x3.4.)
 SOFT_FLOAT_CONFIG_OPTION:=--with-float=soft
 else
 SOFT_FLOAT_CONFIG_OPTION:=--without-float
 endif
 
 # again... there must be a better way
-ifeq ($(findstring 4.,$(GCC_VERSION)),4.)
+ifeq ($(findstring x4.,x$(GCC_VERSION)),x4.)
 SOFT_FLOAT_CONFIG_OPTION:=--with-float=soft
 ifeq ($(BR2_SOFT_FLOAT_FP),y)
 TARGET_SOFT_FLOAT:=-mfloat-abi=softfp
@@ -61,7 +61,7 @@
 
 ifeq ($(BR2_PREFER_IMA),y)
 # >= 4.x
-ifneq ($(findstring 3.,$(GCC_VERSION)),3.)
+ifneq ($(findstring x3.,x$(GCC_VERSION)),x3.)
 EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--enable-intermodule
 endif
 endif # BR2_PREFER_IMA=y
