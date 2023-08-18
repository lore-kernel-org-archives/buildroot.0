Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89821EE4981
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 17:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E04D982151;
	Fri, 18 Aug 2023 17:18:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E04D982151
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CY7sudrH-ZJp; Fri, 18 Aug 2023 17:18:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 820F880C14;
	Fri, 18 Aug 2023 17:18:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 820F880C14
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B49A21BF290
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 17:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F71160A71
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 17:18:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F71160A71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tVvBz0ngXgRB for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 17:18:33 +0000 (UTC)
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B0DA960A6A
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 17:18:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0DA960A6A
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout02.mail.de (Postfix) with ESMTP id 9570FA065A;
 Fri, 18 Aug 2023 19:18:30 +0200 (CEST)
Received: from smtp01.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix01.mail.de (Postfix) with ESMTP id 7BF8C80069;
 Fri, 18 Aug 2023 19:18:30 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 81B10241234;
 Fri, 18 Aug 2023 19:18:29 +0200 (CEST)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Date: Fri, 18 Aug 2023 19:18:28 +0200
Message-ID: <4850715.GXAFRqVoOG@kilian-aisec>
In-Reply-To: <CAOCHtYiuJimX-pF-hUhuK35X+63eE1GJbK=xAZOR73gb8iZkog@mail.gmail.com>
References: <2691942.mvXUDI8C0e@kilian-aisec>
 <CAOCHtYjoouGOSwOy1Fh4muYnU3E-yY6jp8GOcy1f=MhCaaAx8w@mail.gmail.com>
 <CAOCHtYiuJimX-pF-hUhuK35X+63eE1GJbK=xAZOR73gb8iZkog@mail.gmail.com>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1929
X-purgate-ID: 154282::1692379110-F6FFC660-6169E78E/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1692379110;
 bh=U+Ag0ovtshHYwh7ql/gov+kTG+hI7RfIw9oGoW4LZ8o=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=Eczw2J7QCO06iMVuIEtx6YpFHe0C/pl/hmiLLQ50mr7EUeBpU1aZsTLtdoZVlOgDk
 ru92fb0LeNQh9mXeXwibvFeE4LPsLxcVKXSYrXXgmegar70g4dx6gbOYLz2Kjnyu81
 qWzmwjh0uEOedWrC7R8pbPu7nAJGSBTkqQLmuQ0jPhWOVsrn0TisSrxNXm4Hpb7b1m
 b+i9oq4pvnYKA5yw8IxhucRq9JOSyRGApT1pYIFEiAOvQBEAbEuqbPt6Wd5vD55qxa
 vxvVwUoNnwYbEAoqMzc5Y+tqtkHnRfpZdwrHFFly+Hzj8JDZF4lgL5ha4CEClxz+X9
 Py/wpnsSVO2cw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=Eczw2J7Q
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
Cc: Robert Nelson <robertcnelson@gmail.com>,
 Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Robert and Thomas,

I am making a bit of progress. However, I still have some issues.

[--SNIP--]

> Okay Kilian, these all build with
> x86_64-gcc-13.2.0-nolibc-riscv64-linux.tar.xz
> 
> opensbi:
> https://git.beagleboard.org/beaglev-ahead/beaglev-ahead-opensbi/-/tree/0.9-> 1.1.2-ubuntu u-boot:
> https://git.beagleboard.org/beaglev-ahead/beaglev-ahead-u-boot/-/tree/beagl
> ev-v2020.01-1.1.2-ubuntu linux:
> https://git.beagleboard.org/beaglev-ahead/beaglev-ahead-linux/-/tree/beagle
> v-v5.10.113-1.1.2-ubuntu
> 
> For bandwidth issues, please use the github mirrors directly in
> patches for buildroot, as these are push mirrored from
> git.beagleboard.org/ , at worst they lag by 10 minutes after a new
> commit
> 
> opensbi:
> https://github.com/beagleboard/beaglev-ahead-opensbi/tree/0.9-1.1.2-ubuntu
> u-boot:
> https://github.com/beagleboard/beaglev-ahead-u-boot/tree/beaglev-v2020.01-1
> .1.2-ubuntu linux:
> https://github.com/beagleboard/linux/tree/beaglev-v5.10.113-1.1.2-ubuntu

When buildroot compiles opensbi, I get a lot of "undefined reference to 
`__stack_chk_guard'" errors. I think that either the necessary "-fno-stack-
protector" flag is not active during build, or that the toolchain does not 
provide the necessary functions. I tried adding something similar like this

https://gitlab.com/buildroot.org/buildroot/-/blob/master/boot/arm-trusted-firmware/arm-trusted-firmware.mk?ref_type=heads#L67-72
https://gitlab.com/buildroot.org/buildroot/-/blob/master/boot/arm-trusted-firmware/Config.in?ref_type=heads#L234-251

to the opensbi config and make files, but it did not help. I also checked and 
the .config contains the following flags:

BR2_SSP_STRONG=y
BR2_SSP_OPTION="-fstack-protector-strong"
BR2_TARGET_OPENSBI_SSP=y
BR2_TARGET_OPENSBI_SSP_LEVEL="strong"

Does anyone have an idea? I can provide more info if needed.

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
