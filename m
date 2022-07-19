Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EDEFC43334
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 21:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8C0961042;
	Tue, 19 Jul 2022 21:56:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8C0961042
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xoKvqRnyRECC; Tue, 19 Jul 2022 21:56:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7981460EFA;
	Tue, 19 Jul 2022 21:56:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7981460EFA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9213C1BF37C
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 21:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B70360EFA
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 21:56:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B70360EFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yAPO8iInCx4g for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 21:56:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7712B60DFC
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7712B60DFC
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 21:56:47 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id bb16so8681017oib.11
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 14:56:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mRku+ELdtnUFP8lhRQfHjkF/IZGCNfQ/DjBOkhNnkDg=;
 b=0DHacjn2Byfs7v5A9+qvmhlzXbmz4Y2Ms+i4tKl1Y66gCHfRiN3Q5SphcGhyvO4NLJ
 xweYmXjobvOo+K+fiq0+J1/TDXUxqQ4TmBDpZgihbVmTyGyQaqaYnftGfr/Iu98xbSmi
 uPUNUM2rZygUNPS73nHnUTNudDWGh2M4vxQnzXC+aqyQuxMGSNOwnsnWXS8UCZ3PP/Wu
 0HHhNKtO+2eV7GEcsCfARtXjihNHw0CMNnHCoVjxia4OFceU9FriKWjqKt1yu/sQNjUm
 Pe0VQonTBcOKV7Erd/1q75hLHrX4mK3xwha/QX+YdLM6qbObxQM7HlHuR9kjDigUD6gj
 P5nQ==
X-Gm-Message-State: AJIora/+yweM8yU5HWBokUbI8z0PAe2HUrt5fYiWPwHRqaIe/kSsHLco
 duQnYBhRhWdAJ9S0bdv1xCq3H6DTrujzbMDZ+n0=
X-Google-Smtp-Source: AGRyM1t/021SJ+HkB1tEbHrPcgwCD80jZ4BkpzoP4sbLB/5I/UU79HKsz9CRsfa/fUvSM+dmzgB0Aw1llMn75MT6YkA=
X-Received: by 2002:a05:6808:19a0:b0:33a:694a:cd3d with SMTP id
 bj32-20020a05680819a000b0033a694acd3dmr814291oib.99.1658267806425; Tue, 19
 Jul 2022 14:56:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220719130449.334694-1-nolange79@gmail.com>
 <20220719162138.GL2249625@scaer>
In-Reply-To: <20220719162138.GL2249625@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 19 Jul 2022 15:56:35 -0600
Message-ID: <CADvTj4oVSUD8pRRo=iwoMX3u_ABxf2QX1nr9RpBEOO8w2saOfA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=mRku+ELdtnUFP8lhRQfHjkF/IZGCNfQ/DjBOkhNnkDg=;
 b=VKgeeZ+CzESWWQVwoH7+e2wp10XEHOY0vPRSqucIlE0P1yulJ3REzIq4Q/4j6GgAjC
 mrJ8cEpnt7seZsC15mk4zxold1hcNJ9dGlTLdmOMULFDGuhX4WlJkuUyA40XWE8+G6yY
 RuaFQD3CyVnhihnnaImFnSmdRb1eGyfiNNdR+/gnrGFH1laaw1C/HHijuDJBKBNFTgbu
 AFVXPeq/iv7mf0ZkTlfoResKklHhhHgvG277YnmFOFONdccM1aGPioM9P2Th90uKre9j
 Sq07CFYOx2SdjJoUP3zZ0ByZNKF3Y/58k/yIK0uvmw16NBpE2i2AIvoYc+B5GcHdbrzb
 bksQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=VKgeeZ+C
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: bump to version 251.3
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
Cc: Norbert Lange <nolange79@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

FYI I had sent a similar bump earlier:
https://patchwork.ozlabs.org/project/buildroot/patch/20220522011729.117324-1-james.hilliard1@gmail.com/

On Tue, Jul 19, 2022 at 10:22 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Norbert, All,
>
> On 2022-07-19 15:04 +0200, Norbert Lange spake thusly:
> > Add config option for the new sysupdate feature.
>
> Honestly, with a package so complex and critical like systemd, I would
> prefer that new features not be added during the bump, but as followup
> patches. The bump should add a force-disable of new features (when
> known), or just leave them as auto-detected or upstream-decided
> defaults.
>
> > Remove upstreamed patch.
> >
> > Update options, manually setdefault options, remove option
>
> Sorry, I don't immediately see what "manually setdefault" means...
> Is there a missing space, and this should be "manually set default" ?
> Or is "setdefault" and actual systemd concept?
>
> (genuinely asking)
>
> > not available anymore.
> >
> > Set default-user-shell based on wether a couple packages
> > are enabled.
> >
> > Set default-locale to C, this seems the only safe default,
>
> How does that play with BR2_ENABLE_LOCALE_WHITELIST? I think that we
> would want to use the first word of BR2_ENABLE_LOCALE_WHITELIST is it is
> set, falling back to just 'C' otherwise.

