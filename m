From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 22 Aug 2017 22:04:36 +0200
Subject: [Buildroot] [PATCH/next 3/3] package/weston: bump version to 3.0.0
In-Reply-To: <20170822200436.24905-1-bernd.kuhls@t-online.de>
References: <20170822200436.24905-1-bernd.kuhls@t-online.de>
Message-ID: <20170822200436.24905-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all hashes provided by upstream.

Removed dependency to mtdev after:
https://github.com/wayland-project/weston/commit/167bbb6d109c7c93be3b58232f8c5b8795df44f2

libdrm is now a hard dependency:
https://github.com/wayland-project/weston/commit/b030897b380be4ac8089deecc3db6967dfe7923e

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/weston/Config.in   | 2 +-
 package/weston/weston.hash | 7 +++++--
 package/weston/weston.mk   | 4 ++--
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 454a14d39..61f157ec7 100644
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
diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index 85b461303..82c97b8cc 100644
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
index a6d9faa1b..93b0246e9 100644
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
-- 
2.11.0
