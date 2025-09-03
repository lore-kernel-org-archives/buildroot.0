Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB2ECA1012
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 22:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E2BE84A0B;
	Wed,  3 Sep 2025 22:03:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Af-3D3uEnCWQ; Wed,  3 Sep 2025 22:03:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9471684A0F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9471684A0F;
	Wed,  3 Sep 2025 22:03:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AD25E106
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 22:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EB4E6F47B
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 22:03:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x-PAKIHVwEr5 for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 22:03:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D5FD061721
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5FD061721
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D5FD061721
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 22:03:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 429135FF88;
 Thu,  4 Sep 2025 00:02:58 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 04 Sep 2025 00:02:58 +0200
MIME-Version: 1.0
Date: Thu, 04 Sep 2025 00:02:58 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20250902210206.668712-1-dario.binacchi@amarulasolutions.com>
References: <20250902210206.668712-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <7c1c2011dff5fcfddd2942d76aa93bc4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756936980;
 bh=7eScSDOt8UZ7ySwBz+XgvaCEkJxXToba1G4w189gdsk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QQbPJperqdOGE8dNU6jj6FzYy8HLmPrXztcE0dh8RSKtfccUcEqT3hRFHl51W6gek
 a8nQNPD7nBikzfl2cAoi3mVfPer979biHlSt8M1KuG6liz1zlwlDnWomMh1qy8q3Te
 lR7CIXgjm99q8+HZTQl4EkRq3LE2rZ3/Nd/nuFg1gSa7lVAYmrh0+GGP4QaD/aQRDu
 Z4kQpDhMg2sWkt6vePWawgX0dr9sPePfMfIc6Ar7CG87iETjM3fepcDHcpmbC0HM5x
 8oHzsNE8WEfes8dvpGunj7S4BnIhlO06DiDKthTeVYBRMS6x2ZYx7H05eN0uK4g9xv
 5JlxmfuoII5KA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QQbPJper
Subject: Re: [Buildroot] [next 1/1] package/armadillo: bump to version 15.0.1
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

On 02/09/2025 23:02, Dario Binacchi wrote:
> Release notes:
> https://arma.sourceforge.net/docs.html#changelog
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
