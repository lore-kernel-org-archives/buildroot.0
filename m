Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A01C433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 21:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C23360B79;
	Fri, 13 May 2022 21:04:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AczaZyzYt0d3; Fri, 13 May 2022 21:04:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1235D60B4B;
	Fri, 13 May 2022 21:04:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B4F8B1BF3CD
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 21:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2C1283A47
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 21:04:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bIMRfzb6uILw for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 21:04:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BEC6383495
 for <buildroot@buildroot.org>; Fri, 13 May 2022 21:04:03 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id v12so12862753wrv.10
 for <buildroot@buildroot.org>; Fri, 13 May 2022 14:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/ZxK5E9w2V1AWHJJa3dVZzfsaSZX+Tm/1t2LUARx+gs=;
 b=CKy0NvVDaJf10t9r3y2Hs8jdmVyGiF71wrbxM9DbK9xTaHyHtXwZUBl5iyaanBXpz9
 jp6lYbFEsehh07TdkrLGJ7/F2jzKWqmo65uZNpIqwJ/+CAh5F52DLNj7RGLO/9qDAnC0
 nW0bg/nR7+IzBKvwJpop1hMkR6RRom1GxsyOzbmEXvCIJVc3uwLKu+P21t+aiQV8Nq7V
 epfkcWGKgapZt2uwpPx6vUBGDRczZpZF/9qOmGd9plSN/Z19Sv79m9kG5yyyV48Rrmgg
 xPN7mxPEinIlrLPtUu1yr/e31O+8fr9RLM4sX3VKIJtfF4vxCvWtEkUyj+iCeCAL2Ozx
 BM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/ZxK5E9w2V1AWHJJa3dVZzfsaSZX+Tm/1t2LUARx+gs=;
 b=CSoC24OwMuq8Rcu3AtTJkt5JWf/2kkFKFn0XuOyT+nfwheROThyI+4VR68JgK/OGJ+
 EWJ8seEIicqNaVbOhry7CDQSXh9pr0ldQwtV723DHRiEbZMcuCTuqINWO8g9lVLBx0IN
 4AyrjLWj0ltFn7hqwbZL1Ct1y43zhGRqdNdgdz3GgJD0rlWu5R9w4HZxMt6Xx2PDm//D
 MXr7kyKT+uG5PvbT2pWvEP2L4uV+p+Fh34RGJrEb5DiJcqBiKOulOCuPMVvTezByZWpf
 pprAleHmtyaqlAB36fm8KeYILd+dFxAdBIINqrhWDtJyjr6bl6qbEYPhIIYPJxPlwwTv
 VYmA==
X-Gm-Message-State: AOAM530WM8ZzyYQLpzXGzRLmYRi53Q+EnUH4JNOZPzWdvNx/ZdmZ3Sul
 Dx4eZwr4TnPksPXkCsBzKSn0ELv9Iuq6bdPdNIo=
X-Google-Smtp-Source: ABdhPJwPuLsIv9HfQzs5uPzpAhPvsT0W+ryMDk2UuAGiTReCg4y5WrJ6rJK07K7oFNlXdjtmZ0lycGGzeLL0hz6vMIM=
X-Received: by 2002:a5d:6dab:0:b0:20c:84b1:5d4e with SMTP id
 u11-20020a5d6dab000000b0020c84b15d4emr5585163wrs.470.1652475841850; Fri, 13
 May 2022 14:04:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220513071522.19853-1-heiko.thiery@gmail.com>
 <20220513170138.GT1597494@scaer>
In-Reply-To: <20220513170138.GT1597494@scaer>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 13 May 2022 23:03:50 +0200
Message-ID: <CAEyMn7YzOs=VjLQaNNT=kC_M+QVz5C+AefRdnwpnEqHU3YGnDg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH] configs/kontron_pitx_imx8m_defconfig: use
 linux kernel 5.17.7
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

Am Fr., 13. Mai 2022 um 19:01 Uhr schrieb Yann E. MORIN
<yann.morin.1998@free.fr>:
>
> Heiko, All,
>
> On 2022-05-13 09:15 +0200, Heiko Thiery spake thusly:
> > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> > ---
> >  configs/kontron_pitx_imx8m_defconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/configs/kontron_pitx_imx8m_defconfig b/configs/kontron_pitx_imx8m_defconfig
> > index 161b9cfe3b..b69516b8cc 100644
> > --- a/configs/kontron_pitx_imx8m_defconfig
> > +++ b/configs/kontron_pitx_imx8m_defconfig
> > @@ -10,7 +10,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
> >  # Kernel
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16.1"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.17.7"
>
> Since we now have support for 5.17 headers, I've also changed that:
>
>     -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
>     +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=y
>
> Could you please check that I did not bork it?

Just did a build and that finished fine. I will do a runtime test as
soon as I am at a device.

>
> Applied to master, thanks.
>
> Regards,
> Yann E. MORIN.
>
> >  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> >  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> >  BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mq-kontron-pitx-imx8m"
> > --
> > 2.20.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

Thanks
-- 
Heiko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
