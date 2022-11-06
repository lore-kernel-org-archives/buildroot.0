Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A517C43217
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 17:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83F08404F8;
	Sun,  6 Nov 2022 17:01:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83F08404F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id peog0dIeXcEo; Sun,  6 Nov 2022 17:01:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AD83404EC;
	Sun,  6 Nov 2022 17:01:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AD83404EC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 673391BF32A
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 17:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 420D380FB6
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 17:01:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 420D380FB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZPHpUXCJcBCs for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 17:01:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 319E080F59
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 319E080F59
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 17:01:13 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id w4so5856184qts.0
 for <buildroot@buildroot.org>; Sun, 06 Nov 2022 09:01:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=js2YhGcQtlAQ2cicXVkCVyP36N+PP+FALUT1rTLd8XU=;
 b=F3gaAT8HgTRn0JEUTGa1FmxT63686ECH2fBTpRSh8DMfkcAULH3PFGjPS15c0l4dUA
 M8sCjptNcPZuqFbeUkL2+e3HxYOqDV/yZyqj2cCn4TVXS2IcYt016M2Rd0etQlnS4+g2
 rESq/A+s0uTCSruz/476ZcB6DWipaqMoZETkUb4X1Kp+jmx+Scrfx2goyp78bFbcik2X
 cdUD1rjFdisxBCW7EFNxyMWi/q8dfjCkBZgAvpU4qcgpwAkmRv1TuplBySoyIBlsoTTe
 AfvxbPvOB/n/lKrFmteUMtmyouyuRNl1jfrR9mxmnMXYUW/Sn+abKLhHesYsnwzbCgpu
 11fg==
X-Gm-Message-State: ACrzQf06Y1ZcrhFNhsqp8y8BbFTN07UXR4O82BIJKTf6dC7D+JzIFrzW
 cyNaXy54ZfUu/9viGzeZC0/tzUoTD2NIYbM38aw=
X-Google-Smtp-Source: AMsMyM7egQvpSy0E6k89oIuVJucyLPXhbBijVNywQ2AkiQIlR+U3w/Zj0DTuI2Nt6uJg8Ru4XJje1/9TgXOEH7+fO58=
X-Received: by 2002:a05:622a:6006:b0:39a:185a:a07a with SMTP id
 he6-20020a05622a600600b0039a185aa07amr580988qtb.30.1667754071929; Sun, 06 Nov
 2022 09:01:11 -0800 (PST)
MIME-Version: 1.0
References: <10881_1666122188_634F01CC_10881_33_1_cover.1666122184.git.yann.morin@orange.com>
 <CADYdroO7gJybDDV+oBqwOEHyHptKcdqnetBKTQ-tVHQkHUAUuQ@mail.gmail.com>
 <20221106164940.GC3918838@scaer>
In-Reply-To: <20221106164940.GC3918838@scaer>
From: Norbert Lange <nolange79@gmail.com>
Date: Sun, 6 Nov 2022 18:01:01 +0100
Message-ID: <CADYdroN8xGqVe2Cm0P6Pc+0UV++1tBjGcsTD0N_1eWKRgWctGw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=js2YhGcQtlAQ2cicXVkCVyP36N+PP+FALUT1rTLd8XU=;
 b=aSN/Cg8443+b6dvoHhxUzjh7Lo5Sl9+ueqLT0wYoDiXo+Owi3DcDuscGQmhjfzK+a9
 s3Yl+7Vl7LKqT9QX/XjZYzEz6iR5Wi9BnOgQAQzzbTBJp+bmRpUPcjzjbBRaDligFLlH
 nANCGXEBiirD3tFg0fdKEdsu6ftzVmFCb3EDZrG/wJf8tsCWG+fiXFvla2Lpbq6q1rRE
 oqdUBV9EhhBp6jX/QVgh8iUzIT309wYa4jySHfErMxhq7D828seta1EzpUtjR4VFP6dm
 lJ9PkL/dSmvhtzDXcCB/Eh+A7+XUAGzOyCJ66mR9GXHjGgYJFSpKdMZOWig7uHFq9unq
 ah7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=aSN/Cg84
Subject: Re: [Buildroot] [PATCH 0/6 v3] systemd: sort out the conflict
 between var factory and tmpfiles
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
Cc: =?UTF-8?B?SmXMgXJlzIFteSBSb3Nlbg==?= <jeremy.rosen@smile.fr>,
 Romain Naour <romain.naour@smile.fr>, yann.morin@orange.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am So., 6. Nov. 2022 um 17:49 Uhr schrieb Yann E. MORIN
<yann.morin.1998@free.fr>:
>
> Norbert, All,
>
> On 2022-11-06 17:21 +0100, Norbert Lange spake thusly:
> > Am Di., 18. Okt. 2022 um 21:43 Uhr schrieb <yann.morin@orange.com>:
> [--SNIP--]
> > > ----------------------------------------------------------------
> > > Yann E. MORIN (6):
> > >       package/skeleton-systemd: move /var factory tmpfiles out of /etc
> > >       package/skeleton-systemd: systemd-ify mounting /var tmpfs with ro rootfs
> > >       package/skeleton-systemd: host the tmpfiles preparation script
> > >       system: add options for /var factory and tmpfiles pre-seed
> > >       system: introduce a choice for /var management
> > >       system: add option to use an overlayfs on /var on a r/o root w/ systemd
> >
> > you did not cc me for
> > [PATCH 5/6 v3] system: introduce a choice for /var management
>
> Woops, that is definitely an oversight, as I did plan on having you in
> cc of all changes for you to review. Sorry for the mishap.
>
> > I would choose the world NONE instead of CUSTOM,
> > as that is what buildroot does with /var.
>
> I am not too strongly set on using CUSTOM, so NONE is OKish...
>
> > Later we could offer CUSTOM by for ex. only providing a var.mount
> > file, that expects a user-specific mount or similar.
>
> I am not sure I can see how that would work...
>
> Were you thinking of something like:
>
>     [Mount]
>     EnvironmentFile=-/etc/default/fs.var
>     Where=/var
>     What=$VAR_DEVICE
>     Type=$VAR_TYPE
>     Options=$VAR_OPTIONS
>
> But then, would it not be easier to just provide a drop-in to override
> those? What would be the advantage for us to provide a template to begin
> with, leaving users to provide thei full var.mount?
>
> And that also leaves the question of how that /var would get populated.

I am still experimenting with this (see comment on Patch 6).

Idea:
buildroot would provide the read-only var in /run/.br/bnd/var
and var.mount would be the same overlay mount,
but the user is expected to provide a mount for upper + workdir,
as systemd unit, fstab or initramfs or whatever.

>
> > +config BR2_INIT_SYSTEMD_VAR_NONE
> > + bool "do nothing"
> > + help
> > +  Choose this if you have custom dispositions (like a
> > +  post-build, fakeroot script, systemd units, or initramfs)
> > +  that prepare /var to be writable on a read-only rootfs.
>
> Actually, "do nothing" is a bit misleading, as users with custom setups
> actualyl *do* something, it's just something else that is not listed in
> the prompt.

*Buildroot* does nothing. the user might do nothing, as the base systemd
services do work (with the fakeroot systemd-tmpfiles call), or
provide *his* completely own solution.

>
> But you are right, that the choice for the init system has a "None"
> entry with a _NONE suffixed option, so for consistency, that is probably
> good to use _NONE here too.
>
> > but take my
> >
> > Acked-by: Norbert Lange <nolange79@gmail.com>
>
> Great! :-)
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

Regars, Norbert
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
