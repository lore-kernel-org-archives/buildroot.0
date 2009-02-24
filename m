From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 24 Feb 2009 13:29:51 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/x11r7: mesa3d
	xserver_xorg-server
Message-ID: <20090224132951.E32707669C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-24 13:29:50 +0000 (Tue, 24 Feb 2009)
New Revision: 25440

Log:
xserver-xorg: select mesa3d in kconfig

xserver-xorg depends on mesa3d, so select it in kconfig as well.

Modified:
   trunk/buildroot/package/x11r7/mesa3d/Config.in
   trunk/buildroot/package/x11r7/xserver_xorg-server/Config.in


Changeset:
Modified: trunk/buildroot/package/x11r7/mesa3d/Config.in
===================================================================
--- trunk/buildroot/package/x11r7/mesa3d/Config.in	2009-02-24 11:13:56 UTC (rev 25439)
+++ trunk/buildroot/package/x11r7/mesa3d/Config.in	2009-02-24 13:29:50 UTC (rev 25440)
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_MESA3D
 	bool "Mesa 3D Graphics Library"
 	select BR2_PACKAGE_XPROTO_GLPROTO
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER
 	help
 	  Mesa 3D, an open-source implementation of the OpenGL specification.
 

Modified: trunk/buildroot/package/x11r7/xserver_xorg-server/Config.in
===================================================================
--- trunk/buildroot/package/x11r7/xserver_xorg-server/Config.in	2009-02-24 11:13:56 UTC (rev 25439)
+++ trunk/buildroot/package/x11r7/xserver_xorg-server/Config.in	2009-02-24 13:29:50 UTC (rev 25440)
@@ -52,6 +52,7 @@
 	select BR2_PACKAGE_XPROTO_XPROTO
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_XLIB_LIBXSCRNSAVER
+	select BR2_PACKAGE_MESA3D if BR2_PACKAGE_XSERVER_xorg
 	help
 	  xorg-server 1.4
 	  No description available
