From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 8 May 2017 18:00:07 +0100
Subject: [Buildroot] [PATCH v3 2/2] cmake: bump version to 3.8.1
In-Reply-To: <20170508170007.13923-1-Vincent.Riera@imgtec.com>
References: <20170508170007.13923-1-Vincent.Riera@imgtec.com>
Message-ID: <20170508170007.13923-2-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cmake depends on rhash, but host-cmake doesn't. This is because we use
the bundled dependencies for host-cmake but not for target.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v2 -> v3:
- Bump version to 3.8.1
- Change LIBRHASH references to RHASH
Changes v1 -> v2:
- Added explanation in the commit log about why rhash dependency is
  needed for cmake but not for host-cmake. (Arnout)
---
 package/cmake/Config.in  | 1 +
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 6 +++---
 3 files changed, 6 insertions(+), 5 deletions(-)

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
index 13c0237..2aea9bc 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,2 +1,2 @@
-# From http://www.cmake.org/files/v3.7/cmake-3.7.2-SHA-256.txt
-sha256 dc1246c4e6d168ea4d6e042cfba577c1acd65feea27e56f5ff37df920c30cae0  cmake-3.7.2.tar.gz
+# From http://www.cmake.org/files/v3.8/cmake-3.8.1-SHA-256.txt
+sha256 ce5d9161396e06501b00e52933783150a87c33080d4bdcef461b5b7fd24ac228  cmake-3.8.1.tar.gz
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index d9eea32..10af415 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CMAKE_VERSION_MAJOR = 3.7
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).2
+CMAKE_VERSION_MAJOR = 3.8
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).1
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
@@ -22,7 +22,7 @@ CMAKE_LICENSE_FILES = Copyright.txt
 #   the system-wide libraries instead of rebuilding and statically
 #   linking with the ones bundled into the CMake sources.
 
-CMAKE_DEPENDENCIES = zlib jsoncpp libcurl libarchive expat bzip2 xz libuv
+CMAKE_DEPENDENCIES = zlib jsoncpp libcurl libarchive expat bzip2 xz libuv rhash
 
 CMAKE_CONF_OPTS = \
 	-DKWSYS_LFS_WORKS=TRUE \
-- 
2.10.2
