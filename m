From: correa at uclibc.org <correa@uclibc.org>
Date: Thu,  3 Jul 2008 20:49:20 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080704034920.4A9463C658@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2008-07-03 20:49:18 -0700 (Thu, 03 Jul 2008)
New Revision: 22623

Log:
Ensure consistency between XORG_none and (XORG_x11, XORG_tinyx)

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-07-04 02:57:13 UTC (rev 22622)
+++ trunk/buildroot/package/Config.in	2008-07-04 03:49:18 UTC (rev 22623)
@@ -357,10 +357,13 @@
 menu "X Window System server"
 config BR2_PACKAGE_XSERVER_none
 	bool "none"
+	default y
 config BR2_PACKAGE_XSERVER_xorg
 	bool "modular xorg"
+	depends on !BR2_PACKAGE_XSERVER_none
 config BR2_PACKAGE_XSERVER_tinyx
 	bool "tinyx"
+	depends on !BR2_PACKAGE_XSERVER_none
 endmenu
 
 config BR2_X11_PREFIX
