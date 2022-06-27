Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDA5C43334
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 22:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 973FE81A29;
	Mon, 27 Jun 2022 22:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 973FE81A29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W7lo3Ax0BmD5; Mon, 27 Jun 2022 22:10:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA18981773;
	Mon, 27 Jun 2022 22:10:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA18981773
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2A7C01BF2F0
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0455840500
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:10:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0455840500
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MbcpTOot5knR for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 22:10:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23D3C4010C
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 22:10:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23D3C4010C
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BD7C087687; Mon, 27 Jun 2022 21:57:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 00:08:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 992afb85914b16cb2c053f5c056bbf975a02cc6f
X-Git-Newrev: 381a1af2dd63ffb9390c9747d5843846929a2dbb
X-Patchwork-Hint: ignore
Message-Id: <20220627215733.BD7C087687@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xmrig: bump version to 6.18.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=381a1af2dd63ffb9390c9747d5843846929a2dbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch, not needed anymore due to upstream removal of astrobwt:
https://github.com/xmrig/xmrig/commit/22d6a7525e0e5d117d2518906ae86adbc4e65be9

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-astrobwt-fix-build-with-gcc-4.8.patch     | 40 ----------------------
 package/xmrig/xmrig.hash                           |  2 +-
 package/xmrig/xmrig.mk                             |  2 +-
 3 files changed, 2 insertions(+), 42 deletions(-)

diff --git a/package/xmrig/0001-astrobwt-fix-build-with-gcc-4.8.patch b/package/xmrig/0001-astrobwt-fix-build-with-gcc-4.8.patch
deleted file mode 100644
index 694d7b203c..0000000000
--- a/package/xmrig/0001-astrobwt-fix-build-with-gcc-4.8.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 72234ae73590fa93d837034a3fb48b71eb071a2a Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sun, 22 May 2022 20:24:14 +0200
-Subject: [PATCH] astrobwt: fix build with gcc-4.8
-
-Fixes build error:
-
-xmrig-6.17.0/src/crypto/astrobwt/sort_indices2.cpp:40:24: error: missing binary operator before token "("
- #if __has_cpp_attribute(unlikely)
-
-found with the buildroot toolchain
-arm-none-linux-gnueabi-gcc (Sourcery CodeBench Lite 2014.05-29) 4.8.3 20140320 (prerelease)
-
-Inspired by
-https://reviews.llvm.org/rG91c32fd8c8fa395971a028f7091273fa2c8f44e6
-
-Patch sent upstream: https://github.com/xmrig/xmrig/pull/3057
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/crypto/astrobwt/sort_indices2.cpp | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/crypto/astrobwt/sort_indices2.cpp b/src/crypto/astrobwt/sort_indices2.cpp
-index 2d86d462..3a70f619 100644
---- a/src/crypto/astrobwt/sort_indices2.cpp
-+++ b/src/crypto/astrobwt/sort_indices2.cpp
-@@ -36,6 +36,9 @@
- #define RESTRICT
- #endif
- 
-+#ifndef __has_cpp_attribute
-+#define __has_cpp_attribute(x) 0
-+#endif
- 
- #if __has_cpp_attribute(unlikely)
- #define UNLIKELY(X) (X) [[unlikely]]
--- 
-2.30.2
-
diff --git a/package/xmrig/xmrig.hash b/package/xmrig/xmrig.hash
index 7863c0319d..5b9d4402b5 100644
--- a/package/xmrig/xmrig.hash
+++ b/package/xmrig/xmrig.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  748a989390202ba2d1ccbd9d9a6b8cbd6551149cbab63b347fd1ed6df0254faa  xmrig-6.17.0.tar.gz
+sha256  4531a31c0c095fcae18fdef0157f1e2a6694408abbcff6789c8f3cd6ab2c3ca0  xmrig-6.18.0.tar.gz
 sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
diff --git a/package/xmrig/xmrig.mk b/package/xmrig/xmrig.mk
index 6e21e550a4..40db428b56 100644
--- a/package/xmrig/xmrig.mk
+++ b/package/xmrig/xmrig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XMRIG_VERSION = 6.17.0
+XMRIG_VERSION = 6.18.0
 XMRIG_SITE = $(call github,xmrig,xmrig,v$(XMRIG_VERSION))
 XMRIG_LICENSE = GPL-3.0+
 XMRIG_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
