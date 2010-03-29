From: Paul Jones <paul@pauljones.id.au>
Date: Mon, 29 Mar 2010 18:52:50 +1100
Subject: [Buildroot] [PATCH] Bump libdrm to 2.4.14
Message-ID: <1269849170-13244-1-git-send-email-paul@pauljones.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also adds proper dependency information to stop build errors.

Signed-off-by: Paul Jones <paul@pauljones.id.au>
---
 package/libdrm/Config.in |    6 ++++++
 package/libdrm/libdrm.mk |    4 +++-
 2 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index 3d8a731..e1d35ad 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -1,5 +1,11 @@
 config BR2_PACKAGE_LIBDRM
 	bool "libdrm"
+	select BR2_PACKAGE_XPROTO_GLPROTO
+	select BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
+	select BR2_PACKAGE_XLIB_LIBXXF86VM
+	select BR2_PACKAGE_XLIB_LIBXMU
+	select BR2_PACKAGE_XPROTO_DRI2PROTO
+	select BR2_PACKAGE_PTHREAD_STUBS
 	help
 	  Direct Rendering Manager
 
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index eb04867..e56f542 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -3,7 +3,7 @@
 # libdrm
 #
 #############################################################
-LIBDRM_VERSION = 2.4.11
+LIBDRM_VERSION = 2.4.14
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm/
 LIBDRM_AUTORECONF = NO
@@ -11,4 +11,6 @@ LIBDRM_LIBTOOL_PATCH = NO
 LIBDRM_INSTALL_STAGING = YES
 LIBDRM_INSTALL_TARGET = YES
 
+LIBDRM_DEPENDENCIES = xproto_glproto xproto_xf86vidmodeproto xlib_libXxf86vm xlib_libXmu xproto_dri2proto pthread-stubs
+
 $(eval $(call AUTOTARGETS,package,libdrm))
-- 
1.6.4.4
