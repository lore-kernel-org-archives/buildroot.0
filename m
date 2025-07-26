Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A28C87FCA
	for <buildroot@archiver.kernel.org>; Sat, 26 Jul 2025 12:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13E3B41390;
	Sat, 26 Jul 2025 12:05:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M6PU8LsHLBGo; Sat, 26 Jul 2025 12:05:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4989341382
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4989341382;
	Sat, 26 Jul 2025 12:05:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BEDC0198
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 12:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0CD24017B
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 12:05:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rYFhGSLZJ403 for <buildroot@buildroot.org>;
 Sat, 26 Jul 2025 12:05:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D735240151
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D735240151
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D735240151
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 12:05:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id B83F02003BE;
 Sat, 26 Jul 2025 14:05:09 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 26 Jul 2025 14:05:09 +0200
MIME-Version: 1.0
Date: Sat, 26 Jul 2025 14:05:09 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250726071450.3545797-1-bernd@kuhls.net>
References: <20250726071450.3545797-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <3a2f18d636e576c01d6c4c4c004919f3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753531512;
 bh=4dLn2g1E9WtRi48NIMbkd7gx5BYx1n5oNUJuZ6cQk6o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=c4guOkqXFSYQc4uwM0ieYZbARHjO0Ge7Ltdv53x9J4tjwxLtbpT+KWjgaNJSzhION
 J6d0gvqq3+HyHXwgqXT02TJQtePB1AkDXXsbIjAUPLTH1d58zvdnneS2dpcK78cgPL
 kiSGEGvJKWFRYwVx4Rlzh0VMXPYwsCREswsBkn2WAf2xm6Xz30qaD6NWBi11MHeb58
 i2KxvMzoXnFmmSvixTQLiPAIoSALzeDXLN1/vqwZs8EKFY2WbhcOO5f5ZYTLPD+wtU
 N7o8BzLj5pyV/LEQda8f9T9tDoK2VC+Mvofwi9EUR8V4dMWna+64MszQ4LvaY9xPjQ
 wRY6y7a2copbw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=c4guOkqX
Subject: Re: [Buildroot] [PATCH 1/1] Revert "package/libva: fix build error"
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

On 26/07/2025 09:14, Bernd Kuhls wrote:
> This reverts commit c41f953ab9ba262324484a2efe1151d8f543eebd.
> 
> This commit broke gst1-vaapi:
> https://lists.buildroot.org/pipermail/buildroot/2025-July/782786.html
> 
> Reported-by: James Hilliard <james.hilliard1@gmail.com>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
