From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 Mar 2011 23:36:06 +0100
Subject: [Buildroot] [git commit master 1/1] file: bump to version 5.05
Message-ID: <20110306223740.383738E5E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c2bcce4a59f7baa0266300ec35d13fe04500d229
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/file/file-nocxx.patch |   31 -------------------------------
 package/file/file.mk          |    2 +-
 2 files changed, 1 insertions(+), 32 deletions(-)
 delete mode 100644 package/file/file-nocxx.patch

diff --git a/package/file/file-nocxx.patch b/package/file/file-nocxx.patch
deleted file mode 100644
index 3b0eec6..0000000
--- a/package/file/file-nocxx.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 126fcb5d08d69693eb4c6e5f5c3d1082b6910121 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Mon, 7 Jun 2010 11:40:04 -0300
-Subject: [PATCH] Disable configure script from checking for CXX since it's not needed
-
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- configure |    6 ++----
- 1 files changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/configure b/configure
-index a6e812b..ac2587f 100755
---- a/configure
-+++ b/configure
-@@ -6136,10 +6136,8 @@ if $ac_preproc_ok; then
-   :
- else
-   { { echo "$as_me:$LINENO: error: C++ preprocessor \"$CXXCPP\" fails sanity check
--See \`config.log' for more details." >&5
--echo "$as_me: error: C++ preprocessor \"$CXXCPP\" fails sanity check
--See \`config.log' for more details." >&2;}
--   { (exit 1); exit 1; }; }
-+See \`config.log' for more details." >&5;}
-+   { echo "C++ sucks, ignoring ..." >&5; }; }
- fi
- 
- ac_ext=cpp
--- 
-1.6.4.4
-
diff --git a/package/file/file.mk b/package/file/file.mk
index b8281d0..d405c26 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-FILE_VERSION = 5.04
+FILE_VERSION = 5.05
 FILE_SITE = ftp://ftp.astron.com/pub/file/
 FILE_DEPENDENCIES = host-file zlib
 HOST_FILE_DEPENDENCIES = host-zlib
-- 
1.7.3.4
