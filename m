Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CB9D3E79C
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 08:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3273640BE3;
	Thu, 11 Dec 2025 08:28:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EgIZuCTX9aT5; Thu, 11 Dec 2025 08:28:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC57340E36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765441686;
	bh=+FUC7Dkm23mBI13yPIVy3kBY5XHPrpU5qsm9s5VO5R0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WUI/JOgpM2mPu+0PZ2WS1Jy2IiFBsysre+QTiXs0EazMlFVNfa33Y5wpPiqp3/4v8
	 NnlBskU6pKUYEDc20gsuPaMAsaAXDRsjRXPGgSoKa2BUmBXI8xCjVcrToyi8k5zBsO
	 tWKmsq9j6SlAWtidUSXaYftLNew4WyzVD18vUIeRkHXEgwwwTpcoebTnj5XrV2DT54
	 8KTX0V/9IeIrzN78AUh13M7TEEyyvS6Cjt0YD5/cf9giyq+0DOJrjAYI1SPWC097o0
	 tc4fqjhrPHpJ/AoIQl1oxlPXkdVnMXTbe66cqAoCadT78+2pvycY9aod/Wd9pIk6Od
	 /Q0xKehC8rCoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC57340E36;
	Thu, 11 Dec 2025 08:28:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 09B532E9
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 08:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E530E607C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 08:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AwP_NrlX22z9 for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 08:28:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 264F96078F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 264F96078F
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 08:28:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 156E7863F5; Thu, 11 Dec 2025 08:28:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 09:20:34 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 15e090190926b0288f2ae4dbcb08c7093961cc3b
X-Git-Newrev: a6758069c24166b757580af1ea30d3304d9fd5d1
X-Patchwork-Hint: ignore
Message-Id: <20251211082803.156E7863F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] Makefile: update for
 2025.02.9
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a6758069c24166b757580af1ea30d3304d9fd5d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 7641f2cff6..872f1a3900 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2025.02.8
+export BR2_VERSION := 2025.02.9
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1763674300
+BR2_VERSION_EPOCH = 1765441500
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
