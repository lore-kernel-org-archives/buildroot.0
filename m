From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon,  2 Feb 2009 07:22:20 +0000 (UTC)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/at91sam9g20dfc
Message-ID: <20090202072220.BDC91764CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-02-02 07:22:19 +0000 (Mon, 02 Feb 2009)
New Revision: 25217

Log:
Update sam9g20 BSP

Modified:
   trunk/buildroot/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig


Changeset:
Modified: trunk/buildroot/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig	2009-02-02 07:20:54 UTC (rev 25216)
+++ trunk/buildroot/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig	2009-02-02 07:22:19 UTC (rev 25217)
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Thu Jan 29 22:34:19 2009
+# Sun Feb  1 16:26:09 2009
 #
 BR2_HAVE_DOT_CONFIG=y
 BR2_VERSION="2009.02-svn"
@@ -42,6 +42,7 @@
 # BR2_ARM_EABI is not set
 BR2_ARCH="arm"
 BR2_ENDIAN="LITTLE"
+BR2_GCC_TARGET_ABI="apcs-gnu"
 
 #
 # Target options
@@ -238,6 +239,7 @@
 # BR2_KERNEL_HEADERS_2_6_27 is not set
 BR2_KERNEL_HEADERS_2_6_28=y
 # BR2_KERNEL_HEADERS_SNAP is not set
+# BR2_KERNEL_HEADERS_PATCH_DIR is not set
 BR2_DEFAULT_KERNEL_HEADERS="2.6.28.2"
 
 #
@@ -248,12 +250,6 @@
 BR2_UCLIBC_VERSION_0_9_30=y
 # BR2_UCLIBC_VERSION_SNAPSHOT is not set
 BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.30.config"
-BR2_ENABLE_LOCALE=y
-# BR2_ENABLE_LOCALE_PREGENERATED is not set
-# BR2_PTHREADS_NONE is not set
-# BR2_PTHREADS is not set
-BR2_PTHREADS_OLD=y
-# BR2_PTHREADS_NATIVE is not set
 # BR2_PTHREAD_DEBUG is not set
 BR2_UCLIBC_PROGRAM_INVOCATION=y
 # BR2_UCLIBC_INSTALL_TEST_SUITE is not set
@@ -291,9 +287,7 @@
 BR2_TOOLCHAIN_SYSROOT=y
 # BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
-BR2_GCC_CROSS_CXX=y
 # BR2_GCC_CROSS_FORTRAN is not set
-BR2_INSTALL_LIBSTDCPP=y
 # BR2_INSTALL_LIBGCJ is not set
 # BR2_INSTALL_OBJC is not set
 # BR2_INSTALL_FORTRAN is not set
@@ -315,18 +309,26 @@
 #
 # Common Toolchain Options
 #
-# BR2_ELF2FLT is not set
-# BR2_MKLIBS is not set
-BR2_PACKAGE_SSTRIP_TARGET=y
-BR2_PACKAGE_SSTRIP_HOST=y
-# BR2_ENABLE_MULTILIB is not set
 BR2_LARGEFILE=y
 BR2_INET_IPV6=y
 BR2_INET_RPC=y
+BR2_ENABLE_LOCALE=y
+# BR2_ENABLE_LOCALE_PREGENERATED is not set
 BR2_USE_WCHAR=y
 # BR2_SOFT_FLOAT is not set
-# BR2_VFP_FLOAT is not set
+# BR2_PTHREADS_NONE is not set
+# BR2_PTHREADS is not set
+BR2_PTHREADS_OLD=y
+# BR2_PTHREADS_NATIVE is not set
+BR2_GCC_CROSS_CXX=y
+BR2_INSTALL_LIBSTDCPP=y
 BR2_TARGET_OPTIMIZATION="-Os -pipe"
+# BR2_ELF2FLT is not set
+# BR2_MKLIBS is not set
+BR2_PACKAGE_SSTRIP_TARGET=y
+BR2_PACKAGE_SSTRIP_HOST=y
+# BR2_ENABLE_MULTILIB is not set
+# BR2_VFP_FLOAT is not set
 BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
 
 #
@@ -379,8 +381,6 @@
 # BR2_PACKAGE_OPROFILE is not set
 BR2_PACKAGE_PKGCONFIG=y
 BR2_PACKAGE_READLINE=y
-BR2_PACKAGE_READLINE_TARGET=y
-# BR2_PACKAGE_READLINE_HEADERS is not set
 # BR2_PACKAGE_PCRE is not set
 
 #
@@ -944,15 +944,11 @@
 BR2_KERNEL_MINORLEVEL="2"
 BR2_KERNEL_ARCH_PATCH_ENABLED=y
 BR2_ARCH_AT91_2_6_28=y
-# BR2_ARCH_AT91_2_6_27_7 is not set
+# BR2_ARCH_AT91_2_6_27 is not set
 # BR2_ARCH_AT91_2_6_26 is not set
-# BR2_ARCH_AT91_2_6_26_RC3 is not set
 # BR2_ARCH_AT91_2_6_25 is not set
 # BR2_ARCH_AT91_2_6_24 is not set
-# BR2_ARCH_AT91_2_6_22_1 is not set
-# BR2_ARCH_AT91_2_6_21_5 is not set
-# BR2_ARCH_AT91_2_6_21_1 is not set
-# BR2_ARCH_AT91_2_6_20_4 is not set
+# BR2_ARCH_AT91_2_6_22 is not set
 BR2_LINUX_BSP_PATCH=""
 BR2_KERNEL_PATCH="patch-$(BR2_DOWNLOAD_LINUX26_VERSION).$(BR2_KERNEL_PATCH_LEVEL).bz2"
 BR2_EXTRA_VERSION=".$(BR2_KERNEL_PATCH_LEVEL)"
