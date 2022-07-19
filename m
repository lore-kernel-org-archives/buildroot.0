Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C1CC43334
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 21:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0924A82FC9;
	Tue, 19 Jul 2022 21:58:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0924A82FC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n8JRhOttwh8F; Tue, 19 Jul 2022 21:58:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE6C182FA2;
	Tue, 19 Jul 2022 21:58:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE6C182FA2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0E9281BF37C
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 21:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB1F461044
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 21:58:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB1F461044
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iJkszFdpAt9J for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 21:58:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B423861019
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B423861019
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 21:58:24 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id i126so8687085oih.4
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 14:58:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G7/WjScLTgfB2mukeNLDokG5UHaBTJJCURNT+sh1hE8=;
 b=NROEwEPV5VJYx/VeKF17EsaRoDwQ3tD4Kzj0i0fPDp+OEEyZAmq2fZUbzAauW2PWTz
 H5l0Zw6JrD6IByM8g/Uo/ZtOjGu7xR1mOz5kZ9NT6eyPd3TSMon2dujy2B2xFIT87c75
 qIp4toFMapXaRqNX0DFDIsPixPxxOcYNf6B6PbIJiz2KYRQDvqKYQrXPXwx5nPNI0Uvq
 77MMqDKxOJjAH7VGYhf0PgJGJaz1prd1g9TvmaIm/YMLiq+LjOu3Rc/JVKH6vPljX3Mz
 aAnInPE9f9/SymMeMQRSBummygSyCP2Kg8OlgTP+PZC75rCzalPunk0x9m46U86P+HIg
 A+gA==
X-Gm-Message-State: AJIora/GktRanMAFUu47K/TTbQqp3gEdxayH1XrtaUisJZpBD8Pzccm7
 EG0LpCCSgHkB1tm5Tb6RWqPHnGJUawGFTlZ5UVrX/TMFG+s7ww==
X-Google-Smtp-Source: AGRyM1ttqDHDNG1FhH7u9voWqhA13LxszBuuHCpvn6wy95Ze57V+lA2p/zkvm/wa/BZpAS+p1x1F/Yng46n7JzYCEvk=
X-Received: by 2002:a05:6808:19a0:b0:33a:694a:cd3d with SMTP id
 bj32-20020a05680819a000b0033a694acd3dmr817118oib.99.1658267903719; Tue, 19
 Jul 2022 14:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220718185634.526883-1-v@vda.io> <20220719162809.GM2249625@scaer>
In-Reply-To: <20220719162809.GM2249625@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 19 Jul 2022 15:58:12 -0600
Message-ID: <CADvTj4qKQgFqG=J6mQD7tF3kGVe7PGotmEKjcYg-Rz9OGxAR5Q@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=G7/WjScLTgfB2mukeNLDokG5UHaBTJJCURNT+sh1hE8=;
 b=cJnOxcASjU610NgQZyQ29d7tQHPkwz/0/gJiAhwlZTeK7/2hfKuExq+a/MfCWv/VNp
 L5NHYmZUUel26znI5Xasy3eIJ+IvxcWMR+/9LCLUsYilxVzDZznRlxJQ3bYeFZSBQ2IB
 WHGgAGTNSnPgUe1seufVA+PWoHeKF0x66bvEcwDjI7krDb2L7SDmQpVlBfsv/+sotY8t
 vzicn1q8ssOT7828YgQjB+mULR1plGlr/mQlg34/PwwjwAgam2LLWPpDihu/w1NSfUAH
 FvfOupSKoSIJ0Qfk475lsliwzOlZK906mRiFwtIEEVOTZWu2uvnmbgRVjSyFVRRtjaOk
 BrSQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cJnOxcAS
Subject: Re: [Buildroot] [PATCH] package/systemd: build fix for systemd v251
 and up
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
Cc: Vincent Dagonneau <v@vda.io>, Norbert Lange <nolange79@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Jul 19, 2022 at 10:28 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Vincent, All,
>
> (your mail did not make it to the list, so maybe you're not (yet?)
> subscribed?)
>
> On 2022-07-18 14:56 -0400, Vincent Dagonneau spake thusly:
> > Commit 52adf0e91ef00d21a2e83f7669d0823667ce6b6c included in systemd v251
> > removes the efi-cc option. Passing it during building results in the
> > build failing.
> >
> > I understand that this fix only applies to systemd v250 however I am
> > using buildroot with a systemd built out of master and I found that fix.
> > I hope it is going to be helpful in the future when buildroot transition
> > to v251.
>
> Norbert has very recently posted a bump for v251.3 [0], and I did a
> review of it. So we should have it soone I hope!
>
> [0] https://patchwork.ozlabs.org/project/buildroot/patch/20220719130449.334694-1-nolange79@gmail.com/
>
> > I am a happy user of buildroot and I'd be more than happy to contribute
> > some more around systemd in the future.
>
> Cool! :-)
>
> > Signed-off-by: Vincent Dagonneau <v@vda.io>
> > ---
> >  package/systemd/systemd.mk | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> > index 46a4e8de2c..f1b421fb80 100644
> > --- a/package/systemd/systemd.mk
> > +++ b/package/systemd/systemd.mk
> > @@ -546,7 +546,6 @@ SYSTEMD_DEPENDENCIES += gnu-efi
> >  SYSTEMD_CONF_OPTS += \
> >       -Defi=true \
> >       -Dgnu-efi=true \
> > -     -Defi-cc=$(TARGET_CC) \
>
> Since this is required for v250 that we currently have, we can't apply
> this change for now; it will have to be part of the bump.

Yeah, I had applied that as part of my bump patch:
https://patchwork.ozlabs.org/project/buildroot/patch/20220522011729.117324-1-james.hilliard1@gmail.com/

>
> Thanks!
>
> Regards,
> Yann E. MORIN.
>
> >       -Defi-ld=bfd \
> >       -Defi-libdir=$(STAGING_DIR)/usr/lib \
> >       -Defi-includedir=$(STAGING_DIR)/usr/include/efi
> > --
> > 2.36.1
> >
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
