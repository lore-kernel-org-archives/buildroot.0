From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  3 Dec 2018 19:53:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 18.2.6
Message-ID: <20181203185352.32400-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added manditory dependency to xlib_libXxf86vm
https://cgit.freedesktop.org/mesa/mesa/commit/configure.ac?h=18.2&id=f05ce9dc514427a661696bc6b908e30841b6eb9d

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk |  2 +-
 package/mesa3d/Config.in                 |  1 +
 package/mesa3d/mesa3d.hash               | 10 +++++-----
 package/mesa3d/mesa3d.mk                 |  6 ++----
 4 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index d1a836b145..e80e222c65 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 18.2.5
+MESA3D_HEADERS_VERSION = 18.2.6
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 872859b693..c9e08af09f 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -14,6 +14,7 @@ menuconfig BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXXF86VM if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_ZLIB
 	help
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index c3464c3d0c..083284adec 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,7 +1,7 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2018-November/000475.html
-md5 b31a43ebb8b37fb704a9a75c90bbd71b  mesa-18.2.5.tar.xz
-sha1 1ada7d5fc5fabca63c78396b5afa587b94b9f2e0  mesa-18.2.5.tar.xz
-sha256 b12c32872832e5353155e1e8026e1f1ab75bba9dc5b178d712045684d26c2b73  mesa-18.2.5.tar.xz
-sha512 dd454c720241dffa61f3380be62479979a43004b2a52293b817bd3ea95f75960edee680e7380a13fae09b67a90dc0393e4a022d543db91b2f142f2468a9661f0  mesa-18.2.5.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2018-November/000479.html
+md5 7c61a801311fb8d2f7b3cceb7b5cf308  mesa-18.2.6.tar.xz
+sha1 435affd7a2c35782b21533ed2c65c487e40abcf8  mesa-18.2.6.tar.xz
+sha256 9ebafa4f8249df0c718e93b9ca155e3593a1239af303aa2a8b0f2056a7efdc12  mesa-18.2.6.tar.xz
+sha512 a7dd02f67384bb800dff70a0672a968ced96bb438605cdb39bde3e468d4dcf6162414a44e5da1abe7a1831fceb6f23e6c850eb5f80cfc5ee3861c14924c10ed4  mesa-18.2.6.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 1651b5f260..176997068a 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 18.2.5
+MESA3D_VERSION = 18.2.6
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
@@ -66,6 +66,7 @@ MESA3D_DEPENDENCIES += \
 	xlib_libXdamage \
 	xlib_libXfixes \
 	xlib_libXrandr \
+	xlib_libXxf86vm \
 	xorgproto \
 	libxcb
 MESA3D_CONF_OPTS += --enable-glx --disable-mangling
@@ -122,9 +123,6 @@ MESA3D_CONF_OPTS += --enable-dri3
 else
 MESA3D_CONF_OPTS += --disable-dri3
 endif
-ifeq ($(BR2_PACKAGE_XLIB_LIBXXF86VM),y)
-MESA3D_DEPENDENCIES += xlib_libXxf86vm
-endif
 MESA3D_CONF_OPTS += \
 	--enable-shared-glapi \
 	--enable-driglx-direct \
-- 
2.19.2
