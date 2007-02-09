From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri,  9 Feb 2007 05:31:56 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot: toolchain/binutils
	toolchain/gcc toolch etc...
Message-ID: <20070209133156.063AE48586@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-09 05:31:55 -0800 (Fri, 09 Feb 2007)
New Revision: 17833

Log:
- add gcc-4.0.4
- add knob to enable unsupported, deprecated, obsoleted versions of packages


Added:
   trunk/buildroot/toolchain/gcc/4.0.4/

Modified:
   trunk/buildroot/Config.in
   trunk/buildroot/toolchain/binutils/Config.in
   trunk/buildroot/toolchain/gcc/Config.in
   trunk/buildroot/toolchain/kernel-headers/Config.in
   trunk/buildroot/toolchain/uClibc/Config.in
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2007-02-09 13:05:43 UTC (rev 17832)
+++ trunk/buildroot/Config.in	2007-02-09 13:31:55 UTC (rev 17833)
@@ -361,6 +361,11 @@
 
 	  WARNING: This is highly experimental at the moment.
 
+config BR2_DEPRECATED
+	bool "Show packages that are depretated or obsolete"
+	default n
+	help
+	  This option hides outdated/obsoleted versions of packages.
 
 endmenu
 

Modified: trunk/buildroot/toolchain/binutils/Config.in
===================================================================
--- trunk/buildroot/toolchain/binutils/Config.in	2007-02-09 13:05:43 UTC (rev 17832)
+++ trunk/buildroot/toolchain/binutils/Config.in	2007-02-09 13:31:55 UTC (rev 17833)
@@ -9,14 +9,15 @@
 	  Select the version of binutils you wish to use.
 
 	config BR2_BINUTILS_VERSION_2_14_90_0_8
-		depends !BR2_nios2
+		depends !BR2_nios2 && BR2_DEPRECATED
 		bool "binutils 2.14.90.0.8"
 
 	config BR2_BINUTILS_VERSION_2_15
+		depends BR2_DEPRECATED
 		bool "binutils 2.15"
 
 	config BR2_BINUTILS_VERSION_2_15_94_0_2_2
-		depends !BR2_nios2
+		depends !BR2_nios2 && BR2_DEPRECATED
 		bool "binutils 2.15.94.0.2.2"
 
 	config BR2_BINUTILS_VERSION_2_16_1
@@ -24,15 +25,15 @@
 		bool "binutils 2.16.1"
 
 	config BR2_BINUTILS_VERSION_2_16_90_0_3
-		depends !BR2_nios2
+		depends !BR2_nios2 && BR2_DEPRECATED
 		bool "binutils 2.16.90.0.3"
 
 	config BR2_BINUTILS_VERSION_2_16_91_0_5
-		depends !BR2_nios2
+		depends !BR2_nios2 && BR2_DEPRECATED
 		bool "binutils 2.16.91.0.5"
 
 	config BR2_BINUTILS_VERSION_2_16_91_0_6
-		depends !BR2_nios2
+		depends !BR2_nios2 && BR2_DEPRECATED
 		bool "binutils 2.16.91.0.6"
 
 	config BR2_BINUTILS_VERSION_2_16_91_0_7
@@ -44,35 +45,35 @@
 		bool "binutils 2.17"
 
 	config BR2_BINUTILS_VERSION_2_17_50_0_2
-		depends !BR2_nios2
+		depends !BR2_nios2 && BR2_DEPRECATED
 		bool "binutils 2.17.50.0.2"
 
 	config BR2_BINUTILS_VERSION_2_17_50_0_3
-		depends !BR2_nios2
+		depends !BR2_nios2 && BR2_DEPRECATED
 		bool "binutils 2.17.50.0.3"
 
 	config BR2_BINUTILS_VERSION_2_17_50_0_4
-		depends !BR2_nios2
+		depends !BR2_nios2 && BR2_DEPRECATED
 		bool "binutils 2.17.50.0.4"
 
 	config BR2_BINUTILS_VERSION_2_17_50_0_5
