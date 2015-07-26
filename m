From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 15:48:48 +0200
Subject: [Buildroot] [git commit branch/next] libubox: bump version
Message-ID: <20150808105641.C5F1F7FFCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=87932844f7e31a9dc53e00a05ac1bc8a6c69c15a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Change upstream location and remove upstreamed patches.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libubox/0001-drop-legacy-json-c.patch |   34 -------------------------
 package/libubox/libubox.mk                    |    4 +-
 2 files changed, 2 insertions(+), 36 deletions(-)

diff --git a/package/libubox/0001-drop-legacy-json-c.patch b/package/libubox/0001-drop-legacy-json-c.patch
deleted file mode 100644
index 84bd99a..0000000
--- a/package/libubox/0001-drop-legacy-json-c.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-[PATCH] libubox: drop legacy json-c support
-
-The cmake logic is wrong (E.G. PKG_CHECK_FOR_MODULES fails unless all
-modules are found), and the legacy libjson.so name is also used by the other
-libjson (http://sourceforge.net/projects/libjson/) which provides an
-incompatible API, so just drop it.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- CMakeLists.txt |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-Index: libubox-bbd846ec2d72b2629758b69dc122ac0b0f2c3e4b/CMakeLists.txt
-===================================================================
---- libubox-bbd846ec2d72b2629758b69dc122ac0b0f2c3e4b.orig/CMakeLists.txt
-+++ libubox-bbd846ec2d72b2629758b69dc122ac0b0f2c3e4b/CMakeLists.txt
-@@ -13,7 +13,7 @@
- ENDIF()
- 
- INCLUDE(FindPkgConfig)
--PKG_CHECK_MODULES(JSONC json-c json)
-+PKG_CHECK_MODULES(JSONC json-c)
- IF(JSONC_FOUND)
-   ADD_DEFINITIONS(-DJSONC)
-   INCLUDE_DIRECTORIES(${JSONC_INCLUDE_DIRS})
-@@ -42,7 +42,7 @@
- 
- ADD_SUBDIRECTORY(lua)
- 
--find_library(json NAMES json-c json)
-+find_library(json NAMES json-c)
- IF(EXISTS ${json})
- 	ADD_LIBRARY(blobmsg_json SHARED blobmsg_json.c)
- 	TARGET_LINK_LIBRARIES(blobmsg_json ubox ${json})
diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
index 5d9c01d..4c56951 100644
--- a/package/libubox/libubox.mk
+++ b/package/libubox/libubox.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBUBOX_VERSION = 5a0bbefc8fa440446253b171d0ac038d839360e3
-LIBUBOX_SITE = git://nbd.name/luci2/libubox.git
+LIBUBOX_VERSION = e88d816d6e462180f0337565e04e36be58a63309
+LIBUBOX_SITE = git://git.openwrt.org/project/libubox.git
 LIBUBOX_LICENSE = LGPLv2.1, GPLv2, BSD-3c, MIT
 LIBUBOX_INSTALL_STAGING = YES
 LIBUBOX_DEPENDENCIES = $(if $(BR2_PACKAGE_JSON_C),json-c)
