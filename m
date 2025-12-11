Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0376D43341
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C13C28221B;
	Thu, 11 Dec 2025 19:27:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zS3G1cs1MgHq; Thu, 11 Dec 2025 19:27:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCFA082391
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481275;
	bh=2nRSbP2n+4OmQouUri6DqIG3r2P++mghQ6fcPDlEBVc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iB30N+ONeexk0sGvsEivN1OsmYCz1/rxvEYsBP2uQzJYkcQvm98GOmprgbgReUGmb
	 yYciCr38Z54aD8rCvGS8gR2PO0Gy/ZRTtFL/3ws/afI3NTB4f4vqrzwvxXipuL+FMy
	 wsgLzFsvLUnbosQPfaBMVt2LtBJoocUIrQvGtKV8azrFx1kzwWxHUgVMFT6pAxAknb
	 UXwgKc6B9UTTTEsuU6iU/6YwQZ+2RFram8EiFm09U1GhKSxC9DKBwB63SQXcylF6pU
	 V9JfHhw0G9RZj3AdgxWCnSXO/fAsMzveUYKoWJ3gcwN0/RNTv6spDF+bBL/vuF+avp
	 /qp4MJ/TTA+Gw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCFA082391;
	Thu, 11 Dec 2025 19:27:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DE43DE7
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C25AB80B81
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xQNrSH89vxl7 for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:27:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0137680EBF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0137680EBF
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 006BF86B46; Thu, 11 Dec 2025 19:27:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 10:22:04 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e79d30584b54954719e8d39c0cda353de9286bcc
X-Git-Newrev: 081203958b871a677572a6e92fb8f2ab3ee2c6ae
X-Patchwork-Hint: ignore
Message-Id: <20251211192747.006BF86B46@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/mosh: update SITE
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=081203958b871a677572a6e92fb8f2ab3ee2c6ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Old URL returns 404, update SITE according to https://mosh.org/

Fixes:
https://autobuild.buildroot.net/results/c1c/c1cf4568c82deb118aad0171bda356c7f59f17dd/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9c12266739c52b0754ad1e185307273faa851b0d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mosh/mosh.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mosh/mosh.mk b/package/mosh/mosh.mk
index 3c41a17401..bc1f382a9f 100644
--- a/package/mosh/mosh.mk
+++ b/package/mosh/mosh.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MOSH_VERSION = 1.4.0
-MOSH_SITE = https://mosh.org
+MOSH_SITE = https://github.com/mobile-shell/mosh/releases/download/mosh-$(MOSH_VERSION)
 MOSH_DEPENDENCIES = zlib ncurses protobuf host-pkgconf
 MOSH_LICENSE = GPL-3.0+ with exception
 MOSH_LICENSE_FILES = COPYING COPYING.iOS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
