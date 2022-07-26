Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EBBC43334
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 06:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66B68409C6;
	Tue, 26 Jul 2022 06:38:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66B68409C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 065FA_DoTpqY; Tue, 26 Jul 2022 06:38:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F1374091C;
	Tue, 26 Jul 2022 06:38:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F1374091C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B831F1BF287
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 06:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91EC240B80
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 06:38:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91EC240B80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gPsaAVhPCCdF for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 06:38:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87F35400CB
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 87F35400CB
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 06:38:23 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id w188so11878691oiw.8
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 23:38:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TN9XCdP87ru0crp2jn31q/jOFLZ82MWG6cBPRz9bymQ=;
 b=lxKKBsWBg63EyQqIs+8084A01yTaerglRCpi1lwYb5io1c018AxPNTUrwxgc8xW/RM
 9BFhmOmO+N0LrEqma1HorP/d680V7G2/9VryGmHmavLER+ue6T2R9tGIFkiKTwgihzCy
 h07vgDRpmRWjulzQI3qPrOuVrwSymlO80moScTq/yJBmAcypgQygd6cwxAqiBoMIu6sj
 opzxo5q6wjKzfKeR+fSM6wiudB5C0bKEh3DkAHLFV+rkg23aZks0dXd08G7skaGS1jet
 y52CTZqMRPqZOHZuOOTDCVRHitMEvIlyJMa/T9kvRS1EdJdPJo0gxn4yl/XZwgYHnM0e
 AIPw==
X-Gm-Message-State: AJIora+9vsMz4/OfAPcAwsydjp0sgXcbvLQ7udC1NjXmMY2nOAitTJoC
 /wYrSz6cNqNxf07QmolVMPz6RBwNCw4vxVQJ/ClLoICDZlI=
X-Google-Smtp-Source: AGRyM1uTogReE/ABAGMEk7aNQid8AdjBgoRoJUCVS6A7L3Q6QBhI7+3iF9ZGfp5RTvbCW4YLrahaBmE08TUmZAW+v5o=
X-Received: by 2002:a05:6808:211a:b0:33a:9a59:fb31 with SMTP id
 r26-20020a056808211a00b0033a9a59fb31mr7127608oiw.147.1658817502579; Mon, 25
 Jul 2022 23:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220726044425.72570-1-james.hilliard1@gmail.com>
 <20220726044425.72570-2-james.hilliard1@gmail.com>
 <20220726082503.48ce118f@windsurf>
In-Reply-To: <20220726082503.48ce118f@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 26 Jul 2022 00:38:11 -0600
Message-ID: <CADvTj4ob3JZmsB=jdW3kM4mTQ30jsDXWTOEG5FUG1b=vwfRB8g@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=TN9XCdP87ru0crp2jn31q/jOFLZ82MWG6cBPRz9bymQ=;
 b=HYk61agIxOtCsv821SrJ+WamRapHmDX5VNBJxk5EkblP8OlyyfdpzcxGW1V8d9940U
 UP9D4YMJniyQgh7rZXctRIz2uHGFnpRBmbpyZB+tN6/8NKSopReBNDxek4gWQ25Iu44f
 xYqfYe9TuBGIuJlLODMR5VIw5OfuaPEO9gIvrCfuI0RFQaHpKZ2LxXLwlVagvv4Ud3ac
 Su64tEC49PQ/H3H8bvTfetNTQ0ZfxRTDxVODxJ4lHbjyvxEC88JxSAo57hhQwJ+i42UW
 9Ka46nxjc9ururUMiN+Lo4ePfKLGUW0GA6iPmxwuMqV6cIEak5u5VRCnU6fQVKnqp3n2
 74dg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HYk61agI
Subject: Re: [Buildroot] [PATCH v4 2/2] package/pkg-meson: use meson to
 build/install packages
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Samuel Martin <s.martin49@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 buildroot <buildroot@buildroot.org>, Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Jul 26, 2022 at 12:25 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello James,
>
> On Mon, 25 Jul 2022 22:44:25 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > Note that we need to avoid setting HOST_DIR in paths when configuring
> > as these will get appended to the destdir during installation which
> > will result in incorrect paths.
>
> I *think* this is wrong, at least in the classical autotools sense of
> prefix vs. DESTDIR.

This isn't really different from how we handle target/staging prefix+install.

>
> > @@ -156,10 +157,11 @@ define $(2)_CONFIGURE_CMDS
> >       mkdir -p $$($$(PKG)_SRCDIR)/build
> >       $$(HOST_CONFIGURE_OPTS) \
> >       $$($$(PKG)_CONF_ENV) $$(MESON) \
> > -             --prefix=$$(HOST_DIR) \
>
>         --prefix=$$(HOST_DIR)
>
> should stay here.
>
> >  ifndef $(2)_INSTALL_CMDS
> >  define $(2)_INSTALL_CMDS
> > -     $$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
> > -             $$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
> > +     $$(HOST_MAKE_ENV) \
> > +     $$($$(PKG)_MESON_ENV) \
> > +     $$(MESON) \
> > +             install \
> > +             $$(MESON_INSTALL_OPTS) \
> > +             --destdir $$(HOST_DIR) \
>
> And you should drop --destdir $$(HOST_DIR) here.

I recall this didn't work due to pkg-config file generation being prefix based
which was resulting in pkg-config files being incompatible with per-package
directories.

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
