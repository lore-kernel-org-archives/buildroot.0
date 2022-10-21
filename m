Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91C9C3A59D
	for <buildroot@archiver.kernel.org>; Fri, 21 Oct 2022 22:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F87940550;
	Fri, 21 Oct 2022 22:57:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F87940550
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id he2kYWLuxj-p; Fri, 21 Oct 2022 22:57:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34F3940117;
	Fri, 21 Oct 2022 22:57:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34F3940117
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EBA421BF94D
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 22:57:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD30783F9F
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 22:57:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD30783F9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LJASYnH0SB20 for <buildroot@lists.busybox.net>;
 Fri, 21 Oct 2022 22:57:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE32F83F1F
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE32F83F1F
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 22:57:41 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id l4so3631812plb.8
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 15:57:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RZicP28EUaYnQRIzeqofTU20z8XRro5UtP3Sy15XRxg=;
 b=aC0xbZLgI8CQCbw+evUKYlBlSLE8YKIfBBecSldI8GO/hTIzGMBCGurOddq+ubnU07
 k2nXDPdMSC1FoEYrgOMRMqwXVevaGT5AAVcPWS/eoRzV5LZEaFPB0hgWeicKwMImzrKA
 367K80Rj9nIH5G11MuOdgaZtm/K8rgU+j4mS9HkakmoCFQTlm/rJVynm2dp7kDTrE//6
 9WrmZhVo6c7/4OIYXewaNleuOhsJuPWLzCdhRizLkVCN+xtQ5gLmiWUpyEC+FUN9RiCe
 hqLL6L1b68mG256uxrjoEPJQoBJdBdA2k4E39bB74eYZLomVDwp1L9Jhn2m6ihqDCRfx
 FRTQ==
X-Gm-Message-State: ACrzQf3kf2Wf+sBJbtUNlSeYDkzQSIPQR7HKTZxFS3BPCfm/J/6gCs40
 35509m/1N7ou3FI7dySUALMl65A0Xu5CzJjPPwWcANg51bnPlg==
X-Google-Smtp-Source: AMsMyM4NSmVr6hNTDp4d+hjJcm1nLpooXnm3mLuz5ZnS6OKacB3X0uRP+M22Th7aXc5otLiJzi8+PpraJ+pkjzON7m0=
X-Received: by 2002:a17:90b:3b82:b0:20b:516:5ff5 with SMTP id
 pc2-20020a17090b3b8200b0020b05165ff5mr23953364pjb.92.1666393060909; Fri, 21
 Oct 2022 15:57:40 -0700 (PDT)
MIME-Version: 1.0
References: <20221019220019.8418-1-moritz@h6t.eu>
 <20221019220019.8418-2-moritz@h6t.eu>
 <CADvTj4rBgVG3FYMeT1DO_83w5JCJm8hAVZBKf6gq93SzEwpPdg@mail.gmail.com>
 <1c451d96-4f2a-ed48-c7a0-ab83cb935361@h6t.eu>
 <CADvTj4p7RzkEx4NPvPde1FpSWRvRXy+Z_7nK7RceFQfX1zachA@mail.gmail.com>
 <8fee3b0b-e481-455b-5674-b152965b2525@h6t.eu>
In-Reply-To: <8fee3b0b-e481-455b-5674-b152965b2525@h6t.eu>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 21 Oct 2022 18:57:28 -0400
Message-ID: <CADvTj4qKt8kzhqiZDUEH9gaSZoS0cGi8bN2FYxU7hnN_iB9Lrw@mail.gmail.com>
To: Moritz Bitsch <moritz@h6t.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RZicP28EUaYnQRIzeqofTU20z8XRro5UtP3Sy15XRxg=;
 b=WEvSWjYvo6QxVU1X2supR9GLNFpONcWUASPuceyhW8iLbWkiYCi70V6SUoHg14XLkp
 Oikz50A/Y7bIVK7DVivN0SH712K7I4PdLuBPzGxZB6/tGkq8IKISSF2OUVoZQt5ugltD
 q1kMcxM6LkV/v6NPEe2Cr1yktSywqKOjchvUTTJolWBUoYX6P5KGinbIQzrtPr9zituZ
 UETDnXnQObAO1UB3Is7Visf9EYyqSntoWIgcatswUTP4itxxEG3BOIIRRaCW+6WxRyiz
 qimgH9RUmZ7t6FEzvAVpbX2zb442tYxm8CZcUCYVh4B7QKmPE2SJtnlqrzbDdwfxdAhd
 Ff9w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WEvSWjYv
