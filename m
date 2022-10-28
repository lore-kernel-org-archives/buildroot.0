Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B10ECAAA1
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 04:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F0B94097E;
	Fri, 28 Oct 2022 04:59:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F0B94097E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xv3_IjCjZkma; Fri, 28 Oct 2022 04:59:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B83B4092A;
	Fri, 28 Oct 2022 04:59:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B83B4092A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E45D1BF286
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 04:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22388403AC
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 04:59:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22388403AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1JFkWdeX1SUX for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 04:59:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A90D400D0
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6A90D400D0
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 04:59:43 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id m2so3730856pjr.3
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 21:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F4YJcS6luZqTBqoqRWfPdhwDcWVVDYhjpnDGsThKwNk=;
 b=gAJCGVeukQatg3KHsovb3z2ulqeep/jFTQFAs5/blFtLUPK5bMgxkFyJEzxEIdOr+8
 x/k9PPrcUcky+L0F5qxYrszle3BSu2TRRET9yKq+NEgjxUyO56AGDvfKnL9TH1s6c/ww
 78UZQCFyJRJmU3jU8sivHNjbih72MuwRW7WDy+IVD04ZdvhypfdbGzrhcmtTfBYsRmPJ
 +YAZtpkXguS0NoJ7JOZ6jug8FEXSMZMeUXuEOqwOr/5RCpeQNx/Uymv7U8ehyCkFVg9V
 Fo1owsOTGeO0JRcvcIfCk1a7D8iCNLMZfol/4BtdZX3sCk2nReE3YY8+3Sa93kmaYd5W
 XJLw==
X-Gm-Message-State: ACrzQf05RWrTlpCYIhLUJpTZ8I93G87okdlF9ZTmhhccRz9iKiJehO6a
 6OF88ZH6W1NL6VpsPJlBU+PQrn3f1x5oRJ3Zss0=
X-Google-Smtp-Source: AMsMyM6VI16+1gZuFqjEjaO12vH50uBWU79ovmqyrM8NLPtJ/ZjhNEsDVIHekzYPTqTLeAyK+zy7MQPC5MK3CUhav9c=
X-Received: by 2002:a17:902:f551:b0:186:be04:6670 with SMTP id
 h17-20020a170902f55100b00186be046670mr19146961plf.159.1666933182524; Thu, 27
 Oct 2022 21:59:42 -0700 (PDT)
MIME-Version: 1.0
References: <20221022142040.625468-1-ju.o@free.fr>
 <CAOMZO5CxFizBnnyTf-bW=mJ=kO-cdrchN8xDgm6HaGr3+sKPMA@mail.gmail.com>
 <877d0ls30z.fsf@tarshish>
 <CAOMZO5ARKCNBFoJUcD_C5No=aZYCCkUpGpXdNH26ZigctehWzQ@mail.gmail.com>
In-Reply-To: <CAOMZO5ARKCNBFoJUcD_C5No=aZYCCkUpGpXdNH26ZigctehWzQ@mail.gmail.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 28 Oct 2022 06:59:30 +0200
Message-ID: <CAEyMn7Yt=H=jMToKBRG6J=5ee01tt6QwY8FyRe2ej8NzBj7McA@mail.gmail.com>
To: Fabio Estevam <festevam@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=F4YJcS6luZqTBqoqRWfPdhwDcWVVDYhjpnDGsThKwNk=;
 b=bwSoC610Nd4OIpgf0bm3DtK4a105CAiKN1QQBj7CKCqxOB9IDF/8SYqqkZmo32cP+o
 p6ZsKzb1w+Q1ZTY1j4R5EW0OlHzT/I/KzsuR7ubZOqCv4hiuDSn8EBHlU3iKWz4+OzJK
 ZIIhuHG+VtSaU2ls4oKxYMZCYaiYz5EG9+HDoiJMCb6cNtLqEXOJJ1VTRgca2lthtclQ
 f8+fOGohC04NDqopyOAaPIOzFidJWTF5xbCQQLWPgkPhw2Im0ULyoGCWp7we6v1VMvB2
 awkzo7rh3VBg+luZ974V9m4ZkkdAb2zCfU1RHUTLQ6P4aVlhLEEE3iY3nkj4TbIkv6RW
 yIFg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bwSoC610
Subject: Re: [Buildroot] [PATCH 1/1] configs/imx8{m, mm}pico: disable ATF SSP
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
Cc: Julien Olivain <ju.o@free.fr>, Sergey Matyukevich <geomatsi@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Am Fr., 28. Okt. 2022 um 05:04 Uhr schrieb Fabio Estevam <festevam@gmail.com>:
>
> Hi Baruch,
>
> On Thu, Oct 27, 2022 at 12:24 PM Baruch Siach <baruch@tkos.co.il> wrote:
>
> > The global fix might be this:
> >
> > diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
> > index 5070849d9b43..a9b9bbcc5a1f 100644
> > --- a/boot/arm-trusted-firmware/Config.in
> > +++ b/boot/arm-trusted-firmware/Config.in
> > @@ -212,7 +212,6 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN
> >
> >  config BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP
> >         bool "Build with SSP"
> > -       default y
> >         depends on BR2_TOOLCHAIN_HAS_SSP
> >         depends on !BR2_SSP_NONE
> >         help
> >
> > Commit cf176128ec4 ("boot/arm-trusted-firmware: add SSP option")
> > mentions that not all platform implement the require hook for SSP. So I
> > think that enabling SSP by default is not the right choice.
>
> Yes, that is a proper fix.
>
> Thanks

I can also confirm that it works again with the change.

-- 
Heiko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
