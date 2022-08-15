Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB87C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 19:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5AB6401B2;
	Mon, 15 Aug 2022 19:05:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5AB6401B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WhSSoXBFEPUS; Mon, 15 Aug 2022 19:05:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D82864018E;
	Mon, 15 Aug 2022 19:05:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D82864018E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E10081BF30B
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 19:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC602813D7
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 19:05:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC602813D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id leqiEV3l3I-T for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 19:05:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92868813CF
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 92868813CF
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 19:05:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c91d:14e3:a117:34c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 6CBF56012D;
 Mon, 15 Aug 2022 21:05:06 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 15 Aug 2022 21:05:06 +0200
Date: Mon, 15 Aug 2022 21:05:06 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220815190506.GI2854108@scaer>
References: <20220815154854.17628-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220815154854.17628-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660590310;
 bh=gEvikXnYsEDPy9DloX36VTTzVTI+XHerA6BvHe+LHtY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fiWznq5lRlaKo9mU1jIb03i2juEeIbJpTfcAt+XyQlvAcxcB9A9iaGZ88Rlu9QB6s
 /N+oT2gHw10bPzcAjnS6htp+5ZOHlZZegHqkFtfHi7Df8835g5UBWkG1XZzbiAgWpk
 +YOtEXfOCq1sjwzQjiiQjms3x3mhWWEse6OnjVgVAiR8wq1cT/RmQ87lNn8QtrYMgK
 b0LoQpf3+10I8n7uDqjJXPMUt4h7+BDta9Sfq0b/K73EVd7t0/7Sr0WXSYE3ehSk1C
 rsulC7s38RHCFqVNx3xZfFd/rpUxc96qF4Cm5HTYCmPZL1IsI9CstJTtEfhZfAfCCo
 ilEO9rJgrcx3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fiWznq5l
Subject: Re: [Buildroot] [PATCH 0/4] Revert wrong NEON/VFPV4 FPU strategy
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2022-08-15 17:48 +0200, Giulio Benetti spake thusly:
> FPU strategy set to NEON+VFPV4 must be avoided by default.
> Here[1] is a good explanation of the reason I report on
> every commit log.
> 
> [1]: https://lists.buildroot.org/pipermail/buildroot/2022-January/634728.html
> 
> Giulio Benetti (4):
>   Revert "configs/olimex_a33_olinuxino: use NEON+VFPv4 as FPU strategy"
>   Revert "configs/olimex_a20_olinuxino_lime2: use NEON+VFPv4 as FPU
>     strategy"
>   Revert "configs/olimex_a20_olinuxino_lime: use NEON+VFPv4 as FPU
>     strategy"
>   Revert "configs/bananapi_m1: use NEON+VFPv4 as FPU strategy"

All four patches applied to master, thanks.

Regards,
Yann E. MORIN.

>  configs/bananapi_m1_defconfig                | 1 -
>  configs/olimex_a20_olinuxino_lime2_defconfig | 1 -
>  configs/olimex_a20_olinuxino_lime_defconfig  | 1 -
>  configs/olimex_a33_olinuxino_defconfig       | 1 -
>  4 files changed, 4 deletions(-)
> 
> -- 
> 2.34.1
> 
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
