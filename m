From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 30 Jun 2008 05:49:19 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/x11r7:
	xdriver_xf86-video-intel
Message-ID: <20080630124919.715493C65B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-30 05:49:18 -0700 (Mon, 30 Jun 2008)
New Revision: 22564

Log:
x11r7: add intel xorg video driver

Based on googlecode r552 by John Voltz.


Added:
   trunk/buildroot/package/x11r7/xdriver_xf86-video-intel/
   trunk/buildroot/package/x11r7/xdriver_xf86-video-intel/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk


Changeset:
Added: trunk/buildroot/package/x11r7/xdriver_xf86-video-intel/Config.in
===================================================================
--- trunk/buildroot/package/x11r7/xdriver_xf86-video-intel/Config.in	                        (rev 0)
+++ trunk/buildroot/package/x11r7/xdriver_xf86-video-intel/Config.in	2008-06-30 12:49:18 UTC (rev 22564)
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL
+	bool "xf86-video-intel"
+	default n
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  xf86-video-intel 2.1.1
+	  Intel video driver

Added: trunk/buildroot/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
===================================================================
--- trunk/buildroot/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk	                        (rev 0)
+++ trunk/buildroot/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk	2008-06-30 12:49:18 UTC (rev 22564)
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xdriver_xf86-video-intel -- Intel video driver
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.1.1
+XDRIVER_XF86_VIDEO_INTEL_SOURCE = xf86-video-intel-$(XDRIVER_XF86_VIDEO_INTEL_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_INTEL_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_INTEL_AUTORECONF = NO
+XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
+
+$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-intel))
