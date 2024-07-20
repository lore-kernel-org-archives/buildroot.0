Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24DCC3DA59
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 21:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB01D4059A;
	Sat, 20 Jul 2024 21:09:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v62bMMUto1Ij; Sat, 20 Jul 2024 21:09:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0AF440509
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0AF440509;
	Sat, 20 Jul 2024 21:09:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B7DD11BF2C7
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3D8D4044B
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:08:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aT__lP6u3D8G for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 21:08:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EB42400D8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EB42400D8
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 21:08:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 32D1186EA2; Sat, 20 Jul 2024 21:08:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 23:07:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33d25f08f97450cea7a415582dc2110b2bc828c2
X-Git-Newrev: da45ae33040a55d9eaa6a05c75c5e7f24fe73cf4
X-Patchwork-Hint: ignore
Message-Id: <20240720210857.32D1186EA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liburing: bump to version 2.6
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=da45ae33040a55d9eaa6a05c75c5e7f24fe73cf4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version)
- Update hash of README (typo fixed with
  https://github.com/axboe/liburing/commit/2c89b57f3d55b2e3098a629e8aabe659fd5ec138)

https://github.com/axboe/liburing/blob/liburing-2.6/CHANGELOG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-src-arch-aarch64-fix-uclibc-build.patch   | 39 ----------------------
 package/liburing/liburing.hash                     |  4 +--
 package/liburing/liburing.mk                       |  2 +-
 3 files changed, 3 insertions(+), 42 deletions(-)

diff --git a/package/liburing/0001-src-arch-aarch64-fix-uclibc-build.patch b/package/liburing/0001-src-arch-aarch64-fix-uclibc-build.patch
deleted file mode 100644
index 4468105e4f..0000000000
--- a/package/liburing/0001-src-arch-aarch64-fix-uclibc-build.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From f03f8da34fe96ac35a916ca3058b0f41971eae3b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 16 Feb 2024 18:59:42 +0100
-Subject: [PATCH] src/arch/aarch64: fix uclibc build
-
-Fix the following build failure with uclibc-ng raised since version 2.3
-and
-https://github.com/axboe/liburing/commit/c6bc86e2125bcd6fa10ff2b128cd86486acadff6:
-
-In file included from lib.h:12,
-                 from setup.c:4:
-arch/aarch64/lib.h:7:10: fatal error: sys/auxv.h: No such file or directory
-    7 | #include <sys/auxv.h>
-      |          ^~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/cc44d714c9267dd7a98debeb8c81c4ee1efe4ebb
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/axboe/liburing/commit/32f9c27a76c43627f79bb77469d2da8583e4d3df
----
- src/arch/aarch64/lib.h | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/src/arch/aarch64/lib.h b/src/arch/aarch64/lib.h
-index 3b701b1..41bcfc9 100644
---- a/src/arch/aarch64/lib.h
-+++ b/src/arch/aarch64/lib.h
-@@ -4,7 +4,6 @@
- #define LIBURING_ARCH_AARCH64_LIB_H
- 
- #include <elf.h>
--#include <sys/auxv.h>
- #include "../../syscall.h"
- 
- static inline long __get_page_size(void)
--- 
-2.43.0
-
diff --git a/package/liburing/liburing.hash b/package/liburing/liburing.hash
index 30458c6b9f..f06dd187a7 100644
--- a/package/liburing/liburing.hash
+++ b/package/liburing/liburing.hash
@@ -1,8 +1,8 @@
 # Locally calculated
-sha256  319ff9096a5655362a9741c5145b45494db810e38679a1de82e2f440c17181a6  liburing-2.5.tar.bz2
+sha256  78bcc0dc0d004a238d8b5f597adbb4ec74926352a3983b872db7f0efdb72565d  liburing-2.6.tar.bz2
 
 # Hash for license files
 sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL
 sha256  2ec12f7934cdfce25ff72b0557738989d79fc7a496d1cf9b2d3f9464fd61edbe  LICENSE
-sha256  51e124279343177cb3c214ffddc011f1355b6eba0bbefca4f4c41fbc56574c92  README
+sha256  b0731ca09e6f4718d456a989d32b6c61bf27e5d4bab6ca31e409d75c5120d19e  README
diff --git a/package/liburing/liburing.mk b/package/liburing/liburing.mk
index 2c448d6a87..fc3993b38c 100644
--- a/package/liburing/liburing.mk
+++ b/package/liburing/liburing.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURING_VERSION = 2.5
+LIBURING_VERSION = 2.6
 LIBURING_SOURCE = liburing-$(LIBURING_VERSION).tar.bz2
 LIBURING_SITE = https://git.kernel.dk/cgit/liburing/snapshot
 LIBURING_LICENSE = (GPL-2.0 with exceptions and LGPL-2.1+) or MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
