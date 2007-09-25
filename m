From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 25 Sep 2007 04:53:44 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain: binutils gcc
	uClibc
Message-ID: <20070925115344.A9A023006B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-25 04:53:44 -0700 (Tue, 25 Sep 2007)
New Revision: 20009

Log:
- Schedule removal of ancient versions (configuration part).


Modified:
   trunk/buildroot/toolchain/binutils/Config.in
   trunk/buildroot/toolchain/gcc/Config.in
   trunk/buildroot/toolchain/uClibc/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/binutils/Config.in
===================================================================
--- trunk/buildroot/toolchain/binutils/Config.in	2007-09-25 11:51:15 UTC (rev 20008)
+++ trunk/buildroot/toolchain/binutils/Config.in	2007-09-25 11:53:44 UTC (rev 20009)
@@ -4,94 +4,14 @@
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_17
+	default BR2_BINUTILS_VERSION_2_18
 	help
 	  Select the version of binutils you wish to use.
 
-	config BR2_BINUTILS_VERSION_2_14_90_0_8
-		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
-		bool "binutils 2.14.90.0.8"
-
-	config BR2_BINUTILS_VERSION_2_15
-		depends !BR2_avr32 && BR2_DEPRECATED
-		bool "binutils 2.15"
-
-	config BR2_BINUTILS_VERSION_2_15_94_0_2_2
-		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
-		bool "binutils 2.15.94.0.2.2"
-
-	config BR2_BINUTILS_VERSION_2_16_1
-		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
-		bool "binutils 2.16.1"
-
-	config BR2_BINUTILS_VERSION_2_16_90_0_3
-		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
-		bool "binutils 2.16.90.0.3"
-
-	config BR2_BINUTILS_VERSION_2_16_91_0_5
-		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
-		bool "binutils 2.16.91.0.5"
-
-	config BR2_BINUTILS_VERSION_2_16_91_0_6
-		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
-		bool "binutils 2.16.91.0.6"
-
-	config BR2_BINUTILS_VERSION_2_16_91_0_7
-		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
-		bool "binutils 2.16.91.0.7"
-
 	config BR2_BINUTILS_VERSION_2_17
 		depends BR2_avr32 || !BR2_nios2 && BR2_DEPRECATED
 		bool "binutils 2.17"
 
-	config BR2_BINUTILS_VERSION_2_17_50_0_2
-		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
-		bool "binutils 2.17.50.0.2"
-
-	config BR2_BINUTILS_VERSION_2_17_50_0_3
-		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
-		bool "binutils 2.17.50.0.3"
-
-	config BR2_BINUTILS_VERSION_2_17_50_0_4
-		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
-		bool "binutils 2.17.50.0.4"
-
-	config BR2_BINUTILS_VERSION_2_17_50_0_5
-		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
-		bool "binutils 2.17.50.0.5"
-
-	config BR2_BINUTILS_VERSION_2_17_50_0_6
-		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
-		bool "binutils 2.17.50.0.6"
-
-	config BR2_BINUTILS_VERSION_2_17_50_0_7
-		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
-		bool "binutils 2.17.50.0.7"
-
-	config BR2_BINUTILS_VERSION_2_17_50_0_8
-		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
-		bool "binutils 2.17.50.0.8"
-
-	config BR2_BINUTILS_VERSION_2_17_50_0_9
-		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
-		bool "binutils 2.17.50.0.9"
-
-	config BR2_BINUTILS_VERSION_2_17_50_0_10
-		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
-		bool "binutils 2.17.50.0.10"
-
-	config BR2_BINUTILS_VERSION_2_17_50_0_12
-		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
-		bool "binutils 2.17.50.0.12"
-
-	config BR2_BINUTILS_VERSION_2_17_50_0_14
-		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
-		bool "binutils 2.17.50.0.14"
-
-	config BR2_BINUTILS_VERSION_2_17_50_0_16
-		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
-		bool "binutils 2.17.50.0.16"
-
 	config BR2_BINUTILS_VERSION_2_17_50_0_17
 		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "binutils 2.17.50.0.17"
