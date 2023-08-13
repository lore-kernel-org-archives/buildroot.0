Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8944BEB64DD
	for <buildroot@archiver.kernel.org>; Sun, 13 Aug 2023 20:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE53140984;
	Sun, 13 Aug 2023 20:41:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE53140984
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VL-CFuUNaPkI; Sun, 13 Aug 2023 20:41:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0BE04098C;
	Sun, 13 Aug 2023 20:41:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0BE04098C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C9B11BF3C9
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 20:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C6EA81470
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 20:41:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C6EA81470
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vTydhWTEd3ft for <buildroot@lists.busybox.net>;
 Sun, 13 Aug 2023 20:41:03 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC5C28146D
 for <buildroot@buildroot.org>; Sun, 13 Aug 2023 20:41:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC5C28146D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 370CC240002;
 Sun, 13 Aug 2023 20:40:59 +0000 (UTC)
Date: Sun, 13 Aug 2023 22:39:23 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20230813223923.008e4347@windsurf>
In-Reply-To: <20230813124037.GX421096@scaer>
References: <20230528113042.585399-1-dario.binacchi@amarulasolutions.com>
 <20230728230159.6440c601@windsurf>
 <CABGWkvoEvH=4=OmPQHm5T1XMAQ11x-SixLpAxkUL1CUtUrF2_A@mail.gmail.com>
 <20230729230335.3cd59db6@windsurf> <20230813124037.GX421096@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691959259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QXdLMyy9mWITrJ4zsWq8QK8IH7EaD8vvJrgfg/EeaJs=;
 b=XeV/riGFBFxPL6JpX20flaBfb5y/2Jc0J+m1FJyQojEhmeXMdpPo6VqZUQ2XKPs1ohWMts
 Tnx7rZqLTRskMwZfvH+A84ZCtEdhX3hDeby9putuYtBbtstTsXBmSiXXggSPxbhvhwV0oF
 LwNLsIOxusCzWIw+dto1fEeMQOxswYHo6albJMgnZrPOY6tl6Ub3DqVcRfhMUZ2GevjprS
 eoS1o99lFnoEPpxFlwETyPsdytyYhl9CK3pyKvTVQ/Up4tJ1vLor38oLE4THiFMEIOOvw2
 Gw7kgEO6373GQlaMlwPzx7npDiNJQEmLsmCVBp6egWquRo0EVtSuuBU60lsyUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XeV/riGF
Subject: Re: [Buildroot] [RFC PATCH 1/1] package/automake: include .m4 files
 of autoconf-archive
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sun, 13 Aug 2023 14:40:37 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> After thinking a bit on this, here's what I think we should try;
> 
> For packages that have _AUTORECONF = YES, we forcibly add
> host-autoconf-archive to their _DEPENDENCIES, and always set the macros
> search path as proposed here. Supposedly, having macros from
> autoconf-archive available should not be a cause for failure to
> successfully autorconf, otherwise that would not work on random systems
> which have it installed for other reasons, like native builds on
> standard distros; also, a missing directorry in the macro search list
> should not be a cause for failure.
> 
> Consequently, we can drop the ad-hoc dependencies in the individual
> packages, and drop the ad-hoc include directove as well.
> 
> host-autoconf-archive is a plain autocnf package, without dependencies
> (save for the autoconf machinery), and it only ever installs a buncha
> files, does not compile anything, so it is pretty fast. Adding it to all
> autoreconfigured packages should have a minimal, barely noticeable
> impact on the build time.
> 
> If the above causes too much breakage, then even this patch was going to
> be incorrect, as it would unconditionally add the autocon-archive path
> to the search list for all packages that indirectly have
> autoconf-archive in their dependencies.

We have 336 packages that set AUTORECONF = YES. Out of these 336
packages, only 8 need host-autoconf-archive.

To me, it makes no sense to add host-autoconf-archive to those 336-8
packages that need autoreconf, but do not use any of the macros
provided by host-autoconf-archive. One of Buildroot's beauty is its
minimalism: it builds only what's needed, and every time it builds
something, there is a solid reason for it. I would really dislike if we
were to start building useless dependencies, even if admittedly
host-autoconf-archive is small and quick to build. But small and quick
to build is not the only thing, it's also about whether it makes sense.
I regularly stare at my build going on, and when something gets built
that I don't understand why its gets pulled into the build, I check
with "make graph-depends" why it is there, and sometimes investigate
further to make sure there's a good justification. To me, this is an
important property of Buildroot, and I would really like to keep this
aspect of Buildroot.

Especially, I don't see what problem we would solve by making
host-autoconf-archive a dependency of all packages that do AUTORECONF =
YES. What problem would this solve?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
