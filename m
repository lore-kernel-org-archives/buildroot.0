From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun,  1 Feb 2009 19:37:06 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target:  linux
Message-ID: <20090201193706.70A447653E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-01 19:37:06 +0000 (Sun, 01 Feb 2009)
New Revision: 25207

Log:
buildroot: use same defaults for atmel target as everything else

Modified:
   trunk/buildroot/target/Config.in
   trunk/buildroot/target/linux/Config.in.advanced


Changeset:
Modified: trunk/buildroot/target/Config.in
===================================================================
--- trunk/buildroot/target/Config.in	2009-02-01 19:36:56 UTC (rev 25206)
+++ trunk/buildroot/target/Config.in	2009-02-01 19:37:06 UTC (rev 25207)
@@ -26,8 +26,7 @@
 menu "Kernel"
 choice
 	prompt "Kernel type"
-	default BR2_KERNEL_LINUX_ADVANCED if BR2_TARGET_ATMEL
-	default BR2_KERNEL_none if !BR2_TARGET_ATMEL
+	default BR2_KERNEL_none
 
 config BR2_KERNEL_none
 	bool "none"

Modified: trunk/buildroot/target/linux/Config.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Config.in.advanced	2009-02-01 19:36:56 UTC (rev 25206)
+++ trunk/buildroot/target/linux/Config.in.advanced	2009-02-01 19:37:06 UTC (rev 25207)
@@ -505,8 +505,6 @@
 
 config BR2_LINUX_COPYTO_TFTPBOOT
 	bool "Copy kernel to /tftpboot"
-	default y if BR2_TARGET_ATMEL
-	default n if !BR2_TARGET_ATMEL
 	help
 	  Copy kernel to /tftpboot directory
 
@@ -518,8 +516,6 @@
 
 config BR2_LINUX_COPY_CONFIGURATION
 	bool "Copy buildroot configuration to Linux file system"
-	default y if BR2_TARGET_ATMEL
-	default n if !BR2_TARGET_ATMEL
 	help
 	  The configuration files for buildroot, uclibc, busybox and linux
 	  are copied to the "<root>/boot" directory.