@@ -107,27 +27,7 @@
 
 config BR2_BINUTILS_VERSION
 	string
-	default "2.14.90.0.8"	if BR2_BINUTILS_VERSION_2_14_90_0_8
-	default "2.15"		if BR2_BINUTILS_VERSION_2_15
-	default "2.15.94.0.2.2" if BR2_BINUTILS_VERSION_2_15_94_0_2_2
-	default "2.16.1"	if BR2_BINUTILS_VERSION_2_16_1
-	default "2.16.90.0.3"	if BR2_BINUTILS_VERSION_2_16_90_0_3
-	default "2.16.91.0.5"	if BR2_BINUTILS_VERSION_2_16_91_0_5
-	default "2.16.91.0.6"	if BR2_BINUTILS_VERSION_2_16_91_0_6
-	default "2.16.91.0.7"	if BR2_BINUTILS_VERSION_2_16_91_0_7
 	default "2.17"		if BR2_BINUTILS_VERSION_2_17
-	default "2.17.50.0.2"	if BR2_BINUTILS_VERSION_2_17_50_0_2
-	default "2.17.50.0.3"	if BR2_BINUTILS_VERSION_2_17_50_0_3
-	default "2.17.50.0.4"	if BR2_BINUTILS_VERSION_2_17_50_0_4
-	default "2.17.50.0.5"	if BR2_BINUTILS_VERSION_2_17_50_0_5
-	default "2.17.50.0.6"	if BR2_BINUTILS_VERSION_2_17_50_0_6
-	default "2.17.50.0.7"	if BR2_BINUTILS_VERSION_2_17_50_0_7
-	default "2.17.50.0.8"	if BR2_BINUTILS_VERSION_2_17_50_0_8
-	default "2.17.50.0.9"	if BR2_BINUTILS_VERSION_2_17_50_0_9
-	default "2.17.50.0.10"	if BR2_BINUTILS_VERSION_2_17_50_0_10
-	default "2.17.50.0.12"	if BR2_BINUTILS_VERSION_2_17_50_0_12
-	default "2.17.50.0.14"	if BR2_BINUTILS_VERSION_2_17_50_0_14
-	default "2.17.50.0.16"	if BR2_BINUTILS_VERSION_2_17_50_0_16
 	default "2.17.50.0.17"	if BR2_BINUTILS_VERSION_2_17_50_0_17
 	default "2.18"		if BR2_BINUTILS_VERSION_2_18
 	default "2.18.50.0.1"	if BR2_BINUTILS_VERSION_2_18_50_0_1

Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2007-09-25 11:51:15 UTC (rev 20008)
+++ trunk/buildroot/toolchain/gcc/Config.in	2007-09-25 11:53:44 UTC (rev 20009)
@@ -8,68 +8,22 @@
 	help
 	  Select the version of gcc you wish to use.
 
-	config BR2_GCC_VERSION_3_3_5
-		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
-		bool "gcc 3.3.5"
-
-	config BR2_GCC_VERSION_3_3_6
-		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
-		bool "gcc 3.3.6"
-
-	config BR2_GCC_VERSION_3_4_2
-		depends !BR2_avr32 && BR2_DEPRECATED
-		bool "gcc 3.4.2"
-
-	config BR2_GCC_VERSION_3_4_3
-		depends !BR2_avr32 && BR2_DEPRECATED
-		bool "gcc 3.4.3"
-
-	config BR2_GCC_VERSION_3_4_4
-		depends !BR2_avr32 && BR2_DEPRECATED
-		bool "gcc 3.4.4"
-
-	config BR2_GCC_VERSION_3_4_5
-		depends !BR2_avr32 && BR2_DEPRECATED
-		bool "gcc 3.4.5"
-
 	config BR2_GCC_VERSION_3_4_6
 		depends on !BR2_avr32
 		bool "gcc 3.4.6"
 
