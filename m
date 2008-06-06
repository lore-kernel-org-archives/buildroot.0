From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri,  6 Jun 2008 05:49:54 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20080606124954.2EC893C3F0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-06 05:49:53 -0700 (Fri, 06 Jun 2008)
New Revision: 22249

Log:
toolchain: also use arch/tune/abi options when softfloat is enabled

The ifeq/endif nesting was wrong, so arch/tune/abi options where only set in
the non-softfloat case.


Modified:
   trunk/buildroot/toolchain/gcc/Makefile.in


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Makefile.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Makefile.in	2008-06-06 10:31:39 UTC (rev 22248)
+++ trunk/buildroot/toolchain/gcc/Makefile.in	2008-06-06 12:49:53 UTC (rev 22249)
@@ -50,6 +50,8 @@
 SOFT_FLOAT_CONFIG_OPTION:=
 TARGET_SOFT_FLOAT:=
 ARCH_FPU_SUFFIX:=
+endif
+
 # some additional defaults
 ifneq ($(strip $(subst ",,$(BR2_GCC_TARGET_ARCH))),)
 # ")))
@@ -63,7 +65,6 @@
 # ")))
 GCC_WITH_ABI:=--with-abi=$(BR2_GCC_TARGET_ABI)
 endif
-endif
 
 # AVR32 GCC configuration
 ifeq ($(strip $(BR2_avr32)),y)
