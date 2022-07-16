Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DCDC43334
	for <buildroot@archiver.kernel.org>; Sat, 16 Jul 2022 15:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 496A3404C7;
	Sat, 16 Jul 2022 15:44:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 496A3404C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rgSy6AhKTWgH; Sat, 16 Jul 2022 15:44:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53838400FB;
	Sat, 16 Jul 2022 15:44:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53838400FB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0367D1BF4DA
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 15:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D186E60C07
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 15:44:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D186E60C07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7am0FFvX2vH5 for <buildroot@lists.busybox.net>;
 Sat, 16 Jul 2022 15:44:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 013D860BE8
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 013D860BE8
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 15:44:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b44d:f503:4d93:3115])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id CC2C6B00729;
 Sat, 16 Jul 2022 17:44:09 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Jul 2022 17:44:09 +0200
Date: Sat, 16 Jul 2022 17:44:09 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20220716154409.GK2543@scaer>
References: <20220629121204.2347138-1-james.hilliard1@gmail.com>
 <8735fj62s5.fsf@dell.be.48ers.dk> <20220716154039.GI2543@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220716154039.GI2543@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1657986255;
 bh=IziDtZCBaBC8ZdkcPWondSAEzKqjzmQWJEbqsWWfrMU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YZl4gF2EeADU8ulPDgTqsZ9/WYwUh0h4vzkcFv4/CpLRxzYR85gVaxheGKyiNT2nn
 VtqNF85QLEPkLk6G9Wp+w/Um11d01IpA3QzC2g3uzLWQUpUYmoqASepLx8yBckc/xG
 d5wIb+Yoxb8KVcI2ZqaYm1LWUCDwcmmJ7KIaC2gUojRlap86Big4RgvkpdsdTMEagS
 8T36sWr2Qt7qDrrDm+tZrg4OIFfs4kSXn7QX3HwByk9G8dKlO8yCnYy9EZ4tciQntS
 GmB8MtMHcUCOOClELvjk+5OrLZOoymrHGY3VzExMjRV11lY70N1Th5mSSx7aKOSFtk
 r+EoqD1LCvYoQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YZl4gF2E
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pillow: bump to version
 9.1.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2022-07-16 17:40 +0200, Yann E. MORIN spake thusly:
> Peyter, All,

s/y//; # sorry...

> On 2022-07-02 15:51 +0200, Peter Korsgaard spake thusly:
> > >>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:
> >  > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > Committed, thanks.
> There was a previous patch from Fabrice [0[, which identifies this as a
> security fix, so you may want to schedule it for backport to relevant
> branches...

[0[ https://patchwork.ozlabs.org/project/buildroot/patch/20220613211419.296864-1-fontaine.fabrice@gmail.com/

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
