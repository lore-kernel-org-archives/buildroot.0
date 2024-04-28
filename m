Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AEA6C4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 15:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBBFD404A3;
	Sun, 28 Apr 2024 15:10:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gce_Xf-4PDq0; Sun, 28 Apr 2024 15:10:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59EB640640
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59EB640640;
	Sun, 28 Apr 2024 15:10:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CA4911BF8B4
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 15:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5C9381DAB
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 15:09:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dI_jx1jL_Z1Y for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 15:09:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A63D281C21
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A63D281C21
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 15:09:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 92E548618B; Sun, 28 Apr 2024 15:09:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 28 Apr 2024 17:09:15 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: ee27dfff40c4e9c6a084c1f64e7604a02ff3ff1c
X-Git-Newrev: e14d5578d603cfbc776c94fbbf8f318d307c52ac
X-Patchwork-Hint: ignore
Message-Id: <20240428150947.92E548618B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libcurl: security
 bump to 8.7.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=e14d5578d603cfbc776c94fbbf8f318d307c52ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Drop patch that is included in this release. Drop autoreconf that was
introduced for this patch.

Fixes the following security issues:

* CVE-2024-2004
* CVE-2024-2379
* CVE-2024-2398
* CVE-2024-2466

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit fbeec56312e1d2a5ec7c2803c0d2aa3f0e673c5f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-configure.ac-find-libpsl-with-pkg-config.patch | 109 ---------------------
 package/libcurl/libcurl.hash                       |   4 +-
 package/libcurl/libcurl.mk                         |   4 +-
 3 files changed, 3 insertions(+), 114 deletions(-)

