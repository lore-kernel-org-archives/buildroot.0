From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 23:09:21 +0100
Subject: [Buildroot] [PATCH/next 16/31]
	package/kodi-visualisation-shadertoy: bump version, add hash
In-Reply-To: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456006176-21308-17-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...FindOpenGLES2-also-search-for-egl-with-pkg-config.patch | 14 +++++++-------
 .../kodi-visualisation-shadertoy.hash                      |  2 ++
 .../kodi-visualisation-shadertoy.mk                        |  4 ++--
 3 files changed, 11 insertions(+), 9 deletions(-)
 create mode 100644 package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash

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
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
new file mode 100644
index 0000000..fdd81fd
--- /dev/null
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 88732c399bb7e1237e8fc375583bb3789c96a28695a3805fb374361a7e5636c5 kodi-visualisation-shadertoy-f9988007681bf37e6c03d6992bae30133b020608.tar.gz
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
