Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F45C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 00:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5259E60EDE;
	Wed, 27 Apr 2022 00:56:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hqL6OOuA5QJb; Wed, 27 Apr 2022 00:56:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D66960C19;
	Wed, 27 Apr 2022 00:56:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3CEE71BF57B
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 00:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3972C60B62
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 00:55:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ZuCXqdL2VtW for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 00:55:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E55FD60C19
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 00:55:57 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id p10so469457lfa.12
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 17:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LJWUoUaXy0icr2CCkWpc9o/7M4Jgh58dAbPKdqIlGfA=;
 b=RZ3FBZodQ2nkhufwU0rB0CSEkkSI2k0hIS04awK3rX/vav3gd/viFwlD2NXc8UjT4j
 wW1ky5BDoXqljPQ0Plg7/D8qyZf55ewBflQzG7eUafyduf472jrge09s2PfYvu77q72c
 MIqw6oco1cjpHulLsc05I8kbwc9gWt8rFJoFblQ+s9yQcfYFeATcwJuhc7ZGPHoWvS3h
 FpvR16cIIBIlbxi+j/vHgSi+bCSgFjAWqZfkW29TvebAfSLy0ZRQv2UuqsZ+PXPIyttI
 dmcisT3Sw0cdayeGia6nRnzUxPvzRNOqrf1YxJEtyiEjKO4u2CLwavgfF4ZkT3jDSibv
 6Bmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LJWUoUaXy0icr2CCkWpc9o/7M4Jgh58dAbPKdqIlGfA=;
 b=fgT3fN2kcGpoupAbWciDdswxl1ocovy+EiTVc20Qfgm6gQeDFaJl5A+TMAyfIxqk2S
 RYOHL1PCH574nU+tdXPODSXdbhFNbdhybKi/AwYgrluf9aWETTsKNWmoHq8F+Z2xfRge
 9PbITD9AAdiCGMX71Dilm87PdcuqR4tYv+OsDfKaDQ7ARvGb1jwpYf7Uf1ZFBvaii7r5
 yZDK5F2CEvsPd/x06V3Ynif3ngLr4/QPeaTTpYE6fllHQCbfJVnYWC44Nj2fks5E7qf2
 nbCrHYmLKvDLXrqkg44DezsEZ4DgCaJ9Fc05eoi2/89iKHmYNb+6x0WlR7cA/HCcdVds
 Axmw==
X-Gm-Message-State: AOAM530tvhmuPtNS0RZmLWpx0Es38tRsB/ij27v+1dwToBaew8nKOpkP
 JxVowWymCAU8IL+1amepIzPooc9MaXxAW0dY
X-Google-Smtp-Source: ABdhPJzArB/sOoSHvJTfiJuwEq4Wo9VDjZ4qThbRKnAYOth0l6+Vp0eft/xqXIM6wNslWsUVgd/NHw==
X-Received: by 2002:a05:6512:3983:b0:471:9828:dd82 with SMTP id
 j3-20020a056512398300b004719828dd82mr17788171lfu.269.1651020955537; 
 Tue, 26 Apr 2022 17:55:55 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com.
 [209.85.167.47]) by smtp.gmail.com with ESMTPSA id
 s22-20020a195e16000000b00471fe476a26sm1268027lfb.41.2022.04.26.17.55.54
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 17:55:54 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id bu29so580476lfb.0
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 17:55:54 -0700 (PDT)
X-Received: by 2002:a05:6512:228d:b0:471:a5b8:d51a with SMTP id
 f13-20020a056512228d00b00471a5b8d51amr18310167lfu.411.1651020954353; Tue, 26
 Apr 2022 17:55:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220414204922.866533-1-christian@paral.in>
 <55c0f7da-0907-b920-5a9b-33a82dcdb32b@mind.be>
In-Reply-To: <55c0f7da-0907-b920-5a9b-33a82dcdb32b@mind.be>
Date: Tue, 26 Apr 2022 17:55:43 -0700
X-Gmail-Original-Message-ID: <CA+h8R2pJDuZhTYYp23oA4HuXyLFJe4BiGYn_GTpYn0Wmm_Bb0A@mail.gmail.com>
Message-ID: <CA+h8R2pJDuZhTYYp23oA4HuXyLFJe4BiGYn_GTpYn0Wmm_Bb0A@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/go: add support for riscv64
 architecture
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout,

On Thu, Apr 21, 2022 at 12:54 PM Arnout Vandecappelle <arnout@mind.be> wrote:
> On 14/04/2022 22:49, Christian Stewart via buildroot wrote:
> > +GOARCH is set when calling mkbuildcfg, so go1.4 is trying to compile riscv64.
>
>   You SoB is missing.

Go's repository disallows signed-off-by lines.

>   Also, the reference to the upstream PR is missing. And you should probably
> refer to gerrit instead.

Same issue: I've format-patch the exact patch sent upstream, without changes.

Do I modify it specifically for this patch in Buildroot?


> > diff --git a/package/go/Config.in.host b/package/go/Config.in.host
> > index e82ab6e81a..8be86103ea 100644
> > --- a/package/go/Config.in.host
> > +++ b/package/go/Config.in.host
> > @@ -5,7 +5,7 @@ config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> >       depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
> >       depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
> >               || BR2_i386 || BR2_x86_64 || BR2_powerpc64le \
> > -             || BR2_mips64 || BR2_mips64el || BR2_s390x
> > +             || BR2_mips64 || BR2_mips64el || BR2_riscv || BR2_s390x
>
>   Here you enable it both for riscv32 and riscv64, but below you always set
> GOARCH to riscv64.

I'm not sure if it was in this patch revision, but I have in my local version:

    # Go doesn't support Risc-v 32-bit.
    depends on !BR2_RISCV_32

> Also, are you sure it doesn't need any of the ISA extensions? I can imagine
> that Go would be using atomics, floating point and integer
> multiplication/division. Of course, there's almost no chance of finding a
> riscv64 without these extensions, but better be correct, right?

Probably yes.

>  Also, does Go support all three ABI types (integer, single precision and
> double precision)? Again, we only ever test lp64d in the autobuilders, but
> better be correct, right?

There's only one riscv64 target for Go so I have to assume it means lp64d.

Note: I have now tested this extensively on a Nezha Risc-v CPU as well
as a Qemu VM.

https://github.com/skiffos/buildroot/blob/e1fc20cf9/package/go/Config.in.host#L12

Best,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
