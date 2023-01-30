Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314E4C54EAA
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 07:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA4DB416C6;
	Mon, 30 Jan 2023 07:13:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA4DB416C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tcQUX37IyQN1; Mon, 30 Jan 2023 07:13:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD77C416C7;
	Mon, 30 Jan 2023 07:13:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD77C416C7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 04BED1BF3DA
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 07:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D281060C29
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 07:13:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D281060C29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KQ4QYLH0tPEG for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 07:13:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D000460ACC
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D000460ACC
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 07:13:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id CE4C95FFA5;
 Mon, 30 Jan 2023 08:13:36 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 30 Jan 2023 08:13:36 +0100
Date: Mon, 30 Jan 2023 08:13:36 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230130071336.GF2632@scaer>
References: <20230127141058.2180747-1-james.hilliard1@gmail.com>
 <20230127141058.2180747-4-james.hilliard1@gmail.com>
 <20230129214507.GY2632@scaer>
 <CADvTj4rYJHfDyhEmtogs0WQ30=FZQH8zWAcuwZMxmebq_iL7xA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4rYJHfDyhEmtogs0WQ30=FZQH8zWAcuwZMxmebq_iL7xA@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675062823;
 bh=5UNK95XL1eRWxm8s6T7wnImCx2PnUgBPhpae+voPrvo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E1FUHd2CZY2QyfvihJiyj+TV1Vt2wRiPcm/ZzYdd8SCEgiPtGg1kGFy69flVJGZep
 ata8pOR3PF2L663mmwAjB2XxC0kQnGeU3E7h7/cItkgJD1nrNGtY6X+xYJoLLYH8cu
 VMWG0m41kzi4PWh0yo52DIQHFZHuu6cYOMMEkv7H5m8IMkw1qOLcI5/ASUOoP1MNhM
 zD6xwgPzMmZgkvcOSkNyCl0hzMIv+Lwl9HSfm8IiqVB7m4gTmLkVvjtcDijKCWrBTu
 8SN+CXF2wDMMuGO86FqAfCU2linxx0hlXI6KYGHrbLe+oQPeQJ1IlhgTQ5FlySon7K
 0l+LfMXpDEMWw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=E1FUHd2C
Subject: Re: [Buildroot] [PATCH v4 04/13] package/gemmlowp: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2023-01-29 20:17 -0700, James Hilliard spake thusly:
> On Sun, Jan 29, 2023 at 2:45 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > For x86, we should probably have code like (what we have as
> > BR2_X86_CPU_HAS_SSE4 seems to be SSE4.1, but it is not clear whether
> > there is an actual delta between SSE4 and SSE4.1 [0], so let's be safe
> > and assume that BR2_X86_CPU_HAS_SSE4 is not enough):
> >
> >     ifeq ($(BR2_X86_CPU_HAS_SSE42),y)
> >     GEMMLOWP_OPTIM += -msse4.1
> >     endif
> >
> > However, that same header seems to also have some detection based on
> > macros... This needs to be cleared, maybe?
> 
> Well gemmlowp is effectively a header only library so optimization flags would
> not be set for the gemmlowp package itself but rather in something like the
> tensorflow-lite package which consumes the headers AFAIU.

Yeah, I noticed that it was a header-only library only later...

Still, for those packages, gemmlowp, neon-2-sse, maybe fxdiv, they do
have a requirement that SSE be needed, so they should depend on that.
For example:

    config BR2_PACKAGES_GEMMLOWP_ARCH_SUPPORTS
        bool
        default y if BR2_X86_CPU_HAS_SSE42
        default y if BR2_ARM_CPU_HAS_NEON

Or:

    config BR2_PACKAGES_NEON_2_SEE_ARCH_SUPPORTS
        bool
        default y if BR2_X86_CPU_HAS_SSE3

Otherwise, those packages (notable neon-2-sse) don't make much sense, or
will be horribly slow...

Can you send a set of patches, please?

Regards,
Yann E. MORIN.

> Note there's technically an unused deprecated library that gets installed
> to staging, we don't install it to target since we don't have anything consuming
> that deprecated interface at all:
> https://github.com/google/gemmlowp#old-eightbitintgemm-legacy-deprecated-interface
> 
> >
> > [0] https://en.wikipedia.org/wiki/SSE4
> >
> > Regards,
> > Yann E. MORIN.
> >
> > > +$(eval $(cmake-package))
> > > --
> > > 2.34.1
> > >
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot@buildroot.org
> > > https://lists.buildroot.org/mailman/listinfo/buildroot
> >
> > --
> > .-----------------.--------------------.------------------.--------------------.
> > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
