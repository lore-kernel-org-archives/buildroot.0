Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF10C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 22:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81CD682A5D;
	Mon,  4 Jul 2022 22:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81CD682A5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id be3m_JUcZ75c; Mon,  4 Jul 2022 22:18:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59703823DD;
	Mon,  4 Jul 2022 22:18:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59703823DD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CD45C1BF3EB
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 22:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6B0E60E09
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 22:18:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6B0E60E09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eRPEB3TCDewa for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 22:18:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F38060D4B
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F38060D4B
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 22:18:51 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 w2-20020a056830110200b00616ce0dfcb2so8490167otq.1
 for <buildroot@buildroot.org>; Mon, 04 Jul 2022 15:18:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gb26/RczYf3t8XhKdnlZFHizOk0nIlz0im59z7ZTi44=;
 b=2hKnzv/HOgzcKNDYh9nGqio8lAjU8MwiRw04EO91DPJzp0mn8soyM/VCUYNtyD+Yqc
 HCsocM2A/8gpdjo0zFnyK++zQ7IBHGhr3ugMY05mzTe4z194k8FNssww/s2WQQWGoU67
 YUsOAYrFMOHQu4QJHIMQYQ2y575HQT1/XsU5Xr0yVhuPr8x1pAgaGd3CHLqqNbiOpR91
 s0JN9ui1iQo3TLOgwgIbtDHO+u4ZUSGSG+cbpgnzAe5OID3VAXxLudEpQSfmc6hzyy3Y
 8YrNBiTPWatqQgfgFB2VOiJejHVvL91KQfl7XrYqFyawNcTZDpe8k78WKrTSsZY6TfTa
 EIow==
X-Gm-Message-State: AJIora/H4pXE6Mo3BfKbTcIlLtdAW08m+T8lU05/JjyxOHHLzHYAxoP+
 MORFEphR4YKsRjSAWY+r0EYH3JHOnW5+9n/eKPI=
X-Google-Smtp-Source: AGRyM1sr9jaPpkFaalbz/2O0Tr2zkwJHArdXx0s+9OhPnwJbOy1L7qXTYb21Ij0AWlLpwk2L7tbVs7x0vCphxFvae+k=
X-Received: by 2002:a05:6830:4422:b0:616:ef53:918c with SMTP id
 q34-20020a056830442200b00616ef53918cmr13865856otv.151.1656973130475; Mon, 04
 Jul 2022 15:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220506104658.3174243-1-foss+buildroot@0leil.net>
 <CADvTj4p_22ayfvpD=+pKWppGJHD-Q2g48XwFnoKmmB22fw+g+g@mail.gmail.com>
 <165696199632.1630086.2094271397321278842@Monstersaurus>
 <CADvTj4rb30RfhTpfccxmVfRbO3pA4HuCDLL2+j5UKODQ7U+B=Q@mail.gmail.com>
 <165697136700.1729656.17381928019383421701@Monstersaurus>
In-Reply-To: <165697136700.1729656.17381928019383421701@Monstersaurus>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 4 Jul 2022 16:18:39 -0600
Message-ID: <CADvTj4qFMYwxBDj9e7CoMZqn9nYq1PTLC3=yVvvTPDG+MGLicA@mail.gmail.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Gb26/RczYf3t8XhKdnlZFHizOk0nIlz0im59z7ZTi44=;
 b=ODUmHQBeTfbOk0PO5Tb2K1LSsk1iWSGYN5V+V14M2lxG8xfBWxH95eVkWdfPS5PsGr
 nkjeoePyhU+yI4aufotqOgOhAtKB88uotVMN/pgNM+OCBPKNW2B9l+aNt8Ppk9R/D5oX
 VBVoKnX3Fnxn3DQIyLJ6q2IIiFOJDgA+TdkSYk6CN5xfHg/Gwl+uj5y39y8Dp58BJBFJ
 NzGBKbIwQmVeqhp+Y/jUc8NBal3OYYu+afwA7rmLGTAp3SyP0yMijADqULcjLMN17ILe
 rPJIdGevXKx39zqaWmF8+fyB0KYx9Abjm3tsFzFhADgchxOQPXALRxSPpiGO0xsQg+81
 e1tA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ODUmHQBe
