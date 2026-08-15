Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC6DC5CFC1
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 22:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10D4F80E0B;
	Sat, 15 Aug 2026 22:09:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DPRGJn7HSAVf; Sat, 15 Aug 2026 22:09:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEF1880DD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786831787;
	bh=ZOC2X7+l7+wLJP4CFcA71Q3jSjuzrMhRBlZZXWi7DJs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pXNHBLztejwES8nmmHg66s8OSHBfGFODaEGMs/bE/IbWxV0GWGd8zgwttWzSs3f16
	 Rv5XBtlX0+SiXITZW53/dJjU9AaQjKE2lnH77WhKwoyESAdW1/KbBbkUCNE0LYW+oF
	 ywjkGZreL3UbcjFRyheLynhO7oYtwLVd/kO5WD+GbO44hmLGrB44mzuF1pBdVs1yCS
	 kwAO4tu/k9YAtihyvezmBqjLLdtrSWE0g93SJRYC2iTowu1KPuSK0vcB2R2ehLQsAQ
	 qIws92WM6a+hmemPOdU4z11oJWmcc3btmVDqz18htZZ8z8kguzU/LfHOhR8brAp39k
	 uxAsSeijD31oA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEF1880DD8;
	Sat, 15 Aug 2026 22:09:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D4288337
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 22:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA9B0400D8
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 22:09:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i34V0xJAb8Tv for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 22:09:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5963400D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5963400D1
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 22:09:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 20CA78D9C8; Sat, 15 Aug 2026 22:08:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 16 Aug 2026 00:04:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1d132d04fc0ecac014be003b7e1662c47672328b
X-Git-Newrev: f187644e0029e511572225991029a49f97da81fa
X-Patchwork-Hint: ignore
Message-Id: <20260815220855.20CA78D9C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/harfbuzz: bump version to 14.3.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f187644e0029e511572225991029a49f97da81fa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/harfbuzz/harfbuzz/blob/14.3.1/NEWS

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index c9739b2b92..3d7540f788 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,4 +1,4 @@
-# From https://github.com/harfbuzz/harfbuzz/releases/tag/14.2.1
-sha256  a54a5d8e9380a41fbb762ce367bcbf7704792dfca0d93f1bbca86c5a57902e0e  harfbuzz-14.2.1.tar.xz
+# From https://github.com/harfbuzz/harfbuzz/releases/tag/14.3.1
+sha256  9dae9538aae2ffdf70cec31f2c27bf68e2aaeeae3112688467697d5faf6194f7  harfbuzz-14.3.1.tar.xz
 # Locally computed
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index d87d2c41bf..909629d7d0 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 14.2.1
+HARFBUZZ_VERSION = 14.3.1
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
