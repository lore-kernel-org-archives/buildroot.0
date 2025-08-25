Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C1CCA0FE7
	for <buildroot@archiver.kernel.org>; Mon, 25 Aug 2025 19:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDAF3610FD;
	Mon, 25 Aug 2025 19:40:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yg040GqB5keS; Mon, 25 Aug 2025 19:40:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F015060EBD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F015060EBD;
	Mon, 25 Aug 2025 19:40:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15EE1114
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 19:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0605429F9
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 19:40:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KENIoLy2Br1G for <buildroot@buildroot.org>;
 Mon, 25 Aug 2025 19:40:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 39B24429F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39B24429F7
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 39B24429F7
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 19:40:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id A7B4113F899;
 Mon, 25 Aug 2025 21:40:18 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 25 Aug 2025 21:40:18 +0200
MIME-Version: 1.0
Date: Mon, 25 Aug 2025 21:40:18 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
In-Reply-To: <20250824204519.3895-1-bernd@kuhls.net>
References: <20250824204519.3895-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <e0b92ebb2da7f3fd9ca93dc63077fbc8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756150821;
 bh=456pPDRYIxPXpW6PICYIL8wUV1FPD2c25Ot7BNztiDQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NssP4VBY+MnVrppHddHJBFfGU51cJnp7Nzg5E33fydBhLka3e5HqEbSL1naQRhGLP
 lewDioINJ63Swk57vNqfDCK+OlC2R7QUun5lFTHzrXhZfOLPvgBbLGdexR3FV+axJi
 4ky6M5pf5cz6oX3bWVZQBSn3XHrYWNYM/v1/qNzCU1nLzsHUKr9mz6L2wYU/CfUGYU
 m0et13EALibguyDjoyjWLg0ZVlT3t3UcN5ZOu8fWQECqea6Ni9RHvWRt+0DOQGEpyo
 qO0cTt4624+opwT1VSdFLJWhKY26wXuzfORF6dXwknTXvHTJhxW1vXsEy0nwJNfxO6
 Kp0J3c2Z3INxg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=NssP4VBY
Subject: Re: [Buildroot] [PATCH v2 1/1] package/ffmpeg: security bump
 version to 6.1.3
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

On 24/08/2025 22:45, Bernd Kuhls wrote:
> Changelog:
> http://git.videolan.org/?p=ffmpeg.git;a=blob;f=Changelog;h=01cd1ba06fa6570f34e41fd8374f543c7e181604;hb=01d3f764f79b2f571174a4cec855e651258f20ec
> 
> Fixes CVE-2023-6602:
> https://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=ceacc83011a0a5057769626faf14b9256bd3baa7
> https://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=c599745377199fa75fffb30058fb2a6f39d64ab7
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
