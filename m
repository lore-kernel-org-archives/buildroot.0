Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9784DCA0EFA
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 21:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C5D961456;
	Sat, 23 Aug 2025 21:20:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N3_MVQFB_6NJ; Sat, 23 Aug 2025 21:20:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A90F161466
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A90F161466;
	Sat, 23 Aug 2025 21:20:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B87D19C
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 21:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D688413E2
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 21:20:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F_JRwWAuRlJA for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 21:20:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BE70F413E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE70F413E9
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE70F413E9
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 21:20:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 81EBC19F57E;
 Sat, 23 Aug 2025 23:20:10 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 23 Aug 2025 23:20:10 +0200
MIME-Version: 1.0
Date: Sat, 23 Aug 2025 23:20:10 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Michel Stempin <michel.stempin@wanadoo.fr>,
 Damien Le Moal <dlemoal@kernel.org>
In-Reply-To: <20250819172830.3350159-1-thomas.petazzoni@bootlin.com>
References: <20250819172830.3350159-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <819a477b5ca76d549accd942a2e97a8b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755984015;
 bh=2XjZE8Mpn3BwOoiAg66M6lcDzW5ZmN3J2lDulzUcJRI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YVwpuxdwRwKb7qT4TOwjf9yt3q65uTaErq/UjLl9otRRGKWJI/MpVHQp9A44Pv7uL
 /FLHRvDPpOVpL5GdIOZHqa1i4U2xe2cBT8e0FIATr6CuxnvO38qLqE+/45dvoI4Agz
 qXpI8puYqQfEGZhGBl+8j9RITNW/jpnQMA9n+XDvqVYIbsrpZ/ljF2Ctblo/GYmwlC
 sKhm+24hnCTYCrRPls4539NkBkFa59Hg/MJmSpn9Ic2Sl/Ocm1CgeIv0wJkHETT0rd
 UN3RMXhJ6R1fAchzyV79GqtCQj+bZ0Ei3+4niDGMAhNglh8FIbaCOWMVxjBBC99Zwj
 /R0F7bNsYmtCg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YVwpuxdw
Subject: Re: [Buildroot] [PATCH] configs/sipeed_licheepi_zero: remove
 defconfig, broken
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

Hi Thomas,

On 19/08/2025 19:28, Thomas Petazzoni via buildroot wrote:
> This defconfig no longer builds:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771001
> 
> It has been broken for over 2 months:
> 
>   
> https://gitlab.com/buildroot.org/buildroot/-/jobs?name=T%3Dsipeed_licheepi_zero&kind=BUILD
> 
> It uses Linux 5.8.3, which is not even an LTS maintained kernel.
> 
> Unless a fix is provided, this defconfig will be removed.

For info, I proposed in:
https://patchwork.ozlabs.org/project/buildroot/patch/20250823211802.2213734-1-ju.o@free.fr/
an update for this defconfig which fixes this build issue.

> 
> Fixes:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771001
> 
> Cc: Michel Stempin <michel.stempin@wanadoo.fr>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