-	config BR2_GCC_VERSION_4_0_0
-		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
-		bool "gcc 4.0.0"
-
-	config BR2_GCC_VERSION_4_0_1
-		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
-		bool "gcc 4.0.1"
-
-	config BR2_GCC_VERSION_4_0_2
-		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
-		bool "gcc 4.0.2"
-
-	config BR2_GCC_VERSION_4_0_3
-		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
-		bool "gcc 4.0.3"
-
 	config BR2_GCC_VERSION_4_0_4
-		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
+		depends !BR2_avr32 && !BR2_nios2
+		depends BR2_DEPRECATED
 		bool "gcc 4.0.4"
 
-	config BR2_GCC_VERSION_4_1_0
-		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
-		bool "gcc 4.1.0"
-
-	config BR2_GCC_VERSION_4_1_1
-		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
-		bool "gcc 4.1.1"
-
 	config BR2_GCC_VERSION_4_1_2
 		depends !BR2_nios2
 		bool "gcc 4.1.2"
 
 	config BR2_GCC_VERSION_4_2_0
-		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
+		depends !BR2_avr32 && !BR2_nios2
+		depends BR2_DEPRECATED
 		bool "gcc 4.2.0"
 
 	config BR2_GCC_VERSION_4_2_1
@@ -88,9 +42,19 @@
 	bool
 	default n
 
+config BR2_GCC_SUPPORTS_SYSROOT
+	bool
+	default n if BR2_GCC_VERSION_3_4_6 || BR2_GCC_VERSION_4_0_4 || BR2_GCC_VERSION_4_1_2
+	default y if !BR2_GCC_VERSION_3_4_6 && !BR2_GCC_VERSION_4_0_4 && !BR2_GCC_VERSION_4_1_2
+
+config BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
+	bool
+	default n if BR2_GCC_VERSION_3_4_6 || BR2_GCC_VERSION_4_0_4 || BR2_GCC_VERSION_4_1_2 || BR2_GCC_VERSION_4_2_0 || BR2_GCC_VERSION_4_2_1
+	default y if !BR2_GCC_VERSION_3_4_6 && !BR2_GCC_VERSION_4_0_4 && !BR2_GCC_VERSION_4_1_2 && !BR2_GCC_VERSION_4_2_0 && !BR2_GCC_VERSION_4_2_1
+
 config BR2_GCC_SNAP_DATE
 	string "GCC snapshot date"
-	default "20070622"
+	default "20070921"
 	depends BR2_GCC_IS_SNAP
 	help
 	  Enter snapshot date to use for gcc.  Format is:
@@ -98,20 +62,8 @@
 
 config BR2_GCC_VERSION
 	string
-	default "3.3.5"     if BR2_GCC_VERSION_3_3_5
-	default "3.3.6"     if BR2_GCC_VERSION_3_3_6
-	default "3.4.2"     if BR2_GCC_VERSION_3_4_2
-	default "3.4.3"     if BR2_GCC_VERSION_3_4_3
-	default "3.4.4"     if BR2_GCC_VERSION_3_4_4
-	default "3.4.5"     if BR2_GCC_VERSION_3_4_5
 	default "3.4.6"     if BR2_GCC_VERSION_3_4_6
-	default "4.0.0"     if BR2_GCC_VERSION_4_0_0
-	default "4.0.1"     if BR2_GCC_VERSION_4_0_1
-	default "4.0.2"     if BR2_GCC_VERSION_4_0_2
-	default "4.0.3"     if BR2_GCC_VERSION_4_0_3
 	default "4.0.4"     if BR2_GCC_VERSION_4_0_4
