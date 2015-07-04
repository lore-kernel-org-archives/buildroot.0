From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  4 Jul 2015 09:33:26 -0300
Subject: [Buildroot] [PATCH 1/2] cloog: bump to version 0.18.3
Message-ID: <1436013207-29587-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch upstream so remove.
And add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/cloog/0001-add-missing-files.patch | 69 ------------------------------
 package/cloog/cloog.hash                   |  2 +
 package/cloog/cloog.mk                     |  2 +-
 3 files changed, 3 insertions(+), 70 deletions(-)
 delete mode 100644 package/cloog/0001-add-missing-files.patch
 create mode 100644 package/cloog/cloog.hash

diff --git a/package/cloog/0001-add-missing-files.patch b/package/cloog/0001-add-missing-files.patch
deleted file mode 100644
index 23743cc..0000000
--- a/package/cloog/0001-add-missing-files.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-Add CMake related files missing from the release tarball
-
-Due to a bug in the cloog release, a few files were missing from the
-release tarball. This patch re-adds those files, which are needed for
-the build to work. This patch can be dropped when cloog is bumped.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/cmake/isl-config.cmake
-===================================================================
---- /dev/null
-+++ b/cmake/isl-config.cmake
-@@ -0,0 +1,25 @@
-+# Try to find the isl library
-+
-+# ISL_FOUND       - System has isl lib
-+# ISL_INCLUDE_DIR - The isl include directory
-+# ISL_LIBRARY     - Library needed to use isl
-+
-+
-+if (ISL_INCLUDE_DIR AND ISL_LIBRARY)
-+	# Already in cache, be silent
-+	set(ISL_FIND_QUIETLY TRUE)
-+endif()
-+
-+find_path(ISL_INCLUDE_DIR NAMES isl/version.h)
-+find_library(ISL_LIBRARY NAMES isl)
-+
-+if (ISL_LIBRARY AND ISL_INCLUDE_DIR)
-+	message(STATUS "Library isl found =) ${ISL_LIBRARY}")
-+else()
-+	message(STATUS "Library isl not found =(")
-+endif()
-+
-+include(FindPackageHandleStandardArgs)
-+FIND_PACKAGE_HANDLE_STANDARD_ARGS(ISL DEFAULT_MSG ISL_INCLUDE_DIR ISL_LIBRARY)
-+
-+mark_as_advanced(ISL_INCLUDE_DIR ISL_LIBRARY)
-Index: b/cmake/cloog-isl-config.cmake
-===================================================================
---- /dev/null
-+++ b/cmake/cloog-isl-config.cmake
-@@ -0,0 +1,26 @@
-+# Try to find the cloog-isl library
-+
-+# CLOOG_ISL_FOUND       - System has cloog-isl lib
-+# CLOOG_ISL_INCLUDE_DIR - The cloog-isl include directory
-+# CLOOG_ISL_LIBRARY     - Library needed to use cloog-isl
-+
-+
-+if (CLOOG_ISL_INCLUDE_DIR AND CLOOG_ISL_LIBRARY)
-+	# Already in cache, be silent
-+	set(CLOOG_ISL_FIND_QUIETLY TRUE)
-+endif()
-+
-+find_path(CLOOG_ISL_INCLUDE_DIR NAMES cloog/isl/cloog.h)
-+find_library(CLOOG_ISL_LIBRARY NAMES cloog-isl)
-+
-+if (CLOOG_ISL_LIBRARY AND CLOOG_ISL_INCLUDE_DIR)
-+	message(STATUS "Library cloog-isl found =) ${CLOOG_ISL_LIBRARY}")
-+else()
-+	message(STATUS "Library cloog-isl not found =(")
-+endif()
-+
-+
-+include(FindPackageHandleStandardArgs)
-+FIND_PACKAGE_HANDLE_STANDARD_ARGS(CLOOG_ISL DEFAULT_MSG CLOOG_ISL_INCLUDE_DIR CLOOG_ISL_LIBRARY)
-+
-+mark_as_advanced(CLOOG_ISL_INCLUDE_DIR CLOOG_ISL_LIBRARY)
diff --git a/package/cloog/cloog.hash b/package/cloog/cloog.hash
new file mode 100644
index 0000000..72a5b65
--- /dev/null
+++ b/package/cloog/cloog.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	460c6c740acb8cdfbfbb387156b627cf731b3837605f2ec0001d079d89c69734	cloog-0.18.3.tar.gz
diff --git a/package/cloog/cloog.mk b/package/cloog/cloog.mk
index f74d649..4b02cd4 100644
--- a/package/cloog/cloog.mk
+++ b/package/cloog/cloog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLOOG_VERSION = 0.18.2
+CLOOG_VERSION = 0.18.3
 CLOOG_SITE = http://www.bastoul.net/cloog/pages/download
 CLOOG_LICENSE = LGPLv2.1+
 CLOOG_DEPENDENCIES = gmp isl
-- 
2.3.6
