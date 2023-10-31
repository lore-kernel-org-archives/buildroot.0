Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1A0C4332F
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 21:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7512F43EA2;
	Tue, 31 Oct 2023 21:27:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7512F43EA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EnNBZWH2jqAq; Tue, 31 Oct 2023 21:27:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 911DC42D4B;
	Tue, 31 Oct 2023 21:27:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 911DC42D4B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EC5E71BF2A6
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 21:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4C0442D4B
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 21:27:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4C0442D4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m40Y5OgTnMbB for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 21:27:48 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05AC342D23
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 21:27:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05AC342D23
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:67d2:c63c:7c2a:c31])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 50B0919F522;
 Tue, 31 Oct 2023 22:27:43 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 31 Oct 2023 22:27:43 +0100
Date: Tue, 31 Oct 2023 22:27:43 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Scott Fan <fancp2007@gmail.com>
Message-ID: <20231031212743.GD2568@scaer>
References: <20231031084936.2397858-1-fancp2007@gmail.com>
 <20231031211442.GC2568@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231031211442.GC2568@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698787666;
 bh=eknFHNrus11FDWwBHYcHfPjjPg8TjK0j2T+Ruo7ql1o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y4lswIdTk4MjinnlguGAapgmgAy/gHHnj8zkl5ZEZ85pk7jih3CCTDx1KzvEHvs9Y
 LWech+JOrN3z4jmwjHi0UAC0h1SWNeG19uuwCJ+XX8aKLD3qnt93d0UPlHaxbrIoM/
 xuz2fwrwmJKpthW4ygscX/BaDLA47a0Ltn3X7MTZZ1msCGRxXnCpBSoaUezVBMSyFt
 Xh9fz4yAfYmLgRSSJyQI6FPS1rwr1+1S0Ol81u4aoPRT8A8ug9rpNnEiAWGDXbC9Ri
 FaZ3UdQbilMdxm/F9pjb7zipFkl5UotN/2UW+6HfqMs2cjK2BU83mQbL6RC/U9fk2r
 s8Vhf80KH9x+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Y4lswIdT
Subject: Re: [Buildroot] [PATCH] configs/friendlyarm_nanopi_neo2_defconfig:
 new board
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

Scott, All,

On 2023-10-31 22:14 +0100, Yann E. MORIN spake thusly:
> On 2023-10-31 16:49 +0800, Scott Fan spake thusly:
> > Add support for the FriendlyARM NanoPi NEO2 with mainline components:
>     $ ./utils-docker-run make check-package

That should have been:  ./utils/docker-run

Sorry for the noise...

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
