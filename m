Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D01C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 19:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C02B61051;
	Mon,  4 Jul 2022 19:13:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C02B61051
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lQFoDl3GzU3A; Mon,  4 Jul 2022 19:13:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 299876103C;
	Mon,  4 Jul 2022 19:13:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 299876103C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DEA1A1BF331
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 19:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9306408ED
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 19:13:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9306408ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C8NfcGai0lqS for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 19:13:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BA3040002
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7BA3040002
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 19:13:22 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C8DA5802;
 Mon,  4 Jul 2022 21:13:18 +0200 (CEST)
MIME-Version: 1.0
In-Reply-To: <CADvTj4p_22ayfvpD=+pKWppGJHD-Q2g48XwFnoKmmB22fw+g+g@mail.gmail.com>
References: <20220506104658.3174243-1-foss+buildroot@0leil.net>
 <CADvTj4p_22ayfvpD=+pKWppGJHD-Q2g48XwFnoKmmB22fw+g+g@mail.gmail.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: James Hilliard <james.hilliard1@gmail.com>,
 Quentin Schulz <foss+buildroot@0leil.net>
Date: Mon, 04 Jul 2022 20:13:16 +0100
Message-ID: <165696199632.1630086.2094271397321278842@Monstersaurus>
User-Agent: alot/0.10
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1656961998;
 bh=G11+Zzp1YFCgMV5HBMxDUfMUMYvYuJhH/SbWyWnltmA=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=k+w/mk2gPJpi4BDPYmAPSE8yQra74IDMwyckLwB5RFiSAzpOwTcmQrpLj8LVvLZMn
 hueDN6UyPgg9o5okaoVaBUrB1AJHLxHDwCiIST2Kga1TXV/r+SdYP/kB2J5QitHwaI
 fd3+DQmOMcas2l/oKSPV1Zn1LmfiPfYn+/+ffx2w=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=k+w/mk2g
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
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quoting James Hilliard (2022-07-04 18:29:25)
> On Fri, May 6, 2022 at 4:47 AM Quentin Schulz <foss+buildroot@0leil.net> wrote:
> >
> > From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> >
> > Open-Source IPA shlibs need to be signed in order to be runnable within
> > the same process, otherwise they are deemed Closed-Source and run in
> > another process and communicate over IPC.
> 
> Why not just add an option to libcamera to disable signature
> validation entirely?
> 
> It seems kinda pointless if one is not using closed source shlibs.

The IPA modules can be installed separately. We detect that by
validating the signature. If the signature fails, we determine the IPA
shlib module is 'proprietary' and it gets sandboxed in a separate
process.

Providing an option to disable this would defeat the core purpose of it
entirely.

--
Kieran



> > The shlib installed on the target should be the same as the one signed
> > by libcamera during package creation otherwise the signature won't match
> > the shlib.
> >
> > Buildroot sanitizes RPATH in a post build process. meson gets rid of
> > rpath while installing so we don't need to do it manually.
> >
> > Buildroot may strip symbols, so we need to do the same before signing.
> > Since meson install target is also signing the IPA shlibs, let's strip
> > them before this happens.
> >
> > Cc: Quentin Schulz <foss+buildroot@0leil.net>
> > Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> > ---
> >
> > v2:
> >  - use LIBCAMERA_POST_BUILD_HOOKS instead of replacing
> >  LIBCAMERA_INSTALL_TARGET_CMDS,
> >  - add handling of BR2_STRIP_EXCLUDE_FILES to not strip files which
> >  shouldn't,
> >  - added --no-run-if-empty to xargs, in case no IPA is selected,
> >  - removed stderr redirect and pipe to true to not hide useful
> >  information or fail the build if strip does not work,
> >
> >  package/libcamera/libcamera.mk | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> > index 77381ab3ca..41d6a5abef 100644
> > --- a/package/libcamera/libcamera.mk
> > +++ b/package/libcamera/libcamera.mk
> > @@ -104,4 +104,24 @@ LIBCAMERA_DEPENDENCIES += libexecinfo
> >  LIBCAMERA_LDFLAGS = $(TARGET_LDFLAGS) -lexecinfo
> >  endif
> >
> > +# Open-Source IPA shlibs need to be signed in order to be runnable within the
> > +# same process, otherwise they are deemed Closed-Source and run in another
> > +# process and communicate over IPC.
> > +# Buildroot sanitizes RPATH in a post build process. meson gets rid of rpath
> > +# while installing so we don't need to do it manually here.
> > +# Buildroot may strip symbols, so we need to do the same before signing
> > +# otherwise the signature won't match the shlib on the rootfs. Since meson
> > +# install target is signing the shlibs, we need to strip them before.
> > +LIBCAMERA_STRIP_FIND_CMD = \
> > +       find $(@D)/build/src/ipa \
> > +       $(if $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES)), \
> > +               -not \( $(call findfileclauses,$(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) ) \
> > +       -type f -name 'ipa_*.so' -print0
> 
> Wouldn't this make it difficult to analyze core dumps since we need unstripped
> binaries for that?
> 
> > +
> > +define LIBCAMERA_BUILD_STRIP_IPA_SO
> > +       $(LIBCAMERA_STRIP_FIND_CMD) | xargs --no-run-if-empty -0 $(STRIPCMD)
> > +endef
> > +
> > +LIBCAMERA_POST_BUILD_HOOKS += LIBCAMERA_BUILD_STRIP_IPA_SO
> > +
> >  $(eval $(meson-package))
> > --
> > 2.35.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
