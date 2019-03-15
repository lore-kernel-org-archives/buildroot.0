From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 15 Mar 2019 19:06:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: bump version to 19.0.0
Message-ID: <20190315180659.21182-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We keep using autotools and switch to meson in a later patch after
upstream deprecated autotools:
https://lists.freedesktop.org/archives/mesa-announce/2019-March/000501.html

Imx winsys was removed:
https://cgit.freedesktop.org/mesa/mesa/commit/?h=19.0&id=41a0acd6a149ec9f47ea527ad08a2b29bf1ee6b2

Patch 0004 removed, applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk      |  2 +-
 ...sing-include-stddef.h-in-egldevice.h.patch | 47 -------------------
 package/mesa3d/mesa3d.hash                    | 10 ++--
 package/mesa3d/mesa3d.mk                      |  7 ++-
 4 files changed, 11 insertions(+), 55 deletions(-)
 delete mode 100644 package/mesa3d/0004-egl-add-missing-include-stddef.h-in-egldevice.h.patch

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 4730463eac..63bcd8686f 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 18.3.3
+MESA3D_HEADERS_VERSION = 19.0.0
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/0004-egl-add-missing-include-stddef.h-in-egldevice.h.patch b/package/mesa3d/0004-egl-add-missing-include-stddef.h-in-egldevice.h.patch
deleted file mode 100644
index 04621eeabd..0000000000
--- a/package/mesa3d/0004-egl-add-missing-include-stddef.h-in-egldevice.h.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From eb44c36cf1729e7e200b77cf8ea755dff72d1639 Mon Sep 17 00:00:00 2001
-From: Gurchetan Singh <gurchetansingh@chromium.org>
-Date: Wed, 28 Nov 2018 08:39:34 -0800
-Subject: [PATCH] egl: add missing #include <stddef.h> in egldevice.h
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Otherwise, I get this error:
-
-main/egldevice.h:54:13: error: ?NULL? undeclared (first use in this function)
-       dev = NULL;
-             ^~~~
-with this config:
-
-./autogen.sh --enable-gles1 --enable-gles2 --with-platforms='surfaceless' --disable-glx
-             --with-dri-drivers="i965" --with-gallium-drivers="" --enable-gbm
-
-v3: Use stddef.h (Matt)
-v4: Modify commit message (Eric)
-
-Reviewed-by: Matt Turner <mattst88@gmail.com>
-Reviewed-by: Eric Engestrom <eric.engestrom@intel.com>
-Backported from upstream commit eb44c36cf1729e7e200b77cf8ea755dff72d1639
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
----
- src/egl/main/egldevice.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/egl/main/egldevice.h b/src/egl/main/egldevice.h
-index ddcdcd1..83a47d5 100644
---- a/src/egl/main/egldevice.h
-+++ b/src/egl/main/egldevice.h
-@@ -31,9 +31,9 @@
- 
- 
- #include <stdbool.h>
-+#include <stddef.h>
- #include "egltypedefs.h"
- 
--
- #ifdef __cplusplus
- extern "C" {
- #endif
--- 
-2.7.4
-
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index b0774ff407..42dde03c27 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,7 +1,7 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2019-February/000492.html
-md5 e9d1a24dbd5ca20efa75b9a29eb4566f  mesa-18.3.3.tar.xz
-sha1 abb067204ae31493dba7710c378b2b90245108ca  mesa-18.3.3.tar.xz
-sha256 2ab6886a6966c532ccbcc3b240925e681464b658244f0cbed752615af3936299  mesa-18.3.3.tar.xz
-sha512 cd6214b8bbeb3e3d187139ae1e949684f32f90152e1d7ba8d81222bd088770e28cff7ff165f2ccc41c068950561fe952420c6e54472f7204532a8d8700ff18bb  mesa-18.3.3.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2019-March/000501.html
+md5 d0d76cd8b00bc1308e37985d4a45d3c5  mesa-19.0.0.tar.xz
+sha1 d6353eab5e8949d14f15138fb726f5e298c70485  mesa-19.0.0.tar.xz
+sha256 5a549dfb40ec31e5c36c47aadac04554cb2e2a8d144a046a378fc16da57e38f8  mesa-19.0.0.tar.xz
+sha512 5759b85275bcd145513cf14a9ef7505595766fb33b82c53738f74ede462e5850580d48ab4af326b41209e7f4b05aab75539f2bfebf67c3098a4680ea95c37591  mesa-19.0.0.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index c3469f7788..6aacb2ea95 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 18.3.3
+MESA3D_VERSION = 19.0.0
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
@@ -28,6 +28,9 @@ MESA3D_DEPENDENCIES = \
 # Disable assembly usage.
 MESA3D_CONF_OPTS = --disable-asm
 
+# autotools are deprecated in favour of meson, for now force autotools
+MESA3D_CONF_OPTS += --enable-autotools
+
 # Disable static, otherwise configure will fail with: "Cannot enable both static
 # and shared."
 ifeq ($(BR2_SHARED_STATIC_LIBS),y)
@@ -95,7 +98,7 @@ endif
 # Drivers
 
 #Gallium Drivers
-MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV)  += etnaviv imx
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV)  += etnaviv
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)  += nouveau
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600)     += r600
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI) += radeonsi
-- 
2.20.1
