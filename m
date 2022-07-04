Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179A4C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 21:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CA444028F;
	Mon,  4 Jul 2022 21:49:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CA444028F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Oy3UDTXnRZw; Mon,  4 Jul 2022 21:49:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAC1F416E3;
	Mon,  4 Jul 2022 21:49:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAC1F416E3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2365A1BF3F3
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 21:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 061D782919
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 21:49:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 061D782919
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xMAqxrB-GejR for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 21:49:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4F908143A
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E4F908143A
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 21:49:32 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3BBB3471;
 Mon,  4 Jul 2022 23:49:29 +0200 (CEST)
MIME-Version: 1.0
In-Reply-To: <CADvTj4rb30RfhTpfccxmVfRbO3pA4HuCDLL2+j5UKODQ7U+B=Q@mail.gmail.com>
References: <20220506104658.3174243-1-foss+buildroot@0leil.net>
 <CADvTj4p_22ayfvpD=+pKWppGJHD-Q2g48XwFnoKmmB22fw+g+g@mail.gmail.com>
 <165696199632.1630086.2094271397321278842@Monstersaurus>
 <CADvTj4rb30RfhTpfccxmVfRbO3pA4HuCDLL2+j5UKODQ7U+B=Q@mail.gmail.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 04 Jul 2022 22:49:27 +0100
Message-ID: <165697136700.1729656.17381928019383421701@Monstersaurus>
User-Agent: alot/0.10
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1656971369;
 bh=KuZ80AXFqayHdL4+MoiIikWNNvtd/u8LeQyIPhotcoE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=NfAbO16+DjlD+aB4d+pOoLnlapyiPtDHYFs2KAuGSImCig5SkqSAmZ3kL1kdgtJdZ
 HowSaHnugt0OaMKO9UrDAqzUUPlfiuJqatjD90qxLagvlz/i5qVfBwEf/XVdn7KSVo
 tPSvdlvPHtQF1/6nBoWbgK6vYdV58M4F6xnIyRIg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=NfAbO16+
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

Hi James,

(Adding in the libcamera development mailinglist for this topic, as
we're heading into inner details of libcamera support, and even perhaps
the philosophy of it)


Quoting James Hilliard (2022-07-04 20:45:25)
> On Mon, Jul 4, 2022 at 1:13 PM Kieran Bingham
> <kieran.bingham@ideasonboard.com> wrote:
> >
> > Quoting James Hilliard (2022-07-04 18:29:25)
> > > On Fri, May 6, 2022 at 4:47 AM Quentin Schulz <foss+buildroot@0leil.net> wrote:
> > > >
> > > > From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> > > >
> > > > Open-Source IPA shlibs need to be signed in order to be runnable within
> > > > the same process, otherwise they are deemed Closed-Source and run in
> > > > another process and communicate over IPC.
> > >
> > > Why not just add an option to libcamera to disable signature
> > > validation entirely?

In fact, we do already have ways to enforce signature verification to be
off - but in that case, we treat all modules as if they were
'proprietary' and would isolate them.


> > > It seems kinda pointless if one is not using closed source shlibs.
> >
> > The IPA modules can be installed separately. We detect that by
> > validating the signature. If the signature fails, we determine the IPA
> > shlib module is 'proprietary' and it gets sandboxed in a separate
> > process.
> 
> So sandboxing is generally undesirable and kind of a hack to deal with
> security issues around proprietary modules from my understanding.

I'd love to hear of some alternative options too.

What libcamera provides here is a way to minimize the closed source
components as much as possible, along with providing a means to operate
devices with open alternatives.

> > Providing an option to disable this would defeat the core purpose of it
> > entirely.
> 
> The signature scheme from my understanding only makes sense when one
> intends to mix open source and proprietary modules in the same build.
> 
> So if one isn't mixing open source and proprietary IPA modules...then one
> can just disable the validation entirely and choose the desired sandboxing
> on/off behavior at build time.
> 
> Mixing open source/proprietary modules at runtime seems like it would be
> a pretty uncommon use case for buildroot at least.