Subject: Re: [Buildroot] [PATCH v2] package/libcamera: strip symbols before
 signing IPA libs
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Quentin Schulz <foss+buildroot@0leil.net>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Jul 4, 2022 at 3:49 PM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>
> Hi James,
>
> (Adding in the libcamera development mailinglist for this topic, as
> we're heading into inner details of libcamera support, and even perhaps
> the philosophy of it)
>
>
> Quoting James Hilliard (2022-07-04 20:45:25)
> > On Mon, Jul 4, 2022 at 1:13 PM Kieran Bingham
> > <kieran.bingham@ideasonboard.com> wrote:
> > >
> > > Quoting James Hilliard (2022-07-04 18:29:25)
> > > > On Fri, May 6, 2022 at 4:47 AM Quentin Schulz <foss+buildroot@0leil.net> wrote:
> > > > >
> > > > > From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> > > > >
> > > > > Open-Source IPA shlibs need to be signed in order to be runnable within
> > > > > the same process, otherwise they are deemed Closed-Source and run in
> > > > > another process and communicate over IPC.
> > > >
> > > > Why not just add an option to libcamera to disable signature
> > > > validation entirely?
>
> In fact, we do already have ways to enforce signature verification to be
> off - but in that case, we treat all modules as if they were
> 'proprietary' and would isolate them.

Sorry, I meant off as in a signature unenforced sandbox off mode.

For anyone not using proprietary modules at all this would probably be the
preferred mode, at least for typical buildroot builds where one typically
does full rootfs swapping updates.

>
>
> > > > It seems kinda pointless if one is not using closed source shlibs.
> > >
> > > The IPA modules can be installed separately. We detect that by
> > > validating the signature. If the signature fails, we determine the IPA
> > > shlib module is 'proprietary' and it gets sandboxed in a separate
> > > process.
> >
> > So sandboxing is generally undesirable and kind of a hack to deal with
> > security issues around proprietary modules from my understanding.
>
> I'd love to hear of some alternative options too.
>
> What libcamera provides here is a way to minimize the closed source
> components as much as possible, along with providing a means to operate
> devices with open alternatives.

I mean the signature validation+sandboxing is for the most part a feature only
used for supporting closed source components, for those use cases that don't
need closed source component support I see no reason one would want to have
signature validation and sandboxing enabled as it just adds unnecessary
complexity as one has to deal with accidentally triggering sig validation issues
during development as opposed to just switching the closed source component
features(signature validation+sandboxing) off entirely.

>
> > > Providing an option to disable this would defeat the core purpose of it
> > > entirely.
> >
> > The signature scheme from my understanding only makes sense when one
> > intends to mix open source and proprietary modules in the same build.
> >
> > So if one isn't mixing open source and proprietary IPA modules...then one
> > can just disable the validation entirely and choose the desired sandboxing
> > on/off behavior at build time.
> >
> > Mixing open source/proprietary modules at runtime seems like it would be
> > a pretty uncommon use case for buildroot at least.
>
> It could be a scenario right now.
>
> A Raspberry Pi build configuration, but with an Arducam Autofocus
> camera.  Arducam only provide a 'binary only' IPA module for their
> Autofocus implementation.
>
>  - https://github.com/ArduCAM/Arducam-Pivariety-V4L2-Driver/releases/tag/ipa-v0.0.3
>
> I hope that will soon be replaced by an open source version, - but this
> is what there is currently. So I could envisage someone needing to add
> this closed IPA component with a board overlay.

