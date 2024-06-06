Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98B4C27C55
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 16:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EECFF4241C;
	Thu,  6 Jun 2024 16:15:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ykX0AwgQS5L; Thu,  6 Jun 2024 16:15:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED48C41482
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED48C41482;
	Thu,  6 Jun 2024 16:15:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DCF7D1BF580
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 16:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C92A740B9C
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 16:15:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MCX_I6i8Q4K9 for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 16:15:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 72D4240582
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72D4240582
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 72D4240582
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 16:15:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 39BA613F8B9;
 Thu,  6 Jun 2024 18:15:20 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 06 Jun 2024 18:15:19 +0200
Date: Thu, 6 Jun 2024 18:15:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <ZmHgl--jzVhjn1fA@landeda>
References: <20240603115212.184529-1-neal.frager@amd.com>
 <ZmHU1-EPxRFiHZDl@landeda>
 <CH2PR12MB5004460067BCA2D50F456AE0F0FA2@CH2PR12MB5004.namprd12.prod.outlook.com>
 <CH2PR12MB5004A214F904E1B9AB3BC9EDF0FA2@CH2PR12MB5004.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CH2PR12MB5004A214F904E1B9AB3BC9EDF0FA2@CH2PR12MB5004.namprd12.prod.outlook.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717690527;
 bh=jHNNNpRTPk1djso3itcc+TQerr7YQ4XU/JLNYZfKBo0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YmA33o5OGEo6BqLIdSD8PeTtwdQVMkRoPyVL76yX6cCNAFPGw8PhyuMGXIllweNV1
 AgteV9nF8Mw12YLIn0IVUlC5NsoJBpyci+8yty4sausXRZGJRhEfUa0MD5UpJs/6Nd
 CZtAdyWYg0b1VFWsRVpZ1EV/5Tmc4zHBgeAwli3PnA7SzrRTCxKyRkvPWRhkLcyqIh
 SyvwQqLrM1woy+m7XvEdHYVt5/Xkx8EcZUHOtNH2Rh0sG/6GSn1l2hYJdLFzb6WJQM
 svnk4y4Ue8xL4+wVSSO5s3SFzm5XRpryY54jUP9mdm/UNqeBNNyTqsOOQumHZsEPfI
 hjIP9QggJgMKQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YmA33o5O
Subject: Re: [Buildroot] [PATCH v1 1/3] configs/zynqmp_zcu102_defconfig:
 bump to xilinx-v2024.1
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
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Neal, All,

On 2024-06-06 16:02 +0000, Frager, Neal spake thusly:
> > But the filename is unversioned, which means that we can't differentiate
> > between pmufw.elf from yesterday, the one from today, and the one from
> > tomorrow.
[--SNIP--]
> By the way, is this still allowed?  Perhaps we could use it to skip the hash
> check when the u-boot.mk downloads a pre-built pmufw.elf/bin?
> 
> BR_NO_CHECK_HASH_FOR += $(UBOOT_ZYNQMP_PMUFW)

When FORCE_CHECK_HASHES=y, BR_NO_CHECK_HASH_FOR is not actioned, see
package/pkg-download@115.

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
