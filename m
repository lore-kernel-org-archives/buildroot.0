Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD49AC433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:28:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EC4D61056
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4EC4D61056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BAE04021F;
	Wed, 13 Oct 2021 18:28:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XXFSW1jeoxNi; Wed, 13 Oct 2021 18:28:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8018F40482;
	Wed, 13 Oct 2021 18:28:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 39A3F1BF38C
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CA304052A
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:27:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CRTfCc6gPiuJ for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 18:27:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6306340155
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 18:27:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C203B955F7; Wed, 13 Oct 2021 18:24:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 13 Oct 2021 20:14:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c22790448d2558698d0ef38e26d011d767ce9f09
X-Git-Newrev: 2ee43bad85693d1c96e14f5b39ccb13a8982f50a
X-Patchwork-Hint: ignore
Message-Id: <20211013182444.C203B955F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/coreutils: bump version to 9.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ee43bad85693d1c96e14f5b39ccb13a8982f50a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...tore-8.31-behavior-on-removed-directories.patch | 118 ---------------------
 ...pthread-cond.m4-fix-build-without-threads.patch |  59 -----------
 ...ead-cond.c-use-tv.nsec-instead-of-tv.usec.patch |  35 ------
 package/coreutils/coreutils.hash                   |   2 +-
 package/coreutils/coreutils.mk                     |   4 +-
 5 files changed, 2 insertions(+), 216 deletions(-)

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
index 3ec3c847c2..6822c58a32 100644
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
@@ -14,8 +14,6 @@ COREUTILS_CPE_ID_VENDOR = gnu
 COREUTILS_IGNORE_CVES = CVE-2013-0221
 COREUTILS_IGNORE_CVES += CVE-2013-0222
 COREUTILS_IGNORE_CVES += CVE-2013-0223
-# We're patching m4/pthread-cond.m4
-COREUTILS_AUTORECONF = YES
 
 COREUTILS_CONF_OPTS = --disable-rpath \
 	$(if $(BR2_TOOLCHAIN_USES_MUSL),--with-included-regex)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
