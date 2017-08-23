From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Aug 2017 15:45:17 +0200
Subject: [Buildroot] [git commit] package/weston: bump version to 3.0.0
Message-ID: <20170902130619.B8F6B8016A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b606d3a9913b31f1708f148b8ac24b86c16986f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all hashes provided by upstream.

Removed dependency to mtdev after:
https://github.com/wayland-project/weston/commit/167bbb6d109c7c93be3b58232f8c5b8795df44f2

libdrm is now a hard dependency:
https://github.com/wayland-project/weston/commit/b030897b380be4ac8089deecc3db6967dfe7923e

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: drop "select BR2_PACKAGE_LIBDRM" from sub-option, now that it
is selected by the main option.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/weston/Config.in   | 3 +--
 package/weston/weston.hash | 7 +++++--
 package/weston/weston.mk   | 4 ++--
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 454a14d..fd7791c 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -17,8 +17,8 @@ config BR2_PACKAGE_WESTON
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_JPEG
-	select BR2_PACKAGE_MTDEV
 	select BR2_PACKAGE_LIBINPUT
+	select BR2_PACKAGE_LIBDRM
 	# Runtime dependency
 	select BR2_PACKAGE_XKEYBOARD_CONFIG
 	# Make sure at least one compositor is selected.
@@ -40,7 +40,6 @@ config BR2_PACKAGE_WESTON_HAS_COMPOSITOR
 config BR2_PACKAGE_WESTON_DRM
 	bool "DRM compositor"
 	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
-	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_WESTON_HAS_COMPOSITOR
 
 # Uses libgbm from mesa3d
diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index 85b4613..82c97b8 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,2 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2017-February/033231.html
-sha256  b4e446ac27f118196f1609dab89bb3cb3e81652d981414ad860e733b355365d8  weston-2.0.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2017-August/034749.html
+md5 9c42a4c51a1b9f35d040fa9d45ada36d  weston-3.0.0.tar.xz
+sha1 0a75c2ee10f2453a073411157bb6ed029080669f  weston-3.0.0.tar.xz
+sha256 cde1d55e8dd70c3cbb3d1ec72f60e60000041579caa1d6a262bd9c35e93723a5  weston-3.0.0.tar.xz
+sha512 b824c39f2a884f6d50d607613f447090621f684c96f7d905f25f6e500dabd03ecb2b1cd1030babc193c3417223cb220103abb792437e1a5ead7229a76b5c7a58  weston-3.0.0.tar.xz
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index a6d9faa..93b0246 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-WESTON_VERSION = 2.0.0
+WESTON_VERSION = 3.0.0
 WESTON_SITE = http://wayland.freedesktop.org/releases
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
 WESTON_LICENSE_FILES = COPYING
 
 WESTON_DEPENDENCIES = host-pkgconf wayland wayland-protocols \
-	libxkbcommon pixman libpng jpeg mtdev udev cairo libinput \
+	libxkbcommon pixman libpng jpeg udev cairo libinput libdrm \
 	$(if $(BR2_PACKAGE_WEBP),webp)
 
 WESTON_CONF_OPTS = \
