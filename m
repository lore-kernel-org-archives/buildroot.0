Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F5BED41C02
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 08:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70C3640BE3;
	Thu, 11 Dec 2025 08:29:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OsEMB8YEZHJL; Thu, 11 Dec 2025 08:29:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32DB340BE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765441753;
	bh=aFbbk6X+Oi8kyVo1Kh9KyoE/Mbr0Pcy0nRcLFT7x3wk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=B57iQfMUMa8iV2hExilrD8n1kY90DDtfNvjxA6sOurlze4gfxqMQ1+mTDskoy9lqh
	 dUjp2TV4wjoymnwhME0NFREfPjtCygh/eY3Af97L8C2O7ijbQgTcuiCTUU+Jsnqkc2
	 o7PAs7hwu4pf9KsHwD4M+Vsss9jAWYoKiKa7Nj8POmYys22PGkHrWOjkkYZzsZ2zXX
	 9/I9ffyyF6fMZA49InOIloT3IRZkEtEGT1ZW++M1D/IcqFrzsf3ttBPYnJQdjfPnBy
	 YdE1oqcXT2KwO52iQMAcx97k4NnXVHn+AOkutsaR1dU3vgZ2s2Y6LeXSNxMrKbdJSY
	 QPKnB+kKT2inQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32DB340BE5;
	Thu, 11 Dec 2025 08:29:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CEB4D2C6
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 08:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC65E84CD7
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 08:29:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3UgfdCxzh6Jf for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 08:29:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06A7A84CAD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06A7A84CAD
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 08:29:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC09A869F4; Thu, 11 Dec 2025 08:29:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 09:20:41 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: b338a0ca2f78ec5b14ba737d86e2e3ea81bd9360
X-Git-Newrev: dd1b0c2aafefaf9a0459257f654cf2cd6487ad3b
X-Patchwork-Hint: ignore
Message-Id: <20251211082910.EC09A869F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] Makefile: update for
 2025.08.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=dd1b0c2aafefaf9a0459257f654cf2cd6487ad3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 1e0a1ecc5d..89d41ed090 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2025.08.2
+export BR2_VERSION := 2025.08.3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1763674300
+BR2_VERSION_EPOCH = 1765441500
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
