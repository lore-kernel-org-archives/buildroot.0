From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Jul 2020 21:57:06 +0200
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 20.1.4
Message-ID: <20200723195951.6619D880BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb300751c0458506da052e55a8ac3bd2aee225ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch 0001-musl.patch, upstream added a different fix in 2019:
https://gitlab.freedesktop.org/mesa/mesa/-/commit/da84d071a6f4c33015525c168d22c0f121025010

Renumbered remaining patches.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d-headers/mesa3d-headers.mk           |  2 +-
 ...import-isinf-for-uclibc-based-toolchains.patch} |  0
 package/mesa3d/0001-musl.patch                     | 38 ----------------------
 ...n-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch} |  0
 ...n-option-to-disable-optional-neon-suppor.patch} |  0
 package/mesa3d/mesa3d.hash                         |  6 ++--
 package/mesa3d/mesa3d.mk                           |  2 +-
 7 files changed, 5 insertions(+), 43 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 61848af591..2eb18c3dac 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 20.1.3
+MESA3D_HEADERS_VERSION = 20.1.4
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/0002-c99_math-import-isinf-for-uclibc-based-toolchains.patch b/package/mesa3d/0001-c99_math-import-isinf-for-uclibc-based-toolchains.patch
similarity index 100%
rename from package/mesa3d/0002-c99_math-import-isinf-for-uclibc-based-toolchains.patch
rename to package/mesa3d/0001-c99_math-import-isinf-for-uclibc-based-toolchains.patch
diff --git a/package/mesa3d/0001-musl.patch b/package/mesa3d/0001-musl.patch
deleted file mode 100644
index 44c7f5b96d..0000000000
--- a/package/mesa3d/0001-musl.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 25e20c2e288e1d482f479eca863bc4aaa374b782 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sun, 22 Apr 2018 15:58:38 +0200
-Subject: [PATCH] Fix musl build
-
-Fix musl build when svga gallium driver is enabled.
-
-In file included from vmw_fence.c:34:0:
-vmw_screen.h:100:4: error: unknown type name ???dev_t???
-    dev_t device;
-    ^~~~~
-
-Downloaded from
-http://git.alpinelinux.org/cgit/aports/plain/main/mesa/musl-fixes.patch
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Romain: rebase on 18.1]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- src/gallium/winsys/svga/drm/vmw_screen.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/gallium/winsys/svga/drm/vmw_screen.h b/src/gallium/winsys/svga/drm/vmw_screen.h
-index f21cabb51f..20d03f8b53 100644
---- a/src/gallium/winsys/svga/drm/vmw_screen.h
-+++ b/src/gallium/winsys/svga/drm/vmw_screen.h
-@@ -34,7 +34,7 @@
- #ifndef VMW_SCREEN_H_
- #define VMW_SCREEN_H_
- 
--
-+#include <sys/stat.h>
- #include "pipe/p_compiler.h"
- #include "pipe/p_state.h"
- 
--- 
-2.14.3
-
diff --git a/package/mesa3d/0003-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch b/package/mesa3d/0002-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch
similarity index 100%
rename from package/mesa3d/0003-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch
rename to package/mesa3d/0002-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch
diff --git a/package/mesa3d/0004-vc4-add-meson-option-to-disable-optional-neon-suppor.patch b/package/mesa3d/0003-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
similarity index 100%
rename from package/mesa3d/0004-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
rename to package/mesa3d/0003-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 1524315f45..10baee0aa4 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2020-July/000590.html
-sha256  9872b8d46bee822177ffbe4292addff7bdb84cefc1fe776b8e6b2881a8362bf1  mesa-20.1.3.tar.xz
-sha512  c3134cda6a07041c2cacd783663c0618e97f907bb0e67718a5c8fb03f4608ba47f0cd5adb6f0400a44f15fd70f3b41d66da1376035ba4e4f4f97a1843dcb1f77  mesa-20.1.3.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2020-July/000591.html
+sha256  6800271c2be2a0447510eb4e9b67edd9521859a4d565310617c4b359eb6799fe  mesa-20.1.4.tar.xz
+sha512  f4d79694cda8531e7560147caf5d18bce5c685cd6c61264dced5adaa9043be9c83d3a2bd623ebffedc8d4258b9b1f97d84d9aeea307aa77cf99d0bc47c987155  mesa-20.1.4.tar.xz
 
 # License
 sha256  1ddae7da415352a5b5360ff3a9d7ecf23ba81408f62eeecce0011f32e3ef9da6  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 146b7e3141..4a17b2e7a2 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 20.1.3
+MESA3D_VERSION = 20.1.4
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
