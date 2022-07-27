Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A54C19F29
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 22:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E784415D8;
	Wed, 27 Jul 2022 22:13:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E784415D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s6CUzzRvngbi; Wed, 27 Jul 2022 22:13:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBAFD41504;
	Wed, 27 Jul 2022 22:13:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBAFD41504
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 673051BF47F
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 22:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4235781026
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 22:13:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4235781026
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ygcdDG9X8Qiu for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 22:13:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED42080F2C
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED42080F2C
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 22:13:46 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id i4so440430oif.2
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 15:13:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=erbf0pw7F/tUmV45rLgAL4XAeMxP2uuEluTGSjisQms=;
 b=LlbBx6pd/kTppyULg+yWNhoCzc1neoEywGUfRmvGPJRAv7kzI3/I+nAc61I3eue1e3
 ZK5gXal08nbBNPfmrju6RXSJ6X8WvriWLlID5Tfihh08euS2YkUld/8ITlOYX51nOkKB
 qADvhrc0uwbRoy3ON0g2F6JZwIBzmgCOwWH/YEfWAb9bQP0sIfB5C4wEZyxMldS5kgOC
 iTwUpEO7DFKpkCNcct/aKFX4Rzi2RLC3UR7StoKws2FxD3R7Hhw1+2miHqmyJSasP3R7
 dO7RiRlUmEXhBXfpBWiQgzUs8V81zJrjiuGBqwsa4U/phN52HzOlGwpa8lPTLQxui7Dr
 btQA==
X-Gm-Message-State: AJIora9RFfTRt0eY6w6QaUuIZIKkkR+oAfVNuJWVy8SFuKxPoyetWaNP
 gly9VxcUS/dbElcmXJ22UKwRXka2d2IwrSqrLOo=
X-Google-Smtp-Source: AGRyM1tClzEm+L5iFpXBwaL+velp7+5333qF5isDO+RcFr6TkTDQ5yoMv2boHyyhqXIkEyijoinW+DkwHWIWkhI4DwI=
X-Received: by 2002:a05:6808:211a:b0:33a:9a59:fb31 with SMTP id
 r26-20020a056808211a00b0033a9a59fb31mr2832276oiw.147.1658960026048; Wed, 27
 Jul 2022 15:13:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220727071557.3434892-1-james.hilliard1@gmail.com>
 <20220727071557.3434892-2-james.hilliard1@gmail.com>
 <20220727112523.GA1134587@scaer>
In-Reply-To: <20220727112523.GA1134587@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 27 Jul 2022 16:13:34 -0600
Message-ID: <CADvTj4oMg_qBSFxKGC9XA1VMDD943c9aszevXvPYM1CYfNPyUA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=erbf0pw7F/tUmV45rLgAL4XAeMxP2uuEluTGSjisQms=;
 b=YA4leoj/Xts4tL0ak+GbN2mSzmnLh7DWgPFBlFRiF28M+iGySA4SAdW7TX5yKKdGEV
 5CDPl5ZUW/svRJb2tInhXF/tl/NdHoJB3+31tET0Addp8LXXQmrKyJJHqaczcL0rncbi
 GDsSAzAXCaDIM5b5FxrnBpo33OXHoxGHC1gQ7NfYl37CCygm63+umV/ONpnhaaUuuQRN
 pfvdVRvWdHiuKggUURYzXP2z5BQwNr+f6Jtg7nhuWvf+qmDA5MvsaQUiHn1IRdY4F4Br
 pOBlVQ357IAkTy3iM6E9BHlOvnjFbPx/XApP50ZBw36zDoCD4H0tqXtE/569Q9KiRFKJ
 Pkcg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YA4leoj/
Subject: Re: [Buildroot] [PATCH v5 2/2] package/pkg-meson: use meson to
 build/install packages
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Samuel Martin <s.martin49@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 buildroot <buildroot@buildroot.org>, Norbert Lange <nolange79@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Jul 27, 2022 at 5:25 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2022-07-27 01:15 -0600, James Hilliard spake thusly:
> > As of version 0.54.0 meson has had the ability to build and install
> > packages rather than having to run ninja directly as before.
> [--SNIP--]
> > diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> > index 47aaddf849..6efc8d636f 100644
> > --- a/package/systemd/systemd.mk
> > +++ b/package/systemd/systemd.mk
> [--SNIP--]
> > @@ -777,10 +777,7 @@ endef
> >  HOST_SYSTEMD_CONF_OPTS = \
> >       -Dsplit-bin=true \
> >       -Dsplit-usr=false \
> > -     --prefix=/usr \
> > -     --libdir=lib \
> > -     --sysconfdir=/etc \
> > -     --localstatedir=/var \
> > +     -Drootprefix=$(HOST_DIR) \
>
> Have you read the explanations in 35c11a027c8 (package/systemd: add host
> variant)? This change must expand on how it does not break things, with
> a very good and detailed commit log, and as a separate patch.
>
> Also, if the HOST_SYSTEMD_FIX_RPATH hook still needed, then?

Well I think I did find a way to remove that:
https://patchwork.ozlabs.org/project/buildroot/patch/20220727221055.1838031-1-james.hilliard1@gmail.com/

>
> Regards,
> Yann E. MORIN.
>
> >       -Dutmp=false \
> >       -Dhibernate=false \
> > @@ -852,8 +849,6 @@ HOST_SYSTEMD_DEPENDENCIES = \
> >       host-gperf \
> >       host-python-jinja2
> >
> > -HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
> > -
> >  # Fix RPATH After installation
> >  # * systemd provides a install_rpath instruction to meson because the binaries
> >  #   need to link with libsystemd which is not in a standard path
> > --
> > 2.34.1
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
