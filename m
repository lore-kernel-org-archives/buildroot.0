From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 31 Jan 2009 20:43:01 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel/atngw100
Message-ID: <20090131204302.082727621A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-31 20:43:01 +0000 (Sat, 31 Jan 2009)
New Revision: 25190

Log:
Update atngw100 BSP

Modified:
   trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig


Changeset:
Modified: trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2009-01-31 20:42:28 UTC (rev 25189)
+++ trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2009-01-31 20:43:01 UTC (rev 25190)
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Thu Jan 29 21:25:38 2009
+# Sat Jan 31 00:10:01 2009
 #
 BR2_HAVE_DOT_CONFIG=y
 BR2_VERSION="2009.02-svn"
@@ -185,6 +185,7 @@
 # BR2_KERNEL_HEADERS_2_6_27 is not set
 BR2_KERNEL_HEADERS_2_6_28=y
 # BR2_KERNEL_HEADERS_SNAP is not set
+BR2_KERNEL_HEADERS_PATCH_DIR=y
 BR2_DEFAULT_KERNEL_HEADERS="2.6.28.2"
 
 #
@@ -195,12 +196,6 @@
 BR2_UCLIBC_VERSION_0_9_30=y
 # BR2_UCLIBC_VERSION_SNAPSHOT is not set
 BR2_UCLIBC_CONFIG="target/device/Atmel/uClibc.config.avr32"
-BR2_ENABLE_LOCALE=y
-# BR2_ENABLE_LOCALE_PREGENERATED is not set
-# BR2_PTHREADS_NONE is not set
-# BR2_PTHREADS is not set
-BR2_PTHREADS_OLD=y
-# BR2_PTHREADS_NATIVE is not set
 # BR2_PTHREAD_DEBUG is not set
 # BR2_UCLIBC_PROGRAM_INVOCATION is not set
 # BR2_UCLIBC_INSTALL_TEST_SUITE is not set
@@ -238,8 +233,6 @@
 BR2_TOOLCHAIN_SYSROOT=y
 # BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
-BR2_GCC_CROSS_CXX=y
-BR2_INSTALL_LIBSTDCPP=y
 BR2_GCC_SHARED_LIBGCC=y
 
 #
@@ -266,16 +259,24 @@
 #
 # Common Toolchain Options
 #
-# BR2_MKLIBS is not set
-# BR2_PACKAGE_SSTRIP_TARGET is not set
-# BR2_PACKAGE_SSTRIP_HOST is not set
-# BR2_ENABLE_MULTILIB is not set
 BR2_LARGEFILE=y
 BR2_INET_IPV6=y
 BR2_INET_RPC=y
+BR2_ENABLE_LOCALE=y
+# BR2_ENABLE_LOCALE_PREGENERATED is not set
 BR2_USE_WCHAR=y
 BR2_SOFT_FLOAT=y
+# BR2_PTHREADS_NONE is not set
+# BR2_PTHREADS is not set
+BR2_PTHREADS_OLD=y
+# BR2_PTHREADS_NATIVE is not set
+BR2_GCC_CROSS_CXX=y
+BR2_INSTALL_LIBSTDCPP=y
 BR2_TARGET_OPTIMIZATION="-Os -pipe"
+# BR2_MKLIBS is not set
+# BR2_PACKAGE_SSTRIP_TARGET is not set
+# BR2_PACKAGE_SSTRIP_HOST is not set
+# BR2_ENABLE_MULTILIB is not set
 BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
 
 #
@@ -851,9 +852,6 @@
 BR2_KERNEL_ARCH_PATCH_ENABLED=y
 # BR2_ARCH_AVR32_2_6_28_2 is not set
 BR2_ARCH_AVR32_2_6_27_6=y
-# BR2_LINUX_AVR32_ISI_PATCH is not set
-# BR2_LINUX_AVR32_AC97_PATCH is not set
-# BR2_LINUX_AVR32_PSIF_PATCH is not set
 BR2_LINUX_BSP_PATCH=""
 BR2_KERNEL_PATCH="patch-$(BR2_DOWNLOAD_LINUX26_VERSION).$(BR2_KERNEL_PATCH_LEVEL).bz2"
 BR2_EXTRA_VERSION=".$(BR2_KERNEL_PATCH_LEVEL)"
