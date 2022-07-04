Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CDEFC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 19:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFFCE408EF;
	Mon,  4 Jul 2022 19:45:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFFCE408EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nRfpbMczH0M8; Mon,  4 Jul 2022 19:45:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C08C7405C0;
	Mon,  4 Jul 2022 19:45:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C08C7405C0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 30BAD1BF331
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 19:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0AEEE82422
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 19:45:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AEEE82422
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DcwVRD_AAnwM for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 19:45:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB25881CA7
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB25881CA7
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 19:45:37 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id q11so13882280oih.10
 for <buildroot@buildroot.org>; Mon, 04 Jul 2022 12:45:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EDMY+J4uOa68kQBEpQQX8maUkJ4fHAchp8aK+/RsdW0=;
 b=u0abjE697XmwYNbnCj8o2y/6oYx9BpK0IdGDdkj42p1ZyRLCWA25UZjQzEDJPSQLUB
 lTtLX+FB3X4V6vmOaXw9o9Ubvy/mfWniXgfslLQAoQyQV3iMlW9y9CGqVPY2fvs3qUTy
 hIrlD4ns/5s9s8f7Yg2UOk88FYwxW89U6rXnuONTmWOnxamFWxAiGH7N9unkn4yqSKau
 ybCo1+hsx2GFvPOZyeHCxEY6dktjepagxlOHy2WG4HiyRQNSsTYh7IERMZtn0Pa+YCED
 xf7nxlvik/hPBeYkOtvHJ4fZ5bQoWiBmvaviu95DngPC6oBd/ykFc+/SfCU30AV2kz6l
 lrfA==
X-Gm-Message-State: AJIora+41tDqlYq/jCpkHw4YR2+W54cRca1TRh39bbWy9imqn/lrpkAO
 nI05wVBvL3ax5xNEmVfol/CvP6LaVlDNm2xOweqmgE6j/rU=
X-Google-Smtp-Source: AGRyM1s0obIlsBba/MkPq+vGtTus1KO1diR4qLh7oNrA+HWx89qhIuqQ3xdOE9k1xtZeGsXJjTu4OE0c1l/84/S2C/U=
X-Received: by 2002:aca:44c1:0:b0:337:ba0e:3e7d with SMTP id
 r184-20020aca44c1000000b00337ba0e3e7dmr4394120oia.200.1656963936832; Mon, 04
 Jul 2022 12:45:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220506104658.3174243-1-foss+buildroot@0leil.net>
 <CADvTj4p_22ayfvpD=+pKWppGJHD-Q2g48XwFnoKmmB22fw+g+g@mail.gmail.com>
 <165696199632.1630086.2094271397321278842@Monstersaurus>
In-Reply-To: <165696199632.1630086.2094271397321278842@Monstersaurus>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 4 Jul 2022 13:45:25 -0600
Message-ID: <CADvTj4rb30RfhTpfccxmVfRbO3pA4HuCDLL2+j5UKODQ7U+B=Q@mail.gmail.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=EDMY+J4uOa68kQBEpQQX8maUkJ4fHAchp8aK+/RsdW0=;
 b=VA+iOoivna6iy8K8F8TecBOUFFgywcf5D+2UMvPdSDKWoecRCAqaEpkEHRyNs4WBiT
 Z7YFBUud0V0wz7kFPveWwNdOhnBlYBnEQboWtV33w32q/2mcgJKJzoel0CNaIAUQnGON
 mHdIQ8TH9OE7h/u6Hq0kFIaf2uDDFoqrSPGgDvH7OyhQnEZW40M+NjA/XBBZsLQH+Orf
 NK28tCY5+Uc9cPGGlwsjkinabw3vKw9apFa+30rtm+TuRY1vOqBLqCcbRPhjlCCWrupD
 mZlWdx6KhXYaasb5buNrdn2olvOkXUTmACX000ztQhwD3o4PbW1ncyousAYVwEagABqA
 m1ow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=VA+iOoiv
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

