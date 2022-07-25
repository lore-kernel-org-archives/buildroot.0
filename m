Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75243CCA473
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 12:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F40EE408B2;
	Mon, 25 Jul 2022 12:46:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F40EE408B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yci4E-4CgL0U; Mon, 25 Jul 2022 12:46:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F4824064C;
	Mon, 25 Jul 2022 12:46:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F4824064C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 279D41BF215
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 12:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00A34404C9
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 12:46:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00A34404C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qt-ja-_4Ir2S for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 12:46:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B2A4404C2
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B2A4404C2
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 12:46:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9102:8e95:18fd:a25a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 581C119F72D;
 Mon, 25 Jul 2022 14:46:20 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 25 Jul 2022 14:46:19 +0200
Date: Mon, 25 Jul 2022 14:46:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Vincent Fazio <vfazio@xes-inc.com>
Message-ID: <20220725124619.GD3168@scaer>
References: <20220620170940.513445-1-vfazio@xes-inc.com>
 <20220620190115.541032-1-vfazio@xes-inc.com>
 <20220620190115.541032-2-vfazio@xes-inc.com>
 <5659f28f-11ce-b6f1-3b60-b694150aed2f@mind.be>
 <PH1P110MB16031BEB9E963C09FFE461E19F959@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PH1P110MB16031BEB9E963C09FFE461E19F959@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658753184;
 bh=h+MyCnz8zok3bWcVN8+kUg9wSY03d12NHWH9dF2TvIk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R6lN77SzaHvmFOjsg0ONBNI2BHOMMVLspXYk3MKJyotcBVacYC5iZmNqINmYj2uRC
 1Cd0P15wW/iFkAdSOCk+xRnDP4rSnytVah/CDAXue9q7xQt1s1iNyGOr9xbBmDqLhY
 xAw+V2/n+CPzLy3P1umsmUYIgN/5OVA+SJC/agIZLMD8u+GuNW6HHQ2zqdGtHHF6Ka
 KVeZYI0hzlhJBxwqdisvJ+TtWvT+D6yHPSRS1mT5Fkt72cFX0P0TUIALgmMKV5/NPy
 978z2P9qPu9v5IAdJ1NMXsqWlPScP8kISai12OAjABjT+Y8fpRNLhAjCU+baAs6M2r
 JyjlLqCJBYytw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=R6lN77Sz
Subject: Re: [Buildroot] [External] - Re: [PATCH 2/2] package/nvidia-driver:
 bump version to 390.151
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
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Vincent, All,

On 2022-07-25 12:31 +0000, Vincent Fazio spake thusly:
> > From: Arnout Vandecappelle <arnout@mind.be>
> >   I wanted to apply this, but the hash doesn't match... Could you investigate?
> This is a bit concerning because it's the second time this has happened. Thomas had a similar problem when I tried to bump to 390.144
> http://patchwork.ozlabs.org/project/buildroot/patch/20211104141910.1840914-1-vfazio@xes-inc.com/#2813798
> 
> Linux:
> vfazio@vfazio2 ~ $ sha256sum NVIDIA-Linux-x86_64-390.151.run
> 5226e4842044cffd9096deadaf68934c133da74e05b80ccd21236584b3afb1fc  NVIDIA-Linux-x86_64-390.151.run
> 
> vfazio@vfazio2 ~ $ sha256sum ~/Downloads/NVIDIA-Linux-x86_64-390.151-no-compat32.run
> 6e4fd2258465f5d5527fe80abd46de925a30348b4a84658498a6d75caf42c47c  /home/vfazio/Downloads/NVIDIA-Linux-x86_64-390.151-no-compat32.run
> 
> Can you double check the hashes when directly fetching the files?
> https://download.nvidia.com/XFree86/Linux-x86_64/390.151/

I just did, and got:

5226e4842044cffd9096deadaf68934c133da74e05b80ccd21236584b3afb1fc  NVIDIA-Linux-x86_64-390.151.run
6e4fd2258465f5d5527fe80abd46de925a30348b4a84658498a6d75caf42c47c  NVIDIA-Linux-x86_64-390.151-no-compat32.run

... which is what Vincent provided.

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
