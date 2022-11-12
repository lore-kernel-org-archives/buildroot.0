Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D116CC4332F
	for <buildroot@archiver.kernel.org>; Sat, 12 Nov 2022 10:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C78A402FE;
	Sat, 12 Nov 2022 10:16:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C78A402FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wC2PhUPUcGi1; Sat, 12 Nov 2022 10:15:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 434EA4027A;
	Sat, 12 Nov 2022 10:15:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 434EA4027A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 124021BF4D7
 for <buildroot@lists.busybox.net>; Sat, 12 Nov 2022 10:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E603A4027A
 for <buildroot@lists.busybox.net>; Sat, 12 Nov 2022 10:15:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E603A4027A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 76k9mppmPCZi for <buildroot@lists.busybox.net>;
 Sat, 12 Nov 2022 10:15:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1C24401B2
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A1C24401B2
 for <buildroot@buildroot.org>; Sat, 12 Nov 2022 10:15:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:12bc:32e:ad2a:4f42])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 83BDC19F593;
 Sat, 12 Nov 2022 11:15:46 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 12 Nov 2022 11:15:46 +0100
Date: Sat, 12 Nov 2022 11:15:46 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thierry Bultel <thierry.bultel@linatsea.fr>,
 Adam Duskett <aduskett@gmail.com>
Message-ID: <20221112101546.GB2123054@scaer>
References: <20221111215321.7cfdbc46@windsurf> <20221112090731.GA2123054@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221112090731.GA2123054@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1668248150;
 bh=DZCVh6AzBpHaTArZSXn/qyCIsFOTKVIRTLRvVOGERec=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l7JLT/sK5VhZHJuZvOjUiNJWqD9SurcQxhLYr2rI9RaVSDIlm1iKXP0vm7NGze+ee
 Z8FUHe8PMgfZY5kqqFRkbxhwPYT8LxPopyzlk0cdnnwOIdfvgys21LOqBYxTBwztDy
 z+zVdP5z7FiMQ4tL5pGkNpXZ+iFnc63kMvDqUodFRlPtFLEEr++HSzn3lBlxkIBfQH
 DDBdBsyMw1itGFMc3Tp9wyCK838wgSHOW7nvHubPaY2nL7q2my81jTg9UDkInNP4qb
 MO/yO7ev/08lKS+bY1vrv6Bx5+WT14eo30QDx296dexwbr25JXczq4GriMQc1wT+iX
 nN0hVdjEithdQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=l7JLT/sK
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

All,

On 2022-11-12 10:07 +0100, Yann E. MORIN spake thusly:
> On 2022-11-11 21:53 +0100, Thomas Petazzoni spake thusly:
> > Even after your recent Dracut runtime tests fixes there is still one issue:
> >   https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261241
> >   https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261239
> >   https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261236
> > Could you have a look?
> The error occurs because we can't find usr/lib/libz.so in the list of
> files in the cpio archive:
[--SNIP--]
> Final data point: as usual, the tests run OK here: libz is in /usr/lib,
> and /lib is a symlink to /usr/lib, exactly as expected.

I was able to reproduce the issue by running in our reference build
iamge, registry.gitlab.com/buildroot.org/buildroot/base:20220206.1756

This is a good starting point; now, we can investigate further.

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
