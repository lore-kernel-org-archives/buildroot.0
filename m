From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun,  7 Oct 2007 11:29:17 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package/busybox
	toolchain/gcc
Message-ID: <20071007182917.0C89E30042@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-07 11:29:17 -0700 (Sun, 07 Oct 2007)
New Revision: 20199

Log:
Allow longer history for package versions

Modified:
   trunk/buildroot/Config.in
   trunk/buildroot/package/busybox/Config.in
   trunk/buildroot/toolchain/gcc/Config.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2007-10-07 18:23:43 UTC (rev 20198)
+++ trunk/buildroot/Config.in	2007-10-07 18:29:17 UTC (rev 20199)
@@ -170,6 +170,12 @@
 	help
 	  This option hides outdated/obsolete versions of packages.
 
+config BR2_RECENT
+	bool "Show packages that are of the latest major version"
+	default y
+	help
+	  This option show recent versions of packages.
+
 choice
 	prompt "strip"
 	default BR2_STRIP_strip

Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2007-10-07 18:23:43 UTC (rev 20198)
+++ trunk/buildroot/package/busybox/Config.in	2007-10-07 18:29:17 UTC (rev 20199)
@@ -26,11 +26,11 @@
 
 	config BR2_BUSYBOX_VERSION_1_7_0
 		bool "BusyBox 1.7.0"
-		depends on BR2_DEPRECATED
+		depends on BR2_DEPRECATED || BR2_RECENT
 
 	config BR2_BUSYBOX_VERSION_1_7_1
 		bool "BusyBox 1.7.1"
-		depends on BR2_DEPRECATED
+		depends on BR2_DEPRECATED || BR2_RECENT
 
 	config BR2_BUSYBOX_VERSION_1_7_2
 		bool "BusyBox 1.7.2"

Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2007-10-07 18:23:43 UTC (rev 20198)
+++ trunk/buildroot/toolchain/gcc/Config.in	2007-10-07 18:29:17 UTC (rev 20199)
@@ -23,7 +23,7 @@
 
 	config BR2_GCC_VERSION_4_2_0
 		depends !BR2_avr32 && !BR2_nios2
-		depends BR2_DEPRECATED
+		depends BR2_DEPRECATED || BR2_RECENT
 		bool "gcc 4.2.0"
 
 	config BR2_GCC_VERSION_4_2_1
