Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B418EC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 23:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8010960AA8;
	Fri, 28 Feb 2025 23:05:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ewuiS20Ys4N5; Fri, 28 Feb 2025 23:05:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACF2F60C20
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACF2F60C20;
	Fri, 28 Feb 2025 23:05:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 736CB1CB
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 23:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6256084A5A
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 23:05:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1sOdcdDe6JF9 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 23:05:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BC17A84A4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC17A84A4A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC17A84A4A
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 23:05:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 18E242003C6;
 Sat,  1 Mar 2025 00:05:39 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 01 Mar 2025 00:05:39 +0100
MIME-Version: 1.0
Date: Sat, 01 Mar 2025 00:05:39 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250217120002.1887681-1-james.hilliard1@gmail.com>
References: <20250217120002.1887681-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <cd7803d0153a12c881518a4d4f8c0edb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740783940;
 bh=xVRVI+Pw85RFOPNHJGBt6hgK1lORoC5X2guooDkmv5M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=m9L6vrA4+hYqzLafsUyD+KqRLhiPVptDFB3jzXlr5DHxyhD9L7XXSMqO4xzR3hUsH
 +y+UFsGQZZv7Lx1ryeRrJ8oO2tlonv9iOcQoud+g1ZCd9goYL7hqUn2qTd0XLJwW5J
 MKoTMc16cw30/GgCy5XdLXDgm5Y/2ZHxZpDvbsGrNUTexR5DdWNmi6j3ehRUk+gTml
 u3U1GRG+UrpDdEKMRt08UoSIyaVvhLmq6R5YvJ4IZZRI9JB0wFpmLE+OL+gzIU7RZ8
 EfoNrhGmWTahfdaE1KiH6OTgECj52xuuKUWkeyZ4bgX8B9fLMAVX7gAH6U4y0FlLnU
 tpvP1VjIPYW0A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=m9L6vrA4
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiohttp: bump to version
 3.11.12
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

On 17/02/2025 13:00, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
