Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A5DFA3741
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 21:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D49434031E;
	Mon, 31 Oct 2022 21:02:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D49434031E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JOA1UN-ih2So; Mon, 31 Oct 2022 21:02:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9C7E40189;
	Mon, 31 Oct 2022 21:02:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9C7E40189
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6BF231BF327
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 21:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54516400CC
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 21:02:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54516400CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WGMdrJM79_1v for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 21:02:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5772403F7
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D5772403F7
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 21:02:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2A8AB20005;
 Mon, 31 Oct 2022 21:02:28 +0000 (UTC)
Date: Mon, 31 Oct 2022 22:02:26 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20221031220226.36f3ccf8@windsurf>
In-Reply-To: <20220925101041.GH1127102@scaer>
References: <20220925090920.1585682-1-thomas.petazzoni@bootlin.com>
 <20220925090920.1585682-2-thomas.petazzoni@bootlin.com>
 <20220925101041.GH1127102@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667250149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2GhWOjcd/1Lkkwzph2oWCQdYnWdTNPHWow07vKR9JKk=;
 b=Y4wcXeVfIb78vYhzQbXYJ4zQKYFgBUskVUGDDE3VmMlJpL+l+AtE95O33b1Hu9kVHYQfYY
 5fEzyywGEFGqd6zXGH/b29eszghQIaz+nBzur8R8u8GsziQO36GKgUkIkajgB+4a5qDB2t
 FBGMgxW7Cj16ebQlxE4vAs6qVkv7BUdG5q4WbgReDEGx4xvRn6JBWpHxDrQNjI702HnLeW
 7OotzomTq5sA7koz8zcHQoYvAIvl3wYNVdgr0g2nkMtfpEmGBM73LGnWvLWAfVW6v3+An2
 o+7RRfTOYAs2h6BLP31dm7pRmDWAC7GT3L7xAgKMhfNGzqdqKO3xVNeml06xoQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y4wcXeVf
Subject: Re: [Buildroot] [PATCH v2 1/5] arch/Config.in.xtensa: adjust
 endianness logic to avoid bogus configurations
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
Cc: Jonathan Ben Avraham <yba@tkos.co.il>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Sorry to bring back this topic only now, but there are still Xtensa
issues that we need to resolve, and this series was aiming at solving
them. But I have further questions.

On Sun, 25 Sep 2022 12:10:41 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > diff --git a/arch/Config.in.xtensa b/arch/Config.in.xtensa
> > index f9d5adb4c9..4bb58e1964 100644
> > --- a/arch/Config.in.xtensa
> > +++ b/arch/Config.in.xtensa
> > @@ -37,6 +37,10 @@ config BR2_XTENSA_LITTLE_ENDIAN
> >  
> >  config BR2_XTENSA_BIG_ENDIAN
> >  	bool "Big endian"
> > +	# Internal toolchains without an overlay file are always
> > +	# little-endian, so we prevent from selecting big endian in
> > +	# this case.
> > +	depends on BR2_XTENSA_OVERLAY_FILE != "" || BR2_TOOLCHAIN_EXTERNAL  
> 
> I think that dependency should go to the whole choice instead:
> 
>     choice
>         prompt "Target Architecture Endianness"
>         default BR2_XTENSA_LITTLE_ENDIAN
>         depends on BR2_XTENSA_CUSTOM || BR2_TOOLCHAIN_EXTERNAL

My memory is probably vague, but I don't see how this solve the
problem. The problem was to prevent the user from choosing "big endian"
if he has selected a custom core but not specified an overlay.

> This should cover the external toolchain case, and the internal
> toolchain for a custom core (assuming we keep the no-empty overlay for
> custom cores).

Not sure what you mean by "assuming we keep the no-empty overlay for
custom cores".

> 
> I.e. semantically, choosing between big or little is not about having or
> not having an overlay, but about being a custom core or not (or using a
> custom toolchain).

Not sure to follow you here. The only issue is precisely that if you
don't specify an overlay, there is no way your custom Xtensa core can
be big endian: it will be little endian. The configuration we want to
prevent the user from creating is: custom core, no overlay, big endian.

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
