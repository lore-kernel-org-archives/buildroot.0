From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 25 May 2014 22:42:09 -0300
Subject: [Buildroot] [PATCH 3/3] libmicrohttpd: bump to version 0.9.36
In-Reply-To: <1401068529-4738-1-git-send-email-gustavo@zacarias.com.ar>
References: <1401068529-4738-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1401068529-4738-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../libmicrohttpd/libmicrohttpd-0001-cross.patch   | 28 ----------------------
 package/libmicrohttpd/libmicrohttpd.mk             |  3 +--
 2 files changed, 1 insertion(+), 30 deletions(-)
 delete mode 100644 package/libmicrohttpd/libmicrohttpd-0001-cross.patch

diff --git a/package/libmicrohttpd/libmicrohttpd-0001-cross.patch b/package/libmicrohttpd/libmicrohttpd-0001-cross.patch
deleted file mode 100644
index 5980b9c..0000000
--- a/package/libmicrohttpd/libmicrohttpd-0001-cross.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Fix cross-compilation
-
-Patch sent upstream: http://article.gmane.org/gmane.comp.gnu.libmicrohttpd/1193
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr libmicrohttpd-0.9.35.org/configure.ac libmicrohttpd-0.9.35/configure.ac
---- libmicrohttpd-0.9.35.org/configure.ac	2014-05-02 20:38:40.000000000 +0200
-+++ libmicrohttpd-0.9.35/configure.ac	2014-05-04 09:17:00.000000000 +0200
-@@ -639,8 +639,7 @@
-         SAVE_CPPFLAGS="$CPPFLAGS"
-         LDFLAGS="-L$with_gnutls/lib $LDFLAGS"
-         CPPFLAGS="-I$with_gnutls/include $CPPFLAGS"
--        AC_CHECK_FILE([$with_gnutls/include/gnutls/gnutls.h],
--          [AC_CHECK_HEADERS([gnutls/gnutls.h],
-+          AC_CHECK_HEADERS([gnutls/gnutls.h],
-             [AC_CHECK_LIB([gnutls], [gnutls_priority_set],
-               [
-                 GNUTLS_CPPFLAGS="-I$with_gnutls/include"
-@@ -648,7 +647,7 @@
-                 GNUTLS_LIBS="-lgnutls"
-                 AC_CHECK_LIB([gnutls], [gnutls_load_file], [AC_CHECK_LIB([gnutls], [gnutls_privkey_import_x509_raw], [have_gnutls_sni=yes])])
-                 have_gnutls=yes
--              ])])])
-+              ])])
-         AS_IF([test "x$have_gnutls" != "xyes"], [AC_MSG_ERROR([can't find usable libgnutls at specified prefix $with_gnutls])])
-         LDFLAGS="$SAVE_LDFLAGS"
-         CPPFLAGS="$SAVE_CPPFLAGS"
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index edf4f9a..6e3b756 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 0.9.35
+LIBMICROHTTPD_VERSION = 0.9.36
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_INSTALL_STAGING = YES
-LIBMICROHTTPD_AUTORECONF = YES
 LIBMICROHTTPD_CONF_OPT = --disable-curl --disable-spdy
 
 ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_SSL),y)
-- 
1.8.5.5
