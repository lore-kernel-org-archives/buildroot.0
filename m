From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 10:59:41 +0200
Subject: [Buildroot] [git commit] libwebsockets: bump version to
	v1.4-chrome43-firefox-36
Message-ID: <20150406090028.9AB2481996@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=54d70feddef7c1777cd611aedb8f3e3311ced8e1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dropped upstream patch 0001
renamed patch 0002 -> 0001
added hash
details : https://github.com/warmcat/libwebsockets/blob/master/changelog

Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...e-shared-library-build-when-BUILD_SHARED.patch} |    0
 .../0001-cmake-set-the-project-language.patch      |   34 --------------------
 package/libwebsockets/libwebsockets.hash           |    2 +
 package/libwebsockets/libwebsockets.mk             |    2 +-
 4 files changed, 3 insertions(+), 35 deletions(-)

diff --git a/package/libwebsockets/0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch b/package/libwebsockets/0001-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
similarity index 100%
rename from package/libwebsockets/0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
rename to package/libwebsockets/0001-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
diff --git a/package/libwebsockets/0001-cmake-set-the-project-language.patch b/package/libwebsockets/0001-cmake-set-the-project-language.patch
deleted file mode 100644
index 7b017a7..0000000
--- a/package/libwebsockets/0001-cmake-set-the-project-language.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 6ab441e0509a9fda179fd1febf73d0f9fae321d6 Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Fri, 2 May 2014 14:24:58 +0200
-Subject: [PATCH] cmake: set the project language
-
-By default, CMake sets C and C++ as languages used by the project.
-This makes the configuration failed if no C++ compiler is found.
-
-Since libwesockets in written in pure C, no C++, there is no reason to
-disable it when the toolchain has no C++ support.
-
-This patch just make the CMake code reflecting the real status of the
-project with regard to the languages used.
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index f1b6ace..72391b0 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,6 +1,6 @@
- cmake_minimum_required(VERSION 2.6)
- 
--project(libwebsockets)
-+project(libwebsockets C)
- 
- set(PACKAGE "libwebsockets")
- set(CPACK_PACKAGE_NAME "${PACKAGE}")
--- 
-1.9.2
-
diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
new file mode 100644
index 0000000..eadff73
--- /dev/null
+++ b/package/libwebsockets/libwebsockets.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  63e14fbc768a22b01a3ade61a8e6a89ab0eac329b0f9fbb40ce9fb7210fcaa70  libwebsockets-v1.4-chrome43-firefox-36.tar.xz
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index e1a1aa3..da1a872 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = v1.3-chrome37-firefox30
+LIBWEBSOCKETS_VERSION = v1.4-chrome43-firefox-36
 LIBWEBSOCKETS_SOURCE = libwebsockets-$(LIBWEBSOCKETS_VERSION).tar.xz
 LIBWEBSOCKETS_SITE = http://git.libwebsockets.org/cgi-bin/cgit/libwebsockets/snapshot
 LIBWEBSOCKETS_LICENSE = LGPLv2.1 with exceptions
