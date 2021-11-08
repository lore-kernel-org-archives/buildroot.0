Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EAFBC433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 13:42:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5FFA61503
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 13:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B5FFA61503
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 720C0402AF;
	Mon,  8 Nov 2021 13:42:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QoCZWRNVtLU1; Mon,  8 Nov 2021 13:42:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76705402B8;
	Mon,  8 Nov 2021 13:42:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4AAEF1BF331
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 13:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3ABE540231
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 13:41:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G_W5vF8PxU-R for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 13:41:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97004401CC
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 13:41:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1CA428B67A; Mon,  8 Nov 2021 13:38:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 14:15:06 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 76d7b6991c04ec43a127210d32e09608987325d6
X-Git-Newrev: 486ff457b6d4b48fa0bb5e5f3b9846447f280d10
X-Patchwork-Hint: ignore
Message-Id: <20211108133806.1CA428B67A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/exiv2: security
 bump to version 0.27.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=486ff457b6d4b48fa0bb5e5f3b9846447f280d10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix CVE-2021-32815, CVE-2021-34334, CVE-2021-34335, CVE-2021-37615,
CVE-2021-37616, CVE-2021-37618, CVE-2021-37619, CVE-2021-37620,
CVE-2021-37621, CVE-2021-37622 and CVE-2021-37623

https://github.com/Exiv2/exiv2/releases/tag/v0.27.5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2bffe699cbe76fe23f389e843ab1f340003c8b3c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exiv2/exiv2.hash | 2 +-
 package/exiv2/exiv2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/exiv2/exiv2.hash b/package/exiv2/exiv2.hash
index c9af674a51..a405d2611b 100644
--- a/package/exiv2/exiv2.hash
+++ b/package/exiv2/exiv2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  84366dba7c162af9a7603bcd6c16f40fe0e9af294ba2fd2f66ffffb9fbec904e  exiv2-0.27.4-Source.tar.gz
+sha256  35a58618ab236a901ca4928b0ad8b31007ebdc0386d904409d825024e45ea6e2  exiv2-0.27.5-Source.tar.gz
 sha256  a7ba75cb966aca374711e2af49e5f3aea6a4443a803440f5d93e73a5a1222f66  COPYING
diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
index 33222e6381..2a91c71c8f 100644
--- a/package/exiv2/exiv2.mk
+++ b/package/exiv2/exiv2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIV2_VERSION = 0.27.4
+EXIV2_VERSION = 0.27.5
 EXIV2_SOURCE = exiv2-$(EXIV2_VERSION)-Source.tar.gz
 EXIV2_SITE = https://exiv2.org/builds
 EXIV2_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
