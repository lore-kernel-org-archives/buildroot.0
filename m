Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E58C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 13:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70CEB4161A;
	Sun,  7 Aug 2022 13:46:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70CEB4161A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id crBqkPa45s8R; Sun,  7 Aug 2022 13:46:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EEA84168C;
	Sun,  7 Aug 2022 13:46:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EEA84168C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0FBB11BF3CD
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 13:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C021582AC8
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 13:46:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C021582AC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9dhsSLbTe1bx for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 13:46:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E891282B1B
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E891282B1B
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 13:46:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F258F60005;
 Sun,  7 Aug 2022 13:46:03 +0000 (UTC)
Date: Sun, 7 Aug 2022 15:46:01 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20220807154601.45a325c2@windsurf>
In-Reply-To: <20220804024438.1118030-1-christian@paral.in>
References: <20220804024438.1118030-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659879964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UJzJhRIuXJKBumG73DN23Fr8Z7kG+OzRrtXsi4Y5aKU=;
 b=h/wf/BnJjnHrc2ZrgSwZ8rv0DExyjFxLZ8ITAferZTMAku2l2GdsCfb+7t0U0htxf+2wMD
 pdERttI3FuIJrqzdhE5DPnyw8XLLS8emgF/cFKihcQp1tNUBYyJNcfijln7qKf7sWGuiRK
 vPgu4+hTf0bt32rNe6wByUuz63NnuvKyiRlxG6sKUF66RKjAr2mVNkdmlt4JgRH62PPzLu
 8GAkMuRA99e4DAlYhsITpN90wnwwOwzJRfA/nMZCRhI4uqTerUEW3sjPu8pldBgbCn8gH+
 Vfejyk9izjGYHzyXFoyLTc56iBBkcU5Dc4fo4ov7vrC3f+97YVSW5ZLrHHqM/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=h/wf/BnJ
Subject: Re: [Buildroot] [PATCH v2 1/1] package/go: fix go on riscv64 in
 sv57 mode
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  3 Aug 2022 19:44:38 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> On machines supporting Riscv SV57 mode like Qemu, Go programs currently crash
> with the following type of error:
> 
> runtime: lfstack.push invalid packing: node=0xffffff5908a940 cnt=0x1
> packed=0xffff5908a9400001 -> node=0xffff5908a940
> 
> The upstream PR fixes this error, but has not yet been merged.
> 
> Upstream: https://go-review.googlesource.com/c/go/+/409055/4
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> 
> ---

Applied to master after renumbering the patch to have only one 0002
patch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
