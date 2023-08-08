Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDDCC001B0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 14:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0699C6111F;
	Tue,  8 Aug 2023 14:23:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0699C6111F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jFz6GBmokejP; Tue,  8 Aug 2023 14:23:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4815F60AD8;
	Tue,  8 Aug 2023 14:23:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4815F60AD8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3E6261BF398
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 14:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 162C24062E
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 14:23:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 162C24062E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n4RuoxM6BdxS for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 14:23:32 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72C65405C7
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 14:23:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72C65405C7
Received: by mail.gandi.net (Postfix) with ESMTPSA id 39B281C0003;
 Tue,  8 Aug 2023 14:23:29 +0000 (UTC)
Date: Tue, 8 Aug 2023 16:23:28 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20230808162328.1ead34db@windsurf>
In-Reply-To: <CACXRmJhaDgbsEhKC+m60ifiv0bPd8rC10OmAN8pqi=RBs_vtJw@mail.gmail.com>
References: <20230808090407.558957-1-thomas@devoogdt.com>
 <20230808112016.226ac8be@windsurf>
 <CACXRmJhaDgbsEhKC+m60ifiv0bPd8rC10OmAN8pqi=RBs_vtJw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691504609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BwEd5wmmXUPplNFZ2RycBHJZVI3OlTrqJfxm5x7xLBQ=;
 b=J1+bN/mekGiGHxIpzjKjN12fDMvq2tqiRq5P33FVG8W/1rg3X3COrVa/UH0yOanjiujP7Y
 Fl7UuYGznOUEER4pIWuPrif466IwnTmEjiC1ANhSRrIP6E1++S7edr9xGsMb/SwMKY2DL8
 Qg0y0xHkryDGZgLHr6PsLtnOKazUE0VncJ6DiCtgm9NtzZqbC+q7KCgajYInGj13k62H2W
 UznA4kPiTrVDbJVVhGcAP+gPMamCLdwv1oTqDBVU8/Dm9DdOW66Ng3gArLRdtSOuKehC6l
 1NeAAsATHtDYmwQP4SDxYXM/z5JmhOhvkey275sZVMyix+fBXDm+IPhJ5LMu5A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=J1+bN/me
Subject: Re: [Buildroot] [PATCH v1,
 next] package/llvm-project/compiler-rt: fix build with Ninja
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
Cc: Daniel Lang <dalang@gmx.at>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 8 Aug 2023 13:22:21 +0200
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> > Not sure to understand: the default backend for CMake is still
> > makefiles, and compiler-rt was not switched to using ninja. So?  
> 
> No, ninja is not yet the default.
> Yann did some tests to find out if it makes sense to make ninja the default.
> If only a few packages break on it, then we can force them to use make.
> But if there are too many of them, then we can just keep make as the default.
> 
> Either way, see this mail:
> https://lore.kernel.org/buildroot/20230806205447.GW421096@scaer/,
> where Yann told me that compiler-rt fails on ninja, so that's the
> reason for the patch.

Right, but changing compiler-rt to use out of tree build makes sense
together with switching to ninja. So in the same patch, you should have:

COMPILER_RT_SUPPORTS_IN_SOURCE_BUILD = NO
COMPILER_RT_CMAKE_BACKEND = ninja

And then later, when we are ready to make ninja the default backend of
cmake, we can remove in one batch all "<pkg>_CMAKE_BACKEND = ninja"
statements from all packages. We can also progressively mark as
"<pkg>_CMAKE_BACKEND = make" the packages that we know are not
compatible with ninja.

At least, that's how I see the transition period. What do you think?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
