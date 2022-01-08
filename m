Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384EDC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 14:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7874410C8;
	Sat,  8 Jan 2022 14:44:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eSvBQ1BG6y4w; Sat,  8 Jan 2022 14:44:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B21C410D3;
	Sat,  8 Jan 2022 14:44:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 338DF1BF2FA
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 14:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F303400CF
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 14:44:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qIBR-WACc0Ol for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 14:44:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA4BE40106
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 14:44:53 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id i31so26561727lfv.10
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 06:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AW8qWFpDiIgwR5Ewcv4r/B2fzIOYfkqSkUs7/roBkWs=;
 b=HyKZgjSpmbGSSwQgcQbW//nJK/8iKMvYfw3mRFyv+x0BEPLfJm/Cb3t0SarYwr3vr2
 xbFJMRmaDoTmtTCkdrNmb1Cqqshp53/c1mLsCKz1ywItmFX/vD8fhWb5Ivm044XOtq+8
 2zTjur74BOGqqhX0GcQNecPifFqpaI8jD9ZtRQ2DUB6ejYZS3CRFVNvYxReuQs/wAelQ
 25Zsc5qA06SdjpmNNdkTEunXlbeGMd946ylWCRwKtujJ8yrXWdVRSh9p7CdG/xb4SReA
 uhNEttVQfMX+ItuLHYcAgQ5pLwV+ccu51mFExRV6Dh+IuQxAoewJ0L55kTnwd8u6nPXG
 zVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AW8qWFpDiIgwR5Ewcv4r/B2fzIOYfkqSkUs7/roBkWs=;
 b=yhOnTxFoLw0u/LijGIrROCF+xhFETsjv0x6XbAeSbPybDIJS61mKQqf+3HcYU7SyBM
 19IOJMPZd0G2xSDULgcc4uA9B8m8kJ0j3wuBmbQJmVWigFvOFJNAz8FPic2uF9THDeRI
 DoLNU6bMhrDQxsafbEF4tZDXrO0jcPka+X7K7n8nF433/W8WRlLAXT8r0qsXic3gTr6T
 IWiUp77VNcKtRiuDWz9K8hOtedx3oRo9fx86oT8vJPQEoAKHY3C3ySUvoR60VEEM3dFP
 DxER4FPaLsb/hRs4gdFToAwlT7EOTeUu7RshM/u1qyJTut3UPNMxmBaiUG0GSvv6YFTa
 EFkw==
X-Gm-Message-State: AOAM530jS4Rb+EGxDM6HyJb7J9YmekJs1TN3GT8o64VFpCUcFI8gVaLW
 QqwqP+Smi2w9GOAWse8mAVx7USqGlBeiE5gDWreAH7zPPDk=
X-Google-Smtp-Source: ABdhPJxs8OO9D1lldKtRdXfykDRC7fkXv+OJX3F6id/T9fTrvoSgrbJDivjyYDWvORct1hlm2PWSUGYewBnRVoRsu24=
X-Received: by 2002:a05:6512:282b:: with SMTP id
 cf43mr59327941lfb.331.1641653091881; 
 Sat, 08 Jan 2022 06:44:51 -0800 (PST)
MIME-Version: 1.0
References: <20201126144722.502163-1-nolange79@gmail.com>
 <c4ba627e-921f-396b-3ae4-685e7da39f5e@smile.fr>
 <195311e2-38dc-53ee-80b8-09dca52320a0@smile.fr>
In-Reply-To: <195311e2-38dc-53ee-80b8-09dca52320a0@smile.fr>
From: Norbert Lange <nolange79@gmail.com>
Date: Sat, 8 Jan 2022 15:44:40 +0100
Message-ID: <CADYdroNFGP8qThLZ3FDxU8Bm8JN56nBvmsbcpnBLbF444OKi0A@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/systemd: invoke
 systemd-tmpfilesd on final image
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
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>,
 =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Sa., 8. Jan. 2022 um 14:42 Uhr schrieb Romain Naour <romain.naour@smile.fr>:
>
> Hello Norbert,
>
> >> +#
> >> +# [1] - https://github.com/systemd/systemd/issues/16183
> >
> > It seems that systemd now include what you need since version 249 containing the
> > commit [1].
> >
> > The fakeroot_tmpfiles.sh script seems not neceesary anymore.

It is, this particular change did *not* get upstreamed, see [1].
Runtime specifiers might leak
to places they should not, the script is necessary to filter out those
dangerous specs.
Some discussion was at [2].

> >
> > [1]
> > https://github.com/systemd/systemd/commit/de61a04b188f81a85cdb5c64ddb4987dcd9d30d3
>
> I have marked this patch as "Changes Requested".
>
> Best regards,
> Romain
>
> >
> > Best regards,
> > Romain
> >
> >

Norbert

[1] - https://github.com/systemd/systemd/pull/16187
[2] - https://lists.buildroot.org/pipermail/buildroot/2020-June/587414.html
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
