From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 22 Apr 2019 22:46:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/libyuv: bump to version
 413a8d8041f1cc5a350a47c0d81cc721e64f9fd0
Message-ID: <20190422204620.5645-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Switch to https://chromium.googlesource.com/libyuv/libyuv which is
  the official repository and still active (updated this month).
  Current site has not been updated since 2015.
- Drop second patch (already in version)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libyuv/0002-aarch64.patch | 36 -------------------------------
 package/libyuv/libyuv.hash        |  3 ++-
 package/libyuv/libyuv.mk          |  7 ++----
 3 files changed, 4 insertions(+), 42 deletions(-)
 delete mode 100644 package/libyuv/0002-aarch64.patch

diff --git a/package/libyuv/0002-aarch64.patch b/package/libyuv/0002-aarch64.patch
deleted file mode 100644
index c783cffe88..0000000000
--- a/package/libyuv/0002-aarch64.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Add missing source files for aarch64.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr libyuv-1ebf86795cb213a37f06eb1ef3713cff080568ea.org/CMakeLists.txt libyuv-1ebf86795cb213a37f06eb1ef3713cff080568ea/CMakeLists.txt
---- libyuv-1ebf86795cb213a37f06eb1ef3713cff080568ea.org/CMakeLists.txt	2015-06-20 00:04:06.000000000 +0200
-+++ libyuv-1ebf86795cb213a37f06eb1ef3713cff080568ea/CMakeLists.txt	2015-09-07 19:29:42.898034988 +0200
-@@ -14,6 +14,7 @@
-   ${ly_src_dir}/compare.cc
-   ${ly_src_dir}/compare_common.cc
-   ${ly_src_dir}/compare_neon.cc
-+  ${ly_src_dir}/compare_neon64.cc
-   ${ly_src_dir}/compare_gcc.cc
-   ${ly_src_dir}/compare_win.cc
-   ${ly_src_dir}/convert.cc
-@@ -31,10 +32,12 @@
-   ${ly_src_dir}/rotate_argb.cc
-   ${ly_src_dir}/rotate_mips.cc
-   ${ly_src_dir}/rotate_neon.cc
-+  ${ly_src_dir}/rotate_neon64.cc
-   ${ly_src_dir}/row_any.cc
-   ${ly_src_dir}/row_common.cc
-   ${ly_src_dir}/row_mips.cc
-   ${ly_src_dir}/row_neon.cc
-+  ${ly_src_dir}/row_neon64.cc
-   ${ly_src_dir}/row_gcc.cc
-   ${ly_src_dir}/row_win.cc
-   ${ly_src_dir}/scale.cc
-@@ -43,6 +46,7 @@
-   ${ly_src_dir}/scale_common.cc
-   ${ly_src_dir}/scale_mips.cc
-   ${ly_src_dir}/scale_neon.cc
-+  ${ly_src_dir}/scale_neon64.cc
-   ${ly_src_dir}/scale_gcc.cc
-   ${ly_src_dir}/scale_win.cc
-   ${ly_src_dir}/video_common.cc
diff --git a/package/libyuv/libyuv.hash b/package/libyuv/libyuv.hash
index 0361ce6eef..e0d4e57e1a 100644
--- a/package/libyuv/libyuv.hash
+++ b/package/libyuv/libyuv.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 ec31df87fc42153723e9ca65a6d71b0993504c3de5f925e79464c93b7ef66094  libyuv-1ebf86795cb213a37f06eb1ef3713cff080568ea.tar.gz
+sha256 395075bed7e048f5f7d4fe9cb9255ce0afcee3f8f093741a7af1a2b1c579d089  libyuv-413a8d8041f1cc5a350a47c0d81cc721e64f9fd0.tar.gz
+sha256 2b2cc1180c7e6988328ad2033b04b80117419db9c4c584918bbb3cfec7e9364f  LICENSE
diff --git a/package/libyuv/libyuv.mk b/package/libyuv/libyuv.mk
index 1abe126324..b3843cec8f 100644
--- a/package/libyuv/libyuv.mk
+++ b/package/libyuv/libyuv.mk
@@ -4,11 +4,8 @@
 #
 ################################################################################
 
-LIBYUV_VERSION = 1ebf86795cb213a37f06eb1ef3713cff080568ea
-# we use the FreeSwitch fork because there is currently no alternative
-# for https://chromium.googlesource.com/libyuv/libyuv which will be
-# deactivated in 2015.
-LIBYUV_SITE = https://freeswitch.org/stash/scm/sd/libyuv.git
+LIBYUV_VERSION = 413a8d8041f1cc5a350a47c0d81cc721e64f9fd0
+LIBYUV_SITE = https://chromium.googlesource.com/libyuv/libyuv
 LIBYUV_SITE_METHOD = git
 LIBYUV_LICENSE = BSD-3-Clause
 LIBYUV_LICENSE_FILES = LICENSE
-- 
2.20.1
