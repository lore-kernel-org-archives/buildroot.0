Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 376ECC77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 14:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2FA461108;
	Sat,  6 May 2023 14:42:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2FA461108
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f50IXFA0RlmV; Sat,  6 May 2023 14:42:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDCE36110B;
	Sat,  6 May 2023 14:42:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDCE36110B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 778C81BF859
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 14:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECD1141FDF
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 14:41:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECD1141FDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aFjla8CSapQD for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 14:41:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4D7541F8F
 for <buildroot@buildroot.org>; Sat,  6 May 2023 14:41:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4D7541F8F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F0E685DB9; Sat,  6 May 2023 14:41:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 6 May 2023 16:22:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9507e5a4b495716aa8e91211691f62223b883276
X-Git-Newrev: 2d7cfd49ba9f5e009f694692cb21077e208e7d55
X-Patchwork-Hint: ignore
Message-Id: <20230506144102.6F0E685DB9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/valgrind: bump version to 3.20.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=2d7cfd49ba9f5e009f694692cb21077e208e7d55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- remove 0003-coregrind-fix-compilation-for-uclibc.patch
  (from upstream [1]) and drop AUTORECONF

For details see [2].

[1] https://sourceware.org/git/?p=valgrind.git;a=commit;h=9c9fd9ae24b45f915f0759d32f662835c26d37c3
[2] https://www.valgrind.org/docs/manual/dist.news.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...0003-coregrind-fix-compilation-for-uclibc.patch | 65 ----------------------
 package/valgrind/valgrind.hash                     |  4 +-
 package/valgrind/valgrind.mk                       |  4 +-
 3 files changed, 3 insertions(+), 70 deletions(-)

diff --git a/package/valgrind/0003-coregrind-fix-compilation-for-uclibc.patch b/package/valgrind/0003-coregrind-fix-compilation-for-uclibc.patch
deleted file mode 100644
index ff8dc974d8..0000000000
--- a/package/valgrind/0003-coregrind-fix-compilation-for-uclibc.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 9c9fd9ae24b45f915f0759d32f662835c26d37c3 Mon Sep 17 00:00:00 2001
-From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Date: Fri, 8 Apr 2022 12:36:33 +0200
-Subject: [PATCH] coregrind: fix compilation for uclibc
-
-It fixes a known iusse whose details are described at [1] and more
-generally it guarantees that Valgrind is properly compiled for ulibc.
-
-[1] https://www.mail-archive.com/valgrind-users@lists.sourceforge.net/msg05295.html
-
-Suggested-by Michael Trimarchi <michael@amarulasolutions.com>
-Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
----
- configure.ac                        | 2 ++
- coregrind/m_debuginfo/minilzo-inl.c | 4 ++++
- coregrind/vg_preloaded.c            | 4 ++++
- 3 files changed, 10 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 6f51dfd9f8fb..c627a9c17a4a 100755
---- a/configure.ac
-+++ b/configure.ac
-@@ -1204,6 +1204,8 @@ AC_SUBST(DEFAULT_SUPP)
- AC_CHECK_HEADER([features.h])
- 
- if test x$ac_cv_header_features_h = xyes; then
-+  AC_DEFINE([HAVE_HEADER_FEATURES_H], 1,
-+          [Define to 1 if you have the `features.h' header.])
-   rm -f conftest.$ac_ext
-   cat <<_ACEOF >conftest.$ac_ext
- #include <features.h>
-diff --git a/coregrind/m_debuginfo/minilzo-inl.c b/coregrind/m_debuginfo/minilzo-inl.c
-index 153d008fd44f..b45ec92eaa85 100644
---- a/coregrind/m_debuginfo/minilzo-inl.c
-+++ b/coregrind/m_debuginfo/minilzo-inl.c
-@@ -1875,6 +1875,10 @@ extern "C" {
- 
- #endif
- 
-+#ifdef HAVE_HEADER_FEATURES_H
-+#include <features.h>
-+#endif
-+
- #undef LZO_HAVE_CONFIG_H
- #include "minilzo.h"
- 
-diff --git a/coregrind/vg_preloaded.c b/coregrind/vg_preloaded.c
-index 5e2098390847..3809811aede7 100644
---- a/coregrind/vg_preloaded.c
-+++ b/coregrind/vg_preloaded.c
-@@ -45,6 +45,10 @@
- #include "pub_core_debuginfo.h"  // Needed for pub_core_redir.h
- #include "pub_core_redir.h"      // For VG_NOTIFY_ON_LOAD
- 
-+#ifdef HAVE_HEADER_FEATURES_H
-+#include <features.h>
-+#endif
-+
- #if defined(VGO_linux) || defined(VGO_solaris) || defined(VGO_freebsd)
- 
- /* ---------------------------------------------------------------------
--- 
-2.32.0
-
diff --git a/package/valgrind/valgrind.hash b/package/valgrind/valgrind.hash
index 8487c07e42..83717f26f3 100644
--- a/package/valgrind/valgrind.hash
+++ b/package/valgrind/valgrind.hash
@@ -1,7 +1,7 @@
 # From https://valgrind.org/downloads/current.html
-md5  4687a4990585a038c52f842448ef4e63  valgrind-3.19.0.tar.bz2
+md5  e3ca8e03c6c527e80e7da5135a1b6beb  valgrind-3.20.0.tar.bz2
 # locally computed
-sha256  dd5e34486f1a483ff7be7300cc16b4d6b24690987877c3278d797534d6738f02  valgrind-3.19.0.tar.bz2
+sha256  8536c031dbe078d342f121fa881a9ecd205cb5a78e639005ad570011bdb9f3c6  valgrind-3.20.0.tar.bz2
 
 # License files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 17b131c3ec..98beb7ffef 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VALGRIND_VERSION = 3.19.0
+VALGRIND_VERSION = 3.20.0
 VALGRIND_SITE = https://sourceware.org/pub/valgrind
 VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPL-2.0, GFDL-1.2
@@ -14,8 +14,6 @@ VALGRIND_CONF_OPTS = \
 	--disable-ubsan \
 	--without-mpicc
 VALGRIND_INSTALL_STAGING = YES
-# 0003-coregrind-fix-compilation-for-uclibc.patch
-VALGRIND_AUTORECONF=YES
 
 # Valgrind must be compiled with no stack protection, so forcefully
 # pass -fno-stack-protector to override what Buildroot may have in
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
