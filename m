From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 23 Aug 2016 10:19:33 -0300
Subject: [Buildroot] [PATCH 1/2] libnetfilter_acct: bump to version 1.0.3
Message-ID: <1471958374-16839-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patch.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libnetfilter_acct/0001-uclinux.patch     | 26 ------------------------
 package/libnetfilter_acct/libnetfilter_acct.hash |  6 +++---
 package/libnetfilter_acct/libnetfilter_acct.mk   |  2 +-
 3 files changed, 4 insertions(+), 30 deletions(-)
 delete mode 100644 package/libnetfilter_acct/0001-uclinux.patch

diff --git a/package/libnetfilter_acct/0001-uclinux.patch b/package/libnetfilter_acct/0001-uclinux.patch
deleted file mode 100644
index 070f02c..0000000
--- a/package/libnetfilter_acct/0001-uclinux.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From bfcaf00a8c972e2c10412d917f08626eb05079c7 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Tue, 10 Sep 2013 15:32:03 -0300
-Subject: [PATCH] configure: uclinux is also linux
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index ad1bef8..24a7bb9 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -22,7 +22,7 @@ AC_DISABLE_STATIC
- LT_INIT
- CHECK_GCC_FVISIBILITY
- case "$host" in
--*-*-linux*) ;;
-+*-*-linux* | *-*-uclinux*) ;;
- *) AC_MSG_ERROR([Linux only, dude!]);;
- esac
- 
--- 
-1.8.1.5
-
diff --git a/package/libnetfilter_acct/libnetfilter_acct.hash b/package/libnetfilter_acct/libnetfilter_acct.hash
index 852617c..7c38664 100644
--- a/package/libnetfilter_acct/libnetfilter_acct.hash
+++ b/package/libnetfilter_acct/libnetfilter_acct.hash
@@ -1,3 +1,3 @@
-# From ftp://ftp.netfilter.org/pub/libnetfilter_acct/libnetfilter_acct-1.0.2.tar.bz2.{md5sum,sha1sum}
-md5	2118d9514c079839ebd9cb3144ad2ad7	libnetfilter_acct-1.0.2.tar.bz2
-sha1	ca0186912b5ee57088a20dd0a5b78606fd6af02e	libnetfilter_acct-1.0.2.tar.bz2
+# From ftp://ftp.netfilter.org/pub/libnetfilter_acct/libnetfilter_acct-1.0.3.tar.bz2.{md5sum,sha1sum}
+md5	814b2972b2f5c740ff87510bc109168b	libnetfilter_acct-1.0.3.tar.bz2
+sha1	4b9073e4aa989b0f000c8da1ab01b22fceed52b2	libnetfilter_acct-1.0.3.tar.bz2
diff --git a/package/libnetfilter_acct/libnetfilter_acct.mk b/package/libnetfilter_acct/libnetfilter_acct.mk
index 5adb6e0..3870ef8 100644
--- a/package/libnetfilter_acct/libnetfilter_acct.mk
+++ b/package/libnetfilter_acct/libnetfilter_acct.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNETFILTER_ACCT_VERSION = 1.0.2
+LIBNETFILTER_ACCT_VERSION = 1.0.3
 LIBNETFILTER_ACCT_SOURCE = libnetfilter_acct-$(LIBNETFILTER_ACCT_VERSION).tar.bz2
 LIBNETFILTER_ACCT_SITE = http://www.netfilter.org/projects/libnetfilter_acct/files
 LIBNETFILTER_ACCT_INSTALL_STAGING = YES
-- 
2.7.3
