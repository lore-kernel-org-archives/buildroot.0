Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7D5C43458
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 16:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 478DE60629;
	Sun,  5 Jul 2026 16:24:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zUj5VAzkDZxI; Sun,  5 Jul 2026 16:24:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 685D660703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783268670;
	bh=cRstxJypgPM+LhI3Xppsd5Um6LgbPMOj/bFac4MnV9o=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RuFkIc9qkTVFYvFG4xhgO3CET/bjfDx8Fk+AgpQSdgBU8NHFxb5DUNqb+rVqjIwIE
	 k/9juP0AohH+jrAN1MAnC1gw7Ddi96FfBmtbboaG2LBIwKK8/XKkcEDbIl28JGw2iQ
	 LULBueE4rRpFOVZPTqJnLjEIY/Iq1wBGn7AkBh+R/UeS/IjmFaLslzFXcC6PqaUtm2
	 p2D+44tKKoF3D6sfVYzYiy0zONdNlOjhrdd69K1AM0UamwNEuNIYvC09ebQqzOK6Xo
	 fqPd1cDFJForjQfW/ITFbrQK15xUlCmYYIIoe8Ko119uLPPfNb831wsinqLg/ZrftE
	 6MapaN8gthxKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 685D660703;
	Sun,  5 Jul 2026 16:24:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 88FC52A8
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 16:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6729B80E77
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 16:24:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id czN3obPK565u for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 16:24:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 651B780E75
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 651B780E75
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 651B780E75
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 16:24:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 217B3780509;
 Sun,  5 Jul 2026 18:24:20 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 05 Jul 2026 18:24:20 +0200
MIME-Version: 1.0
Date: Sun, 05 Jul 2026 18:24:20 +0200
To: Sofiane HAMAM <sofiane.hamam@smile.fr>
Cc: buildroot@buildroot.org, Gary Bisson <bisson.gary@gmail.com>, Refik
 Tuzakli <tuzakli.refik@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20260705160851.817019-1-sofiane.hamam@smile.fr>
References: <20260705160851.817019-1-sofiane.hamam@smile.fr>
User-Agent: Webmail Free/1.6.16
Message-ID: <c2b38f84845c057f48715f66fd035010@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783268665;
 bh=P11wJ2gvMXqDwQowH8ufLAaU1u8QL30olD9vZLSObyM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lrDS0b30kmfY712/gSRc7Ksm9saqPMc7HcJweC4oCKC3EoCd8vZIP5LYe9lbghbm/
 V6Y67amxb2MR1y+X+AS7gH7B+x1qkwtFvn2JCnGbEvsaTdpDye6IjjrAjUuNYxXXLq
 CrYNslHgzIvPETnDgpopja2W1/C9B7XD4dz0FrQTZevtDporuE0IVGmWImwVT/J+Lq
 hSKDOpDEVZY0PebtcRL2ULo2/SJpAe1OyoI+kJIBy2pev3WUZ4uX7cXmzGStRZPEjv
 uGA42uLmUa508PvmosmtIx9+kWFSbjONyeFHnGJD1YAJwnbmOzg+GHYrh1oobykZiy
 ekC/gYr3bTguA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lrDS0b30
Subject: Re: [Buildroot] [PATCH 1/1] configs/freescale_imx95frdm_defconfig:
 add support for freescale FRDM i.MX95 board
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Sofiane,

Thanks for the patch.

On 05/07/2026 18:08, Sofiane HAMAM via buildroot wrote:
> Add board support for FRDM i.MX 95 Development Board.

There was already a patch series for that board proposed at:
https://patchwork.ozlabs.org/project/buildroot/list/?series=490838

Could you describe in what ways your submission is different?

On my side, I was waiting for the board to be publicly available so I 
can
order one, to test this defconfig. I'm still waiting for my unit.

> https://www.nxp.com/design/design-center/development-boards-and-designs/FRDM-IMX95
> 
> Signed-off-by: Sofiane HAMAM <sofiane.hamam@smile.fr>

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
