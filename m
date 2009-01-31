From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 31 Jan 2009 20:42:29 +0000 (UTC)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/at91sam9263ek
Message-ID: <20090131204229.2A3027621A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-31 20:42:28 +0000 (Sat, 31 Jan 2009)
New Revision: 25189

Log:
Update at91sam9263ek BSP

Modified:
   trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig


Changeset:
Modified: trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig	2009-01-31 20:41:36 UTC (rev 25188)
+++ trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig	2009-01-31 20:42:28 UTC (rev 25189)
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Fri Jan 30 00:24:22 2009
+# Fri Jan 30 23:59:55 2009
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
+BR2_LARGEFILE=y
+BR2_INET_IPV6=y
+BR2_INET_RPC=y
+BR2_ENABLE_LOCALE=y
+# BR2_ENABLE_LOCALE_PREGENERATED is not set
+BR2_USE_WCHAR=y
+# BR2_SOFT_FLOAT is not set
+# BR2_PTHREADS_NONE is not set
+# BR2_PTHREADS is not set
+BR2_PTHREADS_OLD=y
+# BR2_PTHREADS_NATIVE is not set
+BR2_GCC_CROSS_CXX=y
+BR2_INSTALL_LIBSTDCPP=y
+BR2_TARGET_OPTIMIZATION="-Os -pipe"
 # BR2_ELF2FLT is not set
 # BR2_MKLIBS is not set
 # BR2_PACKAGE_SSTRIP_TARGET is not set
 BR2_PACKAGE_SSTRIP_HOST=y
 # BR2_ENABLE_MULTILIB is not set
-BR2_LARGEFILE=y
-BR2_INET_IPV6=y
-BR2_INET_RPC=y
-BR2_USE_WCHAR=y
-# BR2_SOFT_FLOAT is not set
 # BR2_VFP_FLOAT is not set
-BR2_TARGET_OPTIMIZATION="-Os -pipe"
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
