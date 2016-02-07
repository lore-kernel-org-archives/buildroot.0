From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Feb 2016 17:02:59 +0100
Subject: [Buildroot] [PATCH 15/28] package/kodi-visualisation-shadertoy:
	bump version
In-Reply-To: <1454860992-25114-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454860992-25114-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1454860992-25114-16-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...FindOpenGLES2-also-search-for-egl-with-pkg-config.patch | 14 +++++++-------
 .../kodi-visualisation-shadertoy.mk                        |  4 ++--
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/kodi-visualisation-shadertoy/0001-FindOpenGLES2-also-search-for-egl-with-pkg-config.patch b/package/kodi-visualisation-shadertoy/0001-FindOpenGLES2-also-search-for-egl-with-pkg-config.patch
index f40c173..6737296 100644
--- a/package/kodi-visualisation-shadertoy/0001-FindOpenGLES2-also-search-for-egl-with-pkg-config.patch
+++ b/package/kodi-visualisation-shadertoy/0001-FindOpenGLES2-also-search-for-egl-with-pkg-config.patch
@@ -17,15 +17,15 @@ diff --git a/CMakeLists.txt b/CMakeLists.txt
 index 8b084cf..81bbe27 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -24,7 +24,7 @@ else()
+@@ -35,7 +35,7 @@
+     endif()
    endif()
- endif()
  
--include_directories(${OpenGL_INCLUDE_DIR}
-+include_directories(${OpenGL_INCLUDE_DIR} ${OpenGLES2_INCLUDE_DIRS}
-                     ${GLEW_INCLUDE_DIR}
-                     ${KODI_INCLUDE_DIR}
-                     ${PROJECT_SOURCE_DIR}/lib/kissfft
+-  include_directories(${OpenGL_INCLUDE_DIR}
++  include_directories(${OpenGL_INCLUDE_DIR} ${OpenGLES2_INCLUDE_DIRS}
+                       ${GLEW_INCLUDE_DIR}
+                       ${KODI_INCLUDE_DIR}
+                       ${platform_INCLUDE_DIRS}
 diff --git a/FindOpenGLES2.cmake b/FindOpenGLES2.cmake
 index e1b7d21..2a9ce0d 100644
 --- a/FindOpenGLES2.cmake
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
index 1b11f79..308016e 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_SHADERTOY_VERSION = a4eaaad4ab7204a30224f2c6952f7a7035ca1c38
+KODI_VISUALISATION_SHADERTOY_VERSION = f9988007681bf37e6c03d6992bae30133b020608
 KODI_VISUALISATION_SHADERTOY_SITE = $(call github,notspiff,visualization.shadertoy,$(KODI_VISUALISATION_SHADERTOY_VERSION))
 KODI_VISUALISATION_SHADERTOY_LICENSE = GPLv2+
 KODI_VISUALISATION_SHADERTOY_LICENSE_FILES = src/main.cpp
-KODI_VISUALISATION_SHADERTOY_DEPENDENCIES = kodi
+KODI_VISUALISATION_SHADERTOY_DEPENDENCIES = kodi libplatform
 
 $(eval $(cmake-package))
-- 
2.7.0
