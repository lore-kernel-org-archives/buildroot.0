Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE4AC38142
	for <buildroot@archiver.kernel.org>; Mon, 23 Jan 2023 08:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0120404F8;
	Mon, 23 Jan 2023 08:44:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0120404F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dk_pqWo_saJM; Mon, 23 Jan 2023 08:44:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0AFEA402CE;
	Mon, 23 Jan 2023 08:44:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AFEA402CE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8B5001BF369
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 08:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74C3B402CE
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 08:44:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74C3B402CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D0XPY4A_H3Qn for <buildroot@lists.busybox.net>;
 Mon, 23 Jan 2023 08:44:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34AB04012A
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34AB04012A
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 08:44:51 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-4b718cab0e4so161874517b3.9
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 00:44:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fCTkhDcaxZmL3U4fJcmv7F5f6KtFykBP+X6loCsp6o0=;
 b=I/9HiIs2FEMbE9stgg0Xxo76Uv6TBoxbsUB/TYE2PC/QIE/ZfsppGeRqKBefpdWJD8
 pqp6gPY/ptSFlGSOGoArMI6mnMiLMbdmvHXG5aFcFW9hfPHBiqIes3wFMKfIc6dNmU13
 f8oC+EnNu15QhOk4PEZGKKrFUXH2KVe2S/Qbm+nX/gi9MBRE5F9TRrKS15DwxFlA4ElO
 1KqEw2yuUGaubzMYsSkTN7PYy6YCu3CRqrfXuQWd/XQq35PjpYK4/i7uCL1cdaEt/Bl4
 N2+k4DcnRFuaa6oK9vI8qDYkahuPpwgRAx9p0X4dDdM7dKyJ1yy13VyIIG0fIbx+g1cR
 lnVA==
X-Gm-Message-State: AFqh2kop2BNupLqkEqCWR9g+7Ga2D3XXhY7dcPeZA/Y1gl0sQLCbY7N5
 2dTLTmG0vjLdNoOZTl87qQAXmKSCP6Nic2pHNz0rvMlU
X-Google-Smtp-Source: AMrXdXv7VYQX7MoBvDMEspFEAzbGkU5jz0O0cNyPeL4p1LJYeOBKLbi3ZydEhS83jp8WUb4rnmdZ8CPeR4FmsCxPHts=
X-Received: by 2002:a0d:d086:0:b0:4fa:78d8:efbf with SMTP id
 s128-20020a0dd086000000b004fa78d8efbfmr1909026ywd.247.1674463489981; Mon, 23
 Jan 2023 00:44:49 -0800 (PST)
MIME-Version: 1.0
References: <20230116080513.21407-1-yegorslists@googlemail.com>
 <20230116212444.GH2770@scaer>
 <CAGm1_kuifU41S1+Yr4eEX90AwA7CXnFtDVr+GES2SewO1PmagA@mail.gmail.com>
 <20230118203343.GK2770@scaer>
In-Reply-To: <20230118203343.GK2770@scaer>
Date: Mon, 23 Jan 2023 09:44:40 +0100
Message-ID: <CAGm1_ktcfjguBB-XVaNDszx2cW49A_x0B2E-aDiyiBO18MfPww@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fCTkhDcaxZmL3U4fJcmv7F5f6KtFykBP+X6loCsp6o0=;
 b=Tg/cOuiQ0M5eOsHr5OH9Vhvl623d5KPhXdJJwQmCt40LIsXTcnhXNZMx1Yp+y5Y/Y8
 dUqb7SGE8wA24xvx/JL9/EvbpQJ6KC85Tvf/KyJPlUTQg3Tazlq84gf8/zOPY/bN33qv
 gqe1o9j+HH+yoJQbhbOffJGzCAfi2vVHVEoBDw0Vn/Jc51DDikkCsJj9ZI/fVuLGNrN/
 ei4zQ5jAs/KjETHVIBt3AZ5bGCNH7QWQuxXxauBNxbPRGsMRVsC0H8IDWqmEJtALSsb6
 yk6as4tglMAbMDcEHmICAZK0Pney6cosdyVeFg2yNg5hzEbKxinqjO144mk3kEcFJcxR
 BXhA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Tg/cOuiQ
Subject: Re: [Buildroot] [PATCH] package/util-linux: add an option to enable
 irqtop
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yann, all,

