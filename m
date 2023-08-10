Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB13C04A6A
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 17:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 826BE41888;
	Thu, 10 Aug 2023 17:03:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 826BE41888
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ipb6UZ_1VNvT; Thu, 10 Aug 2023 17:03:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56142418A0;
	Thu, 10 Aug 2023 17:03:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56142418A0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E78F91BF45A
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 17:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BECFA418A0
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 17:03:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BECFA418A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3J_DvstuKuwi for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 17:03:23 +0000 (UTC)
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 218B441888
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 17:03:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 218B441888
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout02.mail.de (Postfix) with ESMTP id D5766A0686;
 Thu, 10 Aug 2023 19:03:20 +0200 (CEST)
Received: from smtp02.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix03.mail.de (Postfix) with ESMTP id BA7AB801CF;
 Thu, 10 Aug 2023 19:03:20 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp02.mail.de (Postfix) with ESMTPSA id 7A2BEA0409;
 Thu, 10 Aug 2023 19:03:20 +0200 (CEST)
To: buildroot@buildroot.org, Robert Nelson <robertcnelson@gmail.com>
Date: Thu, 10 Aug 2023 19:03:20 +0200
Message-ID: <845846062.0ifERbkFSE@kilian-aisec>
In-Reply-To: <CAOCHtYjiGK+oKiYoPPosM6Ead+kcw1YEN8225FT3n=r=oqJ_Yw@mail.gmail.com>
References: <2691942.mvXUDI8C0e@kilian-aisec>
 <CAOCHtYjiGK+oKiYoPPosM6Ead+kcw1YEN8225FT3n=r=oqJ_Yw@mail.gmail.com>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 2391
X-purgate-ID: 154282::1691687000-3D7F8199-9A51BFA8/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1691687000;
 bh=On5hvVyZ/UfDvXDWCiBBWqa7hQ7/Gl5HaDm4JA/9PK4=;
 h=From:To:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=4M/VlUrm3EQymdf8Vwdd+K0xEjvzAVwXuFcerI9W/pgGUGYP2hccpeuGGT+RjQgAU
 4sIuGjTrQbqqrjgN9xCn2xfp0dPn+JnxJFFskaxqGf7gYWMWzadOdklgVuUryOEpUr
 HOk0NQrOgEnVgeud3lsapuZ+KwfAN44HHRbytpN/soca9o7FnwLGqVT5E8KPqFKuDA
 5NGXshjcZQlVGGHdKjjW6Ky4gETkP9hKfhsxpuXKpHv+dRqmaEYxCISDRtflWLoHh6
 X8jeO8PhcYdVoy/144BBPPXkgZelcYGTeLlzxPVTaYQF5njvgkSLrmw2tEidYZVRvj
 WoAEf0Fje6K3g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=4M/VlUrm
Subject: Re: [Buildroot] Interested in board support for BeagleV-Ahead
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Robert,

> > I am interested in adding board support for the BeagleV-Ahead.
> > 
> > I already started trying to setup the board support, but at the moment it
> > does not work yet, due to some gcc 12 and zicsr and zifencei RiscV
> > extension issue (see below).
> 
> Awesome work!

Thanks!

> BTW, i've created a special u-boot branch for mainline gcc situations,
> with *-ubuntu extension on the branch..
> 
> https://git.beagleboard.org/beaglev-ahead/beaglev-ahead-u-boot/-/tree/beagle
> v-v2020.01-1.1.2-ubuntu

So should I try using that branch then?

> Using kernel.org's x86_64-gcc-13.2.0-nolibc-riscv64-linux.tar.xz
> 
> I've been mostly working on mainline for the board with @Drew Fustini
> 
> Otherwise on the mainline we've been using main branch of opensbi and
> linu's 6.5.x-rc (only eMMC wip support).. not much else on the
> mainline branch yet..

Do you suggest, that I should then try to use mainline kernel, instead of 
"beaglev-ahead-linux" (https://git.beagleboard.org/beaglev-ahead/beaglev-ahead-linux)?

You seem to also be a maintainer for the "beaglev-ahead-linux" repository? Is 
the light_defconfig the proper one for the beaglev-ahead? What do you think 
about the issues I encountered regarding vector extension v0.7.1 and recent 
gcc apparently not supporting it? What do you think about maybe removing the 
CONFIG_VECTOR flags from the light_defconfig?

https://git.beagleboard.org/beaglev-ahead/beaglev-ahead-linux/-/blob/beaglev-v5.10.113-1.1.2/arch/riscv/configs/light_defconfig#L21-22

And also as mentioned in my other mail, I encountered an enum-int-mismatch 
error when compiling with (buildroot generated) gcc v13.2 between a functions 
an its prototype, see here:

https://git.beagleboard.org/beaglev-ahead/beaglev-ahead-linux/-/blob/beaglev-v5.10.113-1.1.2/drivers/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_linux.h#L338

https://git.beagleboard.org/beaglev-ahead/beaglev-ahead-linux/-/blob/beaglev-v5.10.113-1.1.2/drivers/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_os.c#L6144

And one more question: I was able to generate some binaries, but so far I 
don't have a clue how to assemble them to a proper image and how I would flash 
that image to the BeagleV-Ahead's eMMC. Do you happen to have some hint(s) for 
me, e.g., some link, some documentation, anything?

Best regards,
Kilian



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
