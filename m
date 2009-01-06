From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue,  6 Jan 2009 21:24:43 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20090106212443.8820F76CB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-06 21:24:42 +0000 (Tue, 06 Jan 2009)
New Revision: 24711

Log:
Set default kernel to BR2_LINUX26_STABLE, Remove duplicate definion of BR2_KERNEL_CURRENT_VERSION and remove comments from Config.in choices

Modified:
   trunk/buildroot/target/linux/Config.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Config.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Config.in.advanced	2009-01-06 16:42:15 UTC (rev 24710)
+++ trunk/buildroot/target/linux/Config.in.advanced	2009-01-06 21:24:42 UTC (rev 24711)
@@ -45,10 +45,6 @@
 	default $(BR2_KERNEL_LATEST_2_6_20) if BR2_LINUX_2_6_20 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 	default "$(BR2_KERNEL_MINORLEVEL)" if BR2_KERNEL_ADD_MINORPATCH
 
-config BR2_KERNEL_CURRENT_VERSION
-	string
-	default "2.6.27.10"
-
 config BR2_KERNEL_NEXT_VERSION
 	string
 	default "2.6.29" if BR2_LINUX_2_6_28
@@ -123,104 +119,71 @@
 
 choice
 	prompt "Linux Kernel Version"
-	default BR2_LINUX_2_6_28
+	default BR2_LINUX_2_6_STABLE
 	help
 	  Select the specific Linux version you want to use
 
 config BR2_LINUX_2_6_STABLE
 	bool "The latest stable Linux kernel (2.6.28)"
-	help
-	  Linux 2.26.28
 
 config BR2_LINUX_2_6_28
 	bool "Linux 2.6.28"
 	select BR2_KERNEL_BASE
-	help
-	  Linux 2.6.28
 
 config BR2_LINUX_2_6_27
 	bool "Linux 2.6.27"
 	select BR2_KERNEL_BASE
-	help
-	  Linux 2.6.27
 
 config BR2_LINUX_2_6_26
 	bool "Linux 2.6.26"
 	select BR2_KERNEL_BASE
-	help
-	  Linux 2.6.26
 
 config BR2_LINUX_2_6_25
 	bool "Linux 2.6.25"
 	select BR2_KERNEL_BASE
-	help
-	  Linux 2.6.25
 
 config BR2_LINUX_2_6_24
 	bool "Linux 2.6.24"
 	select BR2_KERNEL_BASE
-	help
-	  Linux 2.6.24
 
 config BR2_LINUX_2_6_23
 	bool "Linux 2.6.23"
 	select BR2_KERNEL_BASE
-	help
-	  Linux 2.6.23
 
 config BR2_LINUX_2_6_22_10
 	bool "Linux 2.6.22.10"
 	select BR2_KERNEL_PREPATCHED
-	help
-	  Linux 2.6.22.10
 
 config BR2_LINUX_2_6_22_1
 	bool "Linux 2.6.22.1"
 	select BR2_KERNEL_PREPATCHED
-	help
-	  Linux 2.6.22.1
 
 config BR2_LINUX_2_6_22
 	bool "Linux 2.6.22"
-	select BR2_KERNEL_LATEST
 	select BR2_KERNEL_BASE
-	help
-	  Linux 2.6.22
 
 config BR2_LINUX_2_6_21_7
 	bool "Linux 2.6.21.7"
 	select BR2_KERNEL_PREPATCHED
-	help
-	  Linux 2.6.21.1
 
 config BR2_LINUX_2_6_21_5
 	bool "Linux 2.6.21.5"
 	select BR2_KERNEL_PREPATCHED
-	help
-	  Linux 2.6.21.5
 
 config BR2_LINUX_2_6_21
 	bool "Linux 2.6.21"
 	select BR2_KERNEL_BASE
-	help
-	  Linux 2.6.21
 
 config BR2_LINUX_2_6_20
 	bool "Linux 2.6.20"
 	select BR2_KERNEL_BASE
-	help
-	  Linux 2.6.20
 
 config BR2_LINUX_2_6_29
 	bool "Linux 2.6.29"
 	select BR2_KERNEL_BASE
-	help
-	  Linux 2.6.29
 
 config BR2_LINUX26_CUSTOM
 	bool "Linux <custom> version"
-	help
-	  Linux <your selection>
 
 endchoice
 
