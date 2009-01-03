From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat,  3 Jan 2009 01:06:37 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20090103010637.58207769FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-03 01:06:36 +0000 (Sat, 03 Jan 2009)
New Revision: 24663

Log:
Update linux versions

Modified:
   trunk/buildroot/target/linux/Config.in.advanced
   trunk/buildroot/target/linux/Config.in.versions


Changeset:
Modified: trunk/buildroot/target/linux/Config.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Config.in.advanced	2009-01-03 01:06:16 UTC (rev 24662)
+++ trunk/buildroot/target/linux/Config.in.advanced	2009-01-03 01:06:36 UTC (rev 24663)
@@ -123,17 +123,21 @@
 
 choice
 	prompt "Linux Kernel Version"
-	default BR2_LINUX_2_6_22_10 if BR2_avr32
-	default BR2_LINUX_2_6_22_1 if !BR2_avr32 && BR2_TARGET_ATMEL
-	default BR2_LINUX_2_6_22 if !BR2_TARGET_ATMEL
+	default BR2_LINUX_2_6_28
 	help
 	  Select the specific Linux version you want to use
 
 config BR2_LINUX_2_6_STABLE
-	bool "The latest stable Linux kernel (2.6.27.10)"
+	bool "The latest stable Linux kernel (2.6.28)"
 	help
-	  Linux 2.26.27.10
+	  Linux 2.26.28
 
+config BR2_LINUX_2_6_28
+	bool "Linux 2.6.28"
+	select BR2_KERNEL_BASE
+	help
+	  Linux 2.6.28
+
 config BR2_LINUX_2_6_27
 	bool "Linux 2.6.27"
 	select BR2_KERNEL_BASE
@@ -207,12 +211,6 @@
 	help
 	  Linux 2.6.20
 
-config BR2_LINUX_2_6_28
-	bool "Linux 2.6.28"
-	select BR2_KERNEL_BASE
-	help
-	  Linux 2.6.28
-
 config BR2_LINUX_2_6_29
 	bool "Linux 2.6.29"
 	select BR2_KERNEL_BASE

Modified: trunk/buildroot/target/linux/Config.in.versions
===================================================================
--- trunk/buildroot/target/linux/Config.in.versions	2009-01-03 01:06:16 UTC (rev 24662)
+++ trunk/buildroot/target/linux/Config.in.versions	2009-01-03 01:06:36 UTC (rev 24663)
@@ -5,11 +5,13 @@
 
 config LINUX26_LATEST_RC_VERSION
 	string
-	default "2.6.28-rc9" if BR2_KERNEL_ADD_LATEST_RC_PATCH
+	default "2.6.29-rc1" if BR2_KERNEL_ADD_LATEST_RC_PATCH
+	help
+	  Not really available as of 20090103
 
 config LINUX26_LATEST_GIT_VERSION
 	string
-	default "2.6.28-rc9-git1" if BR2_KERNEL_ADD_LATEST_SNAPSHOT
+	default "2.6.28-git5" if BR2_KERNEL_ADD_LATEST_SNAPSHOT
 
 config LINUX26_LATEST_MM_VERSION
 	string
@@ -17,36 +19,42 @@
 
 config BR2_KERNEL_CURRENT_VERSION
 	string
-	default "2.6.27.10"
+	default "2.6.28"
 
+config BR2_KERNEL_LATEST_2_6_28
+	string
+	default "1"
+	help
+	  Not really available as of 20090103
+
 config BR2_KERNEL_LATEST_2_6_27
-       string
-       default "10"
+	string
+	default "10"
 
 config BR2_KERNEL_LATEST_2_6_26
-       string
-       default "8"
+	string
+	default "8"
 
 config BR2_KERNEL_LATEST_2_6_25
-       string
-       default "9"
+	string
+	default "9"
 
 config BR2_KERNEL_LATEST_2_6_24
-       string
-       default "7"
+	string
+	default "7"
 
 config BR2_KERNEL_LATEST_2_6_23
-       string
-       default "17"
+	string
+	default "17"
 
 config BR2_KERNEL_LATEST_2_6_22
-       string
-       default "19"
+	string
+	default "19"
 
 config BR2_KERNEL_LATEST_2_6_21
-       string
-       default "7"
+	string
+	default "7"
 
 config BR2_KERNEL_LATEST_2_6_20
-       string
-       default "21"
+	string
+	default "21"
