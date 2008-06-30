From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 30 Jun 2008 06:16:07 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/x11r7:
	xdriver_xf86-video-xgi
Message-ID: <20080630131607.796AB3C64F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-30 06:16:00 -0700 (Mon, 30 Jun 2008)
New Revision: 22570

Log:
x1157: add XGI video driver

Based on googlecode r575 by Thiago Correa.


Added:
   trunk/buildroot/package/x11r7/xdriver_xf86-video-xgi/
   trunk/buildroot/package/x11r7/xdriver_xf86-video-xgi/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk

Modified:
   trunk/buildroot/package/x11r7/Config.in


Changeset:
Modified: trunk/buildroot/package/x11r7/Config.in
===================================================================
--- trunk/buildroot/package/x11r7/Config.in	2008-06-30 13:14:44 UTC (rev 22569)
+++ trunk/buildroot/package/x11r7/Config.in	2008-06-30 13:16:00 UTC (rev 22570)
@@ -228,6 +228,7 @@
 		source package/x11r7/xdriver_xf86-video-via/Config.in
 		source package/x11r7/xdriver_xf86-video-vmware/Config.in
 		source package/x11r7/xdriver_xf86-video-voodoo/Config.in
+		source package/x11r7/xdriver_xf86-video-xgi/Config.in
 	endmenu
 	endif
 	menu "X11R7 Fonts"

Added: trunk/buildroot/package/x11r7/xdriver_xf86-video-xgi/Config.in
===================================================================
--- trunk/buildroot/package/x11r7/xdriver_xf86-video-xgi/Config.in	                        (rev 0)
+++ trunk/buildroot/package/x11r7/xdriver_xf86-video-xgi/Config.in	2008-06-30 13:16:00 UTC (rev 22570)
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_XGI
+	bool "xf86-video-xgi"
+	default n
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_XEXTPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  xf86-video-xgi 1.3.0
+	  XGI based chips video driver

Added: trunk/buildroot/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk
===================================================================
--- trunk/buildroot/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk	                        (rev 0)
+++ trunk/buildroot/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk	2008-06-30 13:16:00 UTC (rev 22570)
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xdriver_xf86-video-xgi -- XGI video driver
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_XGI_VERSION = 1.5.0
+XDRIVER_XF86_VIDEO_XGI_SOURCE = xf86-video-xgi-$(XDRIVER_XF86_VIDEO_VESA_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_XGI_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_XGI_AUTORECONF = NO
+XDRIVER_XF86_VIDEO_XGI_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
+XDRIVER_XF86_VIDEO_XGI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+
+$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-xgi))
