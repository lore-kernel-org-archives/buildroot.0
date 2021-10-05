Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1161BC433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 21:00:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20DD3613AC
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 21:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 20DD3613AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2E464089E;
	Tue,  5 Oct 2021 21:00:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1PuuQECbfOFW; Tue,  5 Oct 2021 20:59:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFEF0408A8;
	Tue,  5 Oct 2021 20:59:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E3A0E1BF20F
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 20:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2EB1408A8
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 20:59:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NERP2x5gx3UB for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 20:59:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 41C0A4089E
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 20:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1633467594;
 bh=0Q0NMY7PQtLalDdrSpiVj5emEAF52UIvygQxQX1/LOY=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=bOq5L9M1Wwa4toEaci1MWAPEA4MwqQhUGia/wy0V3OR458ubVRhJNP5H42poECQD0
 EfFRU5BLR5pUKRUwEhUSJYG6JRTpxP1JfNqUXDF2o+OUGQps+7u7KC/9bApUYJGcLO
 8LuHBdOAbqp7yXgOXSK/thOhniQhcavj84kA59Y8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.251]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MhlGq-1n2VOj3JYW-00dpN6 for <buildroot@buildroot.org>; Tue, 05 Oct 2021
 22:59:53 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue,  5 Oct 2021 22:59:52 +0200
Message-Id: <20211005205952.13829-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:5RFP85Qd0YW+NsadOxSwVgGmTsR68OoZA/2aVijdoaOJYMAAJ/z
 qhOSn1MrCdPxjgd0OsRvLR3C3sR9p45cvmMaTAzEsJS8ocJAfe2MBP7VQIORcuRKsMo0l/E
 IQ3lPSAaF1M+0ScTup54/+15kXIcEWosI28KgiihHh0IYxd3nlrdS7pIoGmarw6M3aB2qRH
 DY6Ooo99XaK1+HuIYtIag==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hevSbmpX3U8=:UQ9jA1w74sNgpiV7vY4cZc
 fR2T02joj1JTiv5A/ie2oDehr9NtJXpoWejg5F1TFUQjo30IM9QgmMYr/aK+pJRNyWqh/g1Y6
 +ZnJVlejyY6PBlQpFbnVcnMICArD4By/7cEPw4NYMaWW8vb/6SD0kktq4ydKJcsUQQYcDITn5
 jUsNw83x6IrL7JnINCeP09WKhZB/4d+qqi2P5WkOcTxqTsfC+z0NR6hhDVML7Jf439qxqZQRN
 Woeam1YDRJkgSB6X6xpko0kROY6BAudVSsdBHx4ak6qVt8/6stdHEHbrO9zn6cN4kg1Bb4AjK
 nnRCLqXLIpEld0IddT+Sp8IFrHB0rYjye1oLPL/uC4IF/zT3QoHnvV5DFOa5l9lA2+LU4XLVk
 dnGnDPvf0dYGO8v340N2rQwkyndkhVfwpOceiLD83ck3kDrmDCvZ9omqRLSueLvj/WrTpZNZo
 1OrC1/UVQu7PtfVOsAtU60+CHYQ4YHxyuIlUP+cuVtU2F3rSCoWppB0OQjzMKA7npOp3Ies7S
 2rx988JGBFYts3agFSK5yiCMmd1A0/BhVKnySiUne5NJuVhFPUD+xWHxQWn1AIEEDZGshF+Jp
 TEkBTwcDqOtF23obrhFKaDErQuEBDFmpd4Jxm0gqZbELxiXqxh2Yut8aIMnSxOHTLoD45A6u4
 qH7Own7Ti6Ymv6btbG+56S6FySTPkpYApfi3sfM5LLzydKwqG4wat4idQzfLvexFepC7+tYVb
 3pvNBDaLKKuZXKT02R6DE/2KcouJZjhzJm8hhBpH25899Ar/nRkVigVY154uiwOFHY1NwcByi
 knzoTxAbAOPMfMByy3N+ILcI83vtlLMZ6gKQ55MgiIjJT/SoXOoHMg4zwnfaKe6YUrYr+Nk4q
 wzQO5f/qLAyDjflmizIOoP/lbiJXqmW5p+5mB/t0MQ1iN2uVI9ikSfUfnNuUwHYy37RoS0iFn
 8Uhh85qn/1PRkt2l4JBEFl4svXvS+/sIecE5rdp+fbAZBDqWylJfEJPvRm1O+8Sp9kTQoFkW4
 JRriO9x29JdoKYWzii6R4+X32K9DCqf3GvzcBuP0eLYb+daPfwnjvJ3ksFWz7+aty5iH32Prc
 rrDFdyayHxGLao=
