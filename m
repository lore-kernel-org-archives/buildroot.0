From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jun 2017 22:48:42 +0200
Subject: [Buildroot] [git commit] cmake: bump version to 3.8.2
Message-ID: <20170606204850.B49AF81DCA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b44bfc3093d5ef3d16def28fe820ff8ef92a78b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cmake depends on rhash, but host-cmake doesn't. This is because we use
the bundled dependencies for host-cmake but not for target.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cmake/Config.in  | 1 +
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/cmake/Config.in b/package/cmake/Config.in
index 64ab154..e7bd14e 100644
--- a/package/cmake/Config.in
+++ b/package/cmake/Config.in
@@ -29,6 +29,7 @@ config BR2_PACKAGE_CMAKE_CTEST
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_XZ
 	select BR2_PACKAGE_LIBUV
+	select BR2_PACKAGE_RHASH
 	help
 	  CTest is a testing tool distributed as a part of CMake. It
 	  can be used to automate updating (using CVS for example),
diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 13c0237..f138ac7 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,2 +1,2 @@
-# From http://www.cmake.org/files/v3.7/cmake-3.7.2-SHA-256.txt
-sha256 dc1246c4e6d168ea4d6e042cfba577c1acd65feea27e56f5ff37df920c30cae0  cmake-3.7.2.tar.gz
+# From http://www.cmake.org/files/v3.8/cmake-3.8.2-SHA-256.txt
+sha256 da3072794eb4c09f2d782fcee043847b99bb4cf8d4573978d9b2024214d6e92d  cmake-3.8.2.tar.gz
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index d9eea32..46bd1e4 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CMAKE_VERSION_MAJOR = 3.7
+CMAKE_VERSION_MAJOR = 3.8
 CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).2
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
@@ -22,7 +22,7 @@ CMAKE_LICENSE_FILES = Copyright.txt
 #   the system-wide libraries instead of rebuilding and statically
 #   linking with the ones bundled into the CMake sources.
 
-CMAKE_DEPENDENCIES = zlib jsoncpp libcurl libarchive expat bzip2 xz libuv
+CMAKE_DEPENDENCIES = zlib jsoncpp libcurl libarchive expat bzip2 xz libuv rhash
 
 CMAKE_CONF_OPTS = \
 	-DKWSYS_LFS_WORKS=TRUE \
