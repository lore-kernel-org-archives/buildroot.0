From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 May 2020 22:46:59 +0200
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 20.1.0
Message-ID: <20200602200122.39E7C812A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ca15896b742d711d61c92c6406541222468bc4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebased 0006-pan_bo.h-add-time.h-include-for-time_t.patch.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d-headers/mesa3d-headers.mk                 |  2 +-
 .../0006-pan_bo.h-add-time.h-include-for-time_t.patch    | 16 +++++++++-------
 package/mesa3d/mesa3d.hash                               |  6 +++---
 package/mesa3d/mesa3d.mk                                 |  2 +-
 4 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 51b10acdb5..008c2c3cf4 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 20.0.7
+MESA3D_HEADERS_VERSION = 20.1.0
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/0006-pan_bo.h-add-time.h-include-for-time_t.patch b/package/mesa3d/0006-pan_bo.h-add-time.h-include-for-time_t.patch
index 1586b26bba..f90fb85aca 100644
--- a/package/mesa3d/0006-pan_bo.h-add-time.h-include-for-time_t.patch
+++ b/package/mesa3d/0006-pan_bo.h-add-time.h-include-for-time_t.patch
@@ -8,24 +8,26 @@ Content-Transfer-Encoding: 8bit
 
 Fixes:
 
-  ../src/gallium/drivers/panfrost/pan_bo.h:93:9: error: unknown type name ???time_t???
+  ../src/panfrost/encoder/pan_bo.h:93:9: error: unknown type name ???time_t???
 
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+[Bernd: rebased on 20.1]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
- src/gallium/drivers/panfrost/pan_bo.h | 1 +
+ src/panfrost/encoder/pan_bo.h | 1 +
  1 file changed, 1 insertion(+)
 
-diff --git a/src/gallium/drivers/panfrost/pan_bo.h b/src/gallium/drivers/panfrost/pan_bo.h
+diff --git a/src/panfrost/encoder/pan_bo.h b/src/panfrost/encoder/pan_bo.h
 index 414c356b95c..6dda393095d 100644
---- a/src/gallium/drivers/panfrost/pan_bo.h
-+++ b/src/gallium/drivers/panfrost/pan_bo.h
+--- a/src/panfrost/encoder/pan_bo.h
++++ b/src/panfrost/encoder/pan_bo.h
 @@ -29,6 +29,7 @@
  #include <panfrost-misc.h>
- #include "pipe/p_state.h"
  #include "util/list.h"
+ #include "pan_device.h"
 +#include <time.h>
  
- struct panfrost_screen;
+ /* Flags for allocated memory */
  
 -- 
 2.25.1
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 0a6d0c5a82..c8eda7b2ba 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2020-May/000583.html
-sha256  fe6e258fe772c3cd2ac01741bf7408058c3ac02d66acff9a6e669bd72e3ea178  mesa-20.0.7.tar.xz
-sha512  00baae50f14bf2b08b5654dffb11cf67499dc1825e1700b137fb5719e767e0e78e789979df2c194f677ea9c5e531f34965d47b9e37c239944c38d0570c7a9685  mesa-20.0.7.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2020-May/000585.html
+sha256  2109055d7660514fc4c1bcd861bcba9db00c026119ae222720111732dba27c83  mesa-20.1.0.tar.xz
+sha512  f49230d18febe1bfd7c6282ab95fc244530f5cef56df0f804d8bece8a70bafcb445b8b83df96ad1b4c5af022c4e39a71f19a8f7e47b1fb09ada2b1a1317ff3be  mesa-20.1.0.tar.xz
 
 # License
 sha256  1ddae7da415352a5b5360ff3a9d7ecf23ba81408f62eeecce0011f32e3ef9da6  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 5304b05de0..abab93bd20 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 20.0.7
+MESA3D_VERSION = 20.1.0
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
