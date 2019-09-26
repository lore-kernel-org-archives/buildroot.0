From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 26 Sep 2019 08:11:34 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/mesa3d: bump version to 19.2.0
Message-ID: <20190926061134.2945-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updated license hash after cosmetical upstream commits:
https://cgit.freedesktop.org/mesa/mesa/log/docs/license.html?h=19.2

Upstream removed asm configure option:
https://cgit.freedesktop.org/mesa/mesa/commit/meson.build?h=19.2&id=20294dceebc23236e33b22578245f7e6f41b6997

Removed dependency to DRI swrast driver for
BR2_PACKAGE_MESA3D_OSMESA_CLASSIC after upstream commit
https://cgit.freedesktop.org/mesa/mesa/commit/meson.build?h=19.2&id=b816edcbf40abca1e3d68b1a706f5670b3fcf4d7
removed this dependency.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: squashed patch to remove DRI swrast dependency (Yann, Thomas)

 package/mesa3d-headers/mesa3d-headers.mk |  2 +-
 package/mesa3d/Config.in                 |  4 ----
 package/mesa3d/mesa3d.hash               | 10 ++++------
 package/mesa3d/mesa3d.mk                 |  3 +--
 4 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 4b8f68412d..a34df2e93f 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 19.1.7
+MESA3D_HEADERS_VERSION = 19.2.0
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 403693770c..99b3818235 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -299,14 +299,10 @@ comment "Off-screen Rendering"
 
 config BR2_PACKAGE_MESA3D_OSMESA_CLASSIC
 	bool "OSMesa (classic) library"
-	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
 	help
 	  The OSMesa classic API provides functions for
 	  making off-screen renderings.
 
-comment "OSMesa classic requires dri (classic) swrast"
-	depends on !BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
-
 if BR2_PACKAGE_MESA3D_DRIVER
 
 comment "OpenGL API Support"
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 62d81aed64..36b5307972 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,8 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2019-September/000545.html
-md5 cd1345c9b0d5121b860a0bdb20abc347  mesa-19.1.7.tar.xz
-sha1 5fcd2ee01087c821b5e644e007bb491563b9d4e0  mesa-19.1.7.tar.xz
-sha256 e287920fdb38712a9fed448dc90b3ca95048c7face5db52e58361f8b6e0f3cd5  mesa-19.1.7.tar.xz
-sha512 0865b5f91e5daa00e1da2b3d8b65fe5d2ff6332372bf8fec7d671d05d8d64ec5a7abea1858cdfc506c76b7226d2bea0af3426565f156b796d8e0f949ea33dc15  mesa-19.1.7.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2019-September/000547.html
+sha256 b060caa2a00f856431160ff7377d0e8f58f2aa48c16ee5a9e265ebdccb10852a  mesa-19.2.0.tar.xz
+sha512 7278bbfba9c29fe91d1959ff1a48422e917db85287460523d12ae8c6d7f49f76e9636bf4c0d8d7d89e5569b3c67135f1b23b8f6c9d52d39413d8ec22e3bb40f0  mesa-19.2.0.tar.xz
 
 # License
-sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
+sha256 d8d662974fc86e2e640362015e42de3fcc161d435a9f2111ecd8561412feca73  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 5c7cabc97a..82781c9e10 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 19.1.7
+MESA3D_VERSION = 19.2.0
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
@@ -27,7 +27,6 @@ MESA3D_DEPENDENCIES = \
 	zlib
 
 MESA3D_CONF_OPTS = \
-	-Dasm=false \
 	-Dgallium-omx=disabled \
 	-Dpower8=false \
 	-Dvalgrind=false
-- 
2.20.1
