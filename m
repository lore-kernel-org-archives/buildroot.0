Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5398C433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 07:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1888D80E24;
	Sun,  5 Dec 2021 07:29:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f8W2tkvmowoG; Sun,  5 Dec 2021 07:29:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1F4180FC6;
	Sun,  5 Dec 2021 07:29:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 13A931BF294
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 07:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3A6C40163
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 07:29:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZMHEe-raOG0g for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 07:29:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 13BA2400A8
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 07:29:09 +0000 (UTC)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout04.t-online.de (Postfix) with SMTP id 09F2567CD
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 08:29:07 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.179.59]) by fwd77.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mtlxF-1q4Xth0; Sun, 5 Dec 2021 08:29:01 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:38000)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mtlxF-00071n-1f
 for buildroot@buildroot.org; Sun, 05 Dec 2021 08:29:01 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun,  5 Dec 2021 08:29:01 +0100
Message-Id: <20211205072901.858343-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1638689341-00001440-9203AE8A/0/0 CLEAN NORMAL
X-TOI-MSGID: e0cba120-90fa-489f-ac29-381e5943eecf
Subject: [Buildroot] [PATCH/next 1/1] package/linux-pam: bump version to
 1.5.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed patches which were applied upstream.

Release notes:
https://github.com/linux-pam/linux-pam/releases/tag/v1.5.2

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...0001-configure-test-a-o-is-not-POSIX.patch |  75 ---------
 ...002-Remove-support-for-legacy-xcrypt.patch | 149 ------------------
 ...x-build-with-libxcrypt-and-uclibc-ng.patch |  47 ------
 ...o-search-libcrypt-through-pkg-config.patch |  55 -------
 package/linux-pam/linux-pam.hash              |   4 +-
 package/linux-pam/linux-pam.mk                |   4 +-
 6 files changed, 3 insertions(+), 331 deletions(-)
 delete mode 100644 package/linux-pam/0001-configure-test-a-o-is-not-POSIX.patch
 delete mode 100644 package/linux-pam/0002-Remove-support-for-legacy-xcrypt.patch
 delete mode 100644 package/linux-pam/0003-configure.ac-fix-build-with-libxcrypt-and-uclibc-ng.patch
 delete mode 100644 package/linux-pam/0004-configure.ac-also-search-libcrypt-through-pkg-config.patch

