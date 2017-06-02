From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 2 Jun 2017 11:16:41 +0100
Subject: [Buildroot] [PATCH v6 2/2] cmake: bump version to 3.8.2
In-Reply-To: <20170602101641.63979-1-Vincent.Riera@imgtec.com>
References: <20170602101641.63979-1-Vincent.Riera@imgtec.com>
Message-ID: <20170602101641.63979-2-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cmake depends on rhash, but host-cmake doesn't. This is because we use
the bundled dependencies for host-cmake but not for target.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v5 -> v6:
- Bump version to 3.8.2
Changes v4 -> v5:
- Nothing
Changes v3 -> v4:
- Nothing
Changes v2 -> v3:
- Bump version to 3.8.1
- Change LIBRHASH references to RHASH
Changes v1 -> v2:
- Added explanation in the commit log about why rhash dependency is
  needed for cmake but not for host-cmake. (Arnout)
---
 package/cmake/Config.in  | 1 +
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/cmake/Config.in b/package/cmake/Config.in
index 64ab15418..e7bd14e69 100644
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
index 13c023759..f138ac79a 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,2 +1,2 @@
-# From http://www.cmake.org/files/v3.7/cmake-3.7.2-SHA-256.txt
-sha256 dc1246c4e6d168ea4d6e042cfba577c1acd65feea27e56f5ff37df920c30cae0  cmake-3.7.2.tar.gz
+# From http://www.cmake.org/files/v3.8/cmake-3.8.2-SHA-256.txt
+sha256 da3072794eb4c09f2d782fcee043847b99bb4cf8d4573978d9b2024214d6e92d  cmake-3.8.2.tar.gz
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index d9eea3285..46bd1e4e5 100644
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
-- 
2.13.0
