Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6348CAC5B9
	for <buildroot@archiver.kernel.org>; Mon, 29 Sep 2025 19:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BBCC80A95;
	Mon, 29 Sep 2025 19:15:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xohn6LhisAPj; Mon, 29 Sep 2025 19:15:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4225809CD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4225809CD;
	Mon, 29 Sep 2025 19:15:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A35C612D
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 19:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A1F2809A2
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 19:15:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zu9YlvBKTyzM for <buildroot@buildroot.org>;
 Mon, 29 Sep 2025 19:15:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B9747805C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9747805C7
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B9747805C7
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 19:15:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 55E9B2003DE;
 Mon, 29 Sep 2025 21:14:59 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 29 Sep 2025 21:14:59 +0200
MIME-Version: 1.0
Date: Mon, 29 Sep 2025 21:14:59 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20250929130809.1302298-1-dario.binacchi@amarulasolutions.com>
References: <20250929130809.1302298-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <622e8b5d9e4089eb5a35d65ace7374f2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759173301;
 bh=G/nKqTqu4g60RqKJ301USoLv+2o4iuet7jKPLSWOYRs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rfzp4wFJYPX5OX/Pv82JA8fPdnI6W0cL1yTtygXHe52YGhcElTRdC6PMUVHGBKJeV
 JaaW+U3opMs9bGBlWqOZTAGg6WQak4c+s5PHrvw8yGZRrE5r09K8d5i+v/II4xAioI
 xryFs9mnt7+Tsu5QQhyhAek0iLbC1elzht4iPGn14A6R7pXvXfwtv/iwETMC748d9r
 4GCKU9GMBw/7U+iFspB0BW6vTIe9SrP8qMU0K1clhYVaUX6CdykNt36ue/skR/EKIX
 47E/NQWf38obSAWO7fw2e9YjTQZ5ZyM0or9eW1EQfd/xqJcSwVYhUyd/Ii/L62Wyzi
 8Y7nUnTiDcSNg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rfzp4wFJ
Subject: Re: [Buildroot] [PATCH 1/1] package/enet: bump to version 1.3.18
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

On 29/09/2025 15:08, Dario Binacchi wrote:
> See:
> https://github.com/lsalzman/enet/blob/v1.3.18/ChangeLog
> 
> Update file hash due to update license dates:
> https://github.com/lsalzman/enet/commit/2662c0de09e36f2a2030ccc2c528a3e4c9e8138a
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
