Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70EBC28B28
	for <buildroot@archiver.kernel.org>; Sat, 15 Mar 2025 20:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60F55408CC;
	Sat, 15 Mar 2025 20:50:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id noke9WfBCTFL; Sat, 15 Mar 2025 20:50:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29F5740B80
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29F5740B80;
	Sat, 15 Mar 2025 20:50:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D88E461
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 20:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7BE540477
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 20:50:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pXhJq5pwvyHg for <buildroot@buildroot.org>;
 Sat, 15 Mar 2025 20:50:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E5A6400D2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E5A6400D2
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 20:50:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7977587FFF; Sat, 15 Mar 2025 20:50:31 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Mar 2025 21:45:36 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 022f49618cab99f7d944bf6608578ae4a5f543b3
X-Git-Newrev: 1b81b594a9afaf88113d3411a54b8853845153f0
X-Patchwork-Hint: ignore
Message-Id: <20250315205031.7977587FFF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/catatonit: update to
 version 0.2.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b81b594a9afaf88113d3411a54b8853845153f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Christian Stewart <christian@aperture.us>
Tested-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../catatonit/0001-fix-build-with-kernel-5.9.patch | 49 ----------------------
 package/catatonit/catatonit.hash                   |  2 +-
 package/catatonit/catatonit.mk                     |  2 +-
 3 files changed, 2 insertions(+), 51 deletions(-)

diff --git a/package/catatonit/0001-fix-build-with-kernel-5.9.patch b/package/catatonit/0001-fix-build-with-kernel-5.9.patch
deleted file mode 100644
index 37def8e546..0000000000
--- a/package/catatonit/0001-fix-build-with-kernel-5.9.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 65e1b96bd40cb14b3729ac56bb9f1fcb77254403 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 1 Nov 2022 14:16:01 +0100
-Subject: [PATCH] fix build with kernel < 5.9
-
-linux/close_range.h is only available since kernel 5.9 and
-https://github.com/torvalds/linux/commit/60997c3d45d9a67daf01c56d805ae4fec37e0bd8
-resulting in the following build failure:
-
-catatonit.c:39:11: fatal error: linux/close_range.h: No such file or directory
-   39 | # include <linux/close_range.h>
-      |           ^~~~~~~~~~~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/ed9a847905083175c7fcb2f2df28f9ac5b9c3313
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/openSUSE/catatonit/commit/663ad1670689143f65af3a288f90cecb7feed54f
----
- catatonit.c  | 2 +-
- configure.ac | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/catatonit.c b/catatonit.c
-index a33f4cd..b10d9b0 100644
---- a/catatonit.c
-+++ b/catatonit.c
-@@ -36,7 +36,7 @@
- #include <limits.h>
- #include <dirent.h>
- 
--#ifdef HAVE_CLOSE_RANGE
-+#ifdef HAVE_LINUX_CLOSE_RANGE_H
- # include <linux/close_range.h>
- #else
- # include <sys/syscall.h>
-diff --git a/configure.ac b/configure.ac
-index 69e89f0..b37f146 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -24,7 +24,7 @@ LT_PREREQ([2.4.2])
- LT_INIT([disable-shared])
- 
- AC_CHECK_HEADERS([errno.h fcntl.h signal.h stdarg.h stdio.h stdlib.h unistd.h])
--AC_CHECK_HEADERS([sys/prctl.h sys/signalfd.h sys/stat.h sys/types.h sys/wait.h])
-+AC_CHECK_HEADERS([linux/close_range.h sys/prctl.h sys/signalfd.h sys/stat.h sys/types.h sys/wait.h])
- 
- AC_CHECK_FUNCS([close_range])
- 
diff --git a/package/catatonit/catatonit.hash b/package/catatonit/catatonit.hash
index 9940309c76..7b13100a33 100644
--- a/package/catatonit/catatonit.hash
+++ b/package/catatonit/catatonit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d0cf1feffdc89c9fb52af20fc10127887a408bbd99e0424558d182b310a3dc92  catatonit-0.2.0.tar.gz
+sha256  771385049516fdd561fbb9164eddf376075c4c7de3900a8b18654660172748f1  catatonit-0.2.1.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/catatonit/catatonit.mk b/package/catatonit/catatonit.mk
index a308ea6471..aa7e60f697 100644
--- a/package/catatonit/catatonit.mk
+++ b/package/catatonit/catatonit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CATATONIT_VERSION = 0.2.0
+CATATONIT_VERSION = 0.2.1
 CATATONIT_SITE = $(call github,openSUSE,catatonit,v$(CATATONIT_VERSION))
 CATATONIT_LICENSE = GPL-2.0+
 CATATONIT_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
