Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87BDC001B0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 22:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65C5F41894;
	Wed,  9 Aug 2023 22:06:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65C5F41894
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1TcEujU38UZH; Wed,  9 Aug 2023 22:06:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D97A41897;
	Wed,  9 Aug 2023 22:06:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D97A41897
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3E6031BF82C
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 22:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22E2D41897
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 22:06:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22E2D41897
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oVpGZw0RqnGc for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 22:06:28 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA3B141894
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 22:06:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA3B141894
Received: by mail.gandi.net (Postfix) with ESMTPSA id D20BF1BF205;
 Wed,  9 Aug 2023 22:06:24 +0000 (UTC)
Date: Thu, 10 Aug 2023 00:06:23 +0200
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20230810000623.210176d4@windsurf>
In-Reply-To: <20230801002907.01f46d94@windsurf>
References: <VI1P190MB0493D233ECC579510F8C0FC69FB29@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
 <20230801002907.01f46d94@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691618785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KSesY6Annepi8lDbP8zJN2AoYvvcES3GLmARujBh3cE=;
 b=ZKkP+h5/9hLAI6y5aKZLWVLyX46ROO1Dtp1VHzpkskl9NmaxrpCAzGDg8Hpz8EzhL2iUDW
 KEaShmGWFODCjWAv5ACEOlMczbLS4qz5byuRfAxWMcWPjHWe1u4oovd7gvpLCLHZpLtdKa
 bESiERYjh5KwroKgZyalzBFg5F6H4sZWgGd5xstJPAehCxwLWycYO9by25ufBPLub9kcLW
 pV9SuDg4/YKBluh7ddrmVL3fgMtKlqQzS3pLuPsvtN68fJutlEe4R65FbWo9KaHKzauqsr
 AxCJ9Z4+jAkKLfvHiL+M1Jy5yEAPkhx4m1fV+WVp1RGAMvvco8kJzMQETVBaNg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZKkP+h5/
Subject: Re: [Buildroot] [PATCH] package/swupdate: fix ipc header include
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
Cc: Lang Daniel <d.lang@abatec.at>, Andrey Grafin <conquistador@yandex-team.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 1 Aug 2023 00:29:07 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> So I would be inclined to do what upstream suggests here and drop the
> INCLUDEDIR=/usr/include/swupdate from swupdate.mk.
> 
> Thoughts?

Following the discussion we had, I submitted:

  https://patchwork.ozlabs.org/project/buildroot/patch/20230809220514.2089980-1-thomas.petazzoni@bootlin.com/

And I marked this patch proposed by Daniel Lang as Rejected. Let me
know what you think of this other proposal.

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
