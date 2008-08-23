From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 23 Aug 2008 13:25:30 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20080823202530.798ADF8008@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-08-23 13:25:29 -0700 (Sat, 23 Aug 2008)
New Revision: 23187

Log:
Add configurations for current linux versions

Modified:
   trunk/buildroot/target/linux/Config.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Config.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Config.in.advanced	2008-08-23 13:08:37 UTC (rev 23186)
+++ trunk/buildroot/target/linux/Config.in.advanced	2008-08-23 20:25:29 UTC (rev 23187)
@@ -32,6 +32,7 @@
 # --- These 'constants' requires regular maintenance, so put them first
 config BR2_KERNEL_PATCH_LEVEL
 	string
+	default "3" if BR2_LINUX_2_6_26 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 	default "9" if BR2_LINUX_2_6_25 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 	default "7" if BR2_LINUX_2_6_24 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 	default "17" if BR2_LINUX_2_6_23 && BR2_KERNEL_ADD_LATEST_MINORPATCH
@@ -42,10 +43,11 @@
 
 config BR2_KERNEL_CURRENT_VERSION
 	string
-	default "2.6.25.10"
+	default "2.6.26.3"
 
 config BR2_KERNEL_NEXT_VERSION
 	string
+	default "2.6.28" if BR2_LINUX_2_6_27
 	default "2.6.27" if BR2_LINUX_2_6_26
 	default "2.6.26" if BR2_LINUX_2_6_25
 	default "2.6.25" if BR2_LINUX_2_6_24
@@ -56,6 +58,7 @@
 
 config BR2_KERNEL_THIS_VERSION
 	string
+	default "2.6.28" if BR2_LINUX_2_6_28
 	default "2.6.27" if BR2_LINUX_2_6_27
 	default "2.6.26" if BR2_LINUX_2_6_26
 	default "2.6.25" if BR2_LINUX_2_6_25
@@ -67,15 +70,15 @@
 
 config LINUX26_LATEST_RC_VERSION
 	string
-	default "2.6.26-rc8" if BR2_KERNEL_ADD_LATEST_RC_PATCH
+	default "2.6.27-rc4" if BR2_KERNEL_ADD_LATEST_RC_PATCH
 
 config LINUX26_LATEST_GIT_VERSION
 	string
-	default "2.6.25-rc8-git2" if BR2_KERNEL_ADD_LATEST_SNAPSHOT
+	default "2.6.27-rc4-git1" if BR2_KERNEL_ADD_LATEST_SNAPSHOT
 
 config LINUX26_LATEST_MM_VERSION
 	string
-	default "2.6.26-rc5-mm3" if BR2_KERNEL_ADD_LATEST_MM_PATCH
+	default "2.6.27-rc1-mm1" if BR2_KERNEL_ADD_LATEST_MM_PATCH
 
 config BR2_KERNEL_SITE
 	string
@@ -133,10 +136,16 @@
 	  Select the specific Linux version you want to use
 
 config BR2_LINUX_2_6_STABLE
-	bool "The latest stable Linux kernel (2.6.25.10)"
+	bool "The latest stable Linux kernel (2.6.26.3)"
 	help
-	  Linux 2.6.25.10
+	  Linux 2.6.26.3
 
+config BR2_LINUX_2_6_26
+	bool "Linux 2.6.26"
+	select BR2_KERNEL_BASE
+	help
+	  Linux 2.6.26
+
 config BR2_LINUX_2_6_25
 	bool "Linux 2.6.25"
 	select BR2_KERNEL_BASE
@@ -198,18 +207,18 @@
 	help
 	  Linux 2.6.20
 
-config BR2_LINUX_2_6_26
-	bool "Linux 2.6.26"
-	select BR2_KERNEL_BASE
-	help
-	  Linux 2.6.26
-
 config BR2_LINUX_2_6_27
 	bool "Linux 2.6.27"
 	select BR2_KERNEL_BASE
 	help
 	  Linux 2.6.27
 
+config BR2_LINUX_2_6_28
+	bool "Linux 2.6.28"
+	select BR2_KERNEL_BASE
+	help
+	  Linux 2.6.28
+
 config BR2_LINUX26_CUSTOM
 	bool "Linux <custom> version"
 	help
