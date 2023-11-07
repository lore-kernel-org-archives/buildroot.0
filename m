Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF6AC4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 17:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5C7481FC6;
	Tue,  7 Nov 2023 17:02:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5C7481FC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M9GRDrA83Gps; Tue,  7 Nov 2023 17:02:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15D0381FCF;
	Tue,  7 Nov 2023 17:02:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15D0381FCF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B78001BF370
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 17:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97A1660F14
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 17:02:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97A1660F14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D5y6QWpG_AfC for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 17:02:21 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17F1560F00
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 17:02:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17F1560F00
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:251d:f18c:43f3:5a5b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 084F713F899;
 Tue,  7 Nov 2023 18:02:11 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 07 Nov 2023 18:02:11 +0100
Date: Tue, 7 Nov 2023 18:02:11 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20231107170211.GE229059@scaer>
References: <20231103000650.195673-1-adam.duskett@amarulasolutions.com>
 <20231103000650.195673-2-adam.duskett@amarulasolutions.com>
 <f34d953c-f0c6-449c-b5e3-dc35148ab2b0@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f34d953c-f0c6-449c-b5e3-dc35148ab2b0@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1699376538;
 bh=bgPusR/ty0jIPqTQQq/RgcYGngorPNWsLXPBNjhe06w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iioLq+r14dXtabec7xiSynBB4b5n6IV5n69mMnkMTsfJ22suZkdoobaZuMbnUE7q0
 hd3zsaH4eAE92v1PiT2PgjDneXcXyWsmuMh6fk057ZPaIfOJ2CW88o8bPWUPcV1wst
 Uj4fnO6VDDooCZh+n3Z1WTD9diOqqbmMqDeTq47HY8egVoSbyqqBVOvk2pKxEuGUdj
 P6bnCVwzqRHsuy6W7vxQh/UsdUKLmXFNH1JMBs6m3cuJKa8hOZvPFMNfRMGM1Wk1/a
 oEN3+GgWRfG7/lCUcUtfeW7ymRDN9mShppKP9JUx+MgPwdSs5XpPQWjG/qcqAgvePr
 nZIVXH8WSHqzg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iioLq+r1
Subject: Re: [Buildroot] [PATCH] package/nodejs: bump version to 20.9.0
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

On 2023-11-04 17:26 +0100, Arnout Vandecappelle via buildroot spake thusly:
> On 03/11/2023 01:06, Adam Duskett wrote:
> >- NodeJS now requires GCC 10.1 header. However, as there is no
> >   BR2_TOOLCHAIN_GCC_AT_LEAST_10_1, we round up to BR2_TOOLCHAIN_GCC_AT_LEAST_11.
>  GCC 10.1 is the first GCC release [1] (they start counting at 1, weird
> people). So I think it really should be _AT_LEAST_10.

Adam, will you try and downgrade to _AT_LEAST_10, as Arnout suggested?

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
