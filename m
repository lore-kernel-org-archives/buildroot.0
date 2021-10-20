Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40ACBC433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 19:48:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD8AB6128E
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 19:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD8AB6128E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7795C83B6B;
	Wed, 20 Oct 2021 19:48:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EFp3NGDDweoZ; Wed, 20 Oct 2021 19:48:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B83B083B5E;
	Wed, 20 Oct 2021 19:48:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7CAA91BF3F3
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 19:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6502A405AC
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 19:48:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0E1FgyQ0hsxG for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 19:48:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 01938404A5
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 19:47:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a893:adcc:f501:21b0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 9F436780310;
 Wed, 20 Oct 2021 21:47:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634759277;
 bh=fAbIJ1E/g52H17RNGMMO75Heedcr6HUdGowPWUnGtsw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fq2W72TBrR+Rh9hJmTgo3OY0XCo2mtDuSYyjjInxt1fFuCkVpDgXS8UKpuYQdNywF
 QJ4UWFoDTJUHCGJIx8hQk1evkbMQYxXhaWhozVBPTd++aZLswcJPScTrgQe+hzqeW7
 tkeTpBMijpHHPg2n+H2x6TcfVxC8EvbJsfJDsHLG6MUG+RhG+EYUpTiHP90gV8Z3Lm
 ArVB+XImDusUp14XoETS4lXKkA7+/V5kl1dVAVElVmTRqegTKGxcF6g0yAnqtpRvpr
 SXm3q2Qvr42/J3/hbR3mafKdahSp8W4Th932MmvsxAip1oCXv6UqZgkjX/42jMFN27
 aQKO1KJo7KHYg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 20 Oct 2021 21:47:46 +0200
Date: Wed, 20 Oct 2021 21:47:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20211020194746.GC2400@scaer>
References: <20210921202137.7092-1-ps.report@gmx.net>
 <20210921202137.7092-2-ps.report@gmx.net>
 <20211017202717.GR2400@scaer> <20211017225422.2e0348ce@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211017225422.2e0348ce@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v5 2/6] board/raspberrypicm4io: enable RTC
 and USB overlays
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
Cc: buildroot@buildroot.org, Martin Bark <martin@barkynet.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Arthur Courtel <arthur.courtel@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2021-10-17 22:54 +0200, Peter Seiderer spake thusly:
> On Sun, 17 Oct 2021 22:27:17 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > On 2021-09-21 22:21 +0200, Peter Seiderer spake thusly:
> > > - add RTC and USB dtoverlay entries to config_cm4io.txt
> > Why specifically the RTC and USB? And why only on the CM, and not the
> > other boards?
> The config is not for the CM4 standalone, but specific to the
> CM4 IO Board, equipped (as the only RPi original one) with an
> RTC chip....

Ah, OK, that makes sense, then.

> > IIRC, dwc2 is an OTG chip, too, and it is also wired on the rpi0. Well,
> > by experience, I know that the rpi0 *can* do USB slave/OTG.
> And as far as I know the USB is enabled with all RPi's with
> exception of the CM4: 'The  USB  interface  is  disabled  to  save  power  by
> default  on  the  CM4' (see [1] page 5)
> 
> According to [2]:
> 
> 	Name:   dwc-otg
> 	Info:   Selects the dwc_otg USB controller driver which has fiq support. This
> 	        is the default on all except the Pi Zero which defaults to dwc2.
> 	Load:   dtoverlay=dwc-otg
> 	Params: <None>
> 
> 
> 	Name:   dwc2
> 	Info:   Selects the dwc2 USB controller driver
> 	Load:   dtoverlay=dwc2,<param>=<val>
> 	Params: dr_mode                 Dual role mode: "host", "peripheral" or "otg"
> 
> 	        g-rx-fifo-size          Size of rx fifo size in gadget mode
> 
> 	        g-np-tx-fifo-size       Size of non-periodic tx fifo size in gadget
> 	                                mode


> Would interpret 'defaults to dwc2' on Pi Zero as enabled by default...

Yes, it is enabled by default, as a host-only controller, not OTG, which
has to be explictly requested.

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