It could be a scenario right now.

A Raspberry Pi build configuration, but with an Arducam Autofocus
camera.  Arducam only provide a 'binary only' IPA module for their
Autofocus implementation.

 - https://github.com/ArduCAM/Arducam-Pivariety-V4L2-Driver/releases/tag/ipa-v0.0.3

I hope that will soon be replaced by an open source version, - but this
is what there is currently. So I could envisage someone needing to add
this closed IPA component with a board overlay.

--
Kieran


> 
> Or am I missing something here?
> 
> >
> > --
> > Kieran
> >
> >
> >
> > > > The shlib installed on the target should be the same as the one signed
> > > > by libcamera during package creation otherwise the signature won't match
> > > > the shlib.
> > > >
> > > > Buildroot sanitizes RPATH in a post build process. meson gets rid of
> > > > rpath while installing so we don't need to do it manually.
> > > >
> > > > Buildroot may strip symbols, so we need to do the same before signing.
> > > > Since meson install target is also signing the IPA shlibs, let's strip
> > > > them before this happens.
> > > >
> > > > Cc: Quentin Schulz <foss+buildroot@0leil.net>
> > > > Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> > > > ---
> > > >
> > > > v2:
> > > >  - use LIBCAMERA_POST_BUILD_HOOKS instead of replacing
> > > >  LIBCAMERA_INSTALL_TARGET_CMDS,
> > > >  - add handling of BR2_STRIP_EXCLUDE_FILES to not strip files which
> > > >  shouldn't,
> > > >  - added --no-run-if-empty to xargs, in case no IPA is selected,
> > > >  - removed stderr redirect and pipe to true to not hide useful
> > > >  information or fail the build if strip does not work,
> > > >
> > > >  package/libcamera/libcamera.mk | 20 ++++++++++++++++++++
> > > >  1 file changed, 20 insertions(+)
> > > >
> > > > diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> > > > index 77381ab3ca..41d6a5abef 100644
> > > > --- a/package/libcamera/libcamera.mk
> > > > +++ b/package/libcamera/libcamera.mk
> > > > @@ -104,4 +104,24 @@ LIBCAMERA_DEPENDENCIES += libexecinfo
> > > >  LIBCAMERA_LDFLAGS = $(TARGET_LDFLAGS) -lexecinfo
> > > >  endif
> > > >
> > > > +# Open-Source IPA shlibs need to be signed in order to be runnable within the
> > > > +# same process, otherwise they are deemed Closed-Source and run in another
> > > > +# process and communicate over IPC.
> > > > +# Buildroot sanitizes RPATH in a post build process. meson gets rid of rpath
> > > > +# while installing so we don't need to do it manually here.
> > > > +# Buildroot may strip symbols, so we need to do the same before signing
> > > > +# otherwise the signature won't match the shlib on the rootfs. Since meson
> > > > +# install target is signing the shlibs, we need to strip them before.
> > > > +LIBCAMERA_STRIP_FIND_CMD = \
> > > > +       find $(@D)/build/src/ipa \
> > > > +       $(if $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES)), \
> > > > +               -not \( $(call findfileclauses,$(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) ) \
> > > > +       -type f -name 'ipa_*.so' -print0
> > >
> > > Wouldn't this make it difficult to analyze core dumps since we need unstripped
> > > binaries for that?
> > >
> > > > +
> > > > +define LIBCAMERA_BUILD_STRIP_IPA_SO
> > > > +       $(LIBCAMERA_STRIP_FIND_CMD) | xargs --no-run-if-empty -0 $(STRIPCMD)
> > > > +endef
> > > > +
> > > > +LIBCAMERA_POST_BUILD_HOOKS += LIBCAMERA_BUILD_STRIP_IPA_SO
> > > > +
> > > >  $(eval $(meson-package))
> > > > --
> > > > 2.35.1
> > > >
> > > > _______________________________________________
> > > > buildroot mailing list
> > > > buildroot@buildroot.org
> > > > https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