diff --git a/package/linux-pam/0001-configure-test-a-o-is-not-POSIX.patch b/package/linux-pam/0001-configure-test-a-o-is-not-POSIX.patch
deleted file mode 100644
index ac16455956..0000000000
--- a/package/linux-pam/0001-configure-test-a-o-is-not-POSIX.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 7c54428db5b639f05093459b1ba3b77456c5a548 Mon Sep 17 00:00:00 2001
-From: "Issam E. Maghni" <issam.e.maghni@mailbox.org>
-Date: Wed, 16 Dec 2020 18:48:28 -0500
-Subject: [PATCH] configure: test -a|o is not POSIX
-
-Fixes `test: too many arguments` when building Linux-PAM using sbase.
-This is due to a non-POSIX syntax test ... -a ... and test ... -o ....
-
-> The XSI extensions specifying the -a and -o binary primaries and the
-> '(' and ')' operators have been marked obsolescent.
-
-See https://pubs.opengroup.org/onlinepubs/9699919799/utilities/test.html
-
-[Retrieved from:
-https://github.com/linux-pam/linux-pam/commit/7c54428db5b639f05093459b1ba3b77456c5a548]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 5eade7cd3..e325bdd3c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -346,7 +346,7 @@ if test x"$WITH_LIBAUDIT" != xno ; then
- 			     [HAVE_AUDIT_TTY_STATUS=""],
- 			     [#include <libaudit.h>])]
-         )
--        if test -n "$LIBAUDIT" -a "$ac_cv_header_libaudit_h" != "no" ; then
-+        if test -n "$LIBAUDIT" && test "$ac_cv_header_libaudit_h" != "no" ; then
-             AC_DEFINE([HAVE_LIBAUDIT], 1, [Define to 1 if audit support should be compiled in.])
-         fi
-         if test -n "$HAVE_AUDIT_TTY_STATUS" ; then
-@@ -373,12 +373,12 @@ esac
- AC_CHECK_FUNCS(crypt_r crypt_gensalt_r)
- LIBS=$BACKUP_LIBS
- AC_SUBST(LIBCRYPT)
--if test "$LIBCRYPT" = "-lxcrypt" -a "$ac_cv_header_xcrypt_h" = "yes" ; then
-+if test "$LIBCRYPT" = "-lxcrypt" && test "$ac_cv_header_xcrypt_h" = "yes" ; then
- 	AC_DEFINE([HAVE_LIBXCRYPT], 1, [Define to 1 if xcrypt support should be compiled in.])
- fi
- 
- AC_ARG_WITH([randomdev], AS_HELP_STRING([--with-randomdev=(<path>|yes|no)],[use specified random device instead of /dev/urandom or 'no' to disable]), opt_randomdev=$withval)
--if test "$opt_randomdev" = yes -o -z "$opt_randomdev"; then
-+if test "$opt_randomdev" = yes || test -z "$opt_randomdev"; then
-        opt_randomdev="/dev/urandom"
- elif test "$opt_randomdev" = no; then
-        opt_randomdev=
-@@ -395,7 +395,7 @@ AC_ARG_ENABLE([db],
- AC_ARG_WITH([db-uniquename],
- 	AS_HELP_STRING([--with-db-uniquename=extension],[Unique name for db libraries and functions.]))
- if test x"$WITH_DB" != xno ; then
--        if test x"$WITH_DB" = xyes -o x"$WITH_DB" = xdb ; then
-+        if test x"$WITH_DB" = xyes || test x"$WITH_DB" = xdb ; then
-               old_libs=$LIBS
-               LIBS="$LIBS -ldb$with_db_uniquename"
-               AC_CHECK_FUNCS([db_create$with_db_uniquename db_create dbm_store$with_db_uniquename dbm_store],
-@@ -572,7 +572,7 @@ fi
- 
- AC_PATH_PROG([FO2PDF], [fop])
- 
--AM_CONDITIONAL(ENABLE_REGENERATE_MAN, test x$enable_docu != xno -a x$enable_doc != xno)
-+AM_CONDITIONAL(ENABLE_REGENERATE_MAN, test x$enable_docu != xno && test x$enable_doc != xno)
- AM_CONDITIONAL(ENABLE_GENERATE_PDF, test -n "$FO2PDF")
- 
- 
-@@ -625,7 +625,7 @@ esac
- AM_CONDITIONAL([COND_BUILD_PAM_KEYINIT], [test "$have_key_syscalls" = 1])
- AM_CONDITIONAL([COND_BUILD_PAM_LASTLOG], [test "$ac_cv_func_logwtmp" = yes])
- AM_CONDITIONAL([COND_BUILD_PAM_NAMESPACE], [test "$ac_cv_func_unshare" = yes])
--AM_CONDITIONAL([COND_BUILD_PAM_RHOSTS], [test "$ac_cv_func_ruserok_af" = yes -o "$ac_cv_func_ruserok" = yes])
-+AM_CONDITIONAL([COND_BUILD_PAM_RHOSTS], [test "$ac_cv_func_ruserok_af" = yes || test "$ac_cv_func_ruserok" = yes])
- AM_CONDITIONAL([COND_BUILD_PAM_SELINUX], [test -n "$LIBSELINUX"])
- AM_CONDITIONAL([COND_BUILD_PAM_SEPERMIT], [test -n "$LIBSELINUX"])
- AM_CONDITIONAL([COND_BUILD_PAM_SETQUOTA], [test "$ac_cv_func_quotactl" = yes])
diff --git a/package/linux-pam/0002-Remove-support-for-legacy-xcrypt.patch b/package/linux-pam/0002-Remove-support-for-legacy-xcrypt.patch
deleted file mode 100644
index 9f4e8bcde0..0000000000
--- a/package/linux-pam/0002-Remove-support-for-legacy-xcrypt.patch
+++ /dev/null
@@ -1,149 +0,0 @@
-From 530c9f9e2d746e1d168c6b17863debda7664ac7c Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Bj=C3=B6rn=20Esser?= <besser82@fedoraproject.org>
-Date: Fri, 28 Feb 2020 15:47:52 +0100
-Subject: [PATCH] Remove support for legacy xcrypt
-
-Since many distributions are shipping a version of libxcrypt >= 4.0.0
-as a replacement for glibc's libcrypt now, older versions of xcrypt,
-which could be installed in parallel, are not relevant anymore.
-
-* configure.ac (AC_CHECK_HEADERS): Remove xcrypt.h.
-(AC_SEARCH_LIBS): Remove xcrypt.
-(AC_CHECK_FUNCS): Remove crypt_gensalt_r.
-(AC_DEFINE): Remove HAVE_LIBXCRYPT.
-* modules/pam_pwhistory/opasswd.c [HAVE_LIBXCRYPT]: Remove.
-* modules/pam_unix/bigcrypt.c [HAVE_LIBXCRYPT]: Likewise.
-* modules/pam_userdb/pam_userdb.c [HAVE_LIBXCRYPT]: Likewise.
-* modules/pam_unix/passverify.c [HAVE_LIBXCRYPT]: Likewise.
-(create_password_hash) [HAVE_LIBXCRYPT]: Likewise.
-
-[Retrieved from:
-https://github.com/linux-pam/linux-pam/commit/530c9f9e2d746e1d168c6b17863debda7664ac7c]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac                    | 12 +++---------
- modules/pam_pwhistory/opasswd.c |  4 +---
- modules/pam_unix/bigcrypt.c     |  4 +---
- modules/pam_unix/passverify.c   | 24 +++++-------------------
- modules/pam_userdb/pam_userdb.c |  4 +---
- 5 files changed, 11 insertions(+), 37 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 8e5d0ff7c..100565552 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -359,23 +359,17 @@ else
- fi
- AC_SUBST(LIBAUDIT)
- 
--AC_CHECK_HEADERS(xcrypt.h crypt.h)
--AS_IF([test "x$ac_cv_header_xcrypt_h" = "xyes"],
--  [crypt_libs="xcrypt crypt"],
--  [crypt_libs="crypt"])
-+AC_CHECK_HEADERS(crypt.h)
- 
- BACKUP_LIBS=$LIBS
--AC_SEARCH_LIBS([crypt],[$crypt_libs])
-+AC_SEARCH_LIBS([crypt],[crypt])
- case "$ac_cv_search_crypt" in
- 	-l*) LIBCRYPT="$ac_cv_search_crypt" ;;
- 	*) LIBCRYPT="" ;;
- esac
--AC_CHECK_FUNCS(crypt_r crypt_gensalt_r)
-+AC_CHECK_FUNCS([crypt_r])
- LIBS=$BACKUP_LIBS
- AC_SUBST(LIBCRYPT)
--if test "$LIBCRYPT" = "-lxcrypt" && test "$ac_cv_header_xcrypt_h" = "yes" ; then
--	AC_DEFINE([HAVE_LIBXCRYPT], 1, [Define to 1 if xcrypt support should be compiled in.])
--fi
- 
- AC_ARG_WITH([randomdev], AS_HELP_STRING([--with-randomdev=(<path>|yes|no)],[use specified random device instead of /dev/urandom or 'no' to disable]), opt_randomdev=$withval)
- if test "$opt_randomdev" = yes || test -z "$opt_randomdev"; then
-diff --git a/modules/pam_pwhistory/opasswd.c b/modules/pam_pwhistory/opasswd.c
-index 40296d590..a6cd3d2a3 100644
---- a/modules/pam_pwhistory/opasswd.c
-+++ b/modules/pam_pwhistory/opasswd.c
-@@ -54,9 +54,7 @@
- #endif
- #include <sys/stat.h>
- 
--#if defined HAVE_LIBXCRYPT
--#include <xcrypt.h>
--#elif defined (HAVE_CRYPT_H)
-+#ifdef HAVE_CRYPT_H
- #include <crypt.h>
- #endif
- 
-diff --git a/modules/pam_unix/bigcrypt.c b/modules/pam_unix/bigcrypt.c
-index 31be2f7b0..d8d61a4b0 100644
---- a/modules/pam_unix/bigcrypt.c
-+++ b/modules/pam_unix/bigcrypt.c
-@@ -29,9 +29,7 @@
- #include <string.h>
- #include <stdlib.h>
- #include <security/_pam_macros.h>
--#ifdef HAVE_LIBXCRYPT
--#include <xcrypt.h>
--#elif defined(HAVE_CRYPT_H)
-+#ifdef HAVE_CRYPT_H
- #include <crypt.h>
- #endif
- 
-diff --git a/modules/pam_unix/passverify.c b/modules/pam_unix/passverify.c
-index 5a19ed856..e833402c1 100644
---- a/modules/pam_unix/passverify.c
-+++ b/modules/pam_unix/passverify.c
-@@ -19,9 +19,7 @@
- #include <sys/time.h>
- #include <sys/stat.h>
- #include <fcntl.h>
--#ifdef HAVE_LIBXCRYPT
--#include <xcrypt.h>
--#elif defined(HAVE_CRYPT_H)
-+#ifdef HAVE_CRYPT_H
- #include <crypt.h>
- #endif
- 
-@@ -467,23 +465,11 @@ PAMH_ARG_DECL(char * create_password_hash,
- 	 */
- 	sp = crypt_gensalt_rn(algoid, rounds, NULL, 0, salt, sizeof(salt));
- #else
--#ifdef HAVE_CRYPT_GENSALT_R
--	if (on(UNIX_BLOWFISH_PASS, ctrl)) {
--		char entropy[17];
--		crypt_make_salt(entropy, sizeof(entropy) - 1);
--		sp = crypt_gensalt_r (algoid, rounds,
--				      entropy, sizeof(entropy),
--				      salt, sizeof(salt));
--	} else {
--#endif
--		sp = stpcpy(salt, algoid);
--		if (on(UNIX_ALGO_ROUNDS, ctrl)) {
--			sp += snprintf(sp, sizeof(salt) - (16 + 1 + (sp - salt)), "rounds=%u$", rounds);
--		}
--		crypt_make_salt(sp, 16);
--#ifdef HAVE_CRYPT_GENSALT_R
-+	sp = stpcpy(salt, algoid);
-+	if (on(UNIX_ALGO_ROUNDS, ctrl)) {
-+		sp += snprintf(sp, sizeof(salt) - (16 + 1 + (sp - salt)), "rounds=%u$", rounds);
- 	}
--#endif
-+	crypt_make_salt(sp, 16);
- #endif /* CRYPT_GENSALT_IMPLEMENTS_AUTO_ENTROPY */
- #ifdef HAVE_CRYPT_R
- 	sp = NULL;
-diff --git a/modules/pam_userdb/pam_userdb.c b/modules/pam_userdb/pam_userdb.c
-index d59801bfd..f467ea4c8 100644
---- a/modules/pam_userdb/pam_userdb.c
-+++ b/modules/pam_userdb/pam_userdb.c
-@@ -17,9 +17,7 @@
- #include <sys/stat.h>
- #include <fcntl.h>
- #include <errno.h>
--#ifdef HAVE_LIBXCRYPT
--#include <xcrypt.h>
--#elif defined(HAVE_CRYPT_H)
-+#ifdef HAVE_CRYPT_H
- #include <crypt.h>
- #endif
- 
diff --git a/package/linux-pam/0003-configure.ac-fix-build-with-libxcrypt-and-uclibc-ng.patch b/package/linux-pam/0003-configure.ac-fix-build-with-libxcrypt-and-uclibc-ng.patch
deleted file mode 100644
index d452aed34d..0000000000
--- a/package/linux-pam/0003-configure.ac-fix-build-with-libxcrypt-and-uclibc-ng.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From fe1307512fb8892b5ceb3d884c793af8dbd4c16a Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 15 Jun 2021 07:13:56 +0200
-Subject: [PATCH] configure.ac: fix build with libxcrypt and uclibc-ng
-
-Fix the following build failure with libxcrypt and uclibc-ng:
-
-ld: unix_chkpwd-passverify.o: in function `verify_pwd_hash':
-passverify.c:(.text+0xab4): undefined reference to `crypt_checksalt'
-
-Fixes:
- - http://autobuild.buildroot.org/results/65d68b7c9c7de1c7cb0f941ff9982f93a49a56f8
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/linux-pam/linux-pam/commit/fe1307512fb8892b5ceb3d884c793af8dbd4c16a]
----
- configure.ac | 16 ++++++++++++----
- 1 file changed, 12 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 7a4b2e86..e9c57345 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -362,10 +362,18 @@ AC_SUBST(LIBAUDIT)
- AC_CHECK_HEADERS(crypt.h)
- 
- BACKUP_LIBS=$LIBS
--AC_SEARCH_LIBS([crypt],[crypt])
--case "$ac_cv_search_crypt" in
--	-l*) LIBCRYPT="$ac_cv_search_crypt" ;;
--	*) LIBCRYPT="" ;;
-+LIBCRYPT=""
-+AC_SEARCH_LIBS([crypt_gensalt_rn],[crypt])
-+case "$ac_cv_search_crypt_gensalt_rn" in
-+	-l*) LIBCRYPT="$ac_cv_search_crypt_gensalt_rn" ;;
-+	no) AC_SEARCH_LIBS([crypt_r],[crypt])
-+		case "$ac_cv_search_crypt_r" in
-+		-l*) LIBCRYPT="$ac_cv_search_crypt_r" ;;
-+		no ) AC_SEARCH_LIBS([crypt],[crypt])
-+		case "$ac_cv_search_crypt" in
-+			-l*) LIBCRYPT="$ac_cv_search_crypt" ;;
-+		esac ;;
-+	esac ;;
- esac
- AC_CHECK_FUNCS([crypt_r])
- LIBS=$BACKUP_LIBS
diff --git a/package/linux-pam/0004-configure.ac-also-search-libcrypt-through-pkg-config.patch b/package/linux-pam/0004-configure.ac-also-search-libcrypt-through-pkg-config.patch
deleted file mode 100644
index 09b86902bb..0000000000
--- a/package/linux-pam/0004-configure.ac-also-search-libcrypt-through-pkg-config.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 49e3ffcbe267691dfbf24c91417aa296e7412146 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 29 Aug 2021 21:15:57 +0200
-Subject: [PATCH] configure.ac: also search libcrypt through pkg-config
-
-libxcrypt provides a libcrypt.pc file so use it if available as this
-will allow to retrieve the library path (e.g.
--L/home/buildroot/output/host//riscv64-buildroot-linux-musl/sysroot/usr/lib)
-which is useful when cross-compiling and will avoid the following build
-failure on buildroot:
-
-/home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv64-buildroot-linux-musl/10.2.0/../../../../riscv64-buildroot-linux-musl/bin/ld: .libs/passverify.o: in function `.L30':
-passverify.c:(.text+0x368): undefined reference to `crypt_checksalt'
-
-Fixes:
- - http://autobuild.buildroot.org/results/20b14e222b35c2d1269960075832b784ba81aa1a
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/linux-pam/linux-pam/commit/49e3ffcbe267691dfbf24c91417aa296e7412146]
----
- configure.ac | 13 ++++++++++---
- 1 file changed, 10 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index d464884c..c06bc7dd 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -363,8 +363,14 @@ AC_CHECK_HEADERS(crypt.h)
- 
- BACKUP_LIBS=$LIBS
- LIBCRYPT=""
--AC_SEARCH_LIBS([crypt_gensalt_rn],[crypt])
--case "$ac_cv_search_crypt_gensalt_rn" in
-+PKG_CHECK_MODULES([CRYPT], [libcrypt], [
-+  CFLAGS="$CFLAGS $CRYPT_CFLAGS"
-+  CPPFLAGS="$CPPFLAGS $CRYPT_CFLAGS"
-+  LIBS="$LIBS $CRYPT_LIBS"
-+  LIBCRYPT="$CRYPT_LIBS"
-+], [
-+  AC_SEARCH_LIBS([crypt_gensalt_rn],[crypt])
-+  case "$ac_cv_search_crypt_gensalt_rn" in
- 	-l*) LIBCRYPT="$ac_cv_search_crypt_gensalt_rn" ;;
- 	no) AC_SEARCH_LIBS([crypt_r],[crypt])
- 		case "$ac_cv_search_crypt_r" in
-@@ -374,7 +380,8 @@ case "$ac_cv_search_crypt_gensalt_rn" in
- 			-l*) LIBCRYPT="$ac_cv_search_crypt" ;;
- 		esac ;;
- 	esac ;;
--esac
-+  esac
-+])
- AC_CHECK_FUNCS([crypt_r])
- LIBS=$BACKUP_LIBS
- AC_SUBST(LIBCRYPT)
diff --git a/package/linux-pam/linux-pam.hash b/package/linux-pam/linux-pam.hash
index be7cabf6dc..0be3433687 100644
--- a/package/linux-pam/linux-pam.hash
+++ b/package/linux-pam/linux-pam.hash
@@ -1,6 +1,6 @@
 # Locally computed hashes after checking signature at
