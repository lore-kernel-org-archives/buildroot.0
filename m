From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 12 Jun 2015 16:22:38 -0300
Subject: [Buildroot] [PATCH] php: security bump to version 5.6.10
Message-ID: <1434136958-26903-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2015-3414, CVE-2015-3415, CVE-2015-3416 (via bundled sqlite
upgrade).
CVE-2015-2325, CVE-2015-2326 (via bundled pcre upgrade).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/php/0002-no-iconv-search.patch | 22 +++++++++++-----------
 package/php/php.hash                   |  2 +-
 package/php/php.mk                     |  2 +-
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/package/php/0002-no-iconv-search.patch b/package/php/0002-no-iconv-search.patch
index 3223953..32aa7f5 100644
--- a/package/php/0002-no-iconv-search.patch
+++ b/package/php/0002-no-iconv-search.patch
@@ -7,11 +7,12 @@ PHP_ICONV_H_PATH which, again, uses test and absolute paths.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 [Gustavo: convert to nice m4 instead of patching configure]
+[Gustavo: update for 5.6.10]
 
-diff -Nura php-5.6.8.orig/acinclude.m4 php-5.6.8/acinclude.m4
---- php-5.6.8.orig/acinclude.m4	2015-05-18 20:06:48.557099001 +0200
-+++ php-5.6.8/acinclude.m4	2015-05-18 20:07:33.177099001 +0200
-@@ -2470,7 +2470,7 @@
+diff -Nura php-5.6.10.orig/acinclude.m4 php-5.6.10/acinclude.m4
+--- php-5.6.10.orig/acinclude.m4	2015-06-12 16:09:06.274355813 -0300
++++ php-5.6.10/acinclude.m4	2015-06-12 16:10:10.884544865 -0300
+@@ -2474,7 +2474,7 @@
    dnl
    if test "$found_iconv" = "no"; then
  
@@ -20,10 +21,10 @@ diff -Nura php-5.6.8.orig/acinclude.m4 php-5.6.8/acinclude.m4
        if test -r $i/include/giconv.h; then
          AC_DEFINE(HAVE_GICONV_H, 1, [ ])
          ICONV_DIR=$i
-diff -Nura php-5.6.7.orig/ext/iconv/config.m4 php-5.6.7/ext/iconv/config.m4
---- php-5.6.7.orig/ext/iconv/config.m4	2015-04-08 11:08:11.184847544 -0300
-+++ php-5.6.7/ext/iconv/config.m4	2015-04-08 11:39:07.823608030 -0300
-@@ -14,28 +14,8 @@
+diff -Nura php-5.6.10.orig/ext/iconv/config.m4 php-5.6.10/ext/iconv/config.m4
+--- php-5.6.10.orig/ext/iconv/config.m4	2015-06-12 16:09:07.792407246 -0300
++++ php-5.6.10/ext/iconv/config.m4	2015-06-12 16:11:07.752471600 -0300
+@@ -14,28 +14,6 @@
    ])
  
    if test "$iconv_avail" != "no"; then
@@ -40,7 +41,7 @@ diff -Nura php-5.6.7.orig/ext/iconv/config.m4 php-5.6.7/ext/iconv/config.m4
 -    else
 -      PHP_ICONV_PREFIX="$ICONV_DIR"
 -    fi
- 
+-
 -    CFLAGS="-I$PHP_ICONV_PREFIX/include $CFLAGS"
 -    LDFLAGS="-L$PHP_ICONV_PREFIX/$PHP_LIBDIR $LDFLAGS"
 -
@@ -48,8 +49,7 @@ diff -Nura php-5.6.7.orig/ext/iconv/config.m4 php-5.6.7/ext/iconv/config.m4
 -      PHP_ICONV_H_PATH="$PHP_ICONV_PREFIX/include/giconv.h"
 -    else
 -      PHP_ICONV_H_PATH="$PHP_ICONV_PREFIX/include/iconv.h"
--    fi 
-+    PHP_ICONV_H_PATH="iconv.h"
+-	fi
  
      AC_MSG_CHECKING([if iconv is glibc's])
      AC_TRY_LINK([#include <gnu/libc-version.h>],[gnu_get_libc_version();],
diff --git a/package/php/php.hash b/package/php/php.hash
index fe938f5..4abf45e 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-sha256	1fac497b596f5e4e87d87a7ca90f8725e39a8ca3f9d7adb500fa83c4bb70a73f	php-5.6.9.tar.xz
+sha256	1af720c955b0a57aa47606e928616e84c78868aff2a5f269c70601a77d6da8c1	php-5.6.10.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index c9bcfe3..afac950 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PHP_VERSION_MAJOR = 5.6
-PHP_VERSION = $(PHP_VERSION_MAJOR).9
+PHP_VERSION = $(PHP_VERSION_MAJOR).10
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.3.6
