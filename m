From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 11 Aug 2007 16:31:42 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  libdrm x11r7
Message-ID: <20070811233142.A67D3A6599@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-11 16:31:41 -0700 (Sat, 11 Aug 2007)
New Revision: 19448

Log:
Use package/libdrm instead of package/x11r7/libdrm

Removed:
   trunk/buildroot/package/x11r7/libdrm/

Modified:
   trunk/buildroot/package/Config.in
   trunk/buildroot/package/libdrm/Config.in
   trunk/buildroot/package/x11r7/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-08-11 23:22:40 UTC (rev 19447)
+++ trunk/buildroot/package/Config.in	2007-08-11 23:31:41 UTC (rev 19448)
@@ -329,6 +329,7 @@
 source "package/atk/Config.in"
 source "package/cairo/Config.in"
 source "package/pango/Config.in"
+source "package/libdrm/Config.in"
 source "package/libglib12/Config.in"
 source "package/libglib2/Config.in"
 source "package/libgtk12/Config.in"

Modified: trunk/buildroot/package/libdrm/Config.in
===================================================================
--- trunk/buildroot/package/libdrm/Config.in	2007-08-11 23:22:40 UTC (rev 19447)
+++ trunk/buildroot/package/libdrm/Config.in	2007-08-11 23:31:41 UTC (rev 19448)
@@ -2,5 +2,6 @@
 	bool "libdrm"
 	default n
 	help
-
-	http://dri.freedesktop.org/libdrm/
+	  Direct Rendering Manager
+	
+	  http://dri.freedesktop.org/libdrm/

Modified: trunk/buildroot/package/x11r7/Config.in
===================================================================
--- trunk/buildroot/package/x11r7/Config.in	2007-08-11 23:22:40 UTC (rev 19447)
+++ trunk/buildroot/package/x11r7/Config.in	2007-08-11 23:31:41 UTC (rev 19448)
@@ -14,7 +14,6 @@
 		source package/x11r7/xserver_xorg-server/Config.in
 	endmenu
 	menu "X11R7 Libraries"
-		source package/x11r7/libdrm/Config.in
 		source package/x11r7/libxcb/Config.in
 		source package/x11r7/mesa3d/Config.in
 		source package/x11r7/pthread-stubs/Config.in
