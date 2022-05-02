Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7453C433EF
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 04:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5137740256;
	Mon,  2 May 2022 04:22:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5bJS3nzmp_WW; Mon,  2 May 2022 04:22:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 099764018C;
	Mon,  2 May 2022 04:22:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CDEF21BF408
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 04:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC0264018C
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 04:22:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D99xKCH2C6qD for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 04:22:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51FAE40133
 for <buildroot@buildroot.org>; Mon,  2 May 2022 04:22:06 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id y19so17052279ljd.4
 for <buildroot@buildroot.org>; Sun, 01 May 2022 21:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wZZbXvLWh3EMJVhTrIRpIzVBqTIcE1VHlywO75RHCgY=;
 b=BTzRM28qbYo09OLdfuN7U4XX0KOP/000hB6AraiU1/6yJPMBUQMtt8+L0YY25SPzr8
 oOCbzrBdZrpjbZnkJj0xPXHVOfXyWoN5pqO6Hbd3p6YitkEvBMjvB8gQNIPcdAnftRbp
 70iqCdRfp/87gKe0Okq9FUH+owdkYHJy/4yNs5byNWW3xtjXsdogE5c6vaoFkIZYBByd
 syJCywBs/Kr9VQXwJkPN4UT108nL4pLI5Xn2lQfPtDhYak4Y36HglyyJeg3fxvBdEs8t
 qYDuMR1tkPnmShaPdMNPsy4aRDn52EHB3ChsIouM22D1vP3iytWB13LSvCmP335p1o9K
 4dow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wZZbXvLWh3EMJVhTrIRpIzVBqTIcE1VHlywO75RHCgY=;
 b=S3qMPkP7yCBqajdR+sLNDZiGBzbLgOpZ/uRrBRQkddHPg7LkntAXH2F2M6cpdIFnBK
 +UosgoQPXxLsQupdgnGa+s0LspgFV1igr8KrcyjuEM9vlPRC9el7F76r0oXJS4r+k6/U
 0ZOt/RUXg7z+BGnXHVrwG5REaPb4Mw9j00agPtGEn/SOEidhdWv6hFBvc1esDZWaqCHj
 gqZES36/4iC5NCKI7s1+Vl/fgagFTzVI/YQRo78CubfARyYhKAevZ2FPGAa83NfdpYUQ
 4cQoN97qqE4Be/+oSZw3bVB7D7IWkIh4HTNPw8rxmeAANUiXDvWaxnRDATisxBlQFUkV
 eIyQ==
X-Gm-Message-State: AOAM531IjUhNfNSgyITKcKYUG3XMLAn60BmK3RHCp7tfWiLS28y0ryDa
 5cgZAot/CUQoRGyzLF7EqiP59YZcCyEfo+NYKE0=
X-Google-Smtp-Source: ABdhPJyNXy99l36zgbRNLrJDH0+AijMvWlfs0wnIY1rNLApsIkwd9I/voC5VbMViskjiUDlcy4t6v6vZd5b9huMA9+w=
X-Received: by 2002:a2e:8449:0:b0:24f:4db3:f02e with SMTP id
 u9-20020a2e8449000000b0024f4db3f02emr5285597ljh.140.1651465323989; Sun, 01
 May 2022 21:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220502040500.93634-1-charles.hardin@chargepoint.com>
 <87mtg0y3f8.fsf@tarshish>
In-Reply-To: <87mtg0y3f8.fsf@tarshish>
From: Charles Hardin <ckhardin@gmail.com>
Date: Sun, 1 May 2022 21:21:52 -0700
Message-ID: <CAN=fXj2w7t3g2t69QgTjTMqD5pkq1zycNYUggPTBnaB8NJfM-g@mail.gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [Buildroot] [PATCH 1/1] toolchain/toolchain-external: add
 aarch64 as a hostarch for arm tools
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

inline

On Sun, May 1, 2022 at 9:16 PM Baruch Siach <baruch@tkos.co.il> wrote:
>
> Hi Charles,
>
> On Sun, May 01 2022, Charles Hardin wrote:
> > From: Charles Hardin <ckhardin@gmail.com>
> >
> > The gcc toolchain is also released for an aarch64 host target and allow
> > that configuration to be used as part of the configuration. Tested on
> > on a aarch64 linux docker.
> >
> > Signed-off-by: Charles Hardin <ckhardin@gmail.com>
>
> [...]
>
> > diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
> > index 4392205105..0f554953ec 100644
> > --- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
> > +++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
> > @@ -7,6 +7,10 @@
> >  TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 2021.07
> >  TOOLCHAIN_EXTERNAL_ARM_ARM_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)/binrel
> >
> > +ifeq ($(HOSTARCH),aarch64)
> > +TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = gcc-arm-10.3-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-aarch64-arm-none-linux-gnueabihf.tar.xz
> > +else
> >  TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = gcc-arm-10.3-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-x86_64-arm-none-linux-gnueabihf.tar.xz
> > +endif
>
> Maybe just
>
> TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = gcc-arm-10.3-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-$(HOSTARCH)-arm-none-linux-gnueabihf.tar.xz
>

Following the pattern seen in toolchain-external-linaro-arm.mk - no
problem changing it - for reference this is what i saw in the other
.mk

ifeq ($(HOSTARCH),x86)
TOOLCHAIN_EXTERNAL_LINARO_ARM_SOURCE =
gcc-linaro-7.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)-i686_arm-linux-gnueabihf.tar.xz
else
TOOLCHAIN_EXTERNAL_LINARO_ARM_SOURCE =
gcc-linaro-7.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)-x86_64_arm-linux-gnueabihf.tar.xz
endif

>
> baruch
>
> --
>                                                      ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
