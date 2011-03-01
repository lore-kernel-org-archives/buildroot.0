From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  1 Mar 2011 13:19:59 -0300
Subject: [Buildroot] [PATCH 2/4] file: bump to version 5.05
In-Reply-To: <1298996401-798-1-git-send-email-gustavo@zacarias.com.ar>
References: <1298996401-798-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1298996401-798-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
