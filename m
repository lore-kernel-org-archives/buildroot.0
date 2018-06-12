From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 12 Jun 2018 15:28:44 +0300
Subject: [Buildroot] [PATCH] hiawatha: bump to version 10.8.1
Message-ID: <cec9e9faeb68a014d3bc2f968405776ccd894098.1528806524.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patch.

Add license file hash.

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../0001-cmake-allow-build-without-c.patch    | 34 -------------------
 package/hiawatha/hiawatha.hash                |  3 +-
 package/hiawatha/hiawatha.mk                  |  2 +-
 3 files changed, 3 insertions(+), 36 deletions(-)
 delete mode 100644 package/hiawatha/0001-cmake-allow-build-without-c.patch

diff --git a/package/hiawatha/0001-cmake-allow-build-without-c.patch b/package/hiawatha/0001-cmake-allow-build-without-c.patch
deleted file mode 100644
index d264d621c8ee..000000000000
--- a/package/hiawatha/0001-cmake-allow-build-without-c.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 784e46afd7530f3010726ba73cc1a81059eae8bf Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Mon, 5 Jun 2017 13:26:18 +0200
-Subject: [PATCH] cmake: allow build without c++
-
-By default cmake also searches for a c++ compiler:
-https://cmake.org/cmake/help/v3.7/command/project.html
-"By default C and CXX are enabled if no language options are given."
-
-This patch restricts the compiler to C to fix a build error detected
-by the buildroot autobuilders:
-http://autobuild.buildroot.net/results/c04/c04ff29b83c020573add597c355c57a6d9c9761d/build-end.log
-
-Patch sent upstream: https://github.com/hsleisink/hiawatha/pull/30
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 4f28d76..e8051fc 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,5 +1,5 @@
- cmake_minimum_required(VERSION 3.0)
--project(Hiawatha VERSION 10.6)
-+project(Hiawatha VERSION 10.6 LANGUAGES C)
- 
- # Compiler
- set(CMAKE_C_FLAGS "-O2 -Wall -Wextra ${CMAKE_C_FLAGS}")
--- 
-2.11.0
-
diff --git a/package/hiawatha/hiawatha.hash b/package/hiawatha/hiawatha.hash
index 3ec11cc21a0d..7d98c01bf7b0 100644
--- a/package/hiawatha/hiawatha.hash
+++ b/package/hiawatha/hiawatha.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 0cf014ae214be1bf6244c46c25e66805987c948837a4e37f9dede570de49bdeb  hiawatha-10.6.tar.gz
+sha256 0f013afc71284bab7267b0d80a51133a8fd4248575dbcbabf338cf826095cda8  hiawatha-10.8.1.tar.gz
+sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE
diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index 4dde25459d8a..776efc1dcf3e 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HIAWATHA_VERSION = 10.6
+HIAWATHA_VERSION = 10.8.1
 HIAWATHA_SITE = https://www.hiawatha-webserver.org/files
 HIAWATHA_DEPENDENCIES = zlib
 HIAWATHA_LICENSE = GPL-2.0
-- 
2.17.1
