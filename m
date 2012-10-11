From: Alexander Khryukin <alexander@mezon.ru>
Date: Thu, 11 Oct 2012 15:20:02 +0400
Subject: [Buildroot] libnspr version update 4.9.2
Message-ID: <CABtOAfwnfThyLOg47yQzdnSp9avrmXQGWiS+dhacB5btdovsbw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexander Khryukin <alexander@mezon.ru>
---

diff --git a/package/libnspr/libnspr-fix-flags.patch
b/package/libnspr/libnspr-fix-flags.patch
deleted file mode 100644
index d5ad4fa..0000000
--- a/package/libnspr/libnspr-fix-flags.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-Fix build issues on ARM with certain toolchains
-
-Some gcc/binutils combinations do not like having a space between
-"-Wa," and the following assembler option, so we simply remove those
-spaces.
-
-However, fixing the configure.in is not sufficient, because libnspr
-absolutely requires the prehistoric autoconf 2.13 to re-generate the
-configure script. So, since the patch to the configure script is not
-horrible, we also patch this script directly.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/mozilla/nsprpub/configure.in
-===================================================================
---- a/mozilla/nsprpub/configure.in
-+++ b/mozilla/nsprpub/configure.in
-@@ -925,8 +925,8 @@
-   case "$target_cpu" in
-     arm*)
-       if test "$GNU_CC"; then
--        CFLAGS="$CFLAGS -march=armv7-a -mthumb -Wa, -march=armv7-a
-Wa, -mthumb"
--        CXXFLAGS="$CXXFLAGS -march=armv7-a -mthumb -Wa,
-march=armv7-a -Wa, -mthumb"
-+        CFLAGS="$CFLAGS -march=armv7-a -mthumb -Wa,-march=armv7-a -Wa,-mthumb"
-+        CXXFLAGS="$CXXFLAGS -march=armv7-a -mthumb
-Wa,-march=armv7-a -Wa,-mthumb"
-         ASFLAGS="$ASFLAGS -march=armv7-a -mthumb"
-       else
-         AC_MSG_ERROR([--enable-thumb2 is not supported for non-GNU
toolchains])
-@@ -940,8 +940,8 @@
-   case "$target_cpu" in
-     arm*)
-       if test "$GNU_CC"; then
--       CFLAGS="$CFLAGS -march=armv5te -mthumb-interwork -Wa,
-march=armv5te -Wa, -mthumb-interwork"
--        CXXFLAGS="$CXXFLAGS -march=armv5te -mthumb-interwork -Wa,
-march=armv5te -Wa, -mthumb-interwork"
-+       CFLAGS="$CFLAGS -march=armv5te -mthumb-interwork
-Wa,-march=armv5te -Wa,-mthumb-interwork"
-+        CXXFLAGS="$CXXFLAGS -march=armv5te -mthumb-interwork
-Wa,-march=armv5te -Wa,-mthumb-interwork"
-         ASFLAGS="$ASFLAGS -march=armv5te -mthumb-interwork"
-       fi
-       ;;
-Index: b/mozilla/nsprpub/configure
-===================================================================
---- a/mozilla/nsprpub/configure
-+++ b/mozilla/nsprpub/configure
-@@ -3101,8 +3101,8 @@
-   case "$target_cpu" in
-     arm*)
-       if test "$GNU_CC"; then
--        CFLAGS="$CFLAGS -march=armv7-a -mthumb -Wa, -march=armv7-a
-Wa, -mthumb"
--        CXXFLAGS="$CXXFLAGS -march=armv7-a -mthumb -Wa,
-march=armv7-a -Wa, -mthumb"
-+        CFLAGS="$CFLAGS -march=armv7-a -mthumb -Wa,-march=armv7-a -Wa,-mthumb"
-+        CXXFLAGS="$CXXFLAGS -march=armv7-a -mthumb
-Wa,-march=armv7-a -Wa,-mthumb"
-         ASFLAGS="$ASFLAGS -march=armv7-a -mthumb"
-       else
-         { echo "configure: error: --enable-thumb2 is not supported
for non-GNU toolchains" 1>&2; exit 1; }
-@@ -3116,8 +3116,8 @@
-   case "$target_cpu" in
-     arm*)
-       if test "$GNU_CC"; then
--       CFLAGS="$CFLAGS -march=armv5te -mthumb-interwork -Wa,
-march=armv5te -Wa, -mthumb-interwork"
--        CXXFLAGS="$CXXFLAGS -march=armv5te -mthumb-interwork -Wa,
-march=armv5te -Wa, -mthumb-interwork"
-+       CFLAGS="$CFLAGS -march=armv5te -mthumb-interwork
-Wa,-march=armv5te -Wa,-mthumb-interwork"
-+        CXXFLAGS="$CXXFLAGS -march=armv5te -mthumb-interwork
-Wa,-march=armv5te -Wa,-mthumb-interwork"
-         ASFLAGS="$ASFLAGS -march=armv5te -mthumb-interwork"
-       fi
-       ;;
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 736984d..4308ac3 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -3,7 +3,7 @@
 # libnspr
 #
 #############################################################
-LIBNSPR_VERSION = 4.8.7
+LIBNSPR_VERSION = 4.9.2
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE =
https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src/
 LIBNSPR_SUBDIR = mozilla/nsprpub




http://pastie.org/5034569
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121011/b210f1b9/attachment.html>
