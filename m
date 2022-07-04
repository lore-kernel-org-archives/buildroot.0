Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1DDC43334
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 22:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BF55416E8;
	Mon,  4 Jul 2022 22:16:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BF55416E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eIqPzmKV1AER; Mon,  4 Jul 2022 22:16:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 139A4416EA;
	Mon,  4 Jul 2022 22:16:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 139A4416EA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B376C1BF3EB
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 22:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D49C40605
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 22:16:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D49C40605
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lhMYVj1iCgYC for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 22:16:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A8604057A
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A8604057A
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 22:16:41 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1030B6D7;
 Tue,  5 Jul 2022 00:16:36 +0200 (CEST)
MIME-Version: 1.0
In-Reply-To: <20220704200426.GJ2521@scaer>
References: <20220506104658.3174243-1-foss+buildroot@0leil.net>
 <20220704200426.GJ2521@scaer>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Quentin Schulz <foss+buildroot@0leil.net>,
 Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 04 Jul 2022 23:16:33 +0100
Message-ID: <165697299387.1729656.13686816775756809776@Monstersaurus>
User-Agent: alot/0.10
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1656972996;
 bh=P9CI7zC+LtEzQMQHeOcOIkRXv5XWplZAax7XTVOMXnk=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=U8RNn6Gcm0VLKoRixOF/8vyXBzNZAZpqaLuJiY6XeemYJPtosA9vS9HAnJJZqd5P9
 IhjMCTgYKNn/W+ZtPzdnrDrvHDk3PD4otX1IU7DacOkYOWlfoZrmK1kgUsyBzRipTa
 ty5rY6PHG9UZoXL0PH0pc2mRTnBedMPx02eVzMLY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=U8RNn6Gc
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
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quoting Yann E. MORIN (2022-07-04 21:04:26)
> Quentin, All,
> 
> Kieran, some question for you toward the end... ;-)
> 
> On 2022-05-06 12:46 +0200, Quentin Schulz spake thusly:
> > From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> > 
> > Open-Source IPA shlibs need to be signed in order to be runnable within
> > the same process, otherwise they are deemed Closed-Source and run in
> > another process and communicate over IPC.
> > 
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
> 
> Applied to master, thanks.
> 
> However, this is a bit fragile, since libcamera may ultimately decide to
> do the signing during the build phase (the install step is supposed to
> be just about copying files around in theory).
> 
> So maybe:
>  1. Buildroot needs to learn about FOO_STRIP_EXCLUDE_FILES/DIRS
>  2. libcamera needs an option -Dstip-ipa=true/false
>  3. libcamera.mk needs to set LIBCAMERA_STRIP_EXCLUDE_FILES/DIRS
> 
> Kieran, what do you think?

I think if we change how or when the signing happens on the libcamera
side - it would/should only be towards a path to simplify things so we
don't need to strip, so I don't think we need to do anything extra here
at the moment.

I think tracking the stripping of files is a pain, and we should find a
way to sign only the relevant sections which don't get stripped ;-) But
unfortunately - that's a bit more work, and not likely to happen in the
near-ish future, unless anyone thinks 'that sounds easy' and wants to try.

--
Kieran

> 
> Regards,
> Yann E. MORIN.
> 
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
> > +     find $(@D)/build/src/ipa \
> > +     $(if $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES)), \
> > +             -not \( $(call findfileclauses,$(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) ) \
> > +     -type f -name 'ipa_*.so' -print0
> > +
> > +define LIBCAMERA_BUILD_STRIP_IPA_SO
> > +     $(LIBCAMERA_STRIP_FIND_CMD) | xargs --no-run-if-empty -0 $(STRIPCMD)
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
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
