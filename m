From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 23 Mar 2009 12:50:06 +0000 (UTC)
Subject: [Buildroot] svn commit: [25793] trunk/buildroot/package/x11r7/mesa3d
Message-ID: <20090323125006.510947656C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-23 12:50:05 +0000 (Mon, 23 Mar 2009)
New Revision: 25793

Log:
mesa3d: sync kconfig deps with makefile

Modified:
   trunk/buildroot/package/x11r7/mesa3d/Config.in


Changeset:
Modified: trunk/buildroot/package/x11r7/mesa3d/Config.in
===================================================================
--- trunk/buildroot/package/x11r7/mesa3d/Config.in	2009-03-23 11:40:10 UTC (rev 25792)
+++ trunk/buildroot/package/x11r7/mesa3d/Config.in	2009-03-23 12:50:05 UTC (rev 25793)
@@ -1,6 +1,12 @@
 config BR2_PACKAGE_MESA3D
 	bool "Mesa 3D Graphics Library"
 	select BR2_PACKAGE_XPROTO_GLPROTO
+	select BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
+	select BR2_PACKAGE_XLIB_LIBXXF86VM
+	select BR2_PACKAGE_XLIB_LIBXMU
+	select BR2_PACKAGE_XLIB_LIBPCIACCESS
+	select BR2_PACKAGE_XLIB_LIBXDAMAGE
+	select BR2_PACKAGE_LIBDRM
 	depends on BR2_PACKAGE_XSERVER_XORG_SERVER
 	help
 	  Mesa 3D, an open-source implementation of the OpenGL specification.