Subject: Re: [Buildroot] [PATCH 1/2] package/pkg-cargo.mk: fix handling of
 runtime debug builds
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

On Fri, Oct 21, 2022 at 5:04 PM Moritz Bitsch <moritz@h6t.eu> wrote:
>
> Am 21.10.22 um 18:41 schrieb James Hilliard:
> > On Fri, Oct 21, 2022 at 2:48 AM Moritz Bitsch <moritz@h6t.eu> wrote:
> >>
> >> Am 20.10.22 um 00:12 schrieb James Hilliard:
> >>
> >>> On Wed, Oct 19, 2022 at 6:02 PM Moritz Bitsch via buildroot
> >>> <buildroot@buildroot.org> wrote:
> >>>> From: Moritz Bitsch <moritz@h6t.eu>
> >>>>
> >>>> The cargo --release flag is used to create optimized builds, not supplying
> >>>> --release has major performance implications.

Looking at this further the cargo --release flag merely tells cargo to use the
release profile rather than the dev profile, however the issue of optimizations
being enabled or not is really a matter of what the profile configuration is,
right now we are effectively choosing between the default release or default
dev profile configuration which does not properly match the build settings.

Instead what we really want to do is configure all cargo profiles based on the
selected buildroot build settings.

Unfortunately cargo doesn't have any env variable that selects a profile, but
we can sidestep this simply by configuring both root profiles(which other
profiles inherit from).

I think the existing cargo build flags are fine, I sent a patch which should fix
the profile configurations so that they match the buildroot build settings, let
me know if this fixes the optimization issue for you:
https://lore.kernel.org/buildroot/20221021224448.3502942-1-james.hilliard1@gmail.com/

> >>> Is there an env variable we can use to set this instead?
> >>>
> >>> Some packages use cargo without the cargo infrastructure, for example
> >>> we have a number of pyo3(https://pyo3.rs/) based packages that use the
> >>> cargo env but not the cargo build commands from here.
> >> I could not find any env variable for switching profiles.
> >>
> >> I had a look at python-rtoml, and the used setuptools-rust: supplying
> >> --debug to
> >> the "setup.py build" removes the --release flag from the cargo invocation.
> >
> > Hmm, there are two pyo3 build backends, only setuptools-rust uses setup.py,
> > we also have maturin which is pep517 based.
>
> I'm in no way a a python expert, so take my words with a grain of salt.
>
> I could not find a way to specify what build profile is used by maturin
> when in a pep517 build. Even if maturin supports the -r flag for release
> builds when called directly.

I think the real issue is actually not that the wrong build profile is
being used
so much as the build profile configuration itself is wrong.

>
> >
> >>>> Signed-off-by: Moritz Bitsch <moritz@h6t.eu>
> >>>> ---
> >>>>    package/pkg-cargo.mk | 2 +-
> >>>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
> >>>> index f7e3f39503..e0556252fa 100644
> >>>> --- a/package/pkg-cargo.mk
> >>>> +++ b/package/pkg-cargo.mk
> >>>> @@ -119,7 +119,7 @@ define $(2)_BUILD_CMDS
> >>>>                   $$($(2)_CARGO_ENV) \
> >>>>                   cargo build \
> >>>>                           --offline \
> >>>> -                       $$(if $$(BR2_ENABLE_DEBUG),,--release) \
> >>>> +                       $$(if $$(BR2_ENABLE_RUNTIME_DEBUG),,--release) \
> >>>>                           --manifest-path Cargo.toml \
> >>>>                           --locked \
> >>>>                           $$($(2)_CARGO_BUILD_OPTS)
> >>>> --
> >>>> 2.37.3
> >>>>
> >>>> _______________________________________________
> >>>> buildroot mailing list
> >>>> buildroot@buildroot.org
> >>>> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
