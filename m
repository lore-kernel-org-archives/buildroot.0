From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  2 May 2018 08:35:28 +0200
Subject: [Buildroot] [PATCH 1/1] libcue: bump to version 2.2.1
Message-ID: <20180502063528.10091-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove patch (already in version)
- Include buildroot patch http://patchwork.ozlabs.org/patch/907206
  currently in new state

Fixes:
- http://autobuild.buildroot.net/results/02712e85db8e538045497e9242b476c040198f1d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-libcue-is-only-implemented-in-C.patch     | 34 ----------------------
 package/libcue/libcue.hash                         |  2 +-
 package/libcue/libcue.mk                           |  2 +-
 3 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 package/libcue/0001-libcue-is-only-implemented-in-C.patch

diff --git a/package/libcue/0001-libcue-is-only-implemented-in-C.patch b/package/libcue/0001-libcue-is-only-implemented-in-C.patch
deleted file mode 100644
index bb36172ad1..0000000000
--- a/package/libcue/0001-libcue-is-only-implemented-in-C.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 285dd7fe70878e85f121b990f59e72105ef27688 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 30 Apr 2018 13:06:00 +0200
-Subject: [PATCH] libcue is only implemented in C
-
-By default, CMake assumes that the project is using both C and C++. By
-explicitly passing 'C' as argument of the project() macro, we tell
-CMake that only C is used, which prevents CMake from checking if a C++
-compiler exists.
-
-Fixes:
- - http://autobuild.buildroot.net/results/a5344d18dbdc86705853fbf8a66d5304de07a9b2
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 1e4ca25..8c3a1bd 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -5,7 +5,7 @@ SET(PACKAGE_SOVERSION 2)
- 
- CMAKE_MINIMUM_REQUIRED(VERSION 2.8 FATAL_ERROR)
- 
--PROJECT(libcue)
-+PROJECT(libcue C)
- 
- include(GNUInstallDirs)
- 
--- 
-2.14.1
-
diff --git a/package/libcue/libcue.hash b/package/libcue/libcue.hash
index 1793ce7ab3..357807f0c8 100644
--- a/package/libcue/libcue.hash
+++ b/package/libcue/libcue.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	328f14b8ae0a6b8d4c96928b53b88a86d72a354b4da9d846343c78ba36022879	libcue-v2.2.0.tar.gz
+sha256	f27bc3ebb2e892cd9d32a7bee6d84576a60f955f29f748b9b487b173712f1200	libcue-v2.2.1.tar.gz
 sha256	c388d36583fa54e13b6d73ad924d0b68d073ed8a5771e17cb49104705df4504f	LICENSE
diff --git a/package/libcue/libcue.mk b/package/libcue/libcue.mk
index 65bdd79ac5..f2d64439fe 100644
--- a/package/libcue/libcue.mk
+++ b/package/libcue/libcue.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCUE_VERSION = v2.2.0
+LIBCUE_VERSION = v2.2.1
 LIBCUE_SITE = $(call github,lipnitsk,libcue,$(LIBCUE_VERSION))
 LIBCUE_LICENSE = GPL-2.0, BSD-2-Clause (rem.c)
 LIBCUE_LICENSE_FILES = LICENSE
-- 
2.14.1
