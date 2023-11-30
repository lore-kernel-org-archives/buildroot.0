Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E8AC4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 23:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 882BB43674;
	Thu, 30 Nov 2023 23:11:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 882BB43674
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6obwmJmvZY0H; Thu, 30 Nov 2023 23:11:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 467E1436C3;
	Thu, 30 Nov 2023 23:11:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 467E1436C3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C53121BF2A1
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 23:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9016643668
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 23:09:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9016643668
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tzYkR7gO8D-g for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 23:09:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC92C4365B
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 23:09:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC92C4365B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D9B65876B0; Thu, 30 Nov 2023 23:09:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 30 Nov 2023 23:44:24 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 8b0ba84e38240aecbb08d32f2a3ee69c3a26ac6b
X-Git-Newrev: 1cdd0696d47867d88d0f87305cf9b7022ee44de8
X-Patchwork-Hint: ignore
Message-Id: <20231130230901.D9B65876B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/memcached: bump
 to version 1.6.21
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1cdd0696d47867d88d0f87305cf9b7022ee44de8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

- Send first patch upstream
- Drop second and third patches (already in version) and so drop
  autoreconf

https://github.com/memcached/memcached/wiki/ReleaseNotes1618
https://github.com/memcached/memcached/wiki/ReleaseNotes1619
https://github.com/memcached/memcached/wiki/ReleaseNotes1620
https://github.com/memcached/memcached/wiki/ReleaseNotes1621

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6ce55ab0ed3b7125cd11ecfe8c18aaf156b5f060)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  3 -
 .../memcached/0001-logger.c-initialize-rport.patch |  2 +-
 package/memcached/0002-check-for-sys-auxv.h.patch  | 50 -----------------
 .../0003-configure.ac-add-disable-werror.patch     | 65 ----------------------
 package/memcached/memcached.hash                   |  6 +-
 package/memcached/memcached.mk                     |  4 +-
 6 files changed, 5 insertions(+), 125 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 4a183a445c..a779518b63 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -901,9 +901,6 @@ package/matchbox/0001-defaulttheme.patch Upstream
 package/matchbox/0002-src-Fix-build-with-gcc-10.patch Upstream
 package/mediastreamer/0001-src-videofilters-nowebcam.c-fix-build-without-ffmpeg.patch Upstream
 package/mediastreamer/0002-Use-AV_INPUT_BUFFER_PADDING_SIZE-to-determine-paddin.patch Upstream
-package/memcached/0001-logger.c-initialize-rport.patch Upstream
-package/memcached/0002-check-for-sys-auxv.h.patch Upstream
-package/memcached/0003-configure.ac-add-disable-werror.patch Upstream
 package/memstat/0001-PATH_MAX.patch Upstream
 package/mender-connect/S43mender-connect Shellcheck
 package/menu-cache/0001-Support-gcc10-compilation.patch Upstream
diff --git a/package/memcached/0001-logger.c-initialize-rport.patch b/package/memcached/0001-logger.c-initialize-rport.patch
index 5fb13d5eee..002a689601 100644
--- a/package/memcached/0001-logger.c-initialize-rport.patch
+++ b/package/memcached/0001-logger.c-initialize-rport.patch
@@ -23,7 +23,7 @@ Fixes:
  - http://autobuild.buildroot.org/results/7a46ac38d10b1859034017e0294961daa8f48dd2
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not sent yet]
+Upstream: https://github.com/memcached/memcached/pull/1077
 ---
  logger.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