Subject: [Buildroot] [PATCH v1] package/coreutils: bump version to 9.0
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

- removed 0001-ls-restore-8.31-behavior-on-removed-directories.patch
  (upstream [1])

- removed 0002-m4-pthread-cond.m4-fix-build-without-threads.patch
  and drop AUTORECONF (contained in tar.xz file)

- removed 0003-lib-pthread-cond.c-use-tv.nsec-instead-of-tv.usec.patch
  (contained in tar.xz file)

For details see [2].

[1] https://git.savannah.gnu.org/gitweb/?p=coreutils.git;a=commit;h=10fcb97bd728f09d4a027eddf8ad2900f0819b0a
[2] https://lists.gnu.org/archive/html/info-gnu/2021-09/msg00010.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...8.31-behavior-on-removed-directories.patch | 118 ------------------
 ...ad-cond.m4-fix-build-without-threads.patch |  59 ---------
 ...ond.c-use-tv.nsec-instead-of-tv.usec.patch |  35 ------
 package/coreutils/coreutils.hash              |   2 +-
 package/coreutils/coreutils.mk                |   2 +-
 5 files changed, 2 insertions(+), 214 deletions(-)
 delete mode 100644 package/coreutils/0001-ls-restore-8.31-behavior-on-removed-directories.patch
 delete mode 100644 package/coreutils/0002-m4-pthread-cond.m4-fix-build-without-threads.patch
 delete mode 100644 package/coreutils/0003-lib-pthread-cond.c-use-tv.nsec-instead-of-tv.usec.patch

