Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBFDC0015E
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 19:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E70741F52;
	Thu, 27 Jul 2023 19:22:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E70741F52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SvwLcZtxxjfM; Thu, 27 Jul 2023 19:22:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE2CF41F9B;
	Thu, 27 Jul 2023 19:22:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE2CF41F9B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B616D1BF406
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 19:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F8FD83BC7
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 19:22:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F8FD83BC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jPeGI5jNEeqw for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 19:22:24 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D52F783BBF
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 19:22:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D52F783BBF
Received: from fli4l.lan.fli4l (p54a1bcc1.dip0.t-ipconnect.de [84.161.188.193])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7FD67A4C07EA
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 21:22:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53210)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qP6Z1-0006zX-0b
 for buildroot@buildroot.org; Thu, 27 Jul 2023 21:22:19 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 27 Jul 2023 21:22:19 +0200
Message-Id: <20230727192219.1634755-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690485739;
 bh=URGATb/qD0FOEB/jeYOLZlXUamDADwJwJ3xQ61PSZac=;
 h=From:To:Subject:Date:From;
 b=nqYOl93Zs1aF3oe24vovuH0bDbT6gdQH7zEWlWLACtNfssLwYMcWsfdBAWSZYOK/E
 BBhzZsmYGal9iho4zLq+yH0Wdme0GNrwk9kXz3KRCuI8zQXvnSqIXW+vPAjSY10dht
 Z7b17DtHWxEBXyUN67VG+/3LwsTuDOJ0elDii40YEIVoGlbOCpq5LIg/wnojWBypQf
 DLrirYmYwoUnEkSvMczBJfn2aQe9xDOL0ApEExWwemFipYNyy7zmypDp6FCv7FIEQV
 GXPsEAA04Iyb+eTwuIRLVJND0KFfAHJYyY0M6gnusLfCLiyIHL2YKgdl2zwVNl24E+
 gYkyom2s0zs4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=nqYOl93Z
Subject: [Buildroot] [PATCH 1/1] package/make: bump version to 4.4.1
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

Removed all patches, they are included in this release.

Release notes:
https://lists.gnu.org/archive/html/info-gnu/2023-02/msg00011.html
https://lists.gnu.org/archive/html/info-gnu/2022-10/msg00008.html
https://lists.gnu.org/archive/html/info-gnu/2020-01/msg00004.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  2 -
 ...pport-GLIBC-glob-interface-version-2.patch | 31 --------
 ...b-Do-not-assume-glibc-glob-internals.patch | 70 -------------------
 package/make/make.hash                        |  8 +--
 package/make/make.mk                          |  7 +-
 5 files changed, 6 insertions(+), 112 deletions(-)
 delete mode 100644 package/make/0001-configure.ac-Support-GLIBC-glob-interface-version-2.patch
 delete mode 100644 package/make/0001-glob-Do-not-assume-glibc-glob-internals.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 9e6cb3eda9..9ab28b423d 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -920,8 +920,6 @@ package/madplay/0001-switch-to-new-alsa-api.patch Sob Upstream
 package/madplay/0002-configure-ac-automake-foreign.patch Upstream
 package/madplay/0003-configure-ac-use-pkg-config-to-find-id3tag.patch Upstream
 package/madplay/0004-configure-ac-call-AM_MKINSTALLDIRS.patch Upstream
-package/make/0001-configure.ac-Support-GLIBC-glob-interface-version-2.patch Upstream
-package/make/0001-glob-Do-not-assume-glibc-glob-internals.patch Upstream
 package/makedumpfile/0002-Handle-__mips64.patch Upstream
 package/mariadb/0001-add-extra-check-for-librt.patch Upstream
 package/mariadb/S97mysqld Indent Shellcheck Variables