-	default "4.1.0"     if BR2_GCC_VERSION_4_1_0
-	default "4.1.1"     if BR2_GCC_VERSION_4_1_1
 	default "4.1.2"     if BR2_GCC_VERSION_4_1_2
 	default "4.2.0"     if BR2_GCC_VERSION_4_2_0
 	default "4.2.1"     if BR2_GCC_VERSION_4_2_1
@@ -119,7 +71,7 @@
 
 config BR2_TOOLCHAIN_SYSROOT
 	bool "Enable toolchain with --sysroot support"
-	depends on !BR2_GCC_VERSION_3_3_5 && !BR2_GCC_VERSION_3_3_6 && !BR2_GCC_VERSION_3_4_2 && !BR2_GCC_VERSION_3_4_3 && !BR2_GCC_VERSION_3_4_4 && !BR2_GCC_VERSION_3_4_5 && !BR2_GCC_VERSION_3_4_6 && !BR2_GCC_VERSION_4_0_0 && !BR2_GCC_VERSION_4_0_1 && !BR2_GCC_VERSION_4_0_2 && !BR2_GCC_VERSION_4_0_3 && !BR2_GCC_VERSION_4_0_4 && !BR2_GCC_VERSION_4_1_0 && !BR2_GCC_VERSION_4_1_1 && !BR2_GCC_VERSION_4_1_2
+	depends on BR2_GCC_SUPPORTS_SYSROOT
 	default y
 	help
 	  Enables --sysroot=dir for binutils and gcc.
@@ -164,7 +116,7 @@
 	default n
 	# >= 4.2.0 work fine without LARGEFILE
 	# huh? why so? select BR2_LARGEFILE
-	select BR2_LARGEFILE if BR2_GCC_VERSION_3_3_5 || BR2_GCC_VERSION_3_3_6 || BR2_GCC_VERSION_3_4_2 || BR2_GCC_VERSION_3_4_3 || BR2_GCC_VERSION_3_4_4 || BR2_GCC_VERSION_3_4_5 || BR2_GCC_VERSION_3_4_6 || BR2_GCC_VERSION_4_0_0 || BR2_GCC_VERSION_4_0_1 || BR2_GCC_VERSION_4_0_2 || BR2_GCC_VERSION_4_0_3 || BR2_GCC_VERSION_4_0_4 || BR2_GCC_VERSION_4_1_0 || BR2_GCC_VERSION_4_1_1 || BR2_GCC_VERSION_4_1_2
+	select BR2_LARGEFILE if BR2_GCC_SUPPORTS_SYSROOT
 	help
 	  Build/install c++ compiler and libstdc++?
 

Modified: trunk/buildroot/toolchain/uClibc/Config.in
===================================================================
--- trunk/buildroot/toolchain/uClibc/Config.in	2007-09-25 11:51:15 UTC (rev 20008)
+++ trunk/buildroot/toolchain/uClibc/Config.in	2007-09-25 11:53:44 UTC (rev 20009)
@@ -9,10 +9,6 @@
 	help
 	  Select the version of uClibc you wish to use.
 
-	config BR2_UCLIBC_VERSION_0_9_28
-		depends BR2_DEPRECATED
-		bool "uClibc 0.9.28"
-
 	config BR2_UCLIBC_VERSION_0_9_28_3
 		depends BR2_avr32 || BR2_DEPRECATED
 		bool "uClibc 0.9.28.3"
@@ -37,7 +33,6 @@
 
 config BR2_UCLIBC_CONFIG
 	string "uClibc configuration file to use?"
-	default "toolchain/uClibc/uClibc-0.9.28.config" if BR2_UCLIBC_VERSION_0_9_28
 	default "toolchain/uClibc/uClibc-0.9.28.config" if BR2_UCLIBC_VERSION_0_9_28_3
 	default "toolchain/uClibc/uClibc-0.9.29.config" if BR2_UCLIBC_VERSION_0_9_29
 	default "toolchain/uClibc/uClibc-0.9.29.config" if BR2_UCLIBC_VERSION_0_9_30
