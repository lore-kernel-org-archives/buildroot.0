From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 2 Jun 2018 16:06:02 +0200
Subject: [Buildroot] [git commit] librsync: bump to version 2.0.2
Message-ID: <20180602140444.695E08385B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a29c8ae3ee2f2ef1a7bdac48fa96d29d9e9b62f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove patch (already in version)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...CMakeLists.txt-Don-t-require-a-C-compiler.patch | 33 ----------------------
 package/librsync/librsync.hash                     |  3 +-
 package/librsync/librsync.mk                       |  2 +-
 3 files changed, 3 insertions(+), 35 deletions(-)

diff --git a/package/librsync/0001-CMakeLists.txt-Don-t-require-a-C-compiler.patch b/package/librsync/0001-CMakeLists.txt-Don-t-require-a-C-compiler.patch
deleted file mode 100644
index af5d28c5dc..0000000000
--- a/package/librsync/0001-CMakeLists.txt-Don-t-require-a-C-compiler.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From c1af3e1b926fa04dbddc2d30586ff26026083134 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Tue, 26 Sep 2017 19:06:43 +0200
-Subject: [PATCH] CMakeLists.txt: Don't require a C++ compiler
-
-By default, CMake assumes that the project is using both C and C++.  By
-explicitly passing 'C' as argument of the project() macro, we tell CMake
-that only C is used, which prevents CMake from erroring out if a C++
-compiler doesn't exist.
-
-Patch sent upstream: https://github.com/librsync/librsync/pull/116
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 85536e3..7fe1eda 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -16,7 +16,7 @@
- # Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
- 
- 
--project(librsync)
-+project(librsync C)
- cmake_minimum_required(VERSION 2.6)
- 
- INCLUDE(CMakeDependentOption)
--- 
-2.11.0
-
diff --git a/package/librsync/librsync.hash b/package/librsync/librsync.hash
index 2d5e2e0028..63e14b1059 100644
--- a/package/librsync/librsync.hash
+++ b/package/librsync/librsync.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256 b5c4dd114289832039397789e42d4ff0d1108ada89ce74f1999398593fae2169  librsync-v2.0.0.tar.gz
+sha256 e67b9520ee84f7239be6e948795803bd95495091cc00bf6d0e8c6976032a4af1  librsync-v2.0.2.tar.gz
+sha256 5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
diff --git a/package/librsync/librsync.mk b/package/librsync/librsync.mk
index 07b684a264..3b38e0a27a 100644
--- a/package/librsync/librsync.mk
+++ b/package/librsync/librsync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRSYNC_VERSION = v2.0.0
+LIBRSYNC_VERSION = v2.0.2
 LIBRSYNC_SITE = $(call github,librsync,librsync,$(LIBRSYNC_VERSION))
 LIBRSYNC_LICENSE = LGPL-2.1+
 LIBRSYNC_LICENSE_FILES = COPYING
