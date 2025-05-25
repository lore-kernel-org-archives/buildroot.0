Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8587DC5AD49
	for <buildroot@archiver.kernel.org>; Sun, 25 May 2025 14:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4ABC16073C;
	Sun, 25 May 2025 14:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NgqdOb1nMbY8; Sun, 25 May 2025 14:20:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 788C1606AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 788C1606AF;
	Sun, 25 May 2025 14:20:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3232A68
 for <buildroot@buildroot.org>; Sun, 25 May 2025 14:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18A2A4005A
 for <buildroot@buildroot.org>; Sun, 25 May 2025 14:20:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gm8Voe9pPPdk for <buildroot@buildroot.org>;
 Sun, 25 May 2025 14:20:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0D3544008F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D3544008F
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D3544008F
 for <buildroot@buildroot.org>; Sun, 25 May 2025 14:20:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 4E2032003E3;
 Sun, 25 May 2025 16:20:24 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 25 May 2025 16:20:24 +0200
MIME-Version: 1.0
Date: Sun, 25 May 2025 16:20:24 +0200
From: Julien Olivain <ju.o@free.fr>
To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Cc: buildroot@buildroot.org, Daniel Lang <dalang@gmx.at>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Joseph Kogut
 <joseph.kogut@gmail.com>, Romain Naour <romain.naour@gmail.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Valentin Korenblit
 <valentinkorenblit@gmail.com>, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20250522071816.1948188-2-elmehdi.younes@smile.fr>
References: <20250522071816.1948188-1-elmehdi.younes@smile.fr>
 <20250522071816.1948188-2-elmehdi.younes@smile.fr>
User-Agent: Webmail Free/1.6.10
Message-ID: <3921b8b7800c5904019c017fef086364@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748182834;
 bh=893Wo8uMBjiu63OQFXKsucPSUschP4KOjSGk5CnoTW0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oKNJsYaU1RxCDx+3AqHhGNJe5P4qcGmvhuusxKF+7ppaDTNv32ndEwORFwEIDVyUm
 /fSZuclsP5EmNBrzmO3G3yukKyihzErb+jOlb4xrrAlCQwkuZlKuI2Vr+f2xqwG8z7
 SmD1FMKiLD56sLUoVTlUpAATmvOtXT7B+UvGCoB/KVOQ3ZsEFvtGClaRf/VXOIbRUy
 YSOucgL42XilwYLmoZHGiNsmdoXWxagTvIZoNa3YvdpJIDg6rSvnvsPVWHUMcW+SzX
 gcFikTQ9HuzOl8Rbp+puAYsqpIO0DQcti2dCNa9oGoxJ74dWohfGHhmzlt5gUTadKD
 oYnBeiA6KWpuQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=oKNJsYaU
Subject: Re: [Buildroot] [PATCH v3 1/4] support/testing:
 TestClangCompilerRT: Add a kernel fragment for 48 bits virtual adress
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

On 22/05/2025 09:18, El Mehdi YOUNES via buildroot wrote:
> Add a kernel fragment to enable
> CONFIG_ARM64_VA_BITS_48 for the AARCH64 QEMU platform in the
> clang compiler -rt runtime test.
> 
> Without this setting, this sanitize-based test fails with clang-20
> due to insufficient virtual adress space.
> 
> "This might potentially affect ARM platforms with 39-bit address 
> space." from [1]
> 
> [1] 
> https://github.com/llvm/llvm-project/commit/a588cfe37ea36ec4fae35a233a13d3557fba86e9
> 
> Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to next. Thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
