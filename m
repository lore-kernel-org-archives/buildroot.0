From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 19 Oct 2015 18:38:35 -0300
Subject: [Buildroot] [PATCH 3/3] unionfs: bump to version 1.0
In-Reply-To: <1445290716-25372-1-git-send-email-gustavo@zacarias.com.ar>
References: <1445290716-25372-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1445290716-25372-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to github homepage and site.
Drop patch, it's not required any more.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/unionfs/0001-fuse-no-cxx-needed.patch | 19 -------------------
 package/unionfs/Config.in                     |  2 +-
 package/unionfs/unionfs.hash                  |  4 ++--
 package/unionfs/unionfs.mk                    |  5 ++---
 4 files changed, 5 insertions(+), 25 deletions(-)
 delete mode 100644 package/unionfs/0001-fuse-no-cxx-needed.patch

diff --git a/package/unionfs/0001-fuse-no-cxx-needed.patch b/package/unionfs/0001-fuse-no-cxx-needed.patch
deleted file mode 100644
index 56f7e24..0000000
--- a/package/unionfs/0001-fuse-no-cxx-needed.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-By default, CMake assumes a project uses the C and C++ languages, so
-it checks for both the C and the C++ compiler to exist.
-
-However, unionfs-fuse is written purely in C, so checking for a C++
-compiler is useless, and even prevents unionfs-fuse from building
-properly on targets for which no C++ compiler is available.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/CMakeLists.txt
-===================================================================
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,4 +1,4 @@
--project(unionfs-fuse)
-+project(unionfs-fuse C)
- 
- cmake_minimum_required(VERSION 2.0)
- INCLUDE (CheckIncludeFiles)
diff --git a/package/unionfs/Config.in b/package/unionfs/Config.in
index b623960..ece83a5 100644
--- a/package/unionfs/Config.in
+++ b/package/unionfs/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_UNIONFS
 	help
 	  A userspace unionfs implementation.
 
-	  http://podgorny.cz/moin/UnionFsFuse
+	  https://github.com/rpodgorny/unionfs-fuse
 
 comment "unionfs needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
diff --git a/package/unionfs/unionfs.hash b/package/unionfs/unionfs.hash
index 2cadf0f..fce98e0 100644
--- a/package/unionfs/unionfs.hash
+++ b/package/unionfs/unionfs.hash
@@ -1,2 +1,2 @@
-# locally computed hash
-sha256 8d5c9dcb51ecb9a9b03890e16d17e37d602b0c1f23ed6a9ddec2b0f719c9f662 unionfs-fuse-0.26.tar.xz
+# Locally computed
+sha256	2ee80bd0634a61adb2159212e155d607a0a82ad659214ae6edb3530396cccc09	unionfs-1.0.tar.gz
diff --git a/package/unionfs/unionfs.mk b/package/unionfs/unionfs.mk
index e5c5993..cba52be 100644
--- a/package/unionfs/unionfs.mk
+++ b/package/unionfs/unionfs.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-UNIONFS_VERSION = 0.26
-UNIONFS_SITE = http://podgorny.cz/unionfs-fuse/releases
-UNIONFS_SOURCE = unionfs-fuse-$(UNIONFS_VERSION).tar.xz
+UNIONFS_VERSION = 1.0
+UNIONFS_SITE = $(call github,rpodgorny,unionfs-fuse,v$(UNIONFS_VERSION))
 UNIONFS_DEPENDENCIES = libfuse host-pkgconf
 UNIONFS_LICENSE = BSD-3c
 UNIONFS_LICENSE_FILES = LICENSE
-- 
2.4.10
