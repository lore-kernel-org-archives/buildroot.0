From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 31 Jan 2009 19:08:21 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/x11r7: xapp_xman
	xcb-util
Message-ID: <20090131190821.9457B7621A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-31 19:08:20 +0000 (Sat, 31 Jan 2009)
New Revision: 25183

Log:
x11r7: make xman and xcb-util visible in Kconfig

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>

Modified:
   trunk/buildroot/package/x11r7/Config.in
   trunk/buildroot/package/x11r7/xapp_xman/Config.in
   trunk/buildroot/package/x11r7/xcb-util/Config.in


Changeset:
Modified: trunk/buildroot/package/x11r7/Config.in
===================================================================
--- trunk/buildroot/package/x11r7/Config.in	2009-01-31 18:55:54 UTC (rev 25182)
+++ trunk/buildroot/package/x11r7/Config.in	2009-01-31 19:08:20 UTC (rev 25183)
@@ -18,6 +18,7 @@
 		source package/x11r7/libxcb/Config.in
 		source package/x11r7/mesa3d/Config.in
 		source package/x11r7/pthread-stubs/Config.in
+		source package/x11r7/xcb-util/Config.in
 		source package/x11r7/xlib_libFS/Config.in
 		source package/x11r7/xlib_libICE/Config.in
 		source package/x11r7/xlib_libSM/Config.in
@@ -126,6 +127,7 @@
 		source package/x11r7/xapp_xlsclients/Config.in
 		source package/x11r7/xapp_xlsfonts/Config.in
 		source package/x11r7/xapp_xmag/Config.in
+		source package/x11r7/xapp_xman/Config.in
 		source package/x11r7/xapp_xmessage/Config.in
 		source package/x11r7/xapp_xmh/Config.in
 		source package/x11r7/xapp_xmodmap/Config.in

Modified: trunk/buildroot/package/x11r7/xapp_xman/Config.in
===================================================================
--- trunk/buildroot/package/x11r7/xapp_xman/Config.in	2009-01-31 18:55:54 UTC (rev 25182)
+++ trunk/buildroot/package/x11r7/xapp_xman/Config.in	2009-01-31 19:08:20 UTC (rev 25183)
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XAPP_XMAN
-        bool "xapp_xman"
-        help
+	bool "xman"
+	help
 	  Manual page display program for the X Window System
-

Modified: trunk/buildroot/package/x11r7/xcb-util/Config.in
===================================================================
--- trunk/buildroot/package/x11r7/xcb-util/Config.in	2009-01-31 18:55:54 UTC (rev 25182)
+++ trunk/buildroot/package/x11r7/xcb-util/Config.in	2009-01-31 19:08:20 UTC (rev 25183)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_XCB_UTIL
+	bool "xcb-util"
+	help
+	  Libraries which sit on top of libxcb, the core X protocol library,
+	  and some of the extension libraries.
+
+	  http://xcb.freedesktop.org/
