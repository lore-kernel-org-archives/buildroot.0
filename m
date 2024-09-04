Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC7CCD4F30
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 20:58:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 938508120B;
	Wed,  4 Sep 2024 20:58:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n2k1-xFf7taS; Wed,  4 Sep 2024 20:58:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC5F58120D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC5F58120D;
	Wed,  4 Sep 2024 20:58:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9C9431BF267
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 20:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A2A0600D1
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 20:58:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2dgH1fZs_y8A for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 20:58:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 65042600C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65042600C7
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 65042600C7
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 20:58:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0F32513F8B9;
 Wed,  4 Sep 2024 22:58:13 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 04 Sep 2024 22:58:12 +0200
Date: Wed, 4 Sep 2024 22:58:12 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <ZtjJ5PiY4fKcbl9m@landeda>
References: <20240904100748.3623308-1-yann.morin.1998@free.fr>
 <b37f65c3-93c5-47ea-b7e6-bb542aa208e0@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b37f65c3-93c5-47ea-b7e6-bb542aa208e0@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725483496;
 bh=jH7BklA6xhKno1F74bvUgu99fIqJlU61kUD/pVaFNu8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c86E9piUYYRpx12WEgeWK75G77Wk9reguQCooPEhEx9/f2ya7z/JxVyfmqFC0TI8i
 mscV6+1dHpuBNTFMpziTPoTjpmtcu6S8H1A50ushPOzFH8vwdMFWzeUgH3bk4hRdDS
 8tAH1geRHtuUvH5Y8QntmDOywdssFXGi29usLcHMC1THfVPZmUNevMZUXhgB+Fpd98
 cikyNqNoCfCH4xPE5Dcu8Gylr/LTbFUXC65CyyhHvMGJkKztcTVaDCcutvX8oUrwIA
 3OPV6KgydUE2pLfJ4bJhoICBQ2S887XjF2/caLcWTyWj/TJSx2aQyMDXVgTRP9G4UT
 Xlsizd9/Tv/+g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=c86E9piU
Subject: Re: [Buildroot] [PATCH v2] docs/manual: use space-separated list
 for BR2_EXTERNAL
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
Cc: Brandon Maier <Brandon.Maier@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fiona, All,

On 2024-09-04 19:59 +0200, Fiona Klute via buildroot spake thusly:
> Am 04.09.24 um 12:07 schrieb Yann E. MORIN:
[--SNIP--]
> > Change the documentation to only mention using a space-separated list.
> > Of course, for backward compatibility, we keep the code as-is to accept
> > a colon-separated list, but we just do not advertise it.
> I think it might make sense to add a comment that explains this in
> support/scripts/br2-external where the colon substitution happens,

Good idea, I've done so in v3 that I just sent. Thanks for the review!

> to
> avoid confusing people who don't know the history.

"git log" will give you the history! ;-)

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
