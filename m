From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 13 Aug 2007 13:50:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  tinyx
Message-ID: <20070813205000.A2B34A6874@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-13 13:49:58 -0700 (Mon, 13 Aug 2007)
New Revision: 19495

Log:
Only build tinyX if WCHAR and LOCALE is enabled

Modified:
   trunk/buildroot/package/Config.in
   trunk/buildroot/package/tinyx/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-08-13 20:22:17 UTC (rev 19494)
+++ trunk/buildroot/package/Config.in	2007-08-13 20:49:58 UTC (rev 19495)
@@ -305,6 +305,7 @@
 	  Xserver to use.
 	  For more information about the X protocol see
 	  http://www.x.org
+	  You may have to enable LOCALE and WCHAR to build
 
 config BR2_PACKAGE_XSERVER_none
 	bool "none"
@@ -314,6 +315,8 @@
 	bool "xorg"
 config BR2_PACKAGE_XSERVER_tinyx
 	bool "tinyx"
+	depends on BR2_USE_WCHAR
+	depends on BR2_ENABLE_LOCALE
 endchoice
 if BR2_PACKAGE_XSERVER_x11r7
 source "package/x11r7/Config.in"

Modified: trunk/buildroot/package/tinyx/Config.in
===================================================================
--- trunk/buildroot/package/tinyx/Config.in	2007-08-13 20:22:17 UTC (rev 19494)
+++ trunk/buildroot/package/tinyx/Config.in	2007-08-13 20:49:58 UTC (rev 19495)
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_TINYX
 	bool "tinyx"
 	default y if BR2_PACKAGE_XSERVER_tinyx
+	depends on BR2_USE_WCHAR
+	depends on BR2_ENABLE_LOCALE
 	help
 	  A tiny X server.  Also known as 'Xfbdev' and 'kdrive'.
 
