Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68B4C32771
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 15:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C7A641D18;
	Sat, 24 Sep 2022 15:10:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C7A641D18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PKe7yFzbXpCb; Sat, 24 Sep 2022 15:10:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29C0941D07;
	Sat, 24 Sep 2022 15:10:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29C0941D07
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 10F981BF852
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 15:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF05041726
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 15:09:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF05041726
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d0w3AgooooAS for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 15:09:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 726B8410BD
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 726B8410BD
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 15:09:53 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3EFC1200004;
 Sat, 24 Sep 2022 15:09:50 +0000 (UTC)
Date: Sat, 24 Sep 2022 17:09:49 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Lang Daniel via buildroot <buildroot@buildroot.org>
Message-ID: <20220924170949.0e94ed6e@windsurf>
In-Reply-To: <VI1P190MB0493C482B0410D1BA4C37F849F4C9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
References: <VI1P190MB0493C482B0410D1BA4C37F849F4C9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664032190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h9LZxSwQNbEXhC3r1fqrdK9ULPGm7HT7aXBxdTTHsYw=;
 b=n7L0vz/sA0e3Lq5jIW9UYgHGNoy76psCenDMsvS+M9dMvLHK6cGAP76FyY5zNdilzLzSQ4
 iJfjk/cYm6lsyC3pNJe8feD3ZVMPP1EQC5Omhfg7M49GQ2bLmy4gcOW2GXjAYuseBap8K6
 s63XaWkQDGP3Fx5Tfvhlyps+fACPAR0uq1C/lHftqH6fUZXfT/3zpLTPWfzo8jzjoKjzzB
 1LVyK2YpghTihXmNdLKlpt5TorO+yvHjlyIe8fwvYHWro0TkO6FXzV5/A2CssztmTMO9AB
 46EwWVfDabH+WluOOr5/YoiIJVmRhMCofTk/myxRF2c5rIuBS2R49jDq7hn3Ww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=n7L0vz/s
Subject: Re: [Buildroot] [PATCH 1/1] package/freescale-imx/imx-gpu-viv: fix
 gbm.pc
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
Cc: Lang Daniel <d.lang@abatec.at>, Gary Bisson <bisson.gary@gmail.com>,
 "tuzakli.refik@gmail.com" <tuzakli.refik@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 20 Sep 2022 08:17:13 +0000
Lang Daniel via buildroot <buildroot@buildroot.org> wrote:

> libgbm isn't output/target specific, only one version is included
> in gpu-core/usr/lib/libgbm.so.
> Similarly only gbm.pc is included and not gbm_x11.pc.
> 
> Signed-off-by: Daniel Lang <d.lang@abatec.at>
> ---
>  package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
