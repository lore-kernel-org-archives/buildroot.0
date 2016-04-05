From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Apr 2016 21:34:48 +0200
Subject: [Buildroot] [git commit] package/{mesa3d,
	mesa3d-headers}: bump version to 11.2.0
Message-ID: <20160405194001.E24858024D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2005700322cae9b437de56eb557d6d18affcce38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebased 0002-Fix-runtime-error-with-uClibc.patch

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d-headers/mesa3d-headers.mk                | 2 +-
 package/mesa3d/0002-Fix-runtime-error-with-uClibc.patch | 4 ++--
 package/mesa3d/mesa3d.hash                              | 4 ++--
 package/mesa3d/mesa3d.mk                                | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 5cad42d..8e3156c 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 11.1.2
+MESA3D_HEADERS_VERSION = 11.2.0
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_HEADERS_VERSION)
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/0002-Fix-runtime-error-with-uClibc.patch b/package/mesa3d/0002-Fix-runtime-error-with-uClibc.patch
index c85f88a..59627be 100644
--- a/package/mesa3d/0002-Fix-runtime-error-with-uClibc.patch
+++ b/package/mesa3d/0002-Fix-runtime-error-with-uClibc.patch
@@ -25,8 +25,8 @@ patch: http://lists.busybox.net/pipermail/buildroot/2015-March/123410.html
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
 diff -uNr mesa-10.5.3.org/src/glsl/nir/nir_constant_expressions.c mesa-10.5.3/src/glsl/nir/nir_constant_expressions.c
---- mesa-10.5.3.org/src/glsl/nir/nir_constant_expressions.c	2015-04-12 23:31:29.000000000 +0200
-+++ mesa-10.5.3/src/glsl/nir/nir_constant_expressions.c	2015-04-13 19:59:37.819786541 +0200
+--- mesa-10.5.3.org/src/compiler/nir/nir_constant_expressions.c	2015-04-12 23:31:29.000000000 +0200
++++ mesa-10.5.3/src/compiler/nir/nir_constant_expressions.c	2015-04-13 19:59:37.819786541 +0200
 @@ -48,6 +48,18 @@
  }
  #endif
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 695c535..281dbf0 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2016-February/000199.html
-sha256	8f72aead896b340ba0f7a4a474bfaf71681f5d675592aec1cb7ba698e319148b	mesa-11.1.2.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2016-April/000206.html
+sha256	1c1fed2674abf3f16ed2623e9a5694d6752c293194e18462ebc644a19cfaafb2	mesa-11.2.0.tar.xz
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index b8ccd1f..292935e 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 11.1.2
+MESA3D_VERSION = 11.2.0
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 MESA3D_LICENSE = MIT, SGI, Khronos
