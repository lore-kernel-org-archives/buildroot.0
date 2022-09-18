Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F517C32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 14:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FF83403C8;
	Sun, 18 Sep 2022 14:13:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FF83403C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EHZQeLCTdoRh; Sun, 18 Sep 2022 14:13:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6439640348;
	Sun, 18 Sep 2022 14:13:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6439640348
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 024781BF34A
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 14:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D15C683F21
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 14:13:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D15C683F21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id khgvj9h3ulBP for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 14:13:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC6E483EF3
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC6E483EF3
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 14:13:12 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id l65so25688976pfl.8
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 07:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=oAdKOm99iSvvxpON9QH/gQr/JYX9/GL1TU5AFf/2yLc=;
 b=pEEKoszmOp6d9EH1hYgYfNZ6IMf7Dkh/ajpC8dNldWcI2PeHaAHeGP9EnlIxg7wy3I
 JQrsK+1JbZQwQTTjID4atwIkZgCjlNwriWfiX65EjD8i309aGJBSx0FJ86759ErHDW8O
 J0jkrxdUO4Ai0qAwjApUgDD0SiR4jPpcNL5hvdxJAa0hf3fnqC+FnZaYrjeAEKfrSnJb
 4NoElwF1P4Cvs0VghCEPz75CRVdCovATPf27Q+yKy6YngIUhBBodpjg1Dd8RDvEKnbgj
 m56fIMbBXkiMJAnTcB/ElI0363vTol1Ma6k4hXp+MDvSr4Ds+awWYeJ4rhNFPEeg/+yp
 o+MQ==
X-Gm-Message-State: ACrzQf0EMMn/HqT80N5uiYtSQrpMu7vnaMillmDOC1Jb8pAWUNeJ6+H0
 tuXWM6iYeWDfHXmOsOhI3JPd43l9BrpmX0hPFotyX+16M28=
X-Google-Smtp-Source: AMsMyM5eZZ+TJLHJO7BZuzmJwVp504Kzfc9yGlfFEt4gdmCMGkc4o8wyaWfEtuq1SGl9TX27c7+ptjG+YKgyla4nPdk=
X-Received: by 2002:a65:5886:0:b0:439:8dd3:18d4 with SMTP id
 d6-20020a655886000000b004398dd318d4mr12088104pgu.430.1663510392233; Sun, 18
 Sep 2022 07:13:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220826135503.20612-1-jesseevg@gmail.com>
 <20220826135503.20612-12-jesseevg@gmail.com>
 <20220918115717.45180a48@windsurf>
In-Reply-To: <20220918115717.45180a48@windsurf>
From: Jesse Van Gavere <jesseevg@gmail.com>
Date: Sun, 18 Sep 2022 16:13:01 +0200
Message-ID: <CAMdwsN8ydXOcWRCeHC=OG6=mKzX6VG4mVmqjMhf1OXc31_+VwA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=oAdKOm99iSvvxpON9QH/gQr/JYX9/GL1TU5AFf/2yLc=;
 b=YJhgKye42jD9ikAckYpwk0Oy9407toHGdxpo/gPJ+Iy++t8+wHjdBGDQIFnBZtG/AE
 kzYqNQw6PHmQJ+Izk7LM00ZAKX7YrvdJaeSm92Eoiasw1wWqvxMWXT/oedNDmZ0inzrL
 yisrevR1nrZgBHjaKN6AWHBTJsDsBBJTFIEROVMWjDVKzVb2lg2w4eYIujPBB3sj5z8r
 S68EpbjINsgVMzQnQEqvNbhdOyq581nKz6RtlKbndOtfJdO4tFBgpDQCDcVqW+7fd4MV
 lCWRcNfzceYekbs/+60FBm2tydcK38pB5FYW+etQLCUCz2zG3WyYJDLHiGJLUuJ6yMQ6
 v8Ag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YJhgKye4
Subject: Re: [Buildroot] [PATCH v4 11/29] package/qt6/qt6base: add qt
 support for SSE/AVX SIMD extensions
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

Op zo 18 sep. 2022 om 11:57 schreef Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> On Fri, 26 Aug 2022 15:54:45 +0200
> Jesse Van Gavere <jesseevg@gmail.com> wrote:
>
> > Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
> > ---
> >  package/qt6/qt6base/qt6base.mk | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
> > index 21c15607d6..8bca29900e 100644
> > --- a/package/qt6/qt6base/qt6base.mk
> > +++ b/package/qt6/qt6base/qt6base.mk
> > @@ -35,6 +35,25 @@ QT6BASE_CONF_OPTS = \
> >       -DFEATURE_system_zlib=ON \
> >       -DFEATURE_system_libb2=ON
> >
> > +QT6BASE_CONF_OPTS += -DFEATURE_sse2=$(if $(BR2_X86_CPU_HAS_SSE2),ON,OFF)
> > +QT6BASE_CONF_OPTS += -DFEATURE_sse3=$(if $(BR2_X86_CPU_HAS_SSE3),ON,OFF)
> > +QT6BASE_CONF_OPTS += -DFEATURE_sse4_1=$(if $(BR2_X86_CPU_HAS_SSE4),ON,OFF)
> > +QT6BASE_CONF_OPTS += -DFEATURE_sse4_2=$(if $(BR2_X86_CPU_HAS_SSE42),ON,OFF)
> > +QT6BASE_CONF_OPTS += -DFEATURE_ssse3=$(if $(BR2_X86_CPU_HAS_SSSE3),ON,OFF)
> > +QT6BASE_CONF_OPTS += -DFEATURE_avx=$(if $(BR2_X86_CPU_HAS_AVX),ON,OFF)
> > +QT6BASE_CONF_OPTS += -DFEATURE_avx2=$(if $(BR2_X86_CPU_HAS_AVX2),ON,OFF)
> > +# no buildroot BR2_X86_CPU_HAS_AVX512 option yet
>
> This is not true: we do have a BR2_X86_CPU_HAS_AVX512 option, but my
> understanding of AVX512 is too limited to know how that maps to those
> individual avx512xyz options, so I kept them disabled as you did, but
> with a different explanation.
>
> Also, I grouped the whole thing into a single assignment to
> QT6BASE_CONF_OPTS.
>
> And of course applied the result:
>
>   https://gitlab.com/buildroot.org/buildroot/-/commit/3b395c1574299147b41602aa471a76c98db9a1cc
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
Hey Thomas,

You're right! I missed that being added and it didn't exist at the
time I started working on it so I'll see if I can revisit this topic
later on.

Regards,
Jesse
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
