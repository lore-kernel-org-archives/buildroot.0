From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 25 Jun 2014 16:01:26 -0300
Subject: [Buildroot] [PATCH 1/2] libnftnl: bump to version 1.0.2
Message-ID: <1403722887-21049-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...001-configure-uclinux-is-also-linux-nommu.patch | 26 ----------------------
 package/libnftnl/libnftnl.mk                       |  4 +---
 2 files changed, 1 insertion(+), 29 deletions(-)
 delete mode 100644 package/libnftnl/libnftnl-0001-configure-uclinux-is-also-linux-nommu.patch

diff --git a/package/libnftnl/libnftnl-0001-configure-uclinux-is-also-linux-nommu.patch b/package/libnftnl/libnftnl-0001-configure-uclinux-is-also-linux-nommu.patch
deleted file mode 100644
index 52d81dd..0000000
--- a/package/libnftnl/libnftnl-0001-configure-uclinux-is-also-linux-nommu.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 71773664f9e7c15bb71ca07fcf9be9efc95abe44 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Tue, 3 Jun 2014 16:42:45 -0300
-Subject: [PATCH] configure: uclinux is also linux (nommu)
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 255e457..35287f9 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -35,7 +35,7 @@ AC_DISABLE_STATIC
- LT_INIT
- CHECK_GCC_FVISIBILITY
- case "$host" in
--*-*-linux*) ;;
-+*-*-linux* | *-*-uclinux*) ;;
- *) AC_MSG_ERROR([Linux only, dude!]);;
- esac
- 
--- 
-1.8.5.5
-
diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
index c0e8b94..1ceb547 100644
--- a/package/libnftnl/libnftnl.mk
+++ b/package/libnftnl/libnftnl.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-LIBNFTNL_VERSION = 1.0.1
+LIBNFTNL_VERSION = 1.0.2
 LIBNFTNL_SITE = http://netfilter.org/projects/libnftnl/files
 LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.bz2
 LIBNFTNL_LICENSE = GPLv2+
 LIBNFTNL_LICENSE_FILES = COPYING
 LIBNFTNL_INSTALL_STAGING = YES
-# For uclinux support patch
-LIBNFTNL_AUTORECONF = YES
 LIBNFTNL_DEPENDENCIES = host-pkgconf libmnl
 
 ifeq ($(BR2_PACKAGE_LIBNFTNL_JSON),y)
-- 
1.8.5.5
