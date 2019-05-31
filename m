From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 31 May 2019 09:48:13 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/ell: fix build with uclibc
Message-ID: <20190531074813.27210-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/444c9deb728fb041e560d940145f96cc4f455080

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...0001-ell-ecc.h-fix-build-with-uclibc.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/ell/0001-ell-ecc.h-fix-build-with-uclibc.patch

diff --git a/package/ell/0001-ell-ecc.h-fix-build-with-uclibc.patch b/package/ell/0001-ell-ecc.h-fix-build-with-uclibc.patch
new file mode 100644
index 0000000000..f64e3d9a87
--- /dev/null
+++ b/package/ell/0001-ell-ecc.h-fix-build-with-uclibc.patch
@@ -0,0 +1,31 @@
+From 3ca3044859f40d7c595daf0a93393352e4999fb7 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 30 May 2019 23:46:27 +0200
+Subject: [PATCH] ell/ecc.h: fix build with uclibc
+
+ssize_t is defined in sys/types.h
+
+Fixes:
+ - http://autobuild.buildroot.org/results/444c9deb728fb041e560d940145f96cc4f455080
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ ell/ecc.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/ell/ecc.h b/ell/ecc.h
+index 26a5889..65c49e8 100644
+--- a/ell/ecc.h
++++ b/ell/ecc.h
+@@ -27,6 +27,8 @@
+ extern "C" {
+ #endif
+ 
++#include <sys/types.h> // for ssize_t
++
+ #define L_ECC_MAX_DIGITS 6
+ #define L_ECC_SCALAR_MAX_BYTES		L_ECC_MAX_DIGITS * 8
+ #define L_ECC_POINT_MAX_BYTES		L_ECC_SCALAR_MAX_BYTES * 2
+-- 
+2.20.1
+
-- 
2.20.1
