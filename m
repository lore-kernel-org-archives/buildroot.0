From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 22 Oct 2012 09:31:27 -0300
Subject: [Buildroot] [PATCH] libfuse: bump to version 2.9.2
Message-ID: <1350909087-27325-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libfuse/libfuse-iconv.patch |   18 ------------------
 package/libfuse/libfuse.mk          |    2 +-
 2 files changed, 1 insertions(+), 19 deletions(-)
 delete mode 100644 package/libfuse/libfuse-iconv.patch

diff --git a/package/libfuse/libfuse-iconv.patch b/package/libfuse/libfuse-iconv.patch
deleted file mode 100644
index 9f50032..0000000
--- a/package/libfuse/libfuse-iconv.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Upstream commit efeac22bfa65c845c04adb5e70e6de33b0104fa3 but without
-the need to autoreconf :)
-Fixes libiconv missing in fuse.pc
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura fuse-2.9.1/configure fuse-2.9.1.iconv/configure
---- fuse-2.9.1/configure	2012-07-19 09:53:29.000000000 -0300
-+++ fuse-2.9.1.iconv/configure	2012-09-07 08:47:57.834912620 -0300
-@@ -13237,7 +13237,7 @@
- 
-   fi
- 
--libfuse_libs=$libfuse_libs $LTLIBICONV
-+libfuse_libs="$libfuse_libs $LTLIBICONV"
-  if test "$am_cv_func_iconv" = yes; then
-   ICONV_TRUE=
-   ICONV_FALSE='#'
diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
index 779115b..ccd49fe 100644
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBFUSE_VERSION = 2.9.1
+LIBFUSE_VERSION = 2.9.2
 LIBFUSE_SOURCE = fuse-$(LIBFUSE_VERSION).tar.gz
 LIBFUSE_SITE = http://downloads.sourceforge.net/project/fuse/fuse-2.X/$(LIBFUSE_VERSION)
 LIBFUSE_LICENSE = GPLv2 LGPLv2.1
-- 
1.7.8.6
