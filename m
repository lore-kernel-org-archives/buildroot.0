From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Jul 2019 16:00:48 +0200
Subject: [Buildroot] [git commit] package/libplatform: bump to version
 1eb12b1b1efa6747c1e190964854e9e267e3a1e2
Message-ID: <20190714140544.D36B3813B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1a62b24c6a54ea618e23cea7bcce4276c614fa8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove patch (already in version)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-p8-platform-config-fix-lookup-paths.patch | 38 ----------------------
 package/libplatform/libplatform.hash               |  3 +-
 package/libplatform/libplatform.mk                 |  2 +-
 3 files changed, 3 insertions(+), 40 deletions(-)

diff --git a/package/libplatform/0001-p8-platform-config-fix-lookup-paths.patch b/package/libplatform/0001-p8-platform-config-fix-lookup-paths.patch
deleted file mode 100644
index d487fd942e..0000000000
--- a/package/libplatform/0001-p8-platform-config-fix-lookup-paths.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 01b5478638c705af29f09ad4ed70289f70a21dcf Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Mon, 6 Feb 2017 14:04:47 +0100
-Subject: [PATCH] p8-platform-config: fix lookup paths
-
-Use the proper methods to find the headers and the library.
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- p8-platform-config.cmake.in | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/p8-platform-config.cmake.in b/p8-platform-config.cmake.in
-index 47f30f1..f59418d 100644
---- a/p8-platform-config.cmake.in
-+++ b/p8-platform-config.cmake.in
-@@ -10,7 +10,7 @@
- #
- # propagate these properties from one build system to the other
- set (p8-platform_VERSION "@p8-platform_VERSION_MAJOR at .@p8-platform_VERSION_MINOR@")
--set (p8-platform_INCLUDE_DIRS @p8-platform_INCLUDE_DIRS@ @CMAKE_INSTALL_PREFIX@/include)
-+find_path (p8-platform_INCLUDE_DIRS p8-platform/os.h)
- set (p8-platform_LIBRARY_DIRS "@CMAKE_LIBRARY_OUTPUT_DIRECTORY@")
- set (p8-platform_LINKER_FLAGS "@p8-platform_LINKER_FLAGS@")
- set (p8-platform_CONFIG_VARS "@p8-platform_CONFIG_VARS@")
-@@ -19,7 +19,7 @@ set (p8-platform_CONFIG_VARS "@p8-platform_CONFIG_VARS@")
- if(WIN32)
-   set (p8-platform_LIBRARY "@CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_LIBDIR@/p8-platform.lib")
- else(WIN32)
--  set (p8-platform_LIBRARY "-L at CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_LIBDIR@ -lp8-platform")
-+  find_library (p8-platform_LIBRARY p8-platform)
- endif(WIN32)
- set (p8-platform_LIBRARIES ${p8-platform_LIBRARY} "@p8-platform_LIBRARIES@")
- mark_as_advanced (p8-platform_LIBRARY)
--- 
-2.7.4
-
diff --git a/package/libplatform/libplatform.hash b/package/libplatform/libplatform.hash
index 5162b43fad..09f9dadb19 100644
--- a/package/libplatform/libplatform.hash
+++ b/package/libplatform/libplatform.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 dd07bea9cb5676220586e772f09eab51f1093e5ef0faadee80f7c0e99f5f6c1c  libplatform-2d90f98620e25f47702c9e848380c0d93f29462b.tar.gz
+sha256 94dba139066a332d048486f817736e4cf4962393c9f892d2c7dd40d9d69ca788  libplatform-1eb12b1b1efa6747c1e190964854e9e267e3a1e2.tar.gz
+sha256 80fc66febbb2393c9d518e3eefa4ad9aae15a9b6a84174c0e443ea79eeea5131  src/os.h
diff --git a/package/libplatform/libplatform.mk b/package/libplatform/libplatform.mk
index c805af2e16..0a4c492969 100644
--- a/package/libplatform/libplatform.mk
+++ b/package/libplatform/libplatform.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPLATFORM_VERSION = 2d90f98620e25f47702c9e848380c0d93f29462b
+LIBPLATFORM_VERSION = 1eb12b1b1efa6747c1e190964854e9e267e3a1e2
 LIBPLATFORM_SITE = $(call github,Pulse-Eight,platform,$(LIBPLATFORM_VERSION))
 LIBPLATFORM_LICENSE = GPL-2.0+
 LIBPLATFORM_LICENSE_FILES = src/os.h
