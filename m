From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 20 Dec 2008 20:57:07 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20081220205708.1766876CEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-12-20 20:57:07 +0000 (Sat, 20 Dec 2008)
New Revision: 24465

Log:
Put latest version info in separate file for easier maintenance

Added:
   trunk/buildroot/target/linux/Config.in.versions

Modified:
   trunk/buildroot/target/linux/Config.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Config.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Config.in.advanced	2008-12-20 18:26:38 UTC (rev 24464)
+++ trunk/buildroot/target/linux/Config.in.advanced	2008-12-20 20:57:07 UTC (rev 24465)
@@ -30,21 +30,24 @@
 #
 # ---------------------------------------------------------------------------
 # --- These 'constants' requires regular maintenance, so put them first
+
+source "target/linux/Config.in.versions"
+
 config BR2_KERNEL_PATCH_LEVEL
 	string
-	default "9" if BR2_LINUX_2_6_27 && BR2_KERNEL_ADD_LATEST_MINORPATCH
-	default "8" if BR2_LINUX_2_6_26 && BR2_KERNEL_ADD_LATEST_MINORPATCH
-	default "9" if BR2_LINUX_2_6_25 && BR2_KERNEL_ADD_LATEST_MINORPATCH
-	default "7" if BR2_LINUX_2_6_24 && BR2_KERNEL_ADD_LATEST_MINORPATCH
-	default "17" if BR2_LINUX_2_6_23 && BR2_KERNEL_ADD_LATEST_MINORPATCH
-	default "19" if BR2_LINUX_2_6_22 && BR2_KERNEL_ADD_LATEST_MINORPATCH
-	default "7" if BR2_LINUX_2_6_21 && BR2_KERNEL_ADD_LATEST_MINORPATCH
-	default "21" if BR2_LINUX_2_6_20 && BR2_KERNEL_ADD_LATEST_MINORPATCH
+	default $(BR2_KERNEL_LATEST_2_6_27) if BR2_LINUX_2_6_27 && BR2_KERNEL_ADD_LATEST_MINORPATCH
+	default $(BR2_KERNEL_LATEST_2_6_26) if BR2_LINUX_2_6_26 && BR2_KERNEL_ADD_LATEST_MINORPATCH
+	default $(BR2_KERNEL_LATEST_2_6_25) if BR2_LINUX_2_6_25 && BR2_KERNEL_ADD_LATEST_MINORPATCH
+	default $(BR2_KERNEL_LATEST_2_6_24) if BR2_LINUX_2_6_24 && BR2_KERNEL_ADD_LATEST_MINORPATCH
+	default $(BR2_KERNEL_LATEST_2_6_23) if BR2_LINUX_2_6_23 && BR2_KERNEL_ADD_LATEST_MINORPATCH
+	default $(BR2_KERNEL_LATEST_2_6_22) if BR2_LINUX_2_6_22 && BR2_KERNEL_ADD_LATEST_MINORPATCH
+	default $(BR2_KERNEL_LATEST_2_6_21) if BR2_LINUX_2_6_21 && BR2_KERNEL_ADD_LATEST_MINORPATCH
+	default $(BR2_KERNEL_LATEST_2_6_20) if BR2_LINUX_2_6_20 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 	default "$(BR2_KERNEL_MINORLEVEL)" if BR2_KERNEL_ADD_MINORPATCH
 
 config BR2_KERNEL_CURRENT_VERSION
 	string
-	default "2.6.27.9"
+	default "2.6.27.10"
 
 config BR2_KERNEL_NEXT_VERSION
 	string
@@ -71,18 +74,6 @@
 	default "2.6.21" if BR2_LINUX_2_6_21
 	default "2.6.20" if BR2_LINUX_2_6_20
 
-config LINUX26_LATEST_RC_VERSION
-	string
-	default "2.6.28-rc8" if BR2_KERNEL_ADD_LATEST_RC_PATCH
-
-config LINUX26_LATEST_GIT_VERSION
-	string
-	default "2.6.28-rc6-git4" if BR2_KERNEL_ADD_LATEST_SNAPSHOT
-
-config LINUX26_LATEST_MM_VERSION
-	string
-	default "2.6.28-rc2-mm1" if BR2_KERNEL_ADD_LATEST_MM_PATCH
-
 config BR2_KERNEL_SITE
 	string
 	default "http://ftp.kernel.org/pub/linux/kernel/v2.6/"
@@ -139,9 +130,9 @@
 	  Select the specific Linux version you want to use
 
 config BR2_LINUX_2_6_STABLE
-	bool "The latest stable Linux kernel (2.6.27.9)"
+	bool "The latest stable Linux kernel (2.6.27.10)"
 	help
-	  Linux 2.6.27.9
+	  Linux 2.26.27.10
 
 config BR2_LINUX_2_6_27
 	bool "Linux 2.6.27"

Added: trunk/buildroot/target/linux/Config.in.versions
===================================================================
--- trunk/buildroot/target/linux/Config.in.versions	                        (rev 0)
+++ trunk/buildroot/target/linux/Config.in.versions	2008-12-20 20:57:07 UTC (rev 24465)
@@ -0,0 +1,52 @@
+# This file defines the latest version of 
+# You also have to edit BR2_LINUX_2_6_STABLE
+# in target/linux/Config.in.advanced
+# which is approximately at line 132
+
+config LINUX26_LATEST_RC_VERSION
+	string
+	default "2.6.28-rc9" if BR2_KERNEL_ADD_LATEST_RC_PATCH
+
+config LINUX26_LATEST_GIT_VERSION
+	string
+	default "2.6.28-rc9-git1" if BR2_KERNEL_ADD_LATEST_SNAPSHOT
+
+config LINUX26_LATEST_MM_VERSION
+	string
+	default "2.6.28-rc2-mm1" if BR2_KERNEL_ADD_LATEST_MM_PATCH
+
+config BR2_KERNEL_CURRENT_VERSION
+	string
+	default "2.6.27.10"
+
+config BR2_KERNEL_LATEST_2_6_27
+       string
+       default "10"
+
+config BR2_KERNEL_LATEST_2_6_26
+       string
+       default "8"
+
+config BR2_KERNEL_LATEST_2_6_25
+       string
+       default "9"
+
+config BR2_KERNEL_LATEST_2_6_24
+       string
+       default "7"
+
+config BR2_KERNEL_LATEST_2_6_23
+       string
+       default "17"
+
+config BR2_KERNEL_LATEST_2_6_22
+       string
+       default "19"
+
+config BR2_KERNEL_LATEST_2_6_21
+       string
+       default "7"
+
+config BR2_KERNEL_LATEST_2_6_20
+       string
+       default "21"
