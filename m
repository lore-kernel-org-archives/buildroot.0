From: Will Wagner <will_wagner@carallon.com>
Date: Thu,  1 Apr 2010 13:46:31 +0100
Subject: [Buildroot] [PATCH 01/16] libdrm: bump version to 2.4.19
Message-ID: <1270126006-22405-1-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also adds proper dependency information to stop build errors.

Signed-off-by: Paul Jones <paul@pauljones.id.au>
Acked-by: Will Wagner <willw@carallon.com>
---
 package/libdrm/Config.in |    7 +++++++
 package/libdrm/libdrm.mk |    4 +++-
 2 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index 3d8a731..445eb72 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -1,5 +1,12 @@
 config BR2_PACKAGE_LIBDRM
 	bool "libdrm"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XPROTO_GLPROTO
+	select BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
+	select BR2_PACKAGE_XLIB_LIBXXF86VM
+	select BR2_PACKAGE_XLIB_LIBXMU
+	select BR2_PACKAGE_XPROTO_DRI2PROTO
+	select BR2_PACKAGE_PTHREAD_STUBS
 	help
 	  Direct Rendering Manager
 
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index eb04867..791e67d 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -3,7 +3,7 @@
 # libdrm
 #
 #############################################################
-LIBDRM_VERSION = 2.4.11
+LIBDRM_VERSION = 2.4.19
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
1.7.0