On Mon, Jul 4, 2022 at 1:13 PM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>
> Quoting James Hilliard (2022-07-04 18:29:25)
> > On Fri, May 6, 2022 at 4:47 AM Quentin Schulz <foss+buildroot@0leil.net> wrote:
> > >
> > > From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> > >
> > > Open-Source IPA shlibs need to be signed in order to be runnable within
> > > the same process, otherwise they are deemed Closed-Source and run in
> > > another process and communicate over IPC.
> >
> > Why not just add an option to libcamera to disable signature
> > validation entirely?
> >
> > It seems kinda pointless if one is not using closed source shlibs.
>
> The IPA modules can be installed separately. We detect that by
> validating the signature. If the signature fails, we determine the IPA
> shlib module is 'proprietary' and it gets sandboxed in a separate
> process.

So sandboxing is generally undesirable and kind of a hack to deal with
security issues around proprietary modules from my understanding.

>
> Providing an option to disable this would defeat the core purpose of it
> entirely.

The signature scheme from my understanding only makes sense when one
intends to mix open source and proprietary modules in the same build.

So if one isn't mixing open source and proprietary IPA modules...then one
can just disable the validation entirely and choose the desired sandboxing
on/off behavior at build time.

Mixing open source/proprietary modules at runtime seems like it would be
a pretty uncommon use case for buildroot at least.

Or am I missing something here?

>
> --
> Kieran
>
>
>
> > > The shlib installed on the target should be the same as the one signed
> > > by libcamera during package creation otherwise the signature won't match
> > > the shlib.
> > >
> > > Buildroot sanitizes RPATH in a post build process. meson gets rid of
> > > rpath while installing so we don't need to do it manually.
> > >
> > > Buildroot may strip symbols, so we need to do the same before signing.
> > > Since meson install target is also signing the IPA shlibs, let's strip
> > > them before this happens.
> > >
> > > Cc: Quentin Schulz <foss+buildroot@0leil.net>
> > > Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> > > ---
> > >
> > > v2:
> > >  - use LIBCAMERA_POST_BUILD_HOOKS instead of replacing
> > >  LIBCAMERA_INSTALL_TARGET_CMDS,
> > >  - add handling of BR2_STRIP_EXCLUDE_FILES to not strip files which
> > >  shouldn't,
> > >  - added --no-run-if-empty to xargs, in case no IPA is selected,
> > >  - removed stderr redirect and pipe to true to not hide useful
> > >  information or fail the build if strip does not work,
> > >
> > >  package/libcamera/libcamera.mk | 20 ++++++++++++++++++++
> > >  1 file changed, 20 insertions(+)
> > >
> > > diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> > > index 77381ab3ca..41d6a5abef 100644
> > > --- a/package/libcamera/libcamera.mk
> > > +++ b/package/libcamera/libcamera.mk
> > > @@ -104,4 +104,24 @@ LIBCAMERA_DEPENDENCIES += libexecinfo
> > >  LIBCAMERA_LDFLAGS = $(TARGET_LDFLAGS) -lexecinfo
> > >  endif
> > >
> > > +# Open-Source IPA shlibs need to be signed in order to be runnable within the
> > > +# same process, otherwise they are deemed Closed-Source and run in another
> > > +# process and communicate over IPC.
> > > +# Buildroot sanitizes RPATH in a post build process. meson gets rid of rpath
> > > +# while installing so we don't need to do it manually here.
> > > +# Buildroot may strip symbols, so we need to do the same before signing
> > > +# otherwise the signature won't match the shlib on the rootfs. Since meson
> > > +# install target is signing the shlibs, we need to strip them before.
> > > +LIBCAMERA_STRIP_FIND_CMD = \
> > > +       find $(@D)/build/src/ipa \
> > > +       $(if $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES)), \
> > > +               -not \( $(call findfileclauses,$(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) ) \
> > > +       -type f -name 'ipa_*.so' -print0
> >
> > Wouldn't this make it difficult to analyze core dumps since we need unstripped
> > binaries for that?
> >
> > > +
> > > +define LIBCAMERA_BUILD_STRIP_IPA_SO
> > > +       $(LIBCAMERA_STRIP_FIND_CMD) | xargs --no-run-if-empty -0 $(STRIPCMD)
> > > +endef
> > > +
> > > +LIBCAMERA_POST_BUILD_HOOKS += LIBCAMERA_BUILD_STRIP_IPA_SO
> > > +
> > >  $(eval $(meson-package))
> > > --
> > > 2.35.1
> > >
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot@buildroot.org
> > > https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
