Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79CCCD6E79
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 20:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 830AC84536;
	Mon,  8 Jun 2026 20:53:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mhMBbr2usIn3; Mon,  8 Jun 2026 20:53:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4734844F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780951997;
	bh=cfMLDem+oCd+SGE6rqk+WfOYRX6iY1Gfje8p6mMGRHE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kIIkhooIgiXPbcv7xYFgu9h0idWEXPvNG0znlazNgFMOhb+r6TVUvyUK2G8REDsCe
	 IsZF1BQkOUwhJfa8GmzRdl9r0P1hV66Wjjk1Xg4IgtnIfXcLMfd3TG9HGtC+nGxY1m
	 3JaHtBTzIql6fkk7uK3RLlM3hkmNY4eynZ5DEScxZesBxWfD1zLNJzEZGHeIDZgBet
	 2uFarNNhTo/JH7LIVaRLZlgPjxx90yzjlRSKTu8onxgzqzJ4zgVTXTizmvxMJ//9b1
	 OQMgBodZpuzbM2KN9haxsY3YORTUyx8vscWvQZz7Rg7aTt4ccPzSUIZ06udlpwGhuG
	 h/77okSBqdNPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4734844F6;
	Mon,  8 Jun 2026 20:53:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 21326190
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 20:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1164342960
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 20:53:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iwWE-TJwlCHw for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 20:53:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DF38427A5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DF38427A5
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 20:53:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E6FAE87CE6; Mon,  8 Jun 2026 20:52:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Jun 2026 22:52:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3a4b5e64ec761d687fb7156a7c488c3428c63721
X-Git-Newrev: aba62b43fb940a71a94fb6e33da6ee5a543b0f5a
X-Patchwork-Hint: ignore
Message-Id: <20260608205257.E6FAE87CE6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Kickoff 2026.08 cycle
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aba62b43fb940a71a94fb6e33da6ee5a543b0f5a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 93afd97507..5a382644d9 100644
--- a/Makefile
+++ b/Makefile
@@ -92,7 +92,7 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2026.05
+export BR2_VERSION := 2026.08-git
 # Actual time the release is cut (for reproducible builds)
 BR2_VERSION_EPOCH = 1780950000
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
