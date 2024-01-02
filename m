Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98816C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 08:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45C8340743;
	Tue,  2 Jan 2024 08:39:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45C8340743
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BM2P-mBXEwYs; Tue,  2 Jan 2024 08:39:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E08A405D8;
	Tue,  2 Jan 2024 08:39:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E08A405D8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A6251BF5A6
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 08:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E44B980E46
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 08:39:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E44B980E46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l8159SGkEjkT for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 08:39:08 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB27280E55
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 08:39:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB27280E55
Received: by mail.gandi.net (Postfix) with ESMTPSA id C33B81BF204;
 Tue,  2 Jan 2024 08:39:04 +0000 (UTC)
Date: Tue, 2 Jan 2024 09:39:04 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240102093904.5625d379@windsurf>
In-Reply-To: <ZYxfxXC4-vKZlmcZ@landeda>
References: <20231227165840.2900718-1-thomas.petazzoni@bootlin.com>
 <ZYxfxXC4-vKZlmcZ@landeda>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704184744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+3xVnw50YamXTipw6OqCfsSon7JEfn/8Vti9f59OIKM=;
 b=NhUTSxlOE+UjuOgMQfKAzW5mymAa3ewVuIxe96dsbRbaEJrarH+7KJrTmq5HqPiVhhM62d
 pQ7sRF6ijpIB+GD8q8gehiBdFOORgMEvSQK4AxvdfuBTXtcy+EYA/kKAdJhQsyVo7HLFUh
 T65JTORGOmdQFMcqayMXweIQLRneE9Zf6FgDFe0FRmvTMcaqfr3t5jlWU0zHthcqEmqSAu
 /TqKZAUQpR+y4FzSRlcd8VjaQqoyeDipny7W0M4aoE11nelHpLhacEd8TTrpI3WyfZ7lXG
 Z0KJll+mkkNLFtOdzxKqm+WdLxhbChXiTKPgyUNYv2/LiyzP8d0ACVKqAOuAnQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NhUTSxlO
Subject: Re: [Buildroot] [PATCH] Config.in: change default optimization
 level from -Os to -O2
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
Cc: louis.chauvet@bootlin.com, Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Thanks for the feedback.

On Wed, 27 Dec 2023 18:32:53 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > Here are some arguments in favor of this change:
> > 
> > - Most Buildroot uses use Buildroot for platforms that have a  
> 
> s/uses/users/ maybe?
> 
> >   reasonable amount of storage, and the difference between -Os and -O2
> >   in terms of code size is no longer than significant compared to the  
> 
> s/than/as/
> 
> >   size of storage typically available on average embedded Linux
> >   devices  
> 
> ... nowadays.

I sent a v2 (where I messed up) and then a v3, fixing those. I actually
made another change: the Config.in help text of BR2_OPTIMIZE_S
explicitly mentioned that it was the default. So I updated this and
moved the text to BR2_OPTIMIZE_2.

> 
> > - -Os can have a pretty bad performance impact, compared to -O2.  
> 
> What impact are we speaking of? Basically, -Os is -O2 except for
> optimisations that increase code size. Also, smaller code fit better
> in caches, so there can be a speed gain to have smaller code too.
> 
> So, stating that -Os has a "pretty bad" performance impact is not that
> obvious.

I obviously don't have hard numbers, but I definitely remember
getting reports of performance problems that got solved by moving to
-O2. However, I honestly don't remember if it was a bug report in our
public bug tracker, or an issue in a customer project. But I had in my
TODO-list for a long time to send this patch, because on multiple
occasions I saw people being hit by issues being caused by the default
setting of -Os.

> Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>

Thanks, the v3 has your Acked-by :-)

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
