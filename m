Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67548CAC5BB
	for <buildroot@archiver.kernel.org>; Sun, 28 Sep 2025 11:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D0FB6076B;
	Sun, 28 Sep 2025 11:53:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qNXqVEm8arZT; Sun, 28 Sep 2025 11:53:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C3B560741
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C3B560741;
	Sun, 28 Sep 2025 11:53:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A4B7111
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 11:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9758D80EE7
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 11:53:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kgEAVJoFgK0x for <buildroot@buildroot.org>;
 Sun, 28 Sep 2025 11:53:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BCC4C80DDC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCC4C80DDC
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCC4C80DDC
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 11:53:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id AD814780389;
 Sun, 28 Sep 2025 13:53:01 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 28 Sep 2025 13:53:01 +0200
MIME-Version: 1.0
Date: Sun, 28 Sep 2025 13:53:01 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Patrice Vilchez
 <Patrice.Vilchez@microchip.com>
In-Reply-To: <20250830060013.2674789-1-thomas.petazzoni@bootlin.com>
References: <20250830060013.2674789-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <4e495a77d91496891012301c621b9d23@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759060387;
 bh=gsvSnJtCncldZNzzaLGODpsOzi1PZMP5yvBebBAN6Zg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HnClKnxzdZPeZwqiKsau+gEgBm4tfpE0IRcgfs1bw00EkpQMfhl1GgSN1ZvzBw2Yg
 2j+BAnX/9DnmUpvA7OyVCHUIikBupnLIjcf/K9TcA+vL/81QB6KFDnKzgbF3JHWtOZ
 4Izf4tDsOQuNaZcqLfccX0OkiOAIVIhuj8bp8vnrKxj2xXmRi2VePnC7Jv/EX5i20M
 o10b0HS84iL8AHfOLLZYyMN9cdcb8owGMSMkMOIQsR0ipIDYSHnbjbqPt9aMGfJxWQ
 RN8c3IkyJnaRQUfAfGSrEQEY1ULNhr929OIDIkAVO5zTY5TO/WWNsUxEituACUpF4C
 Uu2tM2kNmHGrg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HnClKnxz
Subject: Re: [Buildroot] [PATCH] configs/atmel_sama5d3xek: remove defconfig,
 broken
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

On 30/08/2025 08:00, Thomas Petazzoni via buildroot wrote:
> This defconfig no longer builds:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/11161167647
> 
> It is still based on the 4.9 kernel, which was LTS but is no longer
> maintained.
> 
> There is no DEVELOPERS entry attached to this configuration as well,
> and this defconfig has been broken for at least 2 months, probably
> more (our Gitlab CI history is only kept for ~2 months). So let's drop
> it, unles someone volunteers to resurrect it.
> 
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Patrice Vilchez <Patrice.Vilchez@microchip.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
