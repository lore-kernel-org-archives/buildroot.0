From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu,  3 Jul 2008 01:15:50 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20080703081550.5DAE73C667@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-03 01:15:49 -0700 (Thu, 03 Jul 2008)
New Revision: 22617

Log:
Add support for latest kernels

Modified:
   trunk/buildroot/target/linux/Config.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Config.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Config.in.advanced	2008-07-03 08:14:54 UTC (rev 22616)
+++ trunk/buildroot/target/linux/Config.in.advanced	2008-07-03 08:15:49 UTC (rev 22617)
@@ -32,7 +32,8 @@
 # --- These 'constants' requires regular maintenance, so put them first
 config BR2_KERNEL_PATCH_LEVEL
 	string
-	default "4" if BR2_LINUX_2_6_24 && BR2_KERNEL_ADD_LATEST_MINORPATCH
+	default "9" if BR2_LINUX_2_6_25 && BR2_KERNEL_ADD_LATEST_MINORPATCH
+	default "7" if BR2_LINUX_2_6_24 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 	default "17" if BR2_LINUX_2_6_23 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 	default "19" if BR2_LINUX_2_6_22 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 	default "7" if BR2_LINUX_2_6_21 && BR2_KERNEL_ADD_LATEST_MINORPATCH
@@ -41,10 +42,11 @@
 
 config BR2_KERNEL_CURRENT_VERSION
 	string
-	default "2.6.24.4"
+	default "2.6.25.9"
 
 config BR2_KERNEL_NEXT_VERSION
 	string
+	default "2.6.27" if BR2_LINUX_2_6_26
 	default "2.6.26" if BR2_LINUX_2_6_25
 	default "2.6.25" if BR2_LINUX_2_6_24
 	default "2.6.24" if BR2_LINUX_2_6_23
@@ -54,6 +56,8 @@
 
 config BR2_KERNEL_THIS_VERSION
 	string
+	default "2.6.27" if BR2_LINUX_2_6_27
+	default "2.6.26" if BR2_LINUX_2_6_26
 	default "2.6.25" if BR2_LINUX_2_6_25
 	default "2.6.24" if BR2_LINUX_2_6_24
 	default "2.6.23" if BR2_LINUX_2_6_23
@@ -63,15 +67,15 @@
 
 config LINUX26_LATEST_RC_VERSION
 	string
-	default "2.6.25-rc7" if BR2_KERNEL_ADD_LATEST_RC_PATCH
+	default "2.6.26-rc8" if BR2_KERNEL_ADD_LATEST_RC_PATCH
 
 config LINUX26_LATEST_GIT_VERSION
 	string
-	default "2.6.25-rc7-git5" if BR2_KERNEL_ADD_LATEST_SNAPSHOT
+	default "2.6.25-rc8-git2" if BR2_KERNEL_ADD_LATEST_SNAPSHOT
 
 config LINUX26_LATEST_MM_VERSION
 	string
-	default "2.6.25-rc5-mm1" if BR2_KERNEL_ADD_LATEST_MM_PATCH
+	default "2.6.26-rc5-mm3" if BR2_KERNEL_ADD_LATEST_MM_PATCH
 
 config BR2_KERNEL_SITE
 	string
@@ -129,10 +133,16 @@
 	  Select the specific Linux version you want to use
 
 config BR2_LINUX_2_6_STABLE
-	bool "The latest stable Linux kernel (2.6.24.4)"
+	bool "The latest stable Linux kernel (2.6.25.9)"
 	help
-	  Linux 2.6.24.4
+	  Linux 2.6.25.9
 
+config BR2_LINUX_2_6_25
+	bool "Linux 2.6.25"
+	select BR2_KERNEL_BASE
+	help
+	  Linux 2.6.25
+
 config BR2_LINUX_2_6_24
 	bool "Linux 2.6.24"
 	select BR2_KERNEL_BASE
@@ -188,12 +198,18 @@
 	help
 	  Linux 2.6.20
 
-config BR2_LINUX_2_6_25
-	bool "Linux 2.6.25"
+config BR2_LINUX_2_6_26
+	bool "Linux 2.6.26"
 	select BR2_KERNEL_BASE
 	help
-	  Linux 2.6.25
+	  Linux 2.6.26
 
+config BR2_LINUX_2_6_27
+	bool "Linux 2.6.27"
+	select BR2_KERNEL_BASE
+	help
+	  Linux 2.6.27
+
 config BR2_LINUX26_CUSTOM
 	bool "Linux <custom> version"
 	help
