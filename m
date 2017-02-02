From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  2 Feb 2017 08:27:22 +0100
Subject: [Buildroot] [PATCH 04/38] package/libplatform: bump version to 2.1.0
In-Reply-To: <20170202072756.6624-1-bernd.kuhls@t-online.de>
References: <20170202072756.6624-1-bernd.kuhls@t-online.de>
Message-ID: <20170202072756.6624-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rebased patch 0001.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...nfig.cmake-fix-paths-for-cross-compilatio.patch | 28 +++++++++++-----------
 package/libplatform/libplatform.hash               |  2 +-
 package/libplatform/libplatform.mk                 |  4 ++--
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/package/libplatform/0001-platform-config.cmake-fix-paths-for-cross-compilatio.patch b/package/libplatform/0001-platform-config.cmake-fix-paths-for-cross-compilatio.patch
index 89f35bdb3..cfb231750 100644
--- a/package/libplatform/0001-platform-config.cmake-fix-paths-for-cross-compilatio.patch
+++ b/package/libplatform/0001-platform-config.cmake-fix-paths-for-cross-compilatio.patch
@@ -13,28 +13,28 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
 diff --git a/platform-config.cmake.in b/platform-config.cmake.in
 index 7fe35fe..78b5085 100644
---- a/platform-config.cmake.in
-+++ b/platform-config.cmake.in
+--- a/p8-platform-config.cmake.in
++++ b/p8-platform-config.cmake.in
 @@ -10,16 +10,16 @@
  #
  # propagate these properties from one build system to the other
- set (platform_VERSION "@platform_VERSION_MAJOR at .@platform_VERSION_MINOR@")
--set (platform_INCLUDE_DIRS @platform_INCLUDE_DIRS@ @CMAKE_INSTALL_PREFIX@/include)
-+set (platform_INCLUDE_DIRS ${CMAKE_FIND_ROOT_PATH}/@platform_INCLUDE_DIRS@ ${CMAKE_FIND_ROOT_PATH}/@CMAKE_INSTALL_PREFIX@/include)
- set (platform_LIBRARY_DIRS "@CMAKE_LIBRARY_OUTPUT_DIRECTORY@")
- set (platform_LINKER_FLAGS "@platform_LINKER_FLAGS@")
- set (platform_CONFIG_VARS "@platform_CONFIG_VARS@")
+ set (p8-platform_VERSION "@p8-platform_VERSION_MAJOR at .@p8-platform_VERSION_MINOR@")
+-set (p8-platform_INCLUDE_DIRS @p8-platform_INCLUDE_DIRS@ @CMAKE_INSTALL_PREFIX@/include)
++set (p8-platform_INCLUDE_DIRS ${CMAKE_FIND_ROOT_PATH}/@p8-platform_INCLUDE_DIRS@ ${CMAKE_FIND_ROOT_PATH}/@CMAKE_INSTALL_PREFIX@/include)
+ set (p8-platform_LIBRARY_DIRS "@CMAKE_LIBRARY_OUTPUT_DIRECTORY@")
+ set (p8-platform_LINKER_FLAGS "@p8-platform_LINKER_FLAGS@")
+ set (p8-platform_CONFIG_VARS "@p8-platform_CONFIG_VARS@")
  
  # libraries come from the build tree where this file was generated
  if(WIN32)
--  set (platform_LIBRARY "@CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_LIBDIR@/platform.lib")
-+  set (platform_LIBRARY "${CMAKE_FIND_ROOT_PATH}/@CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_LIBDIR@/platform.lib")
+-  set (p8-platform_LIBRARY "@CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_LIBDIR@/p8-platform.lib")
++  set (p8-platform_LIBRARY "${CMAKE_FIND_ROOT_PATH}/@CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_LIBDIR@/p8-platform.lib")
  else(WIN32)
--  set (platform_LIBRARY "-L at CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_LIBDIR@ -lplatform")
-+  set (platform_LIBRARY "-L${CMAKE_FIND_ROOT_PATH}/@CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_LIBDIR@ -lplatform")
+-  set (p8-platform_LIBRARY "-L at CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_LIBDIR@ -lp8-platform")
++  set (p8-platform_LIBRARY "-L${CMAKE_FIND_ROOT_PATH}/-L at CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_LIBDIR@ -lp8-platform")
  endif(WIN32)
- set (platform_LIBRARIES ${platform_LIBRARY} "@platform_LIBRARIES@")
- mark_as_advanced (platform_LIBRARY)
+ set (p8-platform_LIBRARIES ${p8-platform_LIBRARY} "@p8-platform_LIBRARIES@")
+ mark_as_advanced (p8-platform_LIBRARY)
 -- 
 2.5.0
 
diff --git a/package/libplatform/libplatform.hash b/package/libplatform/libplatform.hash
index 8975dfd8a..e3d5ed5a9 100644
--- a/package/libplatform/libplatform.hash
+++ b/package/libplatform/libplatform.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  3603ead8b16a48cb35b1e6dea330a693f10552b1a6ea036c5db9ec248cd8baf5  libplatform-feafe68e3e0b02c3261aefb3d711863ef6fadd38.tar.gz
+sha256 88711f1b949285867538a0b2e4189532778e1515325dfa1851eae9d18b6affd9  libplatform-2.1.0.tar.gz
diff --git a/package/libplatform/libplatform.mk b/package/libplatform/libplatform.mk
index 6d549151d..1bb477854 100644
--- a/package/libplatform/libplatform.mk
+++ b/package/libplatform/libplatform.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBPLATFORM_VERSION = feafe68e3e0b02c3261aefb3d711863ef6fadd38
-LIBPLATFORM_SITE = $(call github,Pulse-Eight,platform,$(LIBPLATFORM_VERSION))
+LIBPLATFORM_VERSION = 2.1.0
+LIBPLATFORM_SITE = $(call github,Pulse-Eight,platform,p8-platform-$(LIBPLATFORM_VERSION))
 LIBPLATFORM_LICENSE = GPLv2+, PHP license v3.01
 LIBPLATFORM_LICENSE_FILES = src/os.h src/util/fstrcmp.c
 LIBPLATFORM_INSTALL_STAGING = YES
-- 
2.11.0