-		depends !BR2_nios2
+		depends !BR2_nios2 && BR2_DEPRECATED
 		bool "binutils 2.17.50.0.5"
 
 	config BR2_BINUTILS_VERSION_2_17_50_0_6
-		depends !BR2_nios2
+		depends !BR2_nios2 && BR2_DEPRECATED
 		bool "binutils 2.17.50.0.6"
 
 	config BR2_BINUTILS_VERSION_2_17_50_0_7
-		depends !BR2_nios2
+		depends !BR2_nios2 && BR2_DEPRECATED
 		bool "binutils 2.17.50.0.7"
 
 	config BR2_BINUTILS_VERSION_2_17_50_0_8
-		depends !BR2_nios2
+		depends !BR2_nios2 && BR2_DEPRECATED
 		bool "binutils 2.17.50.0.8"
 
 	config BR2_BINUTILS_VERSION_2_17_50_0_9
-		depends !BR2_nios2
+		depends !BR2_nios2 && BR2_DEPRECATED
 		bool "binutils 2.17.50.0.9"
 
 	config BR2_BINUTILS_VERSION_2_17_50_0_10

Copied: trunk/buildroot/toolchain/gcc/4.0.4 (from rev 17830, trunk/buildroot/toolchain/gcc/4.0.3)

Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2007-02-09 13:05:43 UTC (rev 17832)
+++ trunk/buildroot/toolchain/gcc/Config.in	2007-02-09 13:31:55 UTC (rev 17833)
@@ -9,46 +9,54 @@
 	  Select the version of gcc you wish to use.
 
 	config BR2_GCC_VERSION_3_3_5
-		depends !BR2_nios2
+		depends !BR2_nios2 && BR2_DEPRECATED
 		bool "gcc 3.3.5"
 
 	config BR2_GCC_VERSION_3_3_6
-		depends !BR2_nios2
+		depends !BR2_nios2 && BR2_DEPRECATED
 		bool "gcc 3.3.6"
 
 	config BR2_GCC_VERSION_3_4_2
+		depends BR2_DEPRECATED
 		bool "gcc 3.4.2"
 
 	config BR2_GCC_VERSION_3_4_3
+		depends BR2_DEPRECATED
 		bool "gcc 3.4.3"
 
 	config BR2_GCC_VERSION_3_4_4
+		depends BR2_DEPRECATED
 		bool "gcc 3.4.4"
 
 	config BR2_GCC_VERSION_3_4_5
+		depends BR2_DEPRECATED
 		bool "gcc 3.4.5"
 
 	config BR2_GCC_VERSION_3_4_6
 		bool "gcc 3.4.6"
 
 	config BR2_GCC_VERSION_4_0_0
-		depends !BR2_nios2
+		depends !BR2_nios2 && BR2_DEPRECATED
 		bool "gcc 4.0.0"
 
 	config BR2_GCC_VERSION_4_0_1
-		depends !BR2_nios2
+		depends !BR2_nios2 && BR2_DEPRECATED
 		bool "gcc 4.0.1"
 
 	config BR2_GCC_VERSION_4_0_2
-		depends !BR2_nios2
+		depends !BR2_nios2 && BR2_DEPRECATED
 		bool "gcc 4.0.2"
 
 	config BR2_GCC_VERSION_4_0_3
-		depends !BR2_nios2
+		depends !BR2_nios2 && BR2_DEPRECATED
 		bool "gcc 4.0.3"
 
+	config BR2_GCC_VERSION_4_0_4
+		depends !BR2_nios2
+		bool "gcc 4.0.4"
+
 	config BR2_GCC_VERSION_4_1_0
-		depends !BR2_nios2
+		depends !BR2_nios2 && BR2_DEPRECATED
 		bool "gcc 4.1.0"
 
 	config BR2_GCC_VERSION_4_1_1
@@ -91,6 +99,7 @@
 	default "4.0.1"     if BR2_GCC_VERSION_4_0_1
 	default "4.0.2"     if BR2_GCC_VERSION_4_0_2
 	default "4.0.3"     if BR2_GCC_VERSION_4_0_3
