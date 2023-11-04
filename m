Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0723AC4167B
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 20:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 990A840424;
	Sat,  4 Nov 2023 20:28:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 990A840424
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jAsMy4d6IrXV; Sat,  4 Nov 2023 20:28:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CC46403EA;
	Sat,  4 Nov 2023 20:28:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CC46403EA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C806E1BF20B
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A15FA81F1E
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:26:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A15FA81F1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CGrnDEm4l8ZS for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 20:26:46 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E1F381F1B
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 20:26:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E1F381F1B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C7E11C0002;
 Sat,  4 Nov 2023 20:26:43 +0000 (UTC)
Date: Sat, 4 Nov 2023 21:26:42 +0100
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20231104212642.0bf74a7a@windsurf>
In-Reply-To: <20231002191704.57123-1-christian@aperture.us>
References: <20231002191704.57123-1-christian@aperture.us>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699129603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PQawH7kzhnxeFh9/S9OfMYiGBOvvF9GWvByct6QOFKY=;
 b=BYh98Q1W5IfEse54Sl4PlLmdjXB1zUO73MnyBJKLdtY6jDfNcMOsheaNnfeO3a/XCjx1S2
 a0CZ47rp43NswxRbPp31qbN2O2PNpGs7WFZHJbw7mmeVRxRicmBY/QQfQ4qmEShQ921/09
 MK8vIVwhZxQpq+R2ixWAb+7zTMkfSZ/wy9JhXp9+7DDe+2E3FNiNqNJjVQzgr2hzUtQ/iG
 OmWKFZ1Ont+tkd9XAeS53b2GbwEPapLwtDPfCaSKx2rpfwUsLs4ztSRvhxSJ6UhbV7u9eL
 9LFtebk7PPI5jxJWi9a20gc4cGmnQQ5vMoIkn9cfPGf6vuPgRBaMVOXWjSZ+aQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BYh98Q1W
Subject: Re: [Buildroot] [PATCH v1 1/1] package/amlogic-boot-fip: fix typo
 in Config.in.host
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  2 Oct 2023 12:17:04 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>  package/amlogic-boot-fip/Config.in.host | 2 +-
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
