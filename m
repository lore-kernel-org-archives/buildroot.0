From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  2 Feb 2017 08:27:51 +0100
Subject: [Buildroot] [PATCH 33/38] package/kodi-visualisation-shadertoy:
	bump version
In-Reply-To: <20170202072756.6624-1-bernd.kuhls@t-online.de>
References: <20170202072756.6624-1-bernd.kuhls@t-online.de>
Message-ID: <20170202072756.6624-33-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rebased patch 0001.

Upstream removed the optional dependency to libglew:
https://github.com/notspiff/visualization.shadertoy/commit/11371c4e85f6eebdb8717c6e08d292e0e9b1841d

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-FindOpenGLES2-also-search-for-egl-with-pkg-config.patch    | 4 ++--
 package/kodi-visualisation-shadertoy/Config.in                      | 1 -
 .../kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash  | 2 +-
 .../kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk    | 6 +-----
 4 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/package/kodi-visualisation-shadertoy/0001-FindOpenGLES2-also-search-for-egl-with-pkg-config.patch b/package/kodi-visualisation-shadertoy/0001-FindOpenGLES2-also-search-for-egl-with-pkg-config.patch
index 6737296fe..8de96a6de 100644
--- a/package/kodi-visualisation-shadertoy/0001-FindOpenGLES2-also-search-for-egl-with-pkg-config.patch
+++ b/package/kodi-visualisation-shadertoy/0001-FindOpenGLES2-also-search-for-egl-with-pkg-config.patch
@@ -23,9 +23,9 @@ index 8b084cf..81bbe27 100644
  
 -  include_directories(${OpenGL_INCLUDE_DIR}
 +  include_directories(${OpenGL_INCLUDE_DIR} ${OpenGLES2_INCLUDE_DIRS}
-                       ${GLEW_INCLUDE_DIR}
                        ${KODI_INCLUDE_DIR}
-                       ${platform_INCLUDE_DIRS}
+                       ${p8-platform_INCLUDE_DIRS}
+                       ${PROJECT_SOURCE_DIR}/lib/kissfft
 diff --git a/FindOpenGLES2.cmake b/FindOpenGLES2.cmake
 index e1b7d21..2a9ce0d 100644
 --- a/FindOpenGLES2.cmake
diff --git a/package/kodi-visualisation-shadertoy/Config.in b/package/kodi-visualisation-shadertoy/Config.in
index ac1770270..3b981d0bf 100644
--- a/package/kodi-visualisation-shadertoy/Config.in
+++ b/package/kodi-visualisation-shadertoy/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_KODI_VISUALISATION_SHADERTOY
 	bool "kodi-visualisation-shadertoy"
-	select BR2_PACKAGE_LIBGLEW if BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_LIBPLATFORM
 	help
 	  Shadertoy visualiser for Kodi
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
index fdd81fd59..a0df397e8 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 88732c399bb7e1237e8fc375583bb3789c96a28695a3805fb374361a7e5636c5 kodi-visualisation-shadertoy-f9988007681bf37e6c03d6992bae30133b020608.tar.gz
+sha256 4456e88bc94bcb3e2481286b27926a1f6d85d6f857de31a46d50f44fead01abd  kodi-visualisation-shadertoy-v1.1.5.tar.gz
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
index e5f2d911d..d90afab0e 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
@@ -4,14 +4,10 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_SHADERTOY_VERSION = f9988007681bf37e6c03d6992bae30133b020608
+KODI_VISUALISATION_SHADERTOY_VERSION = v1.1.5
 KODI_VISUALISATION_SHADERTOY_SITE = $(call github,notspiff,visualization.shadertoy,$(KODI_VISUALISATION_SHADERTOY_VERSION))
 KODI_VISUALISATION_SHADERTOY_LICENSE = GPLv2+
 KODI_VISUALISATION_SHADERTOY_LICENSE_FILES = src/main.cpp
 KODI_VISUALISATION_SHADERTOY_DEPENDENCIES = kodi libplatform
 
-ifeq ($(BR2_PACKAGE_LIBGLEW),y)
-KODI_VISUALISATION_SHADERTOY_DEPENDENCIES += libglew
-endif
-
 $(eval $(cmake-package))
-- 
2.11.0
