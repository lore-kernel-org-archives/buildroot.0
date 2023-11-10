Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1DBC4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 07:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19DF440424;
	Fri, 10 Nov 2023 07:17:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19DF440424
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 77-KMCyKsW4Y; Fri, 10 Nov 2023 07:17:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0DDB409BD;
	Fri, 10 Nov 2023 07:17:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0DDB409BD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 276451BF2BC
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 07:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F393A4201F
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 07:17:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F393A4201F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8wn-PIpULZWC for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 07:17:22 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A1F694208C
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 07:17:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1F694208C
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:bf98:93a4:26f0:a873])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id AE65613F81D;
 Fri, 10 Nov 2023 08:17:17 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 10 Nov 2023 08:17:17 +0100
Date: Fri, 10 Nov 2023 08:17:17 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Message-ID: <20231110071717.GH996011@scaer>
References: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
 <20231026092701.12345-29-adam.duskett@amarulasolutions.com>
 <b54a0c07-e87d-4a8c-8c6c-1a2302e18ddf@othermo.de>
 <20231109215509.GG996011@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231109215509.GG996011@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1699600639;
 bh=p3Czi2VMRV1rC4+8OOiRFn32scJxVGNLdP8NVKMoxgM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CEk7C7+UsqB74yx8wYSNWjBj9sInXxmmVxgTJP4qp16nEGiqH3/Nf4PSGtXAoqscG
 i1coeKS9TIwzUh8k0qYkUglAyHNV10h5Kx0WVopp3W7BoF9we39qMou+w7fCZZS+zT
 EzzvLFvzdk+RGIyyzsvDhz1nWe1BEULvHy/FQaAxvA1+s4CFng8X5qHZklLqO3E82K
 7yNVd81g52fVLBPfN2b9GZ6UvcCofhcMv/EMNBYtnwdT4eOTsLGhtrI5bSQyhiIy9A
 gEJMR6GV6jrwe/6ueRqffgdYSN/DOeWnWH5ScB7f6BsLcm0hY5Z98wRnlorSmhS4iR
 QtXYhxCGdC8fQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CEk7C7+U
Subject: Re: [Buildroot] [PATCH 28/30] package/python-pygame: drop package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Marcus, All,

On 2023-11-09 22:55 +0100, Yann E. MORIN spake thusly:
> On 2023-10-26 16:13 +0200, Marcus Hoffmann via buildroot spake thusly:
> > On 26.10.23 11:26, Adam Duskett wrote:
> > >As python 3.12.0 no longer supports distutils, drop the package as the package
> > >is clearly unmaintained.
> > I'd like to update the package to a recent version of pygame instead.
> > Updating the package should be fairly straightforward (famous last
> > words...) but I've struggled to find a platform (real hardware or
> > virtualized) where I can actually test this with actual graphical
> > output. :-/
> You just got an extension deadline to update this package, as I
> committed a patch from James to switch to setuptools:
>     e759e927b344  package/python-pygame: switch from distutils to setuptools

Adam reports that even with the conversion to setuptools, python-pygame
still does not build.

So, if this package is really helpfull to you, please see if you can
update it before it gets ripped away, as I've marked the patch back to
"new" in patchwork, i.e. pending (not rejected).

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