On Wed, Jan 18, 2023 at 9:33 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Yegor, All,
>
> On 2023-01-17 08:57 +0100, Yegor Yefremov via buildroot spake thusly:
> > On Mon, Jan 16, 2023 at 10:24 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > > On 2023-01-16 09:05 +0100, yegorslists--- via buildroot spake thusly:
> > > > From: Yegor Yefremov <yegorslists@googlemail.com>
> > > >
> > > > irqtop is an IRQ monitoring tool.
> > > >
> > > > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> > > > ---
> > > >  package/util-linux/Config.in     | 7 +++++++
> > > >  package/util-linux/util-linux.mk | 1 +
> > > >  2 files changed, 8 insertions(+)
> > > >
> > > > diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
> > > > index 917f1bc2b4..c7e4d2d8bc 100644
> > > > --- a/package/util-linux/Config.in
> > > > +++ b/package/util-linux/Config.in
> > > > @@ -161,6 +161,13 @@ config BR2_PACKAGE_UTIL_LINUX_IPCS
> > > >       help
> > > >         Show information on IPC facilities
> > > >
> > > > +config BR2_PACKAGE_UTIL_LINUX_IRQTOP
> > > > +     bool "irqtop"
> > > > +     depends on BR2_USE_MMU # libsmartcols
> > > > +     select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
> > >
> > > I was about to apply this, but I am a bit conflicted... Building irqtop
> > > defaults to 'yes' for linux systems, when --disable-irqtop is not
> > > specified (unless I misread util-linux' configure.ac).
> > >
> > > So, today we are providing neither --enable-irqtop nor --disable-irqtop,
> > > which means that it is in practice always built.
> > >
> > > But with your change, it means that now it is by default disabled.
> > >
> > > So I wanted to add 'default y' for legacy reasons, but we have no other
> > > option in util-linux that defaults to 'y', so it would have been a bit
> > > odd to do so...
> [--SNIP--]
> > irqtop is a rather new tool and it is not listed in the
> > BR2_PACKAGE_UTIL_LINUX_BINARIES help text. Perhaps, it is not that
> > problematic that it is not enabled by default.
>
> irqtop has been in-tree since 2.36, released almost 2.5 years ago now,
> and packaged in Buildroot for almost as long, so people may have come
> to rely on its presence, even if undocumented.

Perhaps, we should just drop my patch and I just add irqtop to the help text?

Regards,
Yegor

> > I've sent v2 with the added ncurses dependency.
>
> I'll have a look, thanks.
>
> Regards,
> Yann E. MORIN.
>
> > Regards,
> > Yegor
> >
> > > Regards,
> > > Yann E. MORIN.
> > >
> > > > +     help
> > > > +       Show information on IRQs
> > > > +
> > > >  config BR2_PACKAGE_UTIL_LINUX_KILL
> > > >       bool "kill"
> > > >       help
> > > > diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> > > > index b53b94ec31..87ec3c19d7 100644
> > > > --- a/package/util-linux/util-linux.mk
> > > > +++ b/package/util-linux/util-linux.mk
> > > > @@ -136,6 +136,7 @@ UTIL_LINUX_CONF_OPTS += \
> > > >       $(if $(BR2_PACKAGE_UTIL_LINUX_IPCMK),--enable-ipcmk,--disable-ipcmk) \
> > > >       $(if $(BR2_PACKAGE_UTIL_LINUX_IPCRM),--enable-ipcrm,--disable-ipcrm) \
> > > >       $(if $(BR2_PACKAGE_UTIL_LINUX_IPCS),--enable-ipcs,--disable-ipcs) \
> > > > +     $(if $(BR2_PACKAGE_UTIL_LINUX_IRQTOP),--enable-irqtop,--disable-irqtop) \
> > > >       $(if $(BR2_PACKAGE_UTIL_LINUX_KILL),--enable-kill,--disable-kill) \
> > > >       $(if $(BR2_PACKAGE_UTIL_LINUX_LAST),--enable-last,--disable-last) \
> > > >       $(if $(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),--enable-libblkid,--disable-libblkid) \
> > > > --
> > > > 2.17.0
> > > >
> > > > _______________________________________________
> > > > buildroot mailing list
> > > > buildroot@buildroot.org
> > > > https://lists.buildroot.org/mailman/listinfo/buildroot
> > >
> > > --
> > > .-----------------.--------------------.------------------.--------------------.
> > > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > > | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > > '------------------------------^-------^------------------^--------------------'
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