-# https://github.com/linux-pam/linux-pam/releases/download/v1.5.0/Linux-PAM-1.5.1.tar.xz.asc
+# https://github.com/linux-pam/linux-pam/releases/download/v1.5.2/Linux-PAM-1.5.2.tar.xz.asc
 # signed with the key 8C6BFD92EE0F42EDF91A6A736D1A7F052E5924BB
-sha256  201d40730b1135b1b3cdea09f2c28ac634d73181ccd0172ceddee3649c5792fc  Linux-PAM-1.5.1.tar.xz
+sha256  e4ec7131a91da44512574268f493c6d8ca105c87091691b8e9b56ca685d4f94d  Linux-PAM-1.5.2.tar.xz
 # Locally computed
 sha256  133d98e7a2ab3ffd330b4debb0bfc10fea21e4b2b5a5b09de2e924293be5ff08  Copyright
diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 389d32a9a8..e309f6a5a4 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_PAM_VERSION = 1.5.1
+LINUX_PAM_VERSION = 1.5.2
 LINUX_PAM_SOURCE = Linux-PAM-$(LINUX_PAM_VERSION).tar.xz
 LINUX_PAM_SITE = https://github.com/linux-pam/linux-pam/releases/download/v$(LINUX_PAM_VERSION)
 LINUX_PAM_INSTALL_STAGING = YES
@@ -23,8 +23,6 @@ LINUX_PAM_LICENSE = BSD-3-Clause
 LINUX_PAM_LICENSE_FILES = Copyright
 LINUX_PAM_MAKE_OPTS += LIBS=$(TARGET_NLS_LIBS)
 LINUX_PAM_CPE_ID_VENDOR = linux-pam
-# We're patching configure.ac
-LINUX_PAM_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 LINUX_PAM_CONF_OPTS += --enable-selinux
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