diff --git a/package/make/0001-configure.ac-Support-GLIBC-glob-interface-version-2.patch b/package/make/0001-configure.ac-Support-GLIBC-glob-interface-version-2.patch
deleted file mode 100644
index 62e67f850a..0000000000
--- a/package/make/0001-configure.ac-Support-GLIBC-glob-interface-version-2.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 48c8a116a914a325a0497721f5d8b58d5bba34d4 Mon Sep 17 00:00:00 2001
-From: Paul Smith <psmith@gnu.org>
-Date: Sun, 19 Nov 2017 15:09:16 -0500
-Subject: [PATCH] * configure.ac: Support GLIBC glob interface version 2
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit 48c8a116a914a3
-
- configure.ac | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 8c72568cf276..4710832ae568 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -404,10 +404,9 @@ AC_CACHE_CHECK([if system libc has GNU glob], [make_cv_sys_gnu_glob],
- #include <glob.h>
- #include <fnmatch.h>
- 
--#define GLOB_INTERFACE_VERSION 1
- #if !defined _LIBC && defined __GNU_LIBRARY__ && __GNU_LIBRARY__ > 1
- # include <gnu-versions.h>
--# if _GNU_GLOB_INTERFACE_VERSION == GLOB_INTERFACE_VERSION
-+# if _GNU_GLOB_INTERFACE_VERSION == 1 || _GNU_GLOB_INTERFACE_VERSION == 2
-    gnu glob
- # endif
- #endif],
--- 
-2.16.2
-
diff --git a/package/make/0001-glob-Do-not-assume-glibc-glob-internals.patch b/package/make/0001-glob-Do-not-assume-glibc-glob-internals.patch
deleted file mode 100644
index 33ded3c501..0000000000
--- a/package/make/0001-glob-Do-not-assume-glibc-glob-internals.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 193f1e81edd6b1b56b0eb0ff8aa4b41c7b4257b4 Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Sun, 24 Sep 2017 09:12:58 -0400
-Subject: [PATCH] glob: Do not assume glibc glob internals.
-
-It has been proposed that glibc glob start using gl_lstat,
-which the API allows it to do.  GNU 'make' should not get in
-the way of this.  See:
-https://sourceware.org/ml/libc-alpha/2017-09/msg00409.html
-
-* dir.c (local_lstat): New function, like local_stat.
-(dir_setup_glob): Use it to initialize gl_lstat too, as the API
-requires.
-
-Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
-(from upstream commit 193f1e81edd6b1b56b0eb0ff8aa4b41c7b4257b4)
----
- dir.c | 29 +++++++++++++++++++++++++++--
- 1 file changed, 27 insertions(+), 2 deletions(-)
-
-diff --git a/dir.c b/dir.c
-index adbb8a9..c343e4c 100644
---- a/dir.c
-+++ b/dir.c
-@@ -1299,15 +1299,40 @@ local_stat (const char *path, struct stat *buf)
- }
- #endif
- 
-+/* Similarly for lstat.  */
-+#if !defined(lstat) && !defined(WINDOWS32) || defined(VMS)
-+# ifndef VMS
-+#  ifndef HAVE_SYS_STAT_H
-+int lstat (const char *path, struct stat *sbuf);
-+#  endif
-+# else
-+    /* We are done with the fake lstat.  Go back to the real lstat */
-+#   ifdef lstat
-+#     undef lstat
-+#   endif
-+# endif
-+# define local_lstat lstat
-+#elif defined(WINDOWS32)
-+/* Windows doesn't support lstat().  */
-+# define local_lstat local_stat
-+#else
-+static int
-+local_lstat (const char *path, struct stat *buf)
-+{
-+  int e;
-+  EINTRLOOP (e, lstat (path, buf));
-+  return e;
-+}
-+#endif
-+
- void
- dir_setup_glob (glob_t *gl)
- {
-   gl->gl_opendir = open_dirstream;
-   gl->gl_readdir = read_dirstream;
-   gl->gl_closedir = free;
-+  gl->gl_lstat = local_lstat;
-   gl->gl_stat = local_stat;
--  /* We don't bother setting gl_lstat, since glob never calls it.
--     The slot is only there for compatibility with 4.4 BSD.  */
- }
- 
- void
--- 
-2.21.0
-
diff --git a/package/make/make.hash b/package/make/make.hash
index 0bd0e5546f..07d91e7baa 100644
--- a/package/make/make.hash
+++ b/package/make/make.hash
@@ -1,6 +1,6 @@
-# From http://lists.gnu.org/archive/html/info-gnu/2016-06/msg00005.html
-md5  15b012617e7c44c0ed482721629577ac  make-4.2.1.tar.bz2
+# From https://lists.gnu.org/archive/html/info-gnu/2023-02/msg00011.html
+md5  c8b13b7477e812d4213a9b88ff0ff1d6  make-4.4.1.tar.lz
 # Locally calculated after checking signature
-sha256  d6e262bf3601b42d2b1e4ef8310029e1dcf20083c5446b4b7aa67081fdffc589  make-4.2.1.tar.bz2
+sha256  8814ba072182b605d156d7589c19a43b89fc58ea479b9355146160946f8cf6e9  make-4.4.1.tar.lz
 # Locally computed
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
diff --git a/package/make/make.mk b/package/make/make.mk
index f289c5c3d9..e194e15873 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -4,17 +4,14 @@
 #
 ################################################################################
 
-MAKE_VERSION = 4.2.1
-MAKE_SOURCE = make-$(MAKE_VERSION).tar.bz2
+MAKE_VERSION = 4.4.1
+MAKE_SOURCE = make-$(MAKE_VERSION).tar.lz
 MAKE_SITE = $(BR2_GNU_MIRROR)/make
 MAKE_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-pkgconf
 MAKE_LICENSE = GPL-3.0+
 MAKE_LICENSE_FILES = COPYING
 MAKE_CPE_ID_VENDOR = gnu
 
-# Patching configure.ac
-MAKE_AUTORECONF = YES
-
 MAKE_CONF_OPTS = --without-guile
 
 # Disable the 'load' operation for static builds since it needs dlopen
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
