From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 21:13:16 +0100
Subject: [Buildroot] [git commit] package/physfs: bump to 3.0.1
Message-ID: <20171201205339.D4C1080AC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a6dc427a2a9bb7f4575ce3dd265ad3fa695a506
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstream patch.

Use the official archive and add a hash file.
Also add a license file hash.

Remove LGPL.txt license file since src/lzma directory has been removed
from the sources.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Julien BOIBESSOT <julien.boibessot@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../physfs/0001-Fix-builds-with-modern-GCC.patch   | 38 ----------------------
 package/physfs/physfs.hash                         |  3 ++
 package/physfs/physfs.mk                           | 10 +++---
 3 files changed, 8 insertions(+), 43 deletions(-)

diff --git a/package/physfs/0001-Fix-builds-with-modern-GCC.patch b/package/physfs/0001-Fix-builds-with-modern-GCC.patch
deleted file mode 100644
index 710b4ff..0000000
--- a/package/physfs/0001-Fix-builds-with-modern-GCC.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 61d3b63abcba8e9615dcb8a3d1fc026bf7f8d5f8 Mon Sep 17 00:00:00 2001
-From: Jacob Burroughs <jburroughs@trustwave.com>
-Date: Thu, 23 Jun 2016 13:03:47 -0500
-Subject: [PATCH] Fix builds with modern GCC
-
-From SuperTux project:
-https://github.com/SuperTux/physfs/commit/61d3b63abcba8e9615dcb8a3d1fc026bf7f8d5f8
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- CMakeLists.txt | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 2a371af..94c4844 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -50,7 +50,7 @@ endif()
- # Add some gcc-specific command lines.
- if(CMAKE_COMPILER_IS_GNUCC)
-     # Always build with debug symbols...you can strip it later.
--    add_definitions(-g -pipe -Werror -fsigned-char)
-+    add_definitions(-g -pipe -fsigned-char)
- 
-     # Stupid BeOS generates warnings in the system headers.
-     if(NOT BEOS)
-@@ -304,7 +304,7 @@ if(PHYSFS_BUILD_TEST)
-         if(READLINE_LIBRARY)
-             set(HAVE_SYSTEM_READLINE TRUE)
-             set(TEST_PHYSFS_LIBS ${TEST_PHYSFS_LIBS} ${READLINE_LIBRARY} ${CURSES_LIBRARY})
--            include_directories(${READLINE_H} ${HISTORY_H})
-+            include_directories(SYSTEM ${READLINE_H} ${HISTORY_H})
-             add_definitions(-DPHYSFS_HAVE_READLINE=1)
-         endif()
-     endif()
--- 
-2.9.3
-
diff --git a/package/physfs/physfs.hash b/package/physfs/physfs.hash
new file mode 100644
index 0000000..3d97fe0
--- /dev/null
+++ b/package/physfs/physfs.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 b77b9f853168d9636a44f75fca372b363106f52d789d18a2f776397bf117f2f1  physfs-3.0.1.tar.bz2
+sha256 7ce475991f6cc09958ef0d57312522eba78e36d984307c95f9a3965adf7e4e2b  LICENSE.txt
diff --git a/package/physfs/physfs.mk b/package/physfs/physfs.mk
index 9193ad5..78176be 100644
--- a/package/physfs/physfs.mk
+++ b/package/physfs/physfs.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PHYSFS_VERSION = be27dfd07d97336145e7f49d3fd200a6e902f85e
-PHYSFS_SITE = https://hg.icculus.org/icculus/physfs
-PHYSFS_SITE_METHOD = hg
+PHYSFS_VERSION = 3.0.1
+PHYSFS_SOURCE = physfs-$(PHYSFS_VERSION).tar.bz2
+PHYSFS_SITE = https://icculus.org/physfs/downloads
 
-PHYSFS_LICENSE = Zlib (physfs), LGPL with exceptions (lzma)
-PHYSFS_LICENSE_FILES = LICENSE.txt src/lzma/LGPL.txt
+PHYSFS_LICENSE = Zlib
+PHYSFS_LICENSE_FILES = LICENSE.txt
 
 PHYSFS_INSTALL_STAGING = YES
 
