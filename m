Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BD9C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 20:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 853A1404BF;
	Sat,  4 Nov 2023 20:28:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 853A1404BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hoCqpfhqATOR; Sat,  4 Nov 2023 20:28:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4C3C40383;
	Sat,  4 Nov 2023 20:28:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4C3C40383
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 64A4F1BF20B
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E00781F1B
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:26:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E00781F1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vE8z5jFXOpOj for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 20:26:37 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1EACA81F1A
 for <buildroot@busybox.net>; Sat,  4 Nov 2023 20:26:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EACA81F1A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 92A88E0003;
 Sat,  4 Nov 2023 20:26:33 +0000 (UTC)
Date: Sat, 4 Nov 2023 21:26:32 +0100
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20231104212632.2ef03d72@windsurf>
In-Reply-To: <20231003052120.3594513-1-francois.perrad@gadz.org>
References: <20231003052120.3594513-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699129594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pQbHUhGNuSOAcBv0mXLPcte1LZXGg0NZesL6YKgpc+E=;
 b=LutuqnA8VAIlQFX7gU57YfJgt9vnrH6pTTeQDEW4x94aLwB4gMxzjyvn8D7LYXrfWpYD9a
 I9ua1UmziCzd/HGLCx5rXEtxDHhHecW+uo2ghkJesnhn/uIry5DAL5JF412FW3xEv1YMlJ
 pSef4QFhK3DErHVNaunYBVOTGyctIRp+Qj8AE778riI9aKhNxBzOuVn59JH4xkWsVAAFwG
 zcKDjIP0VCM57SIJe1xFnOgxe7mgD4gknCfvxp0Y+CR0Nw5ZbSq3lXzRQJc6PRopt+HmZk
 dSD3ioWcbJ2GlGGv2Sf1UbVpQz1dpQmM65yl1BVolsi3b7/a1NLne7YBfjwNxw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LutuqnA8
Subject: Re: [Buildroot] [PATCH] configs/olimex_a20_olinuxino_lime*: bump
 Linux and U-Boot
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  3 Oct 2023 07:21:20 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  configs/olimex_a20_olinuxino_lime2_defconfig | 4 ++--
>  configs/olimex_a20_olinuxino_lime_defconfig  | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
