From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Nov 2018 13:55:13 +0100
Subject: [Buildroot] [git commit] libgcrypt: bump to version 1.8.4
Message-ID: <20181101131712.2BB7E83C22@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba2705fa4a899680f1e037a01d7950ed2cd61221
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch 0001. We patch the configure script directly in patch 0002,
and we don't autoreconf. So this patch has no effect (never had).

Rename patch 0002. The next version bump should drop this patch as well.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-ac_cv_sys_symbol_underscore.patch         | 27 ----------------------
 ...02-reconfigure.patch => 0001-reconfigure.patch} |  0
 package/libgcrypt/libgcrypt.hash                   |  9 ++++----
 package/libgcrypt/libgcrypt.mk                     |  2 +-
 4 files changed, 6 insertions(+), 32 deletions(-)

diff --git a/package/libgcrypt/0001-ac_cv_sys_symbol_underscore.patch b/package/libgcrypt/0001-ac_cv_sys_symbol_underscore.patch
deleted file mode 100644
index 95db0fbba8..0000000000
--- a/package/libgcrypt/0001-ac_cv_sys_symbol_underscore.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-diff --git a/acinclude.m4 b/acinclude.m4
-index a7bc0fa..1a5bffc 100644
---- a/acinclude.m4
-+++ b/acinclude.m4
-@@ -76,13 +76,14 @@ case "${host}" in
-     i386-emx-os2 | i[3456]86-pc-os2*emx | i386-pc-msdosdjgpp)
-         ac_cv_sys_symbol_underscore=yes
-         ;;
--    *)
--      if test "$cross_compiling" = yes; then
--        if test "x$ac_cv_sys_symbol_underscore" = x ; then
--           ac_cv_sys_symbol_underscore=yes
--        fi
--      else
--         tmp_do_check="yes"
-+    *) if test -z "$ac_cv_sys_symbol_underscore"; then
-+         if test "$cross_compiling" = yes; then
-+           if test "x$ac_cv_sys_symbol_underscore" = x ; then
-+              ac_cv_sys_symbol_underscore=yes
-+           fi
-+         else
-+            tmp_do_check="yes"
-+         fi
-       fi
-        ;;
- esac
- 
diff --git a/package/libgcrypt/0002-reconfigure.patch b/package/libgcrypt/0001-reconfigure.patch
similarity index 100%
rename from package/libgcrypt/0002-reconfigure.patch
rename to package/libgcrypt/0001-reconfigure.patch
diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index dce6522959..000f26dd2d 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,6 +1,7 @@
-# From https://lists.gnupg.org/pipermail/gnupg-announce/2018q2/000426.html
-sha1 13bd2ce69e59ab538e959911dfae80ea309636e3  libgcrypt-1.8.3.tar.bz2
+# From https://lists.gnupg.org/pipermail/gnupg-announce/2018q4/000431.html
+sha1 4a8ef9db6922f3a31992aca5640b4198a69b58fc  libgcrypt-1.8.4.tar.bz2
 # Locally calculated after checking signature
-# https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.8.3.tar.bz2.sig
-sha256  66ec90be036747602f2b48f98312361a9180c97c68a690a5f376fa0f67d0af7c  libgcrypt-1.8.3.tar.bz2
+# https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.8.4.tar.bz2.sig
+# using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
+sha256  f638143a0672628fde0cad745e9b14deb85dffb175709cacc1f4fe24b93f2227  libgcrypt-1.8.4.tar.bz2
 sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LIB
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index f25944da64..452cf17ce1 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.8.3
+LIBGCRYPT_VERSION = 1.8.4
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPL-2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
