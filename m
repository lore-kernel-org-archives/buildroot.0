From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Feb 2019 11:34:28 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] jpeg-turbo: bump to
 version 2.0.1
Message-ID: <20190221104042.EB0108C683@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df5215245143f409501cba94c48dd0b8540e2e8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Remove patch (already in version), see:
https://github.com/libjpeg-turbo/libjpeg-turbo/commit/950580eb0c020598a4c6c8aa46c86e31062e1ddc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 95c78d277c04753562c76f2fda9ceb1c2df1f1eb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ll-of-binaries-with-a-static-only-library.patch | 42 ----------------------
 package/jpeg-turbo/jpeg-turbo.hash                 |  8 ++---
 package/jpeg-turbo/jpeg-turbo.mk                   |  2 +-
 3 files changed, 5 insertions(+), 47 deletions(-)

diff --git a/package/jpeg-turbo/0001-fix-install-of-binaries-with-a-static-only-library.patch b/package/jpeg-turbo/0001-fix-install-of-binaries-with-a-static-only-library.patch
deleted file mode 100644
index 87f9c48382..0000000000
--- a/package/jpeg-turbo/0001-fix-install-of-binaries-with-a-static-only-library.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From f8c7732e24502c06739944f9a721c9d84a50319d Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 26 Aug 2018 19:11:55 +0200
-Subject: [PATCH] fix install of binaries with a static only library
-
-Define CMAKE_INSTALL_RPATH only if ENABLE_SHARED is set otherwise the
-following error is raised:
-
-CMake Error at cmake_install.cmake:73 (file):
-  file RPATH_CHANGE could not write new RPATH:
-
-    /usr/lib
-
-  to the file:
-
-    /home/fabrice/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/bin/rdjpgcom
-
-  No valid ELF RPATH or RUNPATH entry exists in the file;
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/libjpeg-turbo/libjpeg-turbo/pull/273]
----
- CMakeLists.txt | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 1719522..862ab11 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -109,7 +109,9 @@ endif()
- 
- include(cmakescripts/GNUInstallDirs.cmake)
- 
-+if(ENABLE_SHARED)
- set(CMAKE_INSTALL_RPATH ${CMAKE_INSTALL_FULL_LIBDIR})
-+endif()
- 
- macro(report_directory var)
-   if(CMAKE_INSTALL_${var} STREQUAL CMAKE_INSTALL_FULL_${var})
--- 
-2.14.1
-
diff --git a/package/jpeg-turbo/jpeg-turbo.hash b/package/jpeg-turbo/jpeg-turbo.hash
index f0fc5396ef..1779324c51 100644
--- a/package/jpeg-turbo/jpeg-turbo.hash
+++ b/package/jpeg-turbo/jpeg-turbo.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/libjpeg-turbo/files/2.0.0/
-sha1 fe49aea935617748c21ecbe46c986d6c1b98f39b  libjpeg-turbo-2.0.0.tar.gz
-md5 b12a3fcf1d078db38410f27718a91b83  libjpeg-turbo-2.0.0.tar.gz
+# From https://sourceforge.net/projects/libjpeg-turbo/files/2.0.1/
+sha1 7ea4a288bccbb5a2d5bfad5fb328d4a839853f4e  libjpeg-turbo-2.0.1.tar.gz
+md5 1b05a66aa9b006fd04ed29f408e68f46  libjpeg-turbo-2.0.1.tar.gz
 # Locally computed
-sha256 778876105d0d316203c928fd2a0374c8c01f755d0a00b12a1c8934aeccff8868  libjpeg-turbo-2.0.0.tar.gz
+sha256 e5f86cec31df1d39596e0cca619ab1b01f99025a27dafdfc97a30f3a12f866ff  libjpeg-turbo-2.0.1.tar.gz
 sha256 8412238c5ad95965cf3c3197791e9dea8b5fae505d133449e33ee2fa754fe61e  LICENSE.md
 sha256 82fece2bff2669c476495f0fe70096b154e8bc5b40916a64e99836d9a01c3110  README.ijg
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index 1807cc294e..b848b66899 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JPEG_TURBO_VERSION = 2.0.0
+JPEG_TURBO_VERSION = 2.0.1
 JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
 JPEG_TURBO_SITE = https://downloads.sourceforge.net/project/libjpeg-turbo/$(JPEG_TURBO_VERSION)
 JPEG_TURBO_LICENSE = IJG (libjpeg), BSD-3-Clause (TurboJPEG), Zlib (SIMD)
