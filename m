From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 8 Jul 2018 12:17:03 +0200
Subject: [Buildroot] [git commit] libzip: bump to version 1.5.1
Message-ID: <20180708101935.5FC3A863D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1972e13ddeabe9287b82441554d40ade74bbc9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove patch (already in version)
- Update hash of license file: AES section has been removed:
  https://github.com/nih-at/libzip/commit/303fde909ffb1725f9926bed7be33b3abc87a107
  The AES section was BSD-3-Clause as well, so nothing changes in
  LIBZIP_LICENSE.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...0001-Use-cmake-E-tar-to-extract-test-data.patch | 40 ----------------------
 package/libzip/libzip.hash                         |  4 +--
 package/libzip/libzip.mk                           |  2 +-
 3 files changed, 3 insertions(+), 43 deletions(-)

diff --git a/package/libzip/0001-Use-cmake-E-tar-to-extract-test-data.patch b/package/libzip/0001-Use-cmake-E-tar-to-extract-test-data.patch
deleted file mode 100644
index 7d40111b1b..0000000000
--- a/package/libzip/0001-Use-cmake-E-tar-to-extract-test-data.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From e9244b207c0fc883ff84c1fc46602feb1e2b0347 Mon Sep 17 00:00:00 2001
-From: Thomas Klausner <tk@giga.or.at>
-Date: Wed, 3 Jan 2018 11:41:57 +0100
-Subject: [PATCH] Use 'cmake -E tar' to extract test data.
-
-For easier cross-compilation (Github issue #21).
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Patch status: upstream commit e9244b207c0
-
- regress/CMakeLists.txt | 12 +++---------
- 1 file changed, 3 insertions(+), 9 deletions(-)
-
-diff --git a/regress/CMakeLists.txt b/regress/CMakeLists.txt
-index e2ce232c774a..3a0d4f77dcf6 100644
---- a/regress/CMakeLists.txt
-+++ b/regress/CMakeLists.txt
-@@ -51,15 +51,9 @@ ADD_CUSTOM_TARGET(cleanup
- ADD_CUSTOM_TARGET(testinput
-   ALL
-   VERBATIM
--  COMMAND ziptool ${CMAKE_CURRENT_SOURCE_DIR}/manyfiles-zip.zip cat 0 > manyfiles.zip
--  COMMAND ziptool ${CMAKE_CURRENT_SOURCE_DIR}/manyfiles-zip.zip cat 1 > manyfiles-133000.zip
--  COMMAND ziptool ${CMAKE_CURRENT_SOURCE_DIR}/manyfiles-zip.zip cat 2 > manyfiles-65536.zip
--  COMMAND ziptool ${CMAKE_CURRENT_SOURCE_DIR}/manyfiles-zip.zip cat 3 > manyfiles-zip64-modulo.zip
--  COMMAND ziptool ${CMAKE_CURRENT_SOURCE_DIR}/manyfiles-zip.zip cat 4 > manyfiles-zip64.zip
--  COMMAND ziptool ${CMAKE_CURRENT_SOURCE_DIR}/manyfiles-zip.zip cat 5 > manyfiles-fewer.zip
--  COMMAND ziptool ${CMAKE_CURRENT_SOURCE_DIR}/manyfiles-zip.zip cat 6 > manyfiles-more.zip
--  COMMAND ziptool ${CMAKE_CURRENT_SOURCE_DIR}/bigzero-zip.zip cat 0 > bigzero.zip
--  DEPENDS ziptool ${CMAKE_CURRENT_SOURCE_DIR}/manyfiles-zip.zip ${CMAKE_CURRENT_SOURCE_DIR}/bigzero-zip.zip
-+  COMMAND cmake -E tar x ${CMAKE_CURRENT_SOURCE_DIR}/manyfiles-zip.zip
-+  COMMAND cmake -E tar x ${CMAKE_CURRENT_SOURCE_DIR}/bigzero-zip.zip
-+  DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/manyfiles-zip.zip ${CMAKE_CURRENT_SOURCE_DIR}/bigzero-zip.zip
- )
- 
- SET_PROPERTY(DIRECTORY PROPERTY ADDITIONAL_MAKE_CLEAN_FILES
--- 
-2.15.1
-
diff --git a/package/libzip/libzip.hash b/package/libzip/libzip.hash
index 0eeb3130c0..e9ed4717c5 100644
--- a/package/libzip/libzip.hash
+++ b/package/libzip/libzip.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	e508aba025f5f94b267d5120fc33761bcd98440ebe49dbfe2ed3df3afeacc7b1  libzip-1.4.0.tar.xz
-sha256  3c964a7eb1abeb6bd6f40035ed3a014728ff8c5437f107dcf24fbbfab16e227e  LICENSE
+sha256	04ea35b6956c7b3453f1ed3f3fe40e3ddae1f43931089124579e8384e79ed372  libzip-1.5.1.tar.xz
+sha256  04464e729973cf58189051e7a3e8bca2acce9a1058c735e9e2eb1fdbe0fbbf50  LICENSE
diff --git a/package/libzip/libzip.mk b/package/libzip/libzip.mk
index 537aa1deeb..d46bc17977 100644
--- a/package/libzip/libzip.mk
+++ b/package/libzip/libzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZIP_VERSION = 1.4.0
+LIBZIP_VERSION = 1.5.1
 LIBZIP_SITE = http://www.nih.at/libzip
 LIBZIP_SOURCE = libzip-$(LIBZIP_VERSION).tar.xz
 LIBZIP_LICENSE = BSD-3-Clause