+	default "4.0.4"     if BR2_GCC_VERSION_4_0_4
 	default "4.1.0"     if BR2_GCC_VERSION_4_1_0
 	default "4.1.1"     if BR2_GCC_VERSION_4_1_1
 	default "4.1.2"     if BR2_GCC_VERSION_4_1_2

Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2007-02-09 13:05:43 UTC (rev 17832)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2007-02-09 13:31:55 UTC (rev 17833)
@@ -13,15 +13,15 @@
 	  the kernel you intend to use on your target system.
 
 	config BR2_KERNEL_HEADERS_2_4_25
-		depends !BR2_nios2
+		depends !BR2_nios2 && BR2_DEPRECATED
 		bool "Linux 2.4.25 kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_4_27
-		depends !BR2_nios2
+		depends !BR2_nios2 && BR2_DEPRECATED
 		bool "Linux 2.4.27 kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_4_29
-		depends !BR2_nios2
+		depends !BR2_nios2 && BR2_DEPRECATED
 		bool "Linux 2.4.29 kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_4_31
@@ -29,15 +29,21 @@
 		bool "Linux 2.4.31 kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_9
+		depends BR2_DEPRECATED
 		bool "Linux 2.6.9 kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_11
+		depends BR2_DEPRECATED
 		bool "Linux 2.6.11 kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_12
 		depends !BR2_nios2
 		bool "Linux 2.6.12 kernel headers"
 
+	config BR2_KERNEL_HEADERS_2_6_19_2
+		depends !BR2_nios2 && BR2_DEPRECATED
+		bool "Linux 2.6.19.2 kernel headers"
+
 	config BR2_KERNEL_HEADERS_2_6_20
 		depends !BR2_nios2
 		bool "Linux 2.6.20 kernel headers"
@@ -53,4 +59,5 @@
 	default "2.6.9"     if BR2_KERNEL_HEADERS_2_6_9
 	default "2.6.11"    if BR2_KERNEL_HEADERS_2_6_11
 	default "2.6.12"    if BR2_KERNEL_HEADERS_2_6_12
+	default "2.6.19.2"  if BR2_KERNEL_HEADERS_2_6_19_2
 	default "2.6.20"    if BR2_KERNEL_HEADERS_2_6_20

Modified: trunk/buildroot/toolchain/uClibc/Config.in
===================================================================
--- trunk/buildroot/toolchain/uClibc/Config.in	2007-02-09 13:05:43 UTC (rev 17832)
+++ trunk/buildroot/toolchain/uClibc/Config.in	2007-02-09 13:31:55 UTC (rev 17833)
@@ -10,6 +10,7 @@
 	  Select the version of uClibc you wish to use.
 
 	config BR2_UCLIBC_VERSION_0_9_28
+		depends BR2_DEPRECATED
 		bool "uClibc 0.9.28"
 
 	config BR2_UCLIBC_VERSION_0_9_28_1
@@ -52,3 +53,11 @@
 	config BR2_PTHREADS_NATIVE
 		bool "Native POSIX Threading (NPTL)"
 endchoice
+
+config BR2_PTHREAD_DEBUG
+	bool "Thread library debugging"
+	depends on BR2_PTHREADS || BR2_PTHREADS_OLD || BR2_PTHREADS_NATIVE
+	default n
+	help
+	  Build the thread library with debugging enabled.
+

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-02-09 13:05:43 UTC (rev 17832)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-02-09 13:31:55 UTC (rev 17833)
@@ -135,6 +135,8 @@
 	$(SED) 's,.*UCLIBC_HAS_LFS.*,UCLIBC_HAS_LFS=y,g' $(UCLIBC_DIR)/.config
 else
 	$(SED) 's,.*UCLIBC_HAS_LFS.*,UCLIBC_HAS_LFS=n,g' $(UCLIBC_DIR)/.config
+	$(SED) '/.*UCLIBC_HAS_FOPEN_LARGEFILE_MODE.*/d' $(UCLIBC_DIR)/.config
+	echo "# UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set" >> $(UCLIBC_DIR)/.config
 endif
 	$(SED) 's,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g' $(UCLIBC_DIR)/.config
 ifeq ($(BR2_SOFT_FLOAT),y)
