Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A40A8CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 08:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C7F6851BA;
	Sat, 30 May 2026 08:36:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qeCnieAIyaq7; Sat, 30 May 2026 08:36:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B397B84FFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780130160;
	bh=H+3CvvKkYvYfm9r/bXaKegB73BqXu0L/Gb4SmkHN4Gg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=m/buvoBLT7jwimir3LLKi1beSDbLYlCashzKIMaG6X9b7rRfXRQETrghANpZ/2DAH
	 +2/sW76rbv4gYqIXqENrt6toHmAGaH8D1C7h6oIXd2aB+bpvXfNqj0Ze8VKU86azcZ
	 HGsZOGrVruHZQmu86uaVXjHDZ+xjLTvld31eZ7amgNJrZojcs2OA3tAEvXwJr/RlFp
	 NsXxyix7pzCzEk/xaeOpB6mN/Xt6qFDigN8rcwhoBXdSN1VQilV1Qad5JHZY/D5i9z
	 Sp4GRjP+DeVzpLLiKpRXwwkzxrQLwdOIS/q8a3ZI+T5DPbzisXyZgAM2Vz5eFQCSVM
	 wsM3D1W6JMblQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B397B84FFE;
	Sat, 30 May 2026 08:36:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6152FD3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E9D984FFE
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:35:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MyKeaSbzfexV for <buildroot@buildroot.org>;
 Sat, 30 May 2026 08:35:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA6A484FAE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA6A484FAE
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:35:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D281C86441; Sat, 30 May 2026 08:35:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 10:33:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 232f8b5ca7aee3af04632df6616aa6919bd36d0e
X-Git-Newrev: 196070ae5e0242293af0b208b0fe41ad49de6888
X-Patchwork-Hint: ignore
Message-Id: <20260530083543.D281C86441@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add entry for Shubham
 Chakraborty (xterm)
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/196070ae5e0242293af0b208b0fe41ad49de6888
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 941b12b0b7..877aa56d96 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3026,6 +3026,7 @@ F:	package/htop/
 F:	package/hyperfine/
 F:	package/pv/
 F:	package/unrar/
+F:	package/xterm/
 
 N:	Simon Dawson <spdawson@gmail.com>
 F:	boot/at91bootstrap3/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
