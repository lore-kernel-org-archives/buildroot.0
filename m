From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jul 2020 15:26:21 +0200
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 20.1.3
Message-ID: <20200711132255.7D06C84BCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28628c9c0d8d53f10007514df458a01ac5bfc24b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Renumbered patches, rebased patch 0003.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d-headers/mesa3d-headers.mk                            | 2 +-
 ...=> 0002-c99_math-import-isinf-for-uclibc-based-toolchains.patch} | 0
 .../mesa3d/0003-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch  | 6 +++---
 package/mesa3d/mesa3d.hash                                          | 6 +++---
 package/mesa3d/mesa3d.mk                                            | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 6e8c9be2c0..61848af591 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 20.1.2
+MESA3D_HEADERS_VERSION = 20.1.3
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/0003-c99_math-import-isinf-for-uclibc-based-toolchains.patch b/package/mesa3d/0002-c99_math-import-isinf-for-uclibc-based-toolchains.patch
similarity index 100%
rename from package/mesa3d/0003-c99_math-import-isinf-for-uclibc-based-toolchains.patch
rename to package/mesa3d/0002-c99_math-import-isinf-for-uclibc-based-toolchains.patch
diff --git a/package/mesa3d/0003-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch b/package/mesa3d/0003-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch
index 072d79a213..6293b8fba4 100644
--- a/package/mesa3d/0003-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch
+++ b/package/mesa3d/0003-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch
@@ -25,9 +25,9 @@ diff --git a/src/gallium/state_trackers/clover/meson.build b/src/gallium/state_t
 index 62ac5f5278d..ecdeb39669c 100644
 --- a/src/gallium/state_trackers/clover/meson.build
 +++ b/src/gallium/state_trackers/clover/meson.build
-@@ -49,7 +49,7 @@ libclllvm = static_library(
-   include_directories : clover_incs,
-   cpp_args : [
+@@ -64,7 +64,7 @@
+     clover_opencl_cpp_args,
+     clover_spirv_cpp_args,
      cpp_vis_args,
 -    '-DLIBCLC_INCLUDEDIR="@0@/"'.format(dep_clc.get_pkgconfig_variable('includedir')),
 +    '-DLIBCLC_INCLUDEDIR="/usr/share"',
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 9fdf30e013..1524315f45 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2020-June/000589.html
-sha256  283dff72814c8a80ce1ff8271e3f055895d26f4da3f4362acc49193e635780cb  mesa-20.1.2.tar.xz
-sha512  467fc6a1cbfc1bc140ba2e6e90a14bd8d15d979b92ba14d084018b6cf22b172767575f5127c6edb5c3bdf12fe6696b27d9975826b3fbb5ad5909d258fc3b8433  mesa-20.1.2.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2020-July/000590.html
+sha256  9872b8d46bee822177ffbe4292addff7bdb84cefc1fe776b8e6b2881a8362bf1  mesa-20.1.3.tar.xz
+sha512  c3134cda6a07041c2cacd783663c0618e97f907bb0e67718a5c8fb03f4608ba47f0cd5adb6f0400a44f15fd70f3b41d66da1376035ba4e4f4f97a1843dcb1f77  mesa-20.1.3.tar.xz
 
 # License
 sha256  1ddae7da415352a5b5360ff3a9d7ecf23ba81408f62eeecce0011f32e3ef9da6  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 9eb0993f02..146b7e3141 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 20.1.2
+MESA3D_VERSION = 20.1.3
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
