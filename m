From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 Sep 2013 07:59:08 -0300
Subject: [Buildroot] [PATCH] libmicrohttpd: bump to version 0.9.30
Message-ID: <1378205948-24286-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../libmicrohttpd-01-openssl-conditional.patch       | 20 --------------------
 package/libmicrohttpd/libmicrohttpd.mk               |  3 +--
 2 files changed, 1 insertion(+), 22 deletions(-)
 delete mode 100644 package/libmicrohttpd/libmicrohttpd-01-openssl-conditional.patch

diff --git a/package/libmicrohttpd/libmicrohttpd-01-openssl-conditional.patch b/package/libmicrohttpd/libmicrohttpd-01-openssl-conditional.patch
deleted file mode 100644
index 37d5e1e..0000000
--- a/package/libmicrohttpd/libmicrohttpd-01-openssl-conditional.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Subject: [PATCH] Fix configure failure for --disable-spdy
-
-The @HAVE_OPENSSL@ conditional is used in src/Makefile.in so when SPDY
-support is forcibly disabled the AM_CONDITIONAL is never executed, causing
-configure to bail out.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura libmicrohttpd-0.9.29.orig/configure.ac libmicrohttpd-0.9.29/configure.ac
---- libmicrohttpd-0.9.29.orig/configure.ac	2013-09-02 06:17:44.660620584 -0300
-+++ libmicrohttpd-0.9.29/configure.ac	2013-09-02 06:36:44.598189751 -0300
-@@ -341,6 +341,8 @@
-                    enable_spdy="yes"], 
-                    [AM_CONDITIONAL(HAVE_OPENSSL, false)
-                    enable_spdy="no"])
-+else
-+ AM_CONDITIONAL(HAVE_OPENSSL, false)
- fi
- 
- if test "$enable_spdy" = "yes"
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index d0501ee..48dace7 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 0.9.29
+LIBMICROHTTPD_VERSION = 0.9.30
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_INSTALL_STAGING = YES
 LIBMICROHTTPD_CONF_OPT = --disable-spdy
-LIBMICROHTTPD_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_SSL),y)
 LIBMICROHTTPD_LICENSE = LGPLv2.1+
-- 
1.8.1.5
