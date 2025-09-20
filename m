Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C2FBCAC5A7
	for <buildroot@archiver.kernel.org>; Sat, 20 Sep 2025 19:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE98A812CC;
	Sat, 20 Sep 2025 19:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id msKOvzTrw6bH; Sat, 20 Sep 2025 19:44:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC8CF812D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC8CF812D9;
	Sat, 20 Sep 2025 19:44:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 173E6D3
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 19:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08D6C40148
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 19:44:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uGH4jD54GE7A for <buildroot@buildroot.org>;
 Sat, 20 Sep 2025 19:44:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8BB3B4028E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BB3B4028E
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8BB3B4028E
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 19:44:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 0608E19F733;
 Sat, 20 Sep 2025 21:44:36 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 20 Sep 2025 21:44:36 +0200
MIME-Version: 1.0
Date: Sat, 20 Sep 2025 21:44:36 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20250920094617.2571648-1-dario.binacchi@amarulasolutions.com>
References: <20250920094617.2571648-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <e1bf4dac1d9f6ca9b97a88b12cc94be8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758397479;
 bh=H+YtSgRlmE9GtJGeK/lDfXvogQyQfoSk7KobDvvskU0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QWISEw2GwajjOOGOq0FbIBBESFbGbwzNqiXPrgmgEo1+vEnAZonW3Uk3ISGy2e5c8
 aRmEcwnrgDTzt/cQ4gBFvujQW09TmIrbTCgW6REaiARAVR/wHLfPNLkI0YECJGAfMb
 PC+6qwjZXJ+pepxKCzHZiR6i8Il/tSb7B/Y1qobxHQwiu+PXMaAVfrJRis9oRDmGr0
 mD7Y1V+eZJg7Ib8mfX4KuqdPu6Fe7DfzkcFrVZ8zmMJYlZJt8tuAx/OBEdAJbRF+D3
 yL1ZDgHjvfcSNDxEeELQmYTvKtlZwu6wDs5Ssi7i2vVvcPnSGoSS4fAWCw68VTcY6T
 2EonijSRyGAbg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=QWISEw2G
Subject: Re: [Buildroot] [PATCH 1/2] package/atf: bump to version 0.23
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

On 20/09/2025 11:46, Dario Binacchi wrote:
> Release notes:
> https://github.com/freebsd/atf/releases/tag/atf-0.23
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
