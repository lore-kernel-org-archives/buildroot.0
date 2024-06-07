Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 244A9C27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 19:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE48A40AFC;
	Fri,  7 Jun 2024 19:19:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zEDqH0KHXHMC; Fri,  7 Jun 2024 19:19:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7EC6640B32
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7EC6640B32;
	Fri,  7 Jun 2024 19:19:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E9DE1BF95D
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 19:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2782B608D8
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 19:19:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xpt7vDkT8OMm for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 19:19:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EC6916083D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC6916083D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC6916083D
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 19:19:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9BCD913F81D;
 Fri,  7 Jun 2024 21:19:10 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 07 Jun 2024 21:19:10 +0200
Date: Fri, 7 Jun 2024 21:19:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bryan Brattlof <bb@ti.com>
Message-ID: <ZmNdLpmIeiA83M9B@landeda>
References: <20240607093712.2880785-1-yann.morin.1998@free.fr>
 <20240607172617.s42p343dw4ijgck4@bryanbrattlof.com>
 <ZmNNKV_vaTkG0JpW@landeda>
 <20240607190634.salcy2c3jnpjzs57@bryanbrattlof.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240607190634.salcy2c3jnpjzs57@bryanbrattlof.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717787954;
 bh=WShZ4P+Q/zuntWc3mOQiUG6WUWCyAysD4P2VChdkzp0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oTBwXqlGMwjr/MtEugpNpdvl8aiokZi1ET7/FTWsh2lXXxzqjMmoWmb4occc42353
 kaXPt+iI08r+IT1lBhuJX9Z7E6m3j+zV9Jr7EdMczovN4oevdpCdklqG+eJ04+ucqi
 keqbGBHkqdYgd573+GGPc4RTTWDQ0Q/zI89DOm//gNr3Zv8m0cgjE0VU0ykgJ0k/5E
 9HLWjRak4MlYr6lbOKEIBAMDguuB8axXIlbw9RSL/68p64tpO5+B0ULSNvTbyReCv5
 UezsMf7zFG0/p2QtHXGsNF5QOzKi8c7JMsGamKFUWgdJIWmj2Ewdmi/+vHzIC+izFw
 7U5BmlxT5h++Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oTBwXqlG
Subject: Re: [Buildroot] [PATCH] boot/ti-k3-r5-loader: share download files
 with uboot
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
Cc: Xuanhao Shi <X15000177@gmail.com>, Paresh Bhagat <p-bhagat@ti.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bryan, All,

On 2024-06-07 14:06 -0500, Bryan Brattlof spake thusly:
> On June  7, 2024 thus sayeth Yann E. MORIN:
> > Of course, now I notice that the two defconfigs use the same versions
> > for uboot and ti-k3-r5-loader. Which got me thinking that maybe we
> > should make that explicit (and easier!) in the menuconfig:
[--SNIP--]
> > And then with a bit of sorcey/trickery in ti-k3-r5-loader (like we have
> > in package/linux-headers for example) to handle the same-as case.
> Ah Ok! Ideally they should never be different as it can only lead to 
> hard to debug issues between the jump from tiboot3.bin to tispl.bin with 
> vague error messages or no message at all. It's unfortunate that we even 
> have the ability to select a version which can be different from uboot/
> 
> IMHO the K3 boot is complicated enough even without the ability to have 
> different U-Boot version thrown into the mix. :) 

Oh, so would it make sense to completely drop that big choice, and just
always use the same version as uboot, always?

But nowadays, it is possible to enable ti-k3-r5-loader even when uboot
is not enabled. Does that even make sense, or should we tie
ti-k3-r5-loader to depend on uboot?

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
