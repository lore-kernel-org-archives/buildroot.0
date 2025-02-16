Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB46C02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 15:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F60A409EE;
	Sun, 16 Feb 2025 15:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id svdNU664rVCW; Sun, 16 Feb 2025 15:36:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1341340D93
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1341340D93;
	Sun, 16 Feb 2025 15:36:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C2EC0C8
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 15:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B265D803A2
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 15:36:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id komTm0vTvBuf for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 15:36:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C46EF8037B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C46EF8037B
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C46EF8037B
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 15:36:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id BD71960132;
 Sun, 16 Feb 2025 16:36:10 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Feb 2025 16:36:10 +0100
MIME-Version: 1.0
Date: Sun, 16 Feb 2025 16:36:10 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250216135034.2068766-1-bernd@kuhls.net>
References: <20250216135034.2068766-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <5e21943f11e2498092f661fb850689ce@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739720171;
 bh=viU/krbCqsYXWcx4FVdNa2vbnnuAU2XzWsfhk1+nsYA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NklR2OzNwGnHcoC36CeJTekqd+jfV/Pq84RQYNPM9aVKJ0i17HN8umZTxwwFO/Aa0
 Sr0IRZuhppJEAsaGYORMUfbMJa4oRaym9wwyKoFHRUlBbRqOVclWUYxo7u1OjySI80
 DxHm9og3yVF3kysMO1vBpvIHSqU60CQFAZKLBIZ7QS6z5/o/ydnNadUlkjvvO+wXf4
 RBa+OHVphxwNpbiHlgHJgZWo9YYQUQEgYjrI4YYUbwi3d7sm/JZQzM/De+o7ceBM4l
 QeN6pa8OG+utV5tLrie5V2QRVhH1eCad/o7t5H8kxLWOhphEAgGxJKUAz1+e1psFdA
 GenZyTH0ObBiw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NklR2OzN
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-microcode: security bump
 version to 20250211
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 16/02/2025 14:50, Bernd Kuhls wrote:
> Release notes:
> https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20250211
> 
> CVE-2024-31068:
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01166.html
> 
> CVE-2024-36293
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01213.html
> 
> CVE-2023-43758, CVE-2023-34440, CVE-2024-24582, CVE-2024-29214,
> CVE-2024-28127, CVE-2024-39279, CVE-2024-31157 & CVE-2024-28047:
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01139.html
> 
> CVE-2024-39355:
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01228.html
> 
> CVE-2024-37020:
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01194.html
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