diff --git a/package/memcached/0002-check-for-sys-auxv.h.patch b/package/memcached/0002-check-for-sys-auxv.h.patch
deleted file mode 100644
index a7d0dfdd00..0000000000
--- a/package/memcached/0002-check-for-sys-auxv.h.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 58b6de2135c10b64918f25c48f69f144d08a9c0d Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 3 Jun 2022 19:10:15 +0200
-Subject: [PATCH] check for sys/auxv.h
-
-Check for sys/auxv.h to avoid the following uclibc build failure on
-aarch64:
-
-crc32c.c:277:10: fatal error: sys/auxv.h: No such file or directory
-  277 | #include <sys/auxv.h>
-      |          ^~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/08591fbf9677ff126492c50c15170c641bcab56a
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not sent yet]
----
- configure.ac | 1 +
- crc32c.c     | 2 +-
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 0985f07..3337fe7 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -516,6 +516,7 @@ AH_BOTTOM([#ifdef HAVE_INTTYPES_H
- #include <inttypes.h>
- #endif
- ])
-+AC_CHECK_HEADERS([sys/auxv.h])
- 
- dnl **********************************************************************
- dnl Figure out if this system has the stupid sasl_callback_ft
-diff --git a/crc32c.c b/crc32c.c
-index 26df879..05e61ff 100644
---- a/crc32c.c
-+++ b/crc32c.c
-@@ -273,7 +273,7 @@ void crc32c_init(void) {
- }
- 
- #elif defined(__aarch64__) && (defined(__linux__) || defined(__APPLE__))
--#if defined(__linux__)
-+#if defined(__linux__) && defined(HAVE_SYS_AUX_H)
- #include <sys/auxv.h>
- #elif defined(__APPLE__)
- #include <sys/sysctl.h>
--- 
-2.35.1
-
diff --git a/package/memcached/0003-configure.ac-add-disable-werror.patch b/package/memcached/0003-configure.ac-add-disable-werror.patch
deleted file mode 100644
index dab9b8835d..0000000000
--- a/package/memcached/0003-configure.ac-add-disable-werror.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 8497f7ed38146378a988bc22800b3a5eba38b0fd Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 13 Jun 2022 16:29:38 +0200
-Subject: [PATCH] configure.ac: add --disable-werror
-
-Allow the user to disable -Werror to avoid the following build failure:
-
-In file included from hash.c:7:
-xxhash.h:2667:5: error: #warning is a GCC extension [-Werror]
- 2667 | #   warning "XXH3 is highly inefficient without ARM or Thumb-2."
-      |     ^~~~~~~
-xxhash.h:2667:5: error: #warning "XXH3 is highly inefficient without ARM or Thumb-2." [-Werror=cpp]
-
-Fixes:
- - http://autobuild.buildroot.org/results/3124bae73c207f1a118e57e41e222ef464ccb297
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/memcached/memcached/pull/926]
----
- configure.ac | 11 +++++++++--
- 1 file changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 3337fe7..7683b8f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -114,6 +114,9 @@ AC_ARG_ENABLE(static,
- AC_ARG_ENABLE(unix_socket,
-   [AS_HELP_STRING([--disable-unix-socket], [Disable unix domain socket])])
- 
-+AC_ARG_ENABLE(werror,
-+  [AS_HELP_STRING([--disable-werror], [Disable -Werror])])
-+
- dnl **********************************************************************
- dnl DETECT_SASL_CB_GETCONF
- dnl
-@@ -783,6 +786,10 @@ AM_CONDITIONAL([BUILD_SPECIFICATIONS],
-                [test "x$enable_docs" != "xno" -a "x$XML2RFC" != "xno" -a "x$XSLTPROC" != "xno"])
- 
- 
-+if test "x$enable_werror" != "xno"; then
-+   CFLAGS="$CFLAGS -Werror"
-+fi
-+
- dnl Let the compiler be a bit more picky. Please note that you cannot
- dnl specify these flags to the compiler before AC_CHECK_FUNCS, because
- dnl the test program will generate a compilation warning and hence fail
-@@ -790,12 +797,12 @@ dnl to detect the function ;-)
- if test "$ICC" = "yes"
- then
-    dnl ICC trying to be gcc.
--   CFLAGS="$CFLAGS -diag-disable 187 -Wall -Werror"
-+   CFLAGS="$CFLAGS -diag-disable 187 -Wall"
-    AC_DEFINE([_GNU_SOURCE],[1],[make sure IOV_MAX is defined])
- elif test "$GCC" = "yes"
- then
-   GCC_VERSION=`$CC -dumpversion`
--  CFLAGS="$CFLAGS -Wall -Werror -pedantic -Wmissing-prototypes -Wmissing-declarations -Wredundant-decls"
-+  CFLAGS="$CFLAGS -Wall -pedantic -Wmissing-prototypes -Wmissing-declarations -Wredundant-decls"
-   if test "x$enable_asan" = "xyes"; then
-     CFLAGS="$CFLAGS -fsanitize=address"
-   fi
--- 
-2.35.1
-
diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index 78875dde66..c223a14bac 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,6 +1,6 @@
-# From http://www.memcached.org/files/memcached-1.6.17.tar.gz.sha1
-sha1  e25639473e15f1bd9516b915fb7e03ab8209030f  memcached-1.6.17.tar.gz
+# From http://www.memcached.org/files/memcached-1.6.21.tar.gz.sha1
+sha1  6d899680b4ba4b76b6c92120143cf87630ee984a  memcached-1.6.21.tar.gz
 
 # Locally computed
-sha256  2055e373613d8fc21529aff9f0adce3e23b9ce01ba0478d30e7941d9f2bd1224  memcached-1.6.17.tar.gz
+sha256  c788980efc417dd5d93c442b1c8b8769fb2018896c29de3887d22a2f143da2ee  memcached-1.6.21.tar.gz
 sha256  bc887c4ad8051fe690ace9528fe37a2e0bb362e6d963331d82e845ca9b585a0c  COPYING
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index 7183da6c14..2ebc672d1c 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.6.17
+MEMCACHED_VERSION = 1.6.21
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
@@ -13,8 +13,6 @@ MEMCACHED_LICENSE = BSD-3-Clause
 MEMCACHED_LICENSE_FILES = COPYING
 MEMCACHED_CPE_ID_VENDOR = memcached
 MEMCACHED_SELINUX_MODULES = memcached
-# We're patching configure.ac
-MEMCACHED_AUTORECONF = YES
 
 ifeq ($(BR2_ENDIAN),"BIG")
 MEMCACHED_CONF_ENV += ac_cv_c_endian=big
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
