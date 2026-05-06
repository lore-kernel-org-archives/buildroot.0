Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB20CD3439
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 20:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9A0560F2A;
	Wed,  6 May 2026 20:32:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oT_XkinrK44H; Wed,  6 May 2026 20:32:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9853C60F28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778099525;
	bh=u/EsBapaXl3nphr1wslLpKzEukQLfFGFOgxuJinCddo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VJAPET7fc6eekzJcwFnidQg+kFTN4zSYz0TsEUtZbD0McxUSR8dI7YOsHdz0CbBgg
	 EAm6rfQGE6zsZSyj257HnAPVVqQ1RGZzwMaU1h+YI1yOluALBCp9alGdTjNAKCbsIG
	 JPFW9lg0nhDdBnZ9l8njY3qwRHAro4aJVJhqwRSPTQ80UA1duOtkh+rML9upRlimGj
	 bNFL8MV+ht9yssQidW1kdw+FyQO6FC0RB1DglN6DP4NYthxA6U/e3GWuhzBt4VSKlO
	 YvWYCyyzalqDbRUfTxFuIfbjOAVXeKhLEH/HUwK8PjFPY40kmhwV7z/jiMEIUJ7rh0
	 MzV/3GgUy/pzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9853C60F28;
	Wed,  6 May 2026 20:32:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F54311B
 for <buildroot@buildroot.org>; Wed,  6 May 2026 20:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75DC460F28
 for <buildroot@buildroot.org>; Wed,  6 May 2026 20:32:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wz9CDa4mfT00 for <buildroot@buildroot.org>;
 Wed,  6 May 2026 20:32:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3AD5A60F26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AD5A60F26
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3AD5A60F26
 for <buildroot@buildroot.org>; Wed,  6 May 2026 20:32:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 517FB780513;
 Wed,  6 May 2026 22:31:54 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 06 May 2026 22:31:54 +0200
MIME-Version: 1.0
Date: Wed, 06 May 2026 22:31:54 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260506083350.3959360-1-buildroot@bubu1.eu>
References: <20260506083350.3959360-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.14
Message-ID: <de8e4086e62e5a1ba528edcbeea5b511@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778099520;
 bh=qxDufPFgw7a6YCj1iXuDvggtm1mivY0CbaDHzcTRSrw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=t0BMyBetunym4fh8mlws7Fs2TwQ01+FlaH76h68SpSQsgNF0UrZGo3lH0iYWoAXwo
 Km4svGaEI2YWevG7M4qb3pnOob9aYVkG47oQKN27xycQI5vwRyC0JxcCOeID877tbh
 02Q+lSg/Q7qvHNO33Bo/vYj3K1trjeT70ESE4o+JeJ9nbCajGK6mi9ao2n0dpg0pUM
 SX3y9kzCgWHKCInakp0hjhTIT567Tdob7Wi2cS04mc9UiUfaOKDvX2fuiEUz2FCbf1
 MJMFxbifHP+iajCP/CWk0g7b+J/aGzK9M9wW1AXzyJma91ioqKMlayoBD/tPhF5CqS
 oJN5p2AS8M1iw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=t0BMyBet
Subject: Re: [Buildroot] [PATCH 1/3] package/gcc: fix gcc-15 build with host
 gcc 16
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

On 06/05/2026 10:33, Marcus Hoffmann via buildroot wrote:
> Backport patch that was applied upstream to the gcc-15 maintenance
> branch.
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
