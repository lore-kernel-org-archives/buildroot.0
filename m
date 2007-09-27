From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 26 Sep 2007 17:15:49 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel
Message-ID: <20070927001549.89148A5E23@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-26 17:15:46 -0700 (Wed, 26 Sep 2007)
New Revision: 20051

Log:
Update AVR32 config to avoid questions during uclibc make oldconfig

Modified:
   trunk/buildroot/target/device/Atmel/uClibc.config.avr32


Changeset:
Modified: trunk/buildroot/target/device/Atmel/uClibc.config.avr32
===================================================================
--- trunk/buildroot/target/device/Atmel/uClibc.config.avr32	2007-09-26 23:21:43 UTC (rev 20050)
+++ trunk/buildroot/target/device/Atmel/uClibc.config.avr32	2007-09-27 00:15:46 UTC (rev 20051)
@@ -37,10 +37,11 @@
 # ARCH_HAS_NO_MMU is not set
 ARCH_HAS_MMU=y
 UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
 # HAS_FPU is not set
 UCLIBC_HAS_SOFT_FLOAT=y
 DO_C99_MATH=y
-KERNEL_SOURCE="/home/avr32/buildroot/toolchain_build_avr32/linux"
+KERNEL_SOURCE="/home/ulf/projects/Buildroot/20070927/buildroot/toolchain_build_avr32/linux"
 C_SYMBOL_PREFIX=""
 HAVE_DOT_CONFIG=y
 
@@ -101,7 +102,6 @@
 # UCLIBC_HAS_LOCALE is not set
 UCLIBC_HAS_HEXADECIMAL_FLOATS=y
 UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
-# USE_OLD_VFPRINTF is not set
 UCLIBC_PRINTF_SCANF_POSITIONAL_ARGS=9
 UCLIBC_HAS_SCANF_GLIBC_A_FLAG=y
 # UCLIBC_HAS_STDIO_BUFSIZ_NONE is not set
@@ -141,7 +141,7 @@
 #
 SHARED_LIB_LOADER_PREFIX="/lib"
 RUNTIME_PREFIX="/"
-DEVEL_PREFIX="/usr"
+DEVEL_PREFIX="/usr/"
 
 #
 # uClibc security related options
@@ -151,7 +151,7 @@
 #
 # uClibc development/debugging options
 #
-CROSS_COMPILER_PREFIX="/home/avr32/buildroot/build_avr32/staging_dir/bin/avr32-linux-uclibc-"
+CROSS_COMPILER_PREFIX="/home/ulf/projects/Buildroot/20070927/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-"
 # DODEBUG is not set
 # DODEBUG_PT is not set
 # DOASSERTS is not set