Yeah, we should use 'C.UTF-8' since it's now supported by localedef, I had
sent a patch earlier changing the default but there were uclibc compatibility
issues, since systemd is incompatible with uclibc there's probably a better
approach:
https://patchwork.ozlabs.org/project/buildroot/patch/20220517192439.1034654-1-james.hilliard1@gmail.com/

>
> Furthermore, that is not a novelty with v251; v250 already had that
> option, so that should be a separate, preliminary patch.
>
> > users can override this in `/etc/locale.conf`.
>
> > Signed-off-by: Norbert Lange <nolange79@gmail.com>
> > ---
> [--SNIP--]
> > diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
> > index 3572b25965..838ed13fd5 100644
> > --- a/package/systemd/systemd.hash
> > +++ b/package/systemd/systemd.hash
> > @@ -1,5 +1,5 @@
> >  # sha256 locally computed
> > -sha256  d2bda9d225da11dc9ff48b48e59fc36798d3e66902ed400a9f78fa370c596864  systemd-250.4.tar.gz
> > +sha256  11c9c3fcc13d689615dd2ea79161d1b992087cf1e2a23856d7d7ade0efbddc54  systemd-251.3.tar.gz
> >  sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
> >  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
> >  sha256  e5a8645ad94aab24e312dd0c6be2aa54236eb9374480b1b14ea5c61598874fd5  LICENSES/BSD-2-Clause.txt
> > @@ -11,4 +11,4 @@ sha256  790ac93fb2859097bdda4cf08b5a4feb5e479d0cb2c74f403248241bc3e7c216  LICENS
> >  sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
> >  sha256  2a98749f6bec00dfaed86fa9c1edea871aaae4f11ee4d100b671aaf4ce353a73  LICENSES/murmurhash2-public-domain.txt
> >  sha256  1a7adaa2c86cedfd6c7f5c0c7c72fd6d3e02cd0c9593f21fdb53c89bb2b130ec  LICENSES/OFL-1.1.txt
> > -sha256  11801e931f252252a16eac8299465510d0a82c36bfd9ac8aea9b202b76d2f82b  LICENSES/README.md
> > +sha256  177ff657698bc940f9888b7f69e5d734b0933c2859ea264fde8de1700cec40dd  LICENSES/README.md
>
> What has changed in that license file? How does it impact (or not) the
> licensing info we carry?
>
> We have hashes for license files, so that we know they licensing terms
> change when a package is updated. Silently changing the hash kind of
> defeats the purpose for those hashes...
>
> > diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> > index 46a4e8de2c..b6fffc553f 100644
> > --- a/package/systemd/systemd.mk
> > +++ b/package/systemd/systemd.mk
> [--SNIP--]
> > @@ -472,6 +474,20 @@ else
> >  SYSTEMD_CONF_OPTS += -Dsysext=false
> >  endif
> >
> > +ifeq ($(BR2_PACKAGE_SYSTEMD_SYSUPDATE),y)
> > +SYSTEMD_CONF_OPTS += -Dsysupdate=true
> > +else
> > +SYSTEMD_CONF_OPTS += -Dsysupdate=false
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_BASH),y)
> > +SYSTEMD_CONF_OPTS += -Ddefault-user-shell=/bin/bash
> > +else ifeq ($(BR2_PACKAGE_ZSH),y)
> > +SYSTEMD_CONF_OPTS += -Ddefault-user-shell=/bin/zsh
> > +else
> > +SYSTEMD_CONF_OPTS += -Ddefault-user-shell=/bin/sh
> > +endif
>
> We already have BR2_SYSTEM_BIN_SH which defines what /bin/sh is, and so
> I think we should use exactly /bin/sh as the default shell:
>
>     ifneq ($(BR2_SYSTEM_BIN_SH_NONE),y)
>     SYSTEMD_CONF_OPTS += -Ddefault-user-shell=/bin/sh
>     endif
>
> If there is not default shell for the system, then there is none for
> users as well. Systemd-defined users that want a specific shell will
> have to explicitly request it: if they have a requirement for a specific
> shell, they can't rely on whatever the default is, so usng /bin/sh is
> exactly what we want.
>
> If BR2_SYSTEM_BIN_SH is empty, it is perfectly possible that there is no
> shell available at all (no standalone shell, no shell in busybox), so we
> don't want to set any default either.
>
> Regards,
> Yann E. MORIN.
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