diff --git a/package/libcurl/0001-configure.ac-find-libpsl-with-pkg-config.patch b/package/libcurl/0001-configure.ac-find-libpsl-with-pkg-config.patch
deleted file mode 100644
index 46df1e36a2..0000000000
--- a/package/libcurl/0001-configure.ac-find-libpsl-with-pkg-config.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From 9b3f67e267d1fa8d7867655d133bdbf8830a0ab3 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 15 Feb 2024 20:59:25 +0100
-Subject: [PATCH] configure.ac: find libpsl with pkg-config
-
-Find libpsl with pkg-config to avoid static build failures.
-
-Ref: http://autobuild.buildroot.org/results/1fb15e1a99472c403d0d3b1a688902f32e78d002
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Closes #12947
-
-Upstream: https://github.com/curl/curl/commit/9b3f67e267d1fa8d7867655d133bdbf8830a0ab3
----
- configure.ac | 79 ++++++++++++++++++++++++++++++++++++++++++++--------
- docs/TODO    |  7 -----
- 2 files changed, 67 insertions(+), 19 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index cd0e2d07d8d164..09d5364f4de575 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2075,19 +2075,74 @@ dnl **********************************************************************
- dnl Check for libpsl
- dnl **********************************************************************
- 
--AC_ARG_WITH(libpsl,
--           AS_HELP_STRING([--without-libpsl],
--           [disable support for libpsl]),
--           with_libpsl=$withval,
--           with_libpsl=yes)
--curl_psl_msg="no      (libpsl disabled)"
--if test $with_libpsl != "no"; then
--  AC_SEARCH_LIBS(psl_builtin, psl,
--    [curl_psl_msg="enabled";
--     AC_DEFINE([USE_LIBPSL], [1], [PSL support enabled])
--     ],
--    [AC_MSG_ERROR([libpsl was not found]) ]
-+dnl Default to compiler & linker defaults for LIBPSL files & libraries.
-+OPT_LIBPSL=off
-+AC_ARG_WITH(libpsl,dnl
-+AS_HELP_STRING([--with-libpsl=PATH],[Where to look for libpsl, PATH points to the LIBPSL installation; when possible, set the PKG_CONFIG_PATH environment variable instead of using this option])
-+AS_HELP_STRING([--without-libpsl], [disable LIBPSL]),
-+  OPT_LIBPSL=$withval)
-+
-+if test X"$OPT_LIBPSL" != Xno; then
-+  dnl backup the pre-libpsl variables
-+  CLEANLDFLAGS="$LDFLAGS"
-+  CLEANCPPFLAGS="$CPPFLAGS"
-+  CLEANLIBS="$LIBS"
-+
-+  case "$OPT_LIBPSL" in
-+  yes)
-+    dnl --with-libpsl (without path) used
-+    CURL_CHECK_PKGCONFIG(libpsl)
-+
-+    if test "$PKGCONFIG" != "no" ; then
-+      LIB_PSL=`$PKGCONFIG --libs-only-l libpsl`
-+      LD_PSL=`$PKGCONFIG --libs-only-L libpsl`
-+      CPP_PSL=`$PKGCONFIG --cflags-only-I libpsl`
-+    else
-+      dnl no libpsl pkg-config found
-+      LIB_PSL="-lpsl"
-+    fi
-+
-+    ;;
-+  off)
-+    dnl no --with-libpsl option given, just check default places
-+    LIB_PSL="-lpsl"
-+    ;;
-+  *)
-+    dnl use the given --with-libpsl spot
-+    LIB_PSL="-lpsl"
-+    PREFIX_PSL=$OPT_LIBPSL
-+    ;;
-+  esac
-+
-+  dnl if given with a prefix, we set -L and -I based on that
-+  if test -n "$PREFIX_PSL"; then
-+    LD_PSL=-L${PREFIX_PSL}/lib$libsuff
-+    CPP_PSL=-I${PREFIX_PSL}/include
-+  fi
-+
-+  LDFLAGS="$LDFLAGS $LD_PSL"
-+  CPPFLAGS="$CPPFLAGS $CPP_PSL"
-+  LIBS="$LIB_PSL $LIBS"
-+
-+  AC_CHECK_LIB(psl, psl_builtin,
-+    [
-+     AC_CHECK_HEADERS(libpsl.h,
-+        curl_psl_msg="enabled"
-+        LIBPSL_ENABLED=1
-+        AC_DEFINE(USE_LIBPSL, 1, [if libpsl is in use])
-+        AC_SUBST(USE_LIBPSL, [1])
-+     )
-+    ],
-+      dnl not found, revert back to clean variables
-+      LDFLAGS=$CLEANLDFLAGS
-+      CPPFLAGS=$CLEANCPPFLAGS
-+      LIBS=$CLEANLIBS
-   )
-+
-+  if test X"$OPT_LIBPSL" != Xoff &&
-+     test "$LIBPSL_ENABLED" != "1"; then
-+    AC_MSG_ERROR([libpsl libs and/or directories were not found where specified!])
-+  fi
- fi
- AM_CONDITIONAL([USE_LIBPSL], [test "$curl_psl_msg" = "enabled"])
- 
diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 1f3dce0fd5..7fcad973c3 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-8.6.0.tar.xz.asc
+# https://curl.se/download/curl-8.7.1.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  3ccd55d91af9516539df80625f818c734dc6f2ecf9bada33c76765e99121db15  curl-8.6.0.tar.xz
+sha256  6fea2aac6a4610fbd0400afb0bcddbe7258a64c63f1f68e5855ebc0c659710cd  curl-8.7.1.tar.xz
 sha256  adb1fc06547fd136244179809f7b7c2d2ae6c4534f160aa513af9b6a12866a32  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 4281cfabb1..99320c1315 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.6.0
+LIBCURL_VERSION = 8.7.1
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
@@ -14,8 +14,6 @@ LIBCURL_LICENSE = curl
 LIBCURL_LICENSE_FILES = COPYING
 LIBCURL_CPE_ID_VENDOR = haxx
 LIBCURL_INSTALL_STAGING = YES
-# 0001-configure.ac-find-libpsl-with-pkg-config.patch
-LIBCURL_AUTORECONF = YES
 
 # We disable NTLM delegation to winbinds ntlm_auth ('--disable-ntlm-wb')
 # support because it uses fork(), which doesn't work on non-MMU platforms.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
