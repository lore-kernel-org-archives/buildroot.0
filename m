Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F5CC0218D
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 21:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5CC26069C;
	Sun, 26 Jan 2025 21:58:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tZNhL8Ogzc7f; Sun, 26 Jan 2025 21:58:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFA2E60659
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFA2E60659;
	Sun, 26 Jan 2025 21:58:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E12E5AF7
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 21:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCCEA81214
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 21:58:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3o7PuBcQBlUg for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 21:58:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 042C981213
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 042C981213
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 042C981213
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 21:58:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 98C755FFAA;
 Sun, 26 Jan 2025 22:58:49 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:40948])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Jan 2025 22:58:49 +0100
MIME-Version: 1.0
Date: Sun, 26 Jan 2025 22:58:49 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Stefan Hager <stefan.hager@ginzinger.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250126154732.405055-7-james.hilliard1@gmail.com>
References: <20250126154732.405055-1-james.hilliard1@gmail.com>
 <20250126154732.405055-7-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <6aff833b626bdb5e83340ac301a50885@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737928733;
 bh=7FF8V3EVJH2OdE1ivb6d6QT5tegHIsOcRY2/auxDj5M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kPcS8G+HUKoWWzm2Blh//9xbuplfLaL7whCTne3SP48crz32VKeV9GzxNZq9mPLVj
 Gzxb/M+4c+szX3KUaSqK/8bgZ/CojCuisx8GHn+sxdYARUhuEkxDtqgaYa56MwFYca
 6/eqbPX3+rewBsofNaIS4CNKYSGSRR6izd+OCkfP0NCatQ9YMb/p/t6T7jHTU8wRDv
 tXRz6keGSiiwziJICs7ZDET9LVHmqJBeMsLlUCDkP81KpyHp+TeZAKv5u4gscEYOrX
 R9gE+k+C6/7zdjsRg6u8ce+GmU7T8z4pts4JVKCcNorjhPzyUTXq8BB8x7S6y7gAM3
 ba9ZMh4K1ui+A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=kPcS8G+H
Subject: Re: [Buildroot] [PATCH v7 07/10] package/xnnpack: new package
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

Hi James,

Thank you for the patches!

On 26/01/2025 16:47, James Hilliard wrote:
> This package is required by tensorflow-lite.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

I quickly tried to run a "test-pkg -a -p tensorflow-lite" on this
series. I got 3 build failures (out of 6 builds). All those
failures seems to happen in xnnpack. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/1641656260

Could you have a look please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
