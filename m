From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 May 2014 11:49:42 +0200
Subject: [Buildroot] [git commit] libmicrohttpd: bump to version 0.9.36
Message-ID: <20140601083245.DB6D89CE5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d5dbe18560f5d5f337ecc0483d595538e0b8df04
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../libmicrohttpd/libmicrohttpd-0001-cross.patch   |   28 --------------------
 package/libmicrohttpd/libmicrohttpd.mk             |    3 +-
 2 files changed, 1 insertions(+), 30 deletions(-)

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