I mean, one could still disable signature validation and force on sandboxing for
a mixed use case, but I think mixed is probably not the norm for
buildroot as most
configurations would be built for one camera and thus could just
disable sig validation
and set the sandbox unconditionally enabled at build time for closed source
components or unconditionally disabled for open source.

>
> --
> Kieran
>
>
> >
> > Or am I missing something here?
> >
> > >
> > > --
> > > Kieran
> > >
> > >
> > >
> > > > > The shlib installed on the target should be the same as the one signed
> > > > > by libcamera during package creation otherwise the signature won't match
> > > > > the shlib.
> > > > >
> > > > > Buildroot sanitizes RPATH in a post build process. meson gets rid of
> > > > > rpath while installing so we don't need to do it manually.
> > > > >
> > > > > Buildroot may strip symbols, so we need to do the same before signing.
> > > > > Since meson install target is also signing the IPA shlibs, let's strip
> > > > > them before this happens.
> > > > >
> > > > > Cc: Quentin Schulz <foss+buildroot@0leil.net>
> > > > > Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> > > > > ---
> > > > >
> > > > > v2:
> > > > >  - use LIBCAMERA_POST_BUILD_HOOKS instead of replacing
> > > > >  LIBCAMERA_INSTALL_TARGET_CMDS,
> > > > >  - add handling of BR2_STRIP_EXCLUDE_FILES to not strip files which
> > > > >  shouldn't,
> > > > >  - added --no-run-if-empty to xargs, in case no IPA is selected,
> > > > >  - removed stderr redirect and pipe to true to not hide useful
> > > > >  information or fail the build if strip does not work,
> > > > >
> > > > >  package/libcamera/libcamera.mk | 20 ++++++++++++++++++++
> > > > >  1 file changed, 20 insertions(+)
> > > > >
> > > > > diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> > > > > index 77381ab3ca..41d6a5abef 100644
> > > > > --- a/package/libcamera/libcamera.mk
> > > > > +++ b/package/libcamera/libcamera.mk
> > > > > @@ -104,4 +104,24 @@ LIBCAMERA_DEPENDENCIES += libexecinfo
> > > > >  LIBCAMERA_LDFLAGS = $(TARGET_LDFLAGS) -lexecinfo
> > > > >  endif
> > > > >
> > > > > +# Open-Source IPA shlibs need to be signed in order to be runnable within the
> > > > > +# same process, otherwise they are deemed Closed-Source and run in another
> > > > > +# process and communicate over IPC.
> > > > > +# Buildroot sanitizes RPATH in a post build process. meson gets rid of rpath
> > > > > +# while installing so we don't need to do it manually here.
> > > > > +# Buildroot may strip symbols, so we need to do the same before signing
> > > > > +# otherwise the signature won't match the shlib on the rootfs. Since meson
> > > > > +# install target is signing the shlibs, we need to strip them before.
> > > > > +LIBCAMERA_STRIP_FIND_CMD = \
> > > > > +       find $(@D)/build/src/ipa \
> > > > > +       $(if $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES)), \
> > > > > +               -not \( $(call findfileclauses,$(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) ) \
> > > > > +       -type f -name 'ipa_*.so' -print0
> > > >
> > > > Wouldn't this make it difficult to analyze core dumps since we need unstripped
> > > > binaries for that?
> > > >
> > > > > +
> > > > > +define LIBCAMERA_BUILD_STRIP_IPA_SO
> > > > > +       $(LIBCAMERA_STRIP_FIND_CMD) | xargs --no-run-if-empty -0 $(STRIPCMD)
> > > > > +endef
> > > > > +
> > > > > +LIBCAMERA_POST_BUILD_HOOKS += LIBCAMERA_BUILD_STRIP_IPA_SO
> > > > > +
> > > > >  $(eval $(meson-package))
> > > > > --
> > > > > 2.35.1
> > > > >
> > > > > _______________________________________________
> > > > > buildroot mailing list
> > > > > buildroot@buildroot.org
> > > > > https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
