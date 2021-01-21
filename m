From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Jan 2021 23:03:39 +0100
Subject: [Buildroot] [git commit] package/libgcrypt: bump to version 1.9.0
Message-ID: <20210121214424.24FDC81213@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=90a82161b6c065e2a7ffcd33d50d22f57e6d5639
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop first patch (already in version)

https://dev.gnupg.org/T4294

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-default-to-underscore-yes-for-cross-buil.patch | 48 ----------------------
 ...figure.ac-add-an-option-to-disable-tests.patch} |  0
 package/libgcrypt/libgcrypt.hash                   |  6 +--
 package/libgcrypt/libgcrypt.mk                     |  5 +--
 4 files changed, 5 insertions(+), 54 deletions(-)

diff --git a/package/libgcrypt/0001-build-Don-t-default-to-underscore-yes-for-cross-buil.patch b/package/libgcrypt/0001-build-Don-t-default-to-underscore-yes-for-cross-buil.patch
deleted file mode 100644
index 032cb7c84c..0000000000
--- a/package/libgcrypt/0001-build-Don-t-default-to-underscore-yes-for-cross-buil.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 7fec3ac22efb86fce90a9edc5696e16ee88a65c7 Mon Sep 17 00:00:00 2001
-From: NIIBE Yutaka <gniibe@fsij.org>
-Date: Wed, 24 Oct 2018 14:29:45 +0900
-Subject: [PATCH] build: Don't default to underscore=yes for cross-build.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-* acinclude.m4: Don't set ac_cv_sys_symbol_underscore
-for cross build.
-
---
-
-It made sense in the past when cross compile were basically for a.out
-system, but nowadays, it's better not to assume that.
-
-Fetched from: 0f4545b441b6fbdd6e9c4e95f5f2a367483e78ad
-
-Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
----
- acinclude.m4 | 8 ++------
- 1 file changed, 2 insertions(+), 6 deletions(-)
-
-diff --git a/acinclude.m4 b/acinclude.m4
-index fc208c53..6f7789d0 100644
---- a/acinclude.m4
-+++ b/acinclude.m4
-@@ -111,14 +111,10 @@ case "${host}" in
-         ac_cv_sys_symbol_underscore=yes
-         ;;
-     *)
--      if test "$cross_compiling" = yes; then
--        if test "x$ac_cv_sys_symbol_underscore" = x ; then
--           ac_cv_sys_symbol_underscore=yes
--        fi
--      else
-+      if test "$cross_compiling" != yes; then
-          tmp_do_check="yes"
-       fi
--       ;;
-+      ;;
- esac
- if test "$tmp_do_check" = "yes"; then
-   AC_REQUIRE([AC_LIBTOOL_SYS_GLOBAL_SYMBOL_PIPE])
--- 
-2.22.0
-
diff --git a/package/libgcrypt/0002-configure.ac-add-an-option-to-disable-tests.patch b/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch
similarity index 100%
rename from package/libgcrypt/0002-configure.ac-add-an-option-to-disable-tests.patch
rename to package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch
diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index fd9169ca8b..55d6c29695 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,7 +1,7 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  ea79a279b27bf25cb1564f96693128f8fc9f41d6  libgcrypt-1.8.7.tar.bz2
+sha1  459383a8b6200673cfc31f7b265c4961c0850031  libgcrypt-1.9.0.tar.bz2
 # Locally calculated after checking signature
-# https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.8.7.tar.bz2.sig
+# https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.9.0.tar.bz2.sig
 # using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
-sha256  03b70f028299561b7034b8966d7dd77ef16ed139c43440925fe8782561974748  libgcrypt-1.8.7.tar.bz2
+sha256  4d9ccaa5f99db59ebcb64d73f62825b05ce8a6b7f86d19178559ef84de1381cb  libgcrypt-1.9.0.tar.bz2
 sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LIB
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 170c4946b0..a2dcdb5fee 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.8.7
+LIBGCRYPT_VERSION = 1.9.0
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPL-2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
@@ -14,8 +14,7 @@ LIBGCRYPT_DEPENDENCIES = libgpg-error
 LIBGCRYPT_CONFIG_SCRIPTS = libgcrypt-config
 LIBGCRYPT_CPE_ID_VENDOR = gnupg
 
-# Patching acinclude.m4 in 0001
-# Patching configure.ac and Makefile.am in 0002
+# Patching configure.ac and Makefile.am in 0001
 LIBGCRYPT_AUTORECONF = YES
 LIBGCRYPT_CONF_OPTS = \
 	--disable-tests \
