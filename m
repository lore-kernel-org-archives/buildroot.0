Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 529F5C433EF
	for <buildroot@archiver.kernel.org>; Mon, 28 Feb 2022 18:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11C2781416;
	Mon, 28 Feb 2022 18:49:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5YREE08GmcRd; Mon, 28 Feb 2022 18:49:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E204813E4;
	Mon, 28 Feb 2022 18:49:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 55E271BF5A7
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 18:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED6E9402AD
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 18:48:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RehiDhh5gWFX for <buildroot@lists.busybox.net>;
 Mon, 28 Feb 2022 18:48:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4888A40261
 for <buildroot@buildroot.org>; Mon, 28 Feb 2022 18:48:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A7BEF83611; Mon, 28 Feb 2022 18:40:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 28 Feb 2022 19:41:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 55f1d0a3592253df2a356c195e5131a970eade9b
X-Git-Newrev: 14e0c4de719a0d63192cc5de66a608f75297f37d
X-Patchwork-Hint: ignore
Message-Id: <20220228184000.A7BEF83611@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wolfssl: security bump to version
 5.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=14e0c4de719a0d63192cc5de66a608f75297f37d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2021-44718, CVE-2022-23408, CVE-2022-25638 and CVE-2022-25640

https://www.wolfssl.com/docs/security-vulnerabilities
https://github.com/wolfSSL/wolfssl/blob/v5.2.0-stable/ChangeLog.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wolfssl/wolfssl.hash | 2 +-
 package/wolfssl/wolfssl.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index 9896713ca7..63eebf93bb 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  50db45f348f47e00c93dd244c24108220120cb3cc9d01434789229c32937c444  wolfssl-4.8.1-stable.tar.gz
+sha256  409b4646c5f54f642de0e9f3544c3b83de7238134f5b1ff93fb44527bf119d05  wolfssl-5.2.0.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index d3dce0a401..bfb54445e4 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 4.8.1-stable
-WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION))
+WOLFSSL_VERSION = 5.2.0
+WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION)-stable)
 WOLFSSL_INSTALL_STAGING = YES
 
 WOLFSSL_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
