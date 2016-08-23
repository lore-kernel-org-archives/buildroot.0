From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 23 Aug 2016 10:19:34 -0300
Subject: [Buildroot] [PATCH 2/2] nfacct: bump to version 1.0.2
In-Reply-To: <1471958374-16839-1-git-send-email-gustavo@zacarias.com.ar>
References: <1471958374-16839-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1471958374-16839-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patch.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nfacct/0001-uclinux.patch | 26 --------------------------
 package/nfacct/nfacct.hash        |  6 +++---
 package/nfacct/nfacct.mk          |  2 +-
 3 files changed, 4 insertions(+), 30 deletions(-)
 delete mode 100644 package/nfacct/0001-uclinux.patch

diff --git a/package/nfacct/0001-uclinux.patch b/package/nfacct/0001-uclinux.patch
deleted file mode 100644
index 295a370..0000000
--- a/package/nfacct/0001-uclinux.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From da1a0c186232d1bca9c723bd47d11a6e3807ae29 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Tue, 10 Sep 2013 16:16:48 -0300
-Subject: [PATCH] configure: uclinux is also linux
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 9679112..9a34bdc 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -15,7 +15,7 @@ AC_PROG_INSTALL
- AC_PROG_LN_S
- 
- case "$host" in
--*-*-linux*) ;;
-+*-*-linux* | *-*-uclinux*) ;;
- *) AC_MSG_ERROR([Linux only, dude!]);;
- esac
- 
--- 
-1.8.1.5
-
diff --git a/package/nfacct/nfacct.hash b/package/nfacct/nfacct.hash
index 48561ab..737354e 100644
--- a/package/nfacct/nfacct.hash
+++ b/package/nfacct/nfacct.hash
@@ -1,3 +1,3 @@
-# From ftp://ftp.netfilter.org/pub/nfacct/nfacct-1.0.1.tar.bz2.{md5sum,sha1sum}
-md5	992e863409d144350dbc8f0554a0f478	nfacct-1.0.1.tar.bz2
-sha1	57c5fa68a172b30b6c5ea6cb36be685e207312ef	nfacct-1.0.1.tar.bz2
+# From ftp://ftp.netfilter.org/pub/nfacct/nfacct-1.0.2.tar.bz2.{md5sum,sha1sum}
+md5	94faafdaaed85ca9220c5692be8a408e	nfacct-1.0.2.tar.bz2
+sha1	17d6576778227ea93c62600d9b18ff4932963c6a	nfacct-1.0.2.tar.bz2
diff --git a/package/nfacct/nfacct.mk b/package/nfacct/nfacct.mk
index 7e42160..d19d02f 100644
--- a/package/nfacct/nfacct.mk
+++ b/package/nfacct/nfacct.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFACCT_VERSION = 1.0.1
+NFACCT_VERSION = 1.0.2
 NFACCT_SOURCE = nfacct-$(NFACCT_VERSION).tar.bz2
 NFACCT_SITE = http://www.netfilter.org/projects/nfacct/files
 NFACCT_DEPENDENCIES = host-pkgconf \
-- 
2.7.3
