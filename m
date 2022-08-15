Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048C5C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 14:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90442819B4;
	Mon, 15 Aug 2022 14:53:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90442819B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PBfdNfpYF7yk; Mon, 15 Aug 2022 14:53:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 995F1817C0;
	Mon, 15 Aug 2022 14:53:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 995F1817C0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C38821BF308
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 14:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DBA660F90
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 14:53:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DBA660F90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aYTvNcRxLk26 for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 14:53:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4398560D62
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4398560D62
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 14:53:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c91d:14e3:a117:34c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id BFD4B60129;
 Mon, 15 Aug 2022 16:53:32 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 15 Aug 2022 16:53:32 +0200
Date: Mon, 15 Aug 2022 16:53:32 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220815145332.GC2854108@scaer>
References: <YlBzP4J4FGA4Z7nL@arch-zen.localdomain>
 <733d97a0-7ee5-d788-6cba-ccac757befdb@benettiengineering.com>
 <Yvi+0zOx0hn0ydhB@arch-zen.localdomain>
 <91f0cd4b-a3dd-14db-d490-968b4b31339a@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <91f0cd4b-a3dd-14db-d490-968b4b31339a@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660575217;
 bh=V4OGsB/IaGh9b5hvRnDsFMnGtcvxaJl9sHfijvSLt/A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OIfqwQKSL3cX1yZ9d4t7da71hQzv0AMXHLmEo0Zad+nvrq97RAHnMvcNXJoIXHKGJ
 i4di4dwjN3JRhqcoc6ycPEJKuJGQcpsvL3TACWglTu01XKBptu8wIBN7kmuglaUteW
 plf4CoC9VPI1SX52wuJ5M5eCnOfa7V7uec9cPgTsAxtJQfgbGjEYD6pc9ycSr7pZLq
 quX88yOdenez1i3F3tGmrVv1kEozukgDzmnpwfDLAyfzmJ57c6sWMk4KfSHPjPpmVX
 tQOjoXSw/docbeAOuqasxgImZ4nUQDiREdaUFJLWp/7rP0cGAftO0oPDygdBksSVn3
 hZiduel7LCVEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OIfqwQKS
Subject: Re: [Buildroot] [PATCH 1/1] board/pine64/pinecube: new board
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, Jan Havran <havran.jan@email.cz>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, Jan, All,

On 2022-08-14 13:56 +0200, Giulio Benetti spake thusly:
> On 14/08/22 11:22, Jan Havran wrote:
> >>>+++ b/configs/pinecube_defconfig
> >>>+BR2_ARM_FPU_NEON_VFPV4=y
> >>This ^^^ should be removed since NEON doesn't support complete FPU
> >>standard API, so it's better to keep the default for BR2_cortex_a7
> >I will fix everything and post V2, but one thing I do not understand much is
> >this one.
> Here there is a very good explanation on why not adding by default
> BR2_ARM_FPU_NEON_VFPV4:
> https://lists.buildroot.org/pipermail/buildroot/2022-January/634728.html

I even tink that, ultimately, we should just remove FPU options that
also enable NEON, like BR2_ARM_FPU_NEON_VFPV4, because they do not make
sense.

Using NEON for floating-point arithmetics should probably left to a
per-pacakge setting, where and when t makes sense for that package (e.g.
math-intensive packages that can cope with incorrect results (like
real-time audio stuff that favour an occasional glitch rather than a
packet loss).

[--SNIP--]
> But yes, if VFPV4 is supported then yes, it makes sense to enable it
> instead of keeping the default. So since this board is S3 based and
> it supports VFPV4 then you can enable:
> BR2_ARM_FPU_VFPV4
> 
> and same can go with H3 based boards I think.
> 
> @Yann, what do you think about enabling VFPV4 on boards with SoCs
> that support VFPV4? (not NEON/VFPV4 of course)

Usually, defconfigs are very limited, and what we guarantee is very
basic: a booting kernel with basic drivers, and busybox' login and
shell. That does not use much floating-point instructions, so that would
not benefit much from using a "better" FPU.

I previously rejected the big series that bulk-converted all defconfigs
in one go, because that was not tested on real hardware.

But for a defconfig that was actually tested against real hardware, I
think it is OK that it uses a "better" FPU. So, if the pinecube has a
VFPv4, BR2_ARM_FPU_VFPV4 or BR2_ARM_FPU_VFPV4_D16 is OK.

Also nte that BR2_ARM_FPU_VFPV4 will make use of all the 32 flaoting
point registers, i.e. the full range, while BR2_ARM_FPU_VFPV4_D16 will
only make use of 16 registers. Not all VFPv4 implementation have 32
registers, so carefully enable the appropriate one (_D16 is safe to use
in either case, though).

Regards,
Yann E. MORIN.

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
