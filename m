Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCEA2E7D0AF
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 22:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 681F341184;
	Thu, 21 Sep 2023 22:05:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 681F341184
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hMV3olSR2y6T; Thu, 21 Sep 2023 22:05:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACD29403FF;
	Thu, 21 Sep 2023 22:05:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACD29403FF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 87D7B1BF37F
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 22:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60F99403FF
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 22:05:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60F99403FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IOtZkNnToztu for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 22:05:47 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 149CB400FB
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 22:05:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 149CB400FB
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:e186:59f:97d4:33d1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id C881419F593;
 Fri, 22 Sep 2023 00:05:37 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 22 Sep 2023 00:05:37 +0200
Date: Fri, 22 Sep 2023 00:05:37 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20230921220537.GO512384@scaer>
References: <20230822195726.0f691945@windsurf>
 <4EEF27B4-2C4A-427E-91A3-EBA5A63A1AFB@gmail.com>
 <0aa203a3-721e-c564-2c20-68baf6572d9b@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0aa203a3-721e-c564-2c20-68baf6572d9b@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695333944;
 bh=pG2w1RI3RlpmF4H8Z0/i3w60t2CeuBDuprn4lN2D0Fo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e1OrllYiI/S+QjbOkYvR28X8Lxr6DFuLP2lJMG+TtavtXP3Z2ow2xXGnFjIxytmib
 aEEzTS0VeNXazQNeO82AlGR6xbGxaQzXA3W/ZLeSptUPCX+Ml4fum8sk/004/0hyRP
 Xd52zn97XN1ChGe7glvU/JZD1rB3Fd/RojGRszZ5UE3pkh4vXGxttGNBUw7f/8kpRa
 NCviV5uCdy4tpz6xGjX25dFq9a2Mvv9WT9Dovj/X72oIcveAgznxQ5vlHEYlsIlNoE
 xBhjGNQ5uwizyJeuoyY+9OOj1ETW+wPt/zKVDX7/xmAULzAG3LLYvlRnZp+A/6xLqY
 zqXW/cVZ4OMpA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=e1OrllYi
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pykwalify: add required
 package for zephyr cmake
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
Cc: Charles Hardin <ckhardin@gmail.com>,
 "Alvaro G . M" <alvaro.gamez@hazent.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, Charles, All,

On 2023-09-21 22:03 +0200, Arnout Vandecappelle via buildroot spake thusly:
> On 22/08/2023 20:02, Charles Hardin wrote:
> >>On Aug 22, 2023, at 10:57 AM, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> >>>On Mon, 21 Aug 2023 16:45:23 -0700
> >>>Charles Hardin <ckhardin@gmail.com> wrote:
> >>>So, we have various RTOS MCUs that are hooked up into linux controllers,
> >>>and this is just a simple hook so that the same SDK can be handled to build
> >>>both firmware for something like an STM32 and a Raspberry-pi
> >>If I rephrase this: you want to use Buildroot to build the Zephyr
> >>firmware for your STM32 micro-controller, alongside with the Linux
> >>system running on the RaspberryPi?
> >Yes, and we are doing this today with these patches.
>  Honestly, I don't know if we want to go in this direction. If Zephyr
> doesn't give you the possibility to do "from scratch" builds, then in this
> day and age it's more appropriate to create a container image for your build
> environment IMHO. There's something to be said for including host packages
> that are likely to be used in post-build/post-image scripts, but for
> building a completely different OS, that is going a little far IMHO.

I concur.

I believe in this case that external projects are better suited to
handle the nitty-gritty details of running those buildsystems, even if,
as Arnout suggests, that is wrapped in a docker image. With proper
CI/CD, it is easy to construct pipelines that build those "other OS"
stuff, export their artefacts for followup Buildroot-based jobs that
integrate those artefacts (either as wrapping package that jsut instlla
binary blob) or as rootfs overlays, or from post-build scripts.

I have marked the series as rejected in patchwork.

>  Specifically for Python packages, I also think it's much more appropriate
> to use poetry to control them for the host. That way we just have to provide
> host-python-poetry, and the post-build/post-image scripts can take care of
> installing all the needed python tools at the exact version you need,
> controlled by a lock file.
> 
>  In my opinion, even including those arm-none-eabi etc. compilers in
> Buildroot was going a bit too far already. But I guess that that ship has
> sailed :-)

I also heartily agree.

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
