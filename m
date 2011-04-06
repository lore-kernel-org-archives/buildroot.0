From: Allan W. Nielsen <a@awn.dk>
Date: Wed,  6 Apr 2011 12:04:15 +0200
Subject: [Buildroot] [PATCH 61/63] libdrm: upgraded to version 2.4.23 and
	added udev as dependency
In-Reply-To: <1302084257-30775-1-git-send-email-a@awn.dk>
References: <1302084257-30775-1-git-send-email-a@awn.dk>
Message-ID: <1302084257-30775-62-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Allan W. Nielsen <a@awn.dk>
---
 package/libdrm/Config.in |    1 +
 package/libdrm/libdrm.mk |    4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index d68f9d5..3df22e0 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBDRM
 	bool "libdrm"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_LARGEFILE
+	select BR2_PACKAGE_UDEV
 	select BR2_PACKAGE_XPROTO_GLPROTO
 	select BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
 	select BR2_PACKAGE_XLIB_LIBXXF86VM
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index fe7a46f..a013e5d 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -3,12 +3,12 @@
 # libdrm
 #
 #############################################################
-LIBDRM_VERSION = 2.4.19
+LIBDRM_VERSION = 2.4.23
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm/
 LIBDRM_INSTALL_STAGING = YES
 
-LIBDRM_DEPENDENCIES = xproto_glproto xproto_xf86vidmodeproto xlib_libXxf86vm xlib_libXmu xproto_dri2proto pthread-stubs
+LIBDRM_DEPENDENCIES = xproto_glproto xproto_xf86vidmodeproto xlib_libXxf86vm xlib_libXmu xproto_dri2proto pthread-stubs udev
 
 ifeq ($(BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL),y)
 LIBDRM_CONF_OPT += --enable-intel
-- 
1.7.3.4
