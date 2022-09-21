Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F177DECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 19:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F9EA408D5;
	Wed, 21 Sep 2022 19:33:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F9EA408D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Ro8YAklqDTx; Wed, 21 Sep 2022 19:33:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80863416C9;
	Wed, 21 Sep 2022 19:33:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80863416C9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C1D8D1BF3F0
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 19:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9F0661058
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 19:31:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9F0661058
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vtCXDaazVOxS for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 19:31:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CE706104B
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 19:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CE706104B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B49A85D04; Wed, 21 Sep 2022 19:31:19 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 21 Sep 2022 21:24:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8317065ecb4979fe43c466f7e5a7f6dc281bd10d
X-Git-Newrev: 895bfba93f6e5535f2132aeea144d2cd87ebc71b
X-Patchwork-Hint: ignore
Message-Id: <20220921193119.2B49A85D04@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/popt: bump to version 1.19
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

commit: https://git.buildroot.net/buildroot/commit/?id=895bfba93f6e5535f2132aeea144d2cd87ebc71b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patches (already in version) and so autoreconf
- Update hash of COPYING (license adjusted to use the original, straight
  MIT variant:
  https://github.com/rpm-software-management/popt/commit/dcec86df3cfc96d3dd3a3e9f7f1086b768d2d88f)

https://github.com/rpm-software-management/popt/compare/popt-1.18-release...popt-1.19-release

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/popt/0001-add-libiconv-to-popt.pc.patch    | 19 ------
 package/popt/0002-Detect-glob_pattern_p.patch      | 53 ---------------
 .../0003-configure-replace-deprecated-macros.patch | 76 ----------------------
 package/popt/0004-fix-build-without-wchar.patch    | 53 ---------------
 .../popt/0005-fix-build-without-mbstate_t.patch    | 68 -------------------
 package/popt/popt.hash                             |  4 +-
 package/popt/popt.mk                               |  4 +-
 7 files changed, 3 insertions(+), 274 deletions(-)

diff --git a/package/popt/0001-add-libiconv-to-popt.pc.patch b/package/popt/0001-add-libiconv-to-popt.pc.patch
deleted file mode 100644
index baa3cd530d..0000000000
--- a/package/popt/0001-add-libiconv-to-popt.pc.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Add LTLIBICONV to popt.pc.in
-
-Add ${LTLIBICONV} to popt.pc.in so applications such as shairport-sync
-will know that they must link with -liconv when building statically
-
-Fixes:
- - http://autobuild.buildroot.org/results/c5b0d1d2867e49c022a2ad971dd9f358ff0f3865
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
-diff -Naurp popt-1.18-vanilla/popt.pc.in popt-1.18/popt.pc.in
---- popt-1.18-vanilla/popt.pc.in	2020-03-24 10:36:25.000000000 +0100
-+++ popt-1.18/popt.pc.in	2020-09-18 21:18:03.112609343 +0200
-@@ -7,4 +7,5 @@ Name: popt
- Version: @VERSION@
- Description: popt library.
- Libs: -L${libdir} -lpopt
-+Libs.private: @LTLIBICONV@
- Cflags: -I${includedir}
diff --git a/package/popt/0002-Detect-glob_pattern_p.patch b/package/popt/0002-Detect-glob_pattern_p.patch
deleted file mode 100644
index f64ad36f86..0000000000
--- a/package/popt/0002-Detect-glob_pattern_p.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 3938da1286534e4b280340411336eed5b6311d1b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 15 Jul 2020 23:21:32 +0200
-Subject: [PATCH] Detect glob_pattern_p()
-
-The current popt build system tests the existence of <glob.h>, and
-then assumes that if __GLIBC__ is defined, then glob_pattern_p() must
-be available. Unfortunately, that's not true with uClibc: <glob.h> may
-be installed, but not necessarily the GNU glob extensions... and
-uClibc defines __GLIBC__. This is causing build issues with certain
-uClibc toolchains that do not have GNU glob extensions enabled.
-
-To fix this, this patch adds an AC_CHECK_FUNCS() test for
-glob_pattern_p, and uses that to find out whether glob_pattern_p() is
-available or not.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Retrieved (and slightly updated) from:
-https://git.buildroot.net/buildroot/tree/package/popt/0003-glob-detection.patch]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/rpm-software-management/popt/commit/3938da1286534e4b280340411336eed5b6311d1b]
----
- configure.ac     | 2 +-
- src/poptconfig.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index a5568c4..3b71d1a 100755
---- a/configure.ac
-+++ b/configure.ac
-@@ -50,7 +50,7 @@ AC_ARG_ENABLE(build-gcov,
- ])
- 
- AC_SEARCH_LIBS(setreuid, [ucb])
--AC_CHECK_FUNCS(getuid geteuid iconv mtrace secure_getenv __secure_getenv setreuid setuid stpcpy strerror vasprintf srandom)
-+AC_CHECK_FUNCS(getuid geteuid iconv mtrace secure_getenv __secure_getenv setreuid setuid stpcpy strerror vasprintf srandom glob_pattern_p)
- 
- AM_GNU_GETTEXT_VERSION([0.18.2])
- AM_GNU_GETTEXT([external])
-diff --git a/src/poptconfig.c b/src/poptconfig.c
-index 9d97ccd..b4d1b76 100644
---- a/src/poptconfig.c
-+++ b/src/poptconfig.c
-@@ -21,7 +21,7 @@
- #if defined(HAVE_GLOB_H)
- #include <glob.h>
- 
--#if !defined(__GLIBC__)
-+#if !defined(HAVE_GLOB_PATTERN_P)
- /* Return nonzero if PATTERN contains any metacharacters.
-    Metacharacters can be quoted with backslashes if QUOTE is nonzero.  */
- static int
diff --git a/package/popt/0003-configure-replace-deprecated-macros.patch b/package/popt/0003-configure-replace-deprecated-macros.patch
deleted file mode 100644
index 32a6a8dc27..0000000000
--- a/package/popt/0003-configure-replace-deprecated-macros.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From f492b19f59229b0494b5b9ffe5c660a35493a405 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
-Date: Mon, 29 Jun 2020 18:58:09 +0200
-Subject: [PATCH] configure: replace deprecated macros
-
-* use LT_INIT instead of deprecated AC_PROG_LIBTOOL
-* use AS_HELP_STRING instead of deprecated AC_HELP_STRING
-* quote macros
-
-[Retrieved from:
-https://github.com/rpm-software-management/popt/commit/f492b19f59229b0494b5b9ffe5c660a35493a405]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac | 20 ++++++++++----------
- 1 file changed, 10 insertions(+), 10 deletions(-)
- mode change 100755 => 100644 configure.ac
-
-diff --git a/configure.ac b/configure.ac
-old mode 100755
-new mode 100644
-index 3b71d1a..009ae7b
---- a/configure.ac
-+++ b/configure.ac
-@@ -1,5 +1,5 @@
--AC_PREREQ(2.57)
--AC_INIT(popt, 1.18, rpm-maint@lists.rpm.org)
-+AC_PREREQ([2.57])
-+AC_INIT([popt], [1.18], [rpm-maint@lists.rpm.org])
- AC_CONFIG_SRCDIR([src/popt.h])
- AC_CONFIG_HEADERS([config.h])
- 
-@@ -14,11 +14,11 @@ AC_USE_SYSTEM_EXTENSIONS
- AM_PROG_AR
- 
- AC_PROG_INSTALL
--AC_PROG_LIBTOOL
-+LT_INIT
- 
- AC_SYS_LARGEFILE
- 
--AC_CHECK_HEADERS(fnmatch.h glob.h langinfo.h libintl.h mcheck.h stdalign.h)
-+AC_CHECK_HEADERS([fnmatch.h glob.h langinfo.h libintl.h mcheck.h stdalign.h])
- 
- # For some systems we know that we have ld_version scripts.
- # Use it then as default.
-@@ -32,15 +32,15 @@ case "${host}" in
-         ;;
- esac
- AC_ARG_ENABLE([ld-version-script],
--              AC_HELP_STRING([--enable-ld-version-script],
-+              [AS_HELP_STRING([--enable-ld-version-script],
-                              [enable/disable use of linker version script.
--                              (default is system dependent)]),
-+                              (default is system dependent)])],
-               [have_ld_version_script=$enableval],
-               [ : ] )
- AM_CONDITIONAL(HAVE_LD_VERSION_SCRIPT, test "$have_ld_version_script" = "yes")
- 
--AC_ARG_ENABLE(build-gcov,
--    AS_HELP_STRING([--enable-build-gcov], [build POPT instrumented for gcov]), [dnl
-+AC_ARG_ENABLE([build-gcov],
-+    [AS_HELP_STRING([--enable-build-gcov], [build POPT instrumented for gcov])], [dnl
-     if test ".$enableval" = .yes; then
-         if test ".`$CC --version 2>&1 | grep 'GCC'`" != .; then
-             dnl # GNU GCC (usually "gcc")
-@@ -49,8 +49,8 @@ AC_ARG_ENABLE(build-gcov,
-     fi
- ])
- 
--AC_SEARCH_LIBS(setreuid, [ucb])
--AC_CHECK_FUNCS(getuid geteuid iconv mtrace secure_getenv __secure_getenv setreuid setuid stpcpy strerror vasprintf srandom glob_pattern_p)
-+AC_SEARCH_LIBS([setreuid], [ucb])
-+AC_CHECK_FUNCS([getuid geteuid iconv mtrace secure_getenv __secure_getenv setreuid setuid stpcpy strerror vasprintf srandom glob_pattern_p])
- 
- AM_GNU_GETTEXT_VERSION([0.18.2])
- AM_GNU_GETTEXT([external])
diff --git a/package/popt/0004-fix-build-without-wchar.patch b/package/popt/0004-fix-build-without-wchar.patch
deleted file mode 100644
index a5bb09918d..0000000000
--- a/package/popt/0004-fix-build-without-wchar.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 41911aac46d69df6a205af59d60f23a418b0e875 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 2 Sep 2020 11:55:17 +0200
-Subject: [PATCH] fix build without wchar
-
-Check for wchar.h and use HAVE_WCHAR_H instead of hardcoding
-POPT_WCHAR_HACK to fix the build with (embedded) toolchains that don't
-support wchar
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/rpm-software-management/popt/commit/41911aac46d69df6a205af59d60f23a418b0e875]
----
- configure.ac   | 2 +-
- src/popthelp.c | 5 ++---
- 2 files changed, 3 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 009ae7b..1fce6df 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -18,7 +18,7 @@ LT_INIT
- 
- AC_SYS_LARGEFILE
- 
--AC_CHECK_HEADERS([fnmatch.h glob.h langinfo.h libintl.h mcheck.h stdalign.h])
-+AC_CHECK_HEADERS([fnmatch.h glob.h langinfo.h libintl.h mcheck.h stdalign.h wchar.h])
- 
- # For some systems we know that we have ld_version scripts.
- # Use it then as default.
-diff --git a/src/popthelp.c b/src/popthelp.c
-index 9a3f489..5cbc1f4 100644
---- a/src/popthelp.c
-+++ b/src/popthelp.c
-@@ -15,8 +15,7 @@
- #include <sys/ioctl.h>
- #endif
- 
--#define	POPT_WCHAR_HACK
--#ifdef 	POPT_WCHAR_HACK
-+#ifdef HAVE_WCHAR_H
- #include <wchar.h>			/* for mbsrtowcs */
- #endif
- #include "poptint.h"
-@@ -118,7 +117,7 @@ static size_t maxColumnWidth(FILE *fp)
- static inline size_t stringDisplayWidth(const char *s)
- {
-     size_t n = strlen(s);
--#ifdef	POPT_WCHAR_HACK
-+#ifdef HAVE_WCHAR_H
-     mbstate_t t;
- 
-     memset ((void *)&t, 0, sizeof (t));	/* In initial state.  */
diff --git a/package/popt/0005-fix-build-without-mbstate_t.patch b/package/popt/0005-fix-build-without-mbstate_t.patch
deleted file mode 100644
index 12bc73ee95..0000000000
--- a/package/popt/0005-fix-build-without-mbstate_t.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From e4788a0f9d820574a165b2609ff16b717ce0baba Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 19 Sep 2020 18:51:15 +0200
-Subject: [PATCH] fix build without mbstate_t
-
-Commit 41911aac46d69df6a205af59d60f23a418b0e875 tried to fix build
-without wchar by checking for the availability of wchar.h however some
-toolchains have wchar.h but does not define mbstate_t and mbsrtowcs so
-replace HAVE_WCHAR_H by HAVE_MBSRTOWCS
-
-Fixes:
- - http://autobuild.buildroot.org/results/27f184af35468941173628e5e847a284c0b80d73
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://github.com/rpm-software-management/popt/pull/51]
----
- configure.ac   | 4 ++--
- src/popthelp.c | 4 ++--
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 1fce6df..442086b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -18,7 +18,7 @@ LT_INIT
- 
- AC_SYS_LARGEFILE
- 
--AC_CHECK_HEADERS([fnmatch.h glob.h langinfo.h libintl.h mcheck.h stdalign.h wchar.h])
-+AC_CHECK_HEADERS([fnmatch.h glob.h langinfo.h libintl.h mcheck.h stdalign.h])
- 
- # For some systems we know that we have ld_version scripts.
- # Use it then as default.
-@@ -50,7 +50,7 @@ AC_ARG_ENABLE([build-gcov],
- ])
- 
- AC_SEARCH_LIBS([setreuid], [ucb])
--AC_CHECK_FUNCS([getuid geteuid iconv mtrace secure_getenv __secure_getenv setreuid setuid stpcpy strerror vasprintf srandom glob_pattern_p])
-+AC_CHECK_FUNCS([getuid geteuid iconv mtrace secure_getenv __secure_getenv setreuid setuid stpcpy strerror vasprintf srandom glob_pattern_p mbsrtowcs])
- 
- AM_GNU_GETTEXT_VERSION([0.18.2])
- AM_GNU_GETTEXT([external])
-diff --git a/src/popthelp.c b/src/popthelp.c
-index f604516..b4ab9b4 100644
---- a/src/popthelp.c
-+++ b/src/popthelp.c
-@@ -15,7 +15,7 @@
- #include <sys/ioctl.h>
- #endif
- 
--#ifdef HAVE_WCHAR_H
-+#ifdef HAVE_MBSRTOWCS
- #include <wchar.h>			/* for mbsrtowcs */
- #endif
- #include "poptint.h"
-@@ -117,7 +117,7 @@ static size_t maxColumnWidth(FILE *fp)
- static inline size_t stringDisplayWidth(const char *s)
- {
-     size_t n = strlen(s);
--#ifdef HAVE_WCHAR_H
-+#ifdef HAVE_MBSRTOWCS
-     mbstate_t t;
- 
-     memset ((void *)&t, 0, sizeof (t));	/* In initial state.  */
--- 
-2.28.0
-
diff --git a/package/popt/popt.hash b/package/popt/popt.hash
index 9b5efe4be6..63d96326a6 100644
--- a/package/popt/popt.hash
+++ b/package/popt/popt.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  5159bc03a20b28ce363aa96765f37df99ea4d8850b1ece17d1e6ad5c24fdc5d1  popt-1.18.tar.gz
-sha256  518d4f2a05064cb9a8ec0ea02e86408af4feed6916f78ef42171465db8b383c5  COPYING
+sha256  c25a4838fc8e4c1c8aacb8bd620edb3084a3d63bf8987fdad3ca2758c63240f9  popt-1.19.tar.gz
+sha256  2b488b239927935f34769a39309c0680be16e3725a1f55dbb06ed20d53852801  COPYING
diff --git a/package/popt/popt.mk b/package/popt/popt.mk
index f00bf115ee..842cf0d035 100644
--- a/package/popt/popt.mk
+++ b/package/popt/popt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POPT_VERSION = 1.18
+POPT_VERSION = 1.19
 POPT_SITE = http://ftp.rpm.org/popt/releases/popt-1.x
 POPT_INSTALL_STAGING = YES
 POPT_LICENSE = MIT
@@ -13,8 +13,6 @@ POPT_CPE_ID_VENDOR = popt_project
 
 POPT_GETTEXTIZE = YES
 POPT_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
-# We're patching configure.ac
-POPT_AUTORECONF = YES
 
 POPT_CONF_ENV = ac_cv_va_copy=yes
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
