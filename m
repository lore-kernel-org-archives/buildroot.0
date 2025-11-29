Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6E2CFD2F6
	for <buildroot@archiver.kernel.org>; Sat, 29 Nov 2025 23:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEF8040BD8;
	Sat, 29 Nov 2025 23:05:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pNP-piI5ZWtC; Sat, 29 Nov 2025 23:05:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D193A40B72
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D193A40B72;
	Sat, 29 Nov 2025 23:05:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CCDED273
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 23:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B906940B67
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 23:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KQT4v2qpHnv3 for <buildroot@buildroot.org>;
 Sat, 29 Nov 2025 23:05:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6B99240B72
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B99240B72
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6B99240B72
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 23:05:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 0989660128;
 Sun, 30 Nov 2025 00:04:55 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 30 Nov 2025 00:04:55 +0100
MIME-Version: 1.0
Date: Sun, 30 Nov 2025 00:04:55 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20251123162451.597914-1-dario.binacchi@amarulasolutions.com>
References: <20251123162451.597914-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <9dc55d2af3a4e1faf7036856e9bb2994@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764457498;
 bh=ddkCbYtoEU4xwX/FnYwfN2oxKwAz5mY/ajBJNJpXeN4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oE6JWqAmM44We2YeEpGpPtcm0v0czgaXixijJ/ojmlorkDB71aGeFjwhEiwjDqKri
 bxZdeGv46yM84U2rqwNDh/PG7a0ZXrvW8jqVlDeLjbaYSgti455TjIXLGbkuoMXdLu
 9TZidA5FedMPOa55RbVlo1mnlVeiZ3mke5jkWGNoH0b+kvw4vSJ4AKC+5yXRw8Pird
 4j9qwE6BC8D3FLy+jB9qenb1ROIcaxn+XunqAWsodk31lsq3sXDe6YAPnLWwVwO5HA
 Sr18IaxjnN0TsIbrpb5Wmtw/NZJ2Jc58Oi8CL1xDZlxjjwT8Clr8oXp5V71CV5J8Xy
 AeyW0UBlHT9EQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=oE6JWqAm
Subject: Re: [Buildroot] [PATCH 1/1] package/at-spi2-core: bump to version
 2.58.2
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

On 23/11/2025 17:24, Dario Binacchi wrote:
> Release notes:
> https://gitlab.gnome.org/GNOME/at-spi2-core/-/blob/2.58.2/NEWS
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
