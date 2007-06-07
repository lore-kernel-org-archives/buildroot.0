From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu,  7 Jun 2007 05:54:31 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070607125431.E0DEA48074@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-07 05:54:29 -0700 (Thu, 07 Jun 2007)
New Revision: 18768

Log:
- update defconfig


Modified:
   trunk/buildroot/.defconfig


Changeset:
Modified: trunk/buildroot/.defconfig
===================================================================
--- trunk/buildroot/.defconfig	2007-06-07 12:16:55 UTC (rev 18767)
+++ trunk/buildroot/.defconfig	2007-06-07 12:54:29 UTC (rev 18768)
@@ -16,13 +16,38 @@
 BR2_WGET="wget --passive-ftp"
 
 #
-# Toolchain Options
+# Kernel Header Options
 #
-BR2_KERNEL_HEADERS_2_6_19_2=y
-BR2_DEFAULT_KERNEL_HEADERS="2.6.19.2"
+# BR2_KERNEL_HEADERS_2_4_25 is not set
+# BR2_KERNEL_HEADERS_2_4_27 is not set
+# BR2_KERNEL_HEADERS_2_4_29 is not set
+# BR2_KERNEL_HEADERS_2_4_31 is not set
+# BR2_KERNEL_HEADERS_2_6_9 is not set
+# BR2_KERNEL_HEADERS_2_6_11 is not set
+# BR2_KERNEL_HEADERS_2_6_12 is not set
+# BR2_KERNEL_HEADERS_2_6_19_2 is not set
+BR2_KERNEL_HEADERS_2_6_20=y
+BR2_DEFAULT_KERNEL_HEADERS="2.6.20.4"
+
+#
+# uClibc Options
+#
+# BR2_UCLIBC_VERSION_0_9_28 is not set
+# BR2_UCLIBC_VERSION_0_9_28_3 is not set
+BR2_UCLIBC_VERSION_0_9_29=y
 # BR2_UCLIBC_VERSION_SNAPSHOT is not set
-BR2_UCLIBC_VERSION_0_9_28_1=y
+BR2_USE_UCLIBC_SNAPSHOT="snapshot"
+BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.29.config"
 # BR2_ENABLE_LOCALE is not set
+# BR2_PTHREADS_NONE is not set
+# BR2_PTHREADS is not set
+BR2_PTHREADS_OLD=y
+# BR2_PTHREADS_NATIVE is not set
+# BR2_PTHREAD_DEBUG is not set
+
+#
+# Binutils Options
+#
 # BR2_BINUTILS_VERSION_2_14_90_0_8 is not set
 # BR2_BINUTILS_VERSION_2_15 is not set
 # BR2_BINUTILS_VERSION_2_15_94_0_2_2 is not set
@@ -40,7 +65,17 @@
 # BR2_BINUTILS_VERSION_2_17_50_0_7 is not set
 # BR2_BINUTILS_VERSION_2_17_50_0_8 is not set
 # BR2_BINUTILS_VERSION_2_17_50_0_9 is not set
-# BR2_BINUTILS_VERSION is not set
+# BR2_BINUTILS_VERSION_2_17_50_0_10 is not set
+# BR2_BINUTILS_VERSION_2_17_50_0_12 is not set
+# BR2_BINUTILS_VERSION_2_17_50_0_14 is not set
+# BR2_BINUTILS_VERSION_2_17_50_0_16 is not set
+BR2_BINUTILS_VERSION="2.17"
+BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""
+
+
+#
+# Gcc Options
+#
 # BR2_GCC_VERSION_3_3_5 is not set
 # BR2_GCC_VERSION_3_3_6 is not set
 # BR2_GCC_VERSION_3_4_2 is not set
@@ -52,13 +87,22 @@
 # BR2_GCC_VERSION_4_0_1 is not set
 # BR2_GCC_VERSION_4_0_2 is not set
 # BR2_GCC_VERSION_4_0_3 is not set
+# BR2_GCC_VERSION_4_0_4 is not set
 # BR2_GCC_VERSION_4_1_0 is not set
-BR2_GCC_VERSION_4_1_1=y
-BR2_GCC_USE_SJLJ_EXCEPTIONS="--enable-sjlj-exceptions"
+# BR2_GCC_VERSION_4_1_1 is not set
+# BR2_GCC_VERSION_4_1_2 is not set
+BR2_GCC_VERSION_4_2_0=y
+# BR2_GCC_IS_SNAP is not set
+BR2_GCC_VERSION="4.2.0"
+# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
+BR2_GCC_SHARED_LIBGCC=y
 # BR2_INSTALL_LIBSTDCPP is not set
 # BR2_PACKAGE_GDB is not set
 # BR2_PACKAGE_GDB_SERVER is not set
 # BR2_ENABLE_MULTILIB is not set
 BR2_LARGEFILE=y
 BR2_TARGET_OPTIMIZATION="-Os -pipe"
+
+BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
+
