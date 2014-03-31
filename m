From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 31 Mar 2014 22:06:14 +0200
Subject: [Buildroot] [PATCH 01/16] pixman: Version bump 0.32.4
In-Reply-To: <1396296389-28821-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396296389-28821-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396296389-28821-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- removed pixman-01-loongson-cflags.patch, applied upstream

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/pixman/pixman-01-loongson-cflags.patch |   38 ------------------------
 package/pixman/pixman.mk                       |    2 +-
 2 files changed, 1 insertion(+), 39 deletions(-)
 delete mode 100644 package/pixman/pixman-01-loongson-cflags.patch

diff --git a/package/pixman/pixman-01-loongson-cflags.patch b/package/pixman/pixman-01-loongson-cflags.patch
deleted file mode 100644
index fc53be2..0000000
--- a/package/pixman/pixman-01-loongson-cflags.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-configure.ac: Verify that the Loongson MMI code can link
-
-The Loongson MMI code modifies -march and as a result it breaks linking
-when the rest of the code is built with a different -match/-mtune.
-This patch fixes the problem by trying to link the code instead of just
-compiling it. This patch is already committed upstream.
-
-Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
-
-From d77d75cc6e5de14d027d22b70389a4d0c71048b9 Mon Sep 17 00:00:00 2001
-From: Markos Chandras <markos.chandras@imgtec.com>
-Date: Wed, 15 May 2013 16:51:20 +0000
-Subject: Use AC_LINK_IFELSE to check if the Loongson MMI code can link
-
-The Loongson code is compiled with -march=loongson2f to enable the MMI
-instructions, but binutils refuses to link object code compiled with
-different -march settings, leading to link failures later in the
-compile. This avoids that problem by checking if we can link code
-compiled for Loongson.
-
-Reviewed-by: Matt Turner <mattst88@gmail.com>
-Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
----
-diff --git a/configure.ac b/configure.ac
-index c43a0d2..221179f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -279,7 +279,7 @@ AC_MSG_CHECKING(whether to use Loongson MMI assembler)
- 
- xserver_save_CFLAGS=$CFLAGS
- CFLAGS=" $LS_CFLAGS $CFLAGS -I$srcdir"
--AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
-+AC_LINK_IFELSE([AC_LANG_SOURCE([[
- #ifndef __mips_loongson_vector_rev
- #error "Loongson Multimedia Instructions are only available on Loongson"
- #endif
---
-cgit v0.9.0.2-2-gbebe
diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 4f70ce5..91f3332 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIXMAN_VERSION = 0.30.0
+PIXMAN_VERSION = 0.32.4
 PIXMAN_SITE = http://xorg.freedesktop.org/releases/individual/lib
 PIXMAN_LICENSE = MIT
 PIXMAN_LICENSE_FILES = COPYING
-- 
1.7.10.4
