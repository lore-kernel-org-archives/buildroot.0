From: Peter Seiderer <ps.report@gmx.net>
Date: Wed,  3 Jun 2020 00:17:44 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/ell: bump version to 0.31
Message-ID: <20200602221745.3209-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- removed 0001-ell-ecc.h-fix-build-with-uclibc.patch
  (upstream applied [1])

- update 0002-ell-rtnl-fix-compile-with-older-toolchains.patch
 (add upstream link)

[1] https://git.kernel.org/pub/scm/libs/ell/ell.git/commit/?id=aa30f1884cf72d590fdca1db11d4fb2c2d526141

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - add missing sob line
---
 ...0001-ell-ecc.h-fix-build-with-uclibc.patch | 31 -------------------
 ...nl-fix-compile-with-older-toolchains.patch |  1 +
 package/ell/ell.hash                          |  2 +-
 package/ell/ell.mk                            |  2 +-
 4 files changed, 3 insertions(+), 33 deletions(-)
 delete mode 100644 package/ell/0001-ell-ecc.h-fix-build-with-uclibc.patch

diff --git a/package/ell/0001-ell-ecc.h-fix-build-with-uclibc.patch b/package/ell/0001-ell-ecc.h-fix-build-with-uclibc.patch
deleted file mode 100644
index f64e3d9a87..0000000000
--- a/package/ell/0001-ell-ecc.h-fix-build-with-uclibc.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 3ca3044859f40d7c595daf0a93393352e4999fb7 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 30 May 2019 23:46:27 +0200
-Subject: [PATCH] ell/ecc.h: fix build with uclibc
-
-ssize_t is defined in sys/types.h
-
-Fixes:
- - http://autobuild.buildroot.org/results/444c9deb728fb041e560d940145f96cc4f455080
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- ell/ecc.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/ell/ecc.h b/ell/ecc.h
-index 26a5889..65c49e8 100644
---- a/ell/ecc.h
-+++ b/ell/ecc.h
-@@ -27,6 +27,8 @@
- extern "C" {
- #endif
- 
-+#include <sys/types.h> // for ssize_t
-+
- #define L_ECC_MAX_DIGITS 6
- #define L_ECC_SCALAR_MAX_BYTES		L_ECC_MAX_DIGITS * 8
- #define L_ECC_POINT_MAX_BYTES		L_ECC_SCALAR_MAX_BYTES * 2
--- 
-2.20.1
-
diff --git a/package/ell/0002-ell-rtnl-fix-compile-with-older-toolchains.patch b/package/ell/0002-ell-rtnl-fix-compile-with-older-toolchains.patch
index a9828f1904..ba6cafa7a8 100644
--- a/package/ell/0002-ell-rtnl-fix-compile-with-older-toolchains.patch
+++ b/package/ell/0002-ell-rtnl-fix-compile-with-older-toolchains.patch
@@ -17,6 +17,7 @@ Fixes:
   ell/rtnl.c: In function 'l_rtnl_route_extract':
   ell/rtnl.c:120:8: error: 'RTA_PREF' undeclared (first use in this function)
 
+[Upstream: https://lists.ofono.org/hyperkitty/list/ell at lists.01.org/thread/TOJ5XEY7X6WMOMJHX4KWI5LFEOX2QTBQ]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
  configure.ac | 2 ++
diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index 58e624baed..526417bf33 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  15abb7eff187002ce36a27f6752cd4ec815da0ab658608b1cd36a63f7a84237e  ell-0.30.tar.gz
+sha256  5933faff0b94455bc05c9885d138ca295f5e9cc6e2eecdf203e4dba45d08fd80  ell-0.31.tar.gz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
index 45d3df34ed..da39ccc823 100644
--- a/package/ell/ell.mk
+++ b/package/ell/ell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELL_VERSION = 0.30
+ELL_VERSION = 0.31
 ELL_SITE = https://git.kernel.org/pub/scm/libs/ell/ell.git
 ELL_SITE_METHOD = git
 ELL_LICENSE = LGPL-2.1+
-- 
2.26.2
