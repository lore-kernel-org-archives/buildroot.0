From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 25 Sep 2007 23:32:45 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  busybox
Message-ID: <20070926063245.872C3A65AC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-25 23:32:42 -0700 (Tue, 25 Sep 2007)
New Revision: 20032

Log:
Reduce clutter in packages menu

Modified:
   trunk/buildroot/package/Config.in
   trunk/buildroot/package/busybox/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-09-26 06:13:09 UTC (rev 20031)
+++ trunk/buildroot/package/Config.in	2007-09-26 06:32:42 UTC (rev 20032)
@@ -1,11 +1,17 @@
 menu "Package Selection for the target"
 
-
-comment "The default minimal system"
 source "package/busybox/Config.in"
 
+comment "The minimum needed to build a uClibc development system ---"
 
-comment "The minimum needed to build a uClibc development system"
+menuconfig BR2_APPLICATIONS
+	bool "Common Applications"
+	default y
+	help
+	  A set of applications, utilities and libraries for 
+	  text processing, toolchain generation and other things.
+
+if BR2_APPLICATIONS
 source "package/bash/Config.in"
 source "package/bzip2/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
@@ -77,7 +83,6 @@
 source "package/ltp-testsuite/Config.in"
 source "package/ltrace/Config.in"
 source "package/ltt/Config.in"
-source "package/microcom/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/module-init-tools/Config.in"
 source "package/modutils/Config.in"
@@ -114,14 +119,18 @@
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/which/Config.in"
 endif
+endif
 
 menuconfig BR2_NETWORK_SUPPORT
 	bool "Networking"
 	default y
 	help
-	  Support for networking and related packages
+	  Support for communication, networking and related packages
 
 if BR2_NETWORK_SUPPORT
+comment "Communications applications"
+source "package/microcom/Config.in"
+comment "Networking applications"
 source "package/argus/Config.in"
 source "package/avahi/Config.in"
 source "package/boa/Config.in"

Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2007-09-26 06:13:09 UTC (rev 20031)
+++ trunk/buildroot/package/busybox/Config.in	2007-09-26 06:32:42 UTC (rev 20032)
@@ -1,3 +1,10 @@
+menuconfig BR2_BUSYBOX_MENU
+	bool "Busybox configuration -- the default minimal system"
+	default y
+	help
+	  Configuration of Busybox, 
+
+if BR2_BUSYBOX_MENU
 config BR2_PACKAGE_BUSYBOX
 	bool "BusyBox"
 	default y
@@ -155,3 +162,4 @@
 #	depends on BR2_PACKAGE_BUSYBOX
 #	help
 #	  Build small initramfs perusing busybox.
+endif
