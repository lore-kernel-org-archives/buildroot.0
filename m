Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94619C433F5
	for <buildroot@archiver.kernel.org>; Thu, 20 Jan 2022 00:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A62882662;
	Thu, 20 Jan 2022 00:43:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UaVo5FjW_UIq; Thu, 20 Jan 2022 00:43:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BC7282446;
	Thu, 20 Jan 2022 00:43:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 097131BF9C2
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 00:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 037644010F
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 00:43:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W42w2buf4phU for <buildroot@lists.busybox.net>;
 Thu, 20 Jan 2022 00:42:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A9712400B8
 for <buildroot@buildroot.org>; Thu, 20 Jan 2022 00:42:58 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id g205so7057075oif.5
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 16:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wBE+yC897sK28cqSC57fYniRGj7ZS7STOKFdvyw5Os0=;
 b=SS7WnWGzYDs+1AdbeWco3mbQnDLq5rfG8XuJv5GHsM9u3XdYllT9UziPXdrwnhgwRO
 sgh1tU/rmu4rfaiCHMsORbZEs0sSBuXilLWGCr1yEeHtA/tE4pVdp3Sw1czEg3RQe0QA
 V9Jy3dR8k8sD5hLNz2Tvw4USg+7vVWLk6lObaJcgiP2XWrG8SN9zKbT2aAZOZ3bDpgMu
 0u0Qa9dKCPTuaCobe/n1VWTCIBhF/bakQDnAnTXQR/GxCDUPE89yE+TM7LnC6naWTRUk
 6wQb1vTzCk3ZjQEoQuQDKH2Y9tJWCrRHq89ByH6wttP9LdfknUHPlCmJxrJWkYTe/FhH
 LZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wBE+yC897sK28cqSC57fYniRGj7ZS7STOKFdvyw5Os0=;
 b=W5GJ+S9/mocbvbikEI2PWjXxTBRqyRZ189bda+YiOuRIOZmVd/5lUwrDGkbdZz7X+/
 vlEEreWVmpXA1MoqHXoIOR1pd+gQ7whYpbnPjYkiBReM2z2uTOUdWeMJSl56qLntySXh
 Poy0NbUZ14/DwzN9sIJOzGezGxn6+KXOcoDk/8hwVKAPuyJt9JWA4RBUUw29A2NSELfF
 pjDXntwzS57EwmzHQtw4MD6sGlDhgj2wvayEfzCV+dExWnT2i+mds8TW4x6oUw47GgqF
 hrSn0QLKnBwpiuQbTcE2snESulGjGG0zAZbH1uXAiuEeH59LtoccepxfujUWglTHW1pQ
 lsKw==
X-Gm-Message-State: AOAM530hcyVYVNYLK6klv9xkHeM4plaVpdAB1zXQ385oHKBHdqPQMree
 AhgMtavGwdaVsXbDMUUt4sIVSWAFZQqrf/e6o+Y=
X-Google-Smtp-Source: ABdhPJy+VwNDC3O4gUXtwR9HwUrLrXv593278NIEtr1lDxEBuPRSjNYRWzlcgP0kOaUpVDsT0wsblBIEGAURR4Bb2iY=
X-Received: by 2002:a05:6808:1a95:: with SMTP id
 bm21mr5419892oib.67.1642639377443; 
 Wed, 19 Jan 2022 16:42:57 -0800 (PST)
MIME-Version: 1.0
References: <20220119084545.3642950-1-james.hilliard1@gmail.com>
 <20220119204518.GC3095239@scaer>
In-Reply-To: <20220119204518.GC3095239@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 19 Jan 2022 17:42:46 -0700
Message-ID: <CADvTj4q2AWnzpQbbQHFRUWnKki_uRCcDTOiT7pwRZ4-Ao0o3fw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/re2: switch to generic-package
 make build
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Jan 19, 2022 at 1:45 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2022-01-19 01:45 -0700, James Hilliard spake thusly:
> > The cmake build appears to be missing features such as pkg-config
> > generation support, switch to the regular makefile based build
> > which appears to work better.
>
> Can't we just fix the CMakeList.txt and submit a patch upstream,
> instead?

It looked like this had been brought up before and there was some issue that was
making this difficult to fix with cmake.
See:
https://github.com/google/re2/issues/349

>
> Also, see below...
>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/re2/re2.mk | 30 ++++++++++++++++++++++++++----
> >  1 file changed, 26 insertions(+), 4 deletions(-)
> >
> > diff --git a/package/re2/re2.mk b/package/re2/re2.mk
> > index b562d5d7ef..144c82339f 100644
> > --- a/package/re2/re2.mk
> > +++ b/package/re2/re2.mk
> > @@ -10,8 +10,30 @@ RE2_LICENSE = BSD-3-Clause
> >  RE2_LICENSE_FILES = LICENSE
> >  RE2_INSTALL_STAGING = YES
> >
> > -RE2_CONF_OPTS += -DRE2_BUILD_TESTING=OFF
> > -HOST_RE2_CONF_OPTS += -DRE2_BUILD_TESTING=OFF -DBUILD_SHARED_LIBS=ON
> > +define RE2_BUILD_CMDS
> > +     $(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> > +             -C $(@D)
> > +endef
> >
> > -$(eval $(cmake-package))
> > -$(eval $(host-cmake-package))
> > +define RE2_INSTALL_STAGING_CMDS
> > +     $(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> > +             DESTDIR="$(STAGING_DIR)" prefix=/usr -C $(@D) install
> > +endef
> > +
> > +define RE2_INSTALL_TARGET_CMDS
> > +     $(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> > +             DESTDIR="$(TARGET_DIR)" prefix=/usr -C $(@D) install
>
> The 'install' target will forcibly build and install static and shared
> libs:
>
>     https://github.com/google/re2/blob/main/Makefile#L297
>
>     296: .PHONY: install
>     297: install: static-install shared-install
>
> So, this is probably going to not play nicely for builds where a shared
> build is not possible.

Sent a v2 which should fix this:
https://patchwork.ozlabs.org/project/buildroot/patch/20220120003827.395469-1-james.hilliard1@gmail.com/

>
> AFAICS, the cmake-based buildsystem got that one correct, though, so it
> would be a bit of a shame to regress on that point...
>
> Regards,
> Yann E. MORIN.
>
> > +endef
> > +
> > +define HOST_RE2_BUILD_CMDS
> > +     $(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
> > +             -C $(@D)
> > +endef
> > +
> > +define HOST_RE2_INSTALL_CMDS
> > +     $(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
> > +             -C $(@D) DESTDIR="$(HOST_DIR)" prefix=/usr install
> > +endef
> > +
> > +$(eval $(generic-package))
> > +$(eval $(host-generic-package))
> > --
> > 2.25.1
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
