Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0A4CCA476
	for <buildroot@archiver.kernel.org>; Tue,  7 Oct 2025 20:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7982360AEF;
	Tue,  7 Oct 2025 20:19:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kfCdM3hQzc8g; Tue,  7 Oct 2025 20:19:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F09160B15
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F09160B15;
	Tue,  7 Oct 2025 20:19:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B887119
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 20:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D5EE60745
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 20:19:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bc0iet64D85j for <buildroot@buildroot.org>;
 Tue,  7 Oct 2025 20:19:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6BC7360740
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BC7360740
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6BC7360740
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 20:19:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 4842020039E;
 Tue,  7 Oct 2025 22:19:12 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 07 Oct 2025 22:19:12 +0200
MIME-Version: 1.0
Date: Tue, 07 Oct 2025 22:19:12 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20251006164702.1885888-1-dario.binacchi@amarulasolutions.com>
References: <20251006164702.1885888-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <2c196bd9351061be7f0d13f4569fab42@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759868354;
 bh=aJICnMd0c/APHPg6dbRJVgfx93DvYld+GE5hxVKMMaU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RObwhUIKsUKnsFTe8acTEz5iugnLKHp7UgPy3/GnCc/8Mya4TXcjZO2MS9q0SdKMm
 MeAsXci1PV4mi3FRSq49hUsj5Z+aJvdghjQtMZlFAIKu+4kxXC6ROwuplJf2Skh0CR
 i42zTk08OFZ+ofeSKRs5g75DdSWVk0GHyuXgOygwFU2uE6kG4l66yZ8QVPOhgF/MYG
 3gASQbeE7AkhzX7/oGbznK99qDYNsGXuKm/scQ051b/cwHUdkWPIvq4IYBukHptRe1
 /UisxE3Jvkdrv7gh+O87AW+HVE5EDeu1fUI70Gl9LoMDqetsVh7eS/m4MC3tla08jl
 FhSYd5q9Tz5zQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RObwhUIK
Subject: Re: [Buildroot] [PATCH 1/1] package/foot: bump to version 1.24.0
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

On 06/10/2025 18:47, Dario Binacchi wrote:
> Release notes:
> https://codeberg.org/dnkl/foot/src/branch/master/CHANGELOG.md#1-23-1
> https://codeberg.org/dnkl/foot/src/branch/master/CHANGELOG.md#1-24-0
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
