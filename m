Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5EDCE9A05B
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 18:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F069541553;
	Thu, 19 Feb 2026 18:55:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tqPnLGfHNnXj; Thu, 19 Feb 2026 18:55:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF01740C0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771527322;
	bh=tBza0lx0vbMG0Gd700dHma25Ap20EiEbGfvO1t4SdiI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=F5Ruz34F2RfPwE01ZKwYa721WFgWV4ziAQLpA7m4E8E0HvxjUk43KPeaAmcFwFpwJ
	 qB4cePuCwIRsvXC4pt+dV03zIvR4siikmO7QLY6LTWxUgywLOS/AEXD8+t1Pvl/cZq
	 Y5CPn9JQKQkq6JF7bW6uW5Q3OtZfOEhRPj36Cb1+/uHqYPUU4pDCuNsBToBIRc/akh
	 SL41OVzPlpASzxwyD8IhdJMZlBsKwo/cZ3qsLS4T5nbOOaNJ152wp6Hp3g+54B3uGj
	 TNaVnnuhbEmp4wUc7KsBafimchi3rIVorspiF6otcLWLfpSfD4tKDqRC17LIn/aGfV
	 3Hn7i9iq+A/7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF01740C0C;
	Thu, 19 Feb 2026 18:55:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 36C101CE
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 18:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33A8D403F1
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 18:55:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HD86C5jx_W00 for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 18:55:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35597403E8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35597403E8
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 18:55:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23BA2810FE; Thu, 19 Feb 2026 18:55:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 19 Feb 2026 18:54:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 86a5ec97b45f80fdea5d0742497c7f9afac6444c
X-Git-Newrev: 34b9d6381ebfa978b7a377f073a6ff272b171135
X-Patchwork-Hint: ignore
Message-Id: <20260219185520.23BA2810FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 board/olimex/a20_olinuxino/patches/linux/linux.hash: drop unused Linux
 6.18.3 hash
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/34b9d6381ebfa978b7a377f073a6ff272b171135
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/olimex/a20_olinuxino/patches/linux/linux.hash | 1 -
 1 file changed, 1 deletion(-)

diff --git a/board/olimex/a20_olinuxino/patches/linux/linux.hash b/board/olimex/a20_olinuxino/patches/linux/linux.hash
index 8d8499b329..f83883b936 100644
--- a/board/olimex/a20_olinuxino/patches/linux/linux.hash
+++ b/board/olimex/a20_olinuxino/patches/linux/linux.hash
@@ -1,3 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  7a8879167b89c4bae077d6f39c4f2130769f05dbdad2aad914adab9afb7d7f9a  linux-6.18.3.tar.xz
 sha256  37f0c5d5c242c1d604e87d48f08795e861a5a85f725b4ca11d0a538f12ff8cff  linux-6.18.8.tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
