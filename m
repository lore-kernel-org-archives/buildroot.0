Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03AFC636BD
	for <buildroot@archiver.kernel.org>; Fri, 24 Nov 2023 08:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3254E401AE;
	Fri, 24 Nov 2023 08:41:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3254E401AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kY3xDR24HeEL; Fri, 24 Nov 2023 08:41:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45D7B40471;
	Fri, 24 Nov 2023 08:41:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45D7B40471
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6AA1D1BF5AA
 for <buildroot@lists.busybox.net>; Fri, 24 Nov 2023 08:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FEBD82092
 for <buildroot@lists.busybox.net>; Fri, 24 Nov 2023 08:41:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FEBD82092
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3EFRXtLrfRWM for <buildroot@lists.busybox.net>;
 Fri, 24 Nov 2023 08:41:35 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0016782146
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 08:41:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0016782146
Received: by mail.gandi.net (Postfix) with ESMTPSA id C56571BF208;
 Fri, 24 Nov 2023 08:41:31 +0000 (UTC)
Date: Fri, 24 Nov 2023 09:41:31 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231124094131.25d3f825@windsurf>
In-Reply-To: <CAHDQB6NSD3y2mwAZocqQ4Z4V6uD7LQaJ6hdp6xqHh7cB6_AYcg@mail.gmail.com>
References: <20231123000819.488595-1-adam.duskett@amarulasolutions.com>
 <20231123000819.488595-3-adam.duskett@amarulasolutions.com>
 <20231123144454.50fd7944@windsurf>
 <CAHDQB6NSD3y2mwAZocqQ4Z4V6uD7LQaJ6hdp6xqHh7cB6_AYcg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1700815292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CDbo2HfNsR+6GVcP80/VTyuxaWLv0pg4UzOH+5oyvZw=;
 b=Du13vv41S2dAO1EhECxjh0wpgkX3pUjjdrPgd/ZXke3RVLhRC8BV2umZxXSEcfPZ20dlUO
 JeqTsotRX4rliPMn9OTyQ6zI93iSoB1LPzIA7C+wm/yN/CMpXth4IvUiU/0IOPw05vKje1
 DxVwWV7crJQgktJ0B7KSpiq+ilwHloJs7ozwX1CyliIq+Ts7J3rMgL6QzAIJB82GgfCWl/
 m1FgfTCpP4slvwvvu0LIKmLqvQ95vG+pTDW70/v0QyZyiU9W17/0z6+mxaK7Dp/s//KLdc
 6f9A1baGEGwNJoq0ouDaRIiLZwWPiIS3NAsNknrZZ5Jf0mkAFcu2NIYLLMgvNQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Du13vv41
Subject: Re: [Buildroot] [PATCH/next 02/13] package/dmenu-wayland: new
 package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, 23 Nov 2023 12:12:52 -0700
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> lib2 -> glib2
> 
> "I think listing the first order dependency is enough." Not sure what you
> mean.
> 
> Using the github macro wouldn't work as the release is quite old and lacks
> an absurd amount
> of features and fixes.

You do top-posting and HTML e-mails now? :-)

What I mean by "listing the first order dependency is enough" is that
instead of:

	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz

you write:

	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
