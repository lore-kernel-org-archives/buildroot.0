From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 11 Jul 2007 07:42:33 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20070711144233.49A8EA6803@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-11 07:42:32 -0700 (Wed, 11 Jul 2007)
New Revision: 19065

Log:
Configure linux within target/linux/Config.in instead of within target/device/Config.in

Added:
   trunk/buildroot/target/linux/Config.in


Changeset:
Added: trunk/buildroot/target/linux/Config.in
===================================================================
--- trunk/buildroot/target/linux/Config.in	                        (rev 0)
+++ trunk/buildroot/target/linux/Config.in	2007-07-11 14:42:32 UTC (rev 19065)
@@ -0,0 +1,44 @@
+menu "Linux Options"
+
+config BR2_PACKAGE_LINUX
+	bool "linux kernel"
+	default n
+	help
+	  The Linux kernel.
+	  http://www.kernel.org/
+
+	  Note: Requires kernel-headers >= 2.6.19 since the other
+	        kernel headers are just that (headers) and not full
+		kernels. This is a feature.
+
+config BR2_PACKAGE_LINUX_KCONFIG
+	string ".config file"
+	depends on BR2_PACKAGE_LINUX
+	default ""
+	help
+	  kernel's .config to use to build a kernel for the target.
+
+	  If the above setting is empty, you can change the default
+	  board-imposed value by passing LINUX26_KCONFIG=<path> to
+	  make.
+
+config BR2_PACKAGE_LINUX_FORMAT
+	string "kernel binary format"
+	depends on BR2_PACKAGE_LINUX
+	default ""
+	help
+	  kernel binary format.
+	  Popular values include:
+	  - bzImage
+	  - zImage
+	  and other, architecture dependant formats.
+
+	  Note that the default format is supposed to be set by your
+	  board-description, if any.
+	  i386 and compatible default to bzImage if nothing was given
+	  above.
+	  If the above setting is empty, you can change the default
+	  board-imposed value by passing LINUX26_FORMAT=<string> to
+	  make.
+
+endmenu