diff --git a/package/coreutils/0001-ls-restore-8.31-behavior-on-removed-directories.patch b/package/coreutils/0001-ls-restore-8.31-behavior-on-removed-directories.patch
deleted file mode 100644
index 43a8161b93..0000000000
--- a/package/coreutils/0001-ls-restore-8.31-behavior-on-removed-directories.patch
+++ /dev/null
@@ -1,118 +0,0 @@
-From 10fcb97bd728f09d4a027eddf8ad2900f0819b0a Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Thu, 5 Mar 2020 17:25:29 -0800
-Subject: [PATCH] ls: restore 8.31 behavior on removed directories
-
-* NEWS: Mention this.
-* src/ls.c: Do not include <sys/sycall.h>
-(print_dir): Don't worry about whether the directory is removed.
-* tests/ls/removed-directory.sh: Adjust to match new (i.e., old)
-behavior.
-Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
----
- NEWS                          |  6 ++++++
- src/ls.c                      | 22 ----------------------
- tests/ls/removed-directory.sh | 10 ++--------
- 3 files changed, 8 insertions(+), 30 deletions(-)
-
-diff --git a/NEWS b/NEWS
-index fdc8bf5db..653e7178b 100644
---- a/NEWS
-+++ b/NEWS
-@@ -2,6 +2,12 @@ GNU coreutils NEWS                                    -*- outline -*-
- 
- * Noteworthy changes in release ?.? (????-??-??) [?]
- 
-+** Changes in behavior
-+
-+  On GNU/Linux systems, ls no longer issues an error message on
-+  directory merely because it was removed.  This reverts a change
-+  that was made in release 8.32.
-+
- 
- * Noteworthy changes in release 8.32 (2020-03-05) [stable]
- 
-diff --git a/src/ls.c b/src/ls.c
-index 24b983287..4acf5f44d 100644
---- a/src/ls.c
-+++ b/src/ls.c
-@@ -49,10 +49,6 @@
- # include <sys/ptem.h>
- #endif
- 
--#ifdef __linux__
--# include <sys/syscall.h>
--#endif
--
- #include <stdio.h>
- #include <assert.h>
- #include <setjmp.h>
-@@ -2896,7 +2892,6 @@ print_dir (char const *name, char const *realname, bool command_line_arg)
-   struct dirent *next;
-   uintmax_t total_blocks = 0;
-   static bool first = true;
--  bool found_any_entries = false;
- 
-   errno = 0;
-   dirp = opendir (name);
-@@ -2972,7 +2967,6 @@ print_dir (char const *name, char const *realname, bool command_line_arg)
-       next = readdir (dirp);
-       if (next)
-         {
--          found_any_entries = true;
-           if (! file_ignored (next->d_name))
-             {
-               enum filetype type = unknown;
-@@ -3018,22 +3012,6 @@ print_dir (char const *name, char const *realname, bool command_line_arg)
-           if (errno != EOVERFLOW)
-             break;
-         }
--#ifdef __linux__
--      else if (! found_any_entries)
--        {
--          /* If readdir finds no directory entries at all, not even "." or
--             "..", then double check that the directory exists.  */
--          if (syscall (SYS_getdents, dirfd (dirp), NULL, 0) == -1
--              && errno != EINVAL)
--            {
--              /* We exclude EINVAL as that pertains to buffer handling,
--                 and we've passed NULL as the buffer for simplicity.
--                 ENOENT is returned if appropriate before buffer handling.  */
--              file_failure (command_line_arg, _("reading directory %s"), name);
--            }
--          break;
--        }
--#endif
-       else
-         break;
- 
-diff --git a/tests/ls/removed-directory.sh b/tests/ls/removed-directory.sh
-index e8c835dab..fe8f929a1 100755
---- a/tests/ls/removed-directory.sh
-+++ b/tests/ls/removed-directory.sh
-@@ -26,20 +26,14 @@ case $host_triplet in
-   *) skip_ 'non linux kernel' ;;
- esac
- 
--LS_FAILURE=2
--
--cat <<\EOF >exp-err || framework_failure_
--ls: reading directory '.': No such file or directory
--EOF
--
- cwd=$(pwd)
- mkdir d || framework_failure_
- cd d || framework_failure_
- rmdir ../d || framework_failure_
- 
--returns_ $LS_FAILURE ls >../out 2>../err || fail=1
-+ls >../out 2>../err || fail=1
- cd "$cwd" || framework_failure_
- compare /dev/null out || fail=1
--compare exp-err err || fail=1
-+compare /dev/null err || fail=1
- 
- Exit $fail
--- 
-2.17.1
-
diff --git a/package/coreutils/0002-m4-pthread-cond.m4-fix-build-without-threads.patch b/package/coreutils/0002-m4-pthread-cond.m4-fix-build-without-threads.patch
deleted file mode 100644
index 86e6f80d90..0000000000
--- a/package/coreutils/0002-m4-pthread-cond.m4-fix-build-without-threads.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 7622a0a4c6309f9cecaeef72569da687eb5b6b93 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 5 Apr 2021 01:13:29 +0200
-Subject: [PATCH] pthread-cond: Fix wrong configure results when <pthread.h> is
- absent.
-
-* m4/pthread-cond.m4 (gl_PTHREAD_COND): When <pthread.h> does not exist,
-set HAVE_PTHREAD_COND_* to 0, not to 1.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[yann.morin.1998@free.fr:
-  - backport from upstream gnulib
-  - drop upstream's Changelog hunk
-  - reisntate Fabrice's SoB
-]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
-
----
- m4/pthread-cond.m4 | 18 +++++++++---------
- 2 files changed, 15 insertions(+), 9 deletions(-)
-
-diff --git a/m4/pthread-cond.m4 b/m4/pthread-cond.m4
-index 75e37c6138..8922a8a243 100644
---- a/m4/pthread-cond.m4
-+++ b/m4/pthread-cond.m4
-@@ -1,5 +1,5 @@
--# pthread-cond.m4 serial 1
--dnl Copyright (C) 2019-2020 Free Software Foundation, Inc.
-+# pthread-cond.m4 serial 2
-+dnl Copyright (C) 2019-2021 Free Software Foundation, Inc.
- dnl This file is free software; the Free Software Foundation
- dnl gives unlimited permission to copy and/or distribute it,
- dnl with or without modifications, as long as this notice is preserved.
-@@ -23,14 +23,14 @@ AC_DEFUN([gl_PTHREAD_COND],
-     REPLACE_PTHREAD_COND_DESTROY=1
-   else
-     if test $HAVE_PTHREAD_H = 0; then
--      HAVE_PTHREAD_COND_INIT=1
--      HAVE_PTHREAD_CONDATTR_INIT=1
--      HAVE_PTHREAD_CONDATTR_DESTROY=1
--      HAVE_PTHREAD_COND_WAIT=1
--      HAVE_PTHREAD_COND_TIMEDWAIT=1
--      HAVE_PTHREAD_COND_SIGNAL=1
--      HAVE_PTHREAD_COND_BROADCAST=1
--      HAVE_PTHREAD_COND_DESTROY=1
-+      HAVE_PTHREAD_COND_INIT=0
-+      HAVE_PTHREAD_CONDATTR_INIT=0
-+      HAVE_PTHREAD_CONDATTR_DESTROY=0
-+      HAVE_PTHREAD_COND_WAIT=0
-+      HAVE_PTHREAD_COND_TIMEDWAIT=0
-+      HAVE_PTHREAD_COND_SIGNAL=0
-+      HAVE_PTHREAD_COND_BROADCAST=0
-+      HAVE_PTHREAD_COND_DESTROY=0
-     fi
-   fi
- ])
--- 
-2.30.2
-
diff --git a/package/coreutils/0003-lib-pthread-cond.c-use-tv.nsec-instead-of-tv.usec.patch b/package/coreutils/0003-lib-pthread-cond.c-use-tv.nsec-instead-of-tv.usec.patch
deleted file mode 100644
index e1cdccf07c..0000000000
--- a/package/coreutils/0003-lib-pthread-cond.c-use-tv.nsec-instead-of-tv.usec.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 67610020ce7c321678ef59af95fde0483e8e8149 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 4 Apr 2021 21:09:19 +0200
-Subject: [PATCH] lib/pthread-cond.c: use tv.nsec instead of tv.usec
-
-Use tv.nsec instead of tv.usec to avoid the following build failure:
-
-lib/pthread-cond.c: In function 'pthread_cond_wait':
-lib/pthread-cond.c:121:16: error: 'struct timespec' has no member named 'tv_usec'; did you mean 'tv_sec'?
-  121 |       duration.tv_usec = 0;
-      |                ^~~~~~~
-      |                tv_sec
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[upstream status: https://lists.gnu.org/archive/html/bug-gnulib/2021-04/msg00044.html]
----
- lib/pthread-cond.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/pthread-cond.c b/lib/pthread-cond.c
-index baa7c60bb..c2c00be03 100644
---- a/lib/pthread-cond.c
-+++ b/lib/pthread-cond.c
-@@ -118,7 +118,7 @@ pthread_cond_wait (pthread_cond_t *cond _GL_UNUSED,
-       struct timespec duration;
- 
-       duration.tv_sec = 86400;
--      duration.tv_usec = 0;
-+      duration.tv_nsec = 0;
-       nanosleep (&duration, NULL);
-     }
- }
--- 
-2.30.2
-
diff --git a/package/coreutils/coreutils.hash b/package/coreutils/coreutils.hash
index 54cdf4c551..758a6341a3 100644
--- a/package/coreutils/coreutils.hash
+++ b/package/coreutils/coreutils.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256 4458d8de7849df44ccab15e16b1548b285224dbba5f08fac070c1c0e0bcc4cfa  coreutils-8.32.tar.xz
+sha256 ce30acdf4a41bc5bb30dd955e9eaa75fa216b4e3deb08889ed32433c7b3b97ce  coreutils-9.0.tar.xz
 # Locally computed
 sha256 3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 3ec3c847c2..ac2bf07d45 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COREUTILS_VERSION = 8.32
+COREUTILS_VERSION = 9.0
 COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
 COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 COREUTILS_LICENSE = GPL-3.0+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
