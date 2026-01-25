Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8A6D7237B
	for <buildroot@archiver.kernel.org>; Sun, 25 Jan 2026 21:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53F7E60B02;
	Sun, 25 Jan 2026 21:50:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b71GSHmgzzuv; Sun, 25 Jan 2026 21:50:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E8A660883
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769377806;
	bh=LcSRBRuuQRLddAbYuwwtoArx2/ILgAi/peqgAKHp1LQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sRbnVzqJ20Fpx1uZNch2vRy40G3JVwYwZrKvQWdaIYR10RdMX4Qf2pKI8yAyL4uaa
	 HkPygpGgdiBY95cmoSJnbLhQzFDAq+WXiUB+DvRmJ/tnXsiAygTTtDtMLwRJZNA93y
	 GbAbzKpQd+HobnwWJllGMEJZ5/MVhXJZbah83ABuJcy9BDJt63CcR2vSa/KQKuWoOw
	 il/IsbVjolvNrHLVGpCwRAU2L58FDf3fSmq64UMBQaSedDeDk6U90qpjZx8Lw6QSEF
	 q49H8BW2p0Zetq93kYbKLKUbr36xYmlrljG2Yxzdt4E76zQchox2zfRCFyhXnTZwFW
	 ezohnmSQEv0xw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E8A660883;
	Sun, 25 Jan 2026 21:50:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BFF1C1CE
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD7EE401DA
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:50:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WnMrbsoYHkLZ for <buildroot@buildroot.org>;
 Sun, 25 Jan 2026 21:50:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9820340085
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9820340085
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9820340085
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:50:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 217A5B0051E;
 Sun, 25 Jan 2026 22:49:59 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 25 Jan 2026 22:49:59 +0100
MIME-Version: 1.0
Date: Sun, 25 Jan 2026 22:49:59 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Michael Trimarchi
 <michael@amarulasolutions.com>, linux-amarula@amarulasolutions.com
In-Reply-To: <20260124161540.2325660-1-dario.binacchi@amarulasolutions.com>
References: <20260124161540.2325660-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <39df557160e4455dfb94c880ed5ee54b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769377802;
 bh=eeozzy9kcGY6/6ormXbcJQMrkS+D7cHUPumISaxb+j0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ds45LpNLfG6Qq1gfl1dRiIt/IKMTLQ6GxAN0ikGP/tJxcDouKvBwWGhzripzPkEF0
 gTNWY6UAlW/PRdBFDfF+V1Forqs8thHsaotKQPh+WHz6g4kadBOQMd8RPoz/OOmMmI
 Gl939WX1Memt1LRH8saiAd5ZnYjiysS2+sgR7vGgMuJBWPznmWI2gj48ejmouW3Uez
 4enhZFLCPvrLxqqul8b+z68Wl+Vhkon6Y2jio/1MJ/zUSmoaw0junmzEw97+edKX/N
 UVOviPMBduxmHUHOmod4d6ZBbg/4N7OkYzgPyzKsVdIbgWcru1x5v/Lin2Zk2zKjkv
 eOJBy08Pcc/xQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ds45LpNL
Subject: Re: [Buildroot] [PATCH 1/1] board/bsh/imx8mn-bsh-smm-s2: exit
 post-build.sh on error
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

On 24/01/2026 17:15, Dario Binacchi wrote:
> Add 'set -eu' to ensure that command failures or unset variables are
> properly reported to the 'make' process. This prevents silent failures
> during the image generation phase.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
