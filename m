Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329AFC4332F
	for <buildroot@archiver.kernel.org>; Sat, 12 Nov 2022 13:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC17D40445;
	Sat, 12 Nov 2022 13:38:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC17D40445
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tsa0Kvz2yKD1; Sat, 12 Nov 2022 13:38:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0B2D40383;
	Sat, 12 Nov 2022 13:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0B2D40383
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 877FF1BF5B4
 for <buildroot@lists.busybox.net>; Sat, 12 Nov 2022 13:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62DB96060A
 for <buildroot@lists.busybox.net>; Sat, 12 Nov 2022 13:38:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62DB96060A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jl7apWg1zuxI for <buildroot@lists.busybox.net>;
 Sat, 12 Nov 2022 13:38:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36B1C6058B
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 36B1C6058B
 for <buildroot@buildroot.org>; Sat, 12 Nov 2022 13:38:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:12bc:32e:ad2a:4f42])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 0C80919F58C;
 Sat, 12 Nov 2022 14:38:29 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 12 Nov 2022 14:38:29 +0100
Date: Sat, 12 Nov 2022 14:38:29 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thierry Bultel <thierry.bultel@linatsea.fr>,
 Adam Duskett <aduskett@gmail.com>
Message-ID: <20221112133829.GC2123054@scaer>
References: <20221111215321.7cfdbc46@windsurf> <20221112090731.GA2123054@scaer>
 <20221112101546.GB2123054@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221112101546.GB2123054@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1668260314;
 bh=dyGCSvHd4Obac7zz3wKcqyFyohVsGTcEW5se1wweTFw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qjSQh3k1t7dykQsukiNxLQohd32vKerdoHeZo02FqGMdsiyo5EGVQEx+SeBCofbl+
 RYjah1i2WNMJqSK00X13K5n7tTRVRasRkbL999Rtk6APNLYGrzKbWwThTWsXa1jV8d
 YRkmcY+9pBpgHC8NmkgIaLsn1eREJHbni+LXUlKUxDFdJsBPN+m7mI8z9FyP6h1VBm
 K5gGlquplSZjlrmu+WYr3/1pqui3qMCA1ZQaCOGX2UqiTvhUuuigI2AtgfQpvUYC0t
 ndRh2tRkr4soKgW5tSj3YnVVi1n9YHOCJcw9qlyrstvvwNei3BpOYa89MaEsMdoBP1
 7pCgzh6orAzOA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qjSQh3k1
Subject: Re: [Buildroot] Remaining issue with Dracut runtime tests
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-11-12 11:15 +0100, Yann E. MORIN spake thusly:
> On 2022-11-12 10:07 +0100, Yann E. MORIN spake thusly:
> > On 2022-11-11 21:53 +0100, Thomas Petazzoni spake thusly:
> > > Even after your recent Dracut runtime tests fixes there is still one issue:
> > >   https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261241
> > >   https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261239
> > >   https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261236
> > > Could you have a look?

There, there:
    https://patchwork.ozlabs.org/project/buildroot/patch/20221112133707.1674986-1-yann.morin.1998@free.fr/

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
