From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 22:34:41 +0200
Subject: [Buildroot] [git commit] package/ttyd: bump to version 1.6.1
Message-ID: <20200712205248.F048886BA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c3b28bfb0ec1918693a603252c59a20dece24e53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patches applied upstream.

Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ttyd/0001-cmake-fix-build-without-C.patch | 41 -----------------------
 package/ttyd/ttyd.hash                            |  2 +-
 package/ttyd/ttyd.mk                              |  2 +-
 3 files changed, 2 insertions(+), 43 deletions(-)

diff --git a/package/ttyd/0001-cmake-fix-build-without-C.patch b/package/ttyd/0001-cmake-fix-build-without-C.patch
deleted file mode 100644
index 8d5d35ca19..0000000000
--- a/package/ttyd/0001-cmake-fix-build-without-C.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From cec921a680576865847d98552ded2a67efd8eb50 Mon Sep 17 00:00:00 2001
-From: Bartosz Bilas <b.bilas@grinn-global.com>
-Date: Mon, 15 Jun 2020 17:32:26 +0200
-Subject: [PATCH] cmake: fix build without C++
-
-Specify that ttyd is a C project to avoid the
-following build failure if a C++ compiler isn't found.
-
-CMake Error at CMakeLists.txt:3 (project):
-  The CMAKE_CXX_COMPILER:
-
-    /home/bartekk/Projects/buildroots/buildroot-dev/buildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-g++
-
-  is not a full path to an existing compiler tool.
-
-  Tell CMake where to find the compiler by setting either the environment
-  variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full path
-  to the compiler, or to the compiler name if it is in the PATH.
-
-Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
----
- Upstream status: https://github.com/tsl0922/ttyd/pull/382
-
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 8061f47..efd76d2 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,6 +1,6 @@
- cmake_minimum_required(VERSION 2.8)
- 
--project(ttyd)
-+project(ttyd C)
- set(PROJECT_VERSION "1.6.0")
- 
- find_package(Git)
--- 
-2.27.0
-
diff --git a/package/ttyd/ttyd.hash b/package/ttyd/ttyd.hash
index c73af44af3..8810282618 100644
--- a/package/ttyd/ttyd.hash
+++ b/package/ttyd/ttyd.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d14740bc82be0d0760dd0a3c97acbcbde490412a4edc61edabe46d311b068f83  ttyd-1.6.0.tar.gz
+sha256  d72dcca3dec00cda87b80a0a25ae4fee2f8b9098c1cdb558508dcb14fbb6fafc  ttyd-1.6.1.tar.gz
 sha256  711762f081c180ade3d09d7b0b7537eaf35eca8d1671e47bc66eaa39376edb12  LICENSE
diff --git a/package/ttyd/ttyd.mk b/package/ttyd/ttyd.mk
index a7e2ee9bb5..91b650c49e 100644
--- a/package/ttyd/ttyd.mk
+++ b/package/ttyd/ttyd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TTYD_VERSION = 1.6.0
+TTYD_VERSION = 1.6.1
 TTYD_SITE = $(call github,tsl0922,ttyd,$(TTYD_VERSION))
 TTYD_LICENSE = MIT
 TTYD_LICENSE_FILES = LICENSE
