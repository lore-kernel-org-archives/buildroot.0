From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 12 Oct 2016 22:13:56 -0300
Subject: [Buildroot] [PATCH 5/8] poppler: bump to version 0.48.0
In-Reply-To: <1476321239-13894-1-git-send-email-gustavo@zacarias.com.ar>
References: <1476321239-13894-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1476321239-13894-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patch.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...invalid-shell-comparaison-in-libtiff-test.patch | 23 ----------------------
 package/poppler/poppler.hash                       |  2 +-
 package/poppler/poppler.mk                         |  2 +-
 3 files changed, 2 insertions(+), 25 deletions(-)
 delete mode 100644 package/poppler/0001-Fix-invalid-shell-comparaison-in-libtiff-test.patch

diff --git a/package/poppler/0001-Fix-invalid-shell-comparaison-in-libtiff-test.patch b/package/poppler/0001-Fix-invalid-shell-comparaison-in-libtiff-test.patch
deleted file mode 100644
index f40bee1..0000000
--- a/package/poppler/0001-Fix-invalid-shell-comparaison-in-libtiff-test.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Fix syntax issue in configure script
-
-The change is not done in configure.ac, because the package doesn't
-autoreconf properly.
-
-Patch on configure.ac submitted upstream at
-https://bugs.freedesktop.org/show_bug.cgi?id=90292.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/configure
-===================================================================
---- a/configure
-+++ b/configure
-@@ -19738,7 +19738,7 @@
- CXXFLAGS="$CXXFLAGS $LIBTIFF_CFLAGS"
- LIBS="$LIBS $LIBTIFF_LIBS"
- if test x$enable_libtiff = xyes; then
--  if test x"$LIBTIFF_LIBS" != ; then
-+  if test x"$LIBTIFF_LIBS" != x; then
-     ac_fn_cxx_check_func "$LINENO" "TIFFOpen" "ac_cv_func_TIFFOpen"
- if test "x$ac_cv_func_TIFFOpen" = xyes; then :
- 
diff --git a/package/poppler/poppler.hash b/package/poppler/poppler.hash
index c4c7f66..533178f 100644
--- a/package/poppler/poppler.hash
+++ b/package/poppler/poppler.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	4963e31ba5e17530a87b16588e22928bc044e8d28d02303dded981bff6725b98	poppler-0.32.0.tar.xz
+sha256	85a003968074c85d8e13bf320ec47cef647b496b56dcff4c790b34e5482fef93	poppler-0.48.0.tar.xz
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 172c428..202eac2 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POPPLER_VERSION = 0.32.0
+POPPLER_VERSION = 0.48.0
 POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
 POPPLER_SITE = http://poppler.freedesktop.org
 POPPLER_DEPENDENCIES = fontconfig host-pkgconf
-- 
2.7.3
