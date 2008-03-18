From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 18 Mar 2008 01:17:07 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20080318081707.4848012CF80@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-03-18 01:17:06 -0700 (Tue, 18 Mar 2008)
New Revision: 21380

Log:
Update Kernel config

Modified:
   trunk/buildroot/target/linux/Config.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Config.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Config.in.advanced	2008-03-18 03:13:25 UTC (rev 21379)
+++ trunk/buildroot/target/linux/Config.in.advanced	2008-03-18 08:17:06 UTC (rev 21380)
@@ -32,18 +32,21 @@
 # --- These 'constants' requires regular maintenance, so put them first
 config BR2_KERNEL_PATCH_LEVEL
 	string
-	default "1" if BR2_LINUX_2_6_23 && BR2_KERNEL_ADD_LATEST_MINORPATCH
-	default "10" if BR2_LINUX_2_6_22 && BR2_KERNEL_ADD_LATEST_MINORPATCH
+	default "3" if BR2_LINUX_2_6_24 && BR2_KERNEL_ADD_LATEST_MINORPATCH
+	default "17" if BR2_LINUX_2_6_23 && BR2_KERNEL_ADD_LATEST_MINORPATCH
+	default "19" if BR2_LINUX_2_6_22 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 	default "7" if BR2_LINUX_2_6_21 && BR2_KERNEL_ADD_LATEST_MINORPATCH
-	default "20" if BR2_LINUX_2_6_20 && BR2_KERNEL_ADD_LATEST_MINORPATCH
+	default "21" if BR2_LINUX_2_6_20 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 	default "$(BR2_KERNEL_MINORLEVEL)" if BR2_KERNEL_ADD_MINORPATCH
 
 config BR2_KERNEL_CURRENT_VERSION
 	string
-	default "2.6.24"
+	default "2.6.24.3"
 
 config BR2_KERNEL_NEXT_VERSION
 	string
+	default "2.6.26" if BR2_LINUX_2_6_25
+	default "2.6.25" if BR2_LINUX_2_6_24
 	default "2.6.24" if BR2_LINUX_2_6_23
 	default "2.6.23" if BR2_LINUX_2_6_22
 	default "2.6.22" if BR2_LINUX_2_6_21
@@ -51,6 +54,7 @@
 
 config BR2_KERNEL_THIS_VERSION
 	string
+	default "2.6.25" if BR2_LINUX_2_6_25
 	default "2.6.24" if BR2_LINUX_2_6_24
 	default "2.6.23" if BR2_LINUX_2_6_23
 	default "2.6.22" if BR2_LINUX_2_6_22
@@ -59,15 +63,15 @@
 
 config LINUX26_LATEST_RC_VERSION
 	string
-	default "2.6.24" if BR2_KERNEL_ADD_LATEST_RC_PATCH
+	default "2.6.25" if BR2_KERNEL_ADD_LATEST_RC_PATCH
 
 config LINUX26_LATEST_MM_VERSION
 	string
-	default "2.6.24-mm1" if BR2_KERNEL_ADD_LATEST_MM_PATCH
+	default "2.6.25-rc5-mm1" if BR2_KERNEL_ADD_LATEST_MM_PATCH
 
 config LINUX26_LATEST_GIT_VERSION
 	string
-	default "2.6.24-git3" if BR2_KERNEL_ADD_LATEST_SNAPSHOT
+	default "2.6.25-rc6-git3" if BR2_KERNEL_ADD_LATEST_SNAPSHOT
 
 config BR2_KERNEL_SITE
 	string
@@ -125,9 +129,9 @@
 	  Select the specific Linux version you want to use
 
 config BR2_LINUX_2_6_STABLE
-	bool "The latest stable Linux kernel (2.6.24)"
+	bool "The latest stable Linux kernel (2.6.24.3)"
 	help
-	  Linux 2.6.24
+	  Linux 2.6.24.3
 
 config BR2_LINUX_2_6_24
 	bool "Linux 2.6.24"
@@ -184,6 +188,12 @@
 	help
 	  Linux 2.6.20
 
+config BR2_LINUX_2_6_25
+	bool "Linux 2.6.25"
+	select BR2_KERNEL_BASE
+	help
+	  Linux 2.6.25
+
 config BR2_LINUX26_CUSTOM
 	bool "Linux <custom> version"
 	help
