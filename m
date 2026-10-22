Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C571606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 06:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=oSoxulYh
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E13FF607C4;
	Thu, 22 Oct 2026 06:24:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n34D_c34Fh8T; Thu, 22 Oct 2026 06:24:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D42A2607E4
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792650248;
	b=ivFvbwJTc6TzgpIbfXrlxud/hEWiYCCy+XRRwwWjM7UvDEaSPeLR4EsOmjuWSXiIcazD
	 x7arHkgJ4tVhvkKmOmRmkWBslpBh4O9u4Zp10biFnc4WkmbfSl8a3cTsYRiRQqKvKIoZT
	 GnBuBNRxt39rKKhlFCGqv9SMQA9BSJbX0TzEZFRvKLD2HZRDzHfN5nRIw/jpJ2/mYkFz3
	 03FKP2FazeEdTH5eM1AyEZNFVSBuGerfRo7Qew/MNzryDNNDMrAU+X0cjwDhCu0QHjN15
	 zCnZRp+gIzHYAiwR/8bxMs7uyHvW1P+/WPTu+TUurStDX9CjNHBBF/iU3bcZT86njdQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792650248;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=9hKWvpk4Tb0vuTJdL9SaDqftyOu4lyjLlnM6kqa6UlY=;
	b=DsDOfsyu4dtMXANctWYu16Jcjhro6lDVZMv9Ec7bNWhYVPhLKWqKZQ8ONGch8M5SeFuA
	 AG8320s3m3nnW9qUcGXqwAEmiFoeEPKdzkjfgQhqdNGYWdUPfgAJ8TTwsxVbmWixbC7F6
	 AmNmQfFuejp/muBHwmjjBkEKd7Vp4i27/Ajj4OxgsD3iHzq1/pm6yewqLEYA1XklWQ0cf
	 3JjuBYwMBPkFG4AQIoKoLwqno9rtSJMZSOcrTSLhE/URdDLsoVeuzjeAx2crKcD2jFdnb
	 lUUeu0Gun64VvRM2emI+JTBTLGT0pTIqZ3cbRDgxzuoB1RyaqlvxscJ7XjeiCNAUkRg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792650247;
	bh=9hKWvpk4Tb0vuTJdL9SaDqftyOu4lyjLlnM6kqa6UlY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oSoxulYhtjJsCvxhoickwsBgS9RExim9zrF+zwRglsIWT7yyRBJhDfv/Tiy5VEua5
	 fXcZe90owOC6DVsqeGn+id9ynjLzejpihX7pr8rav5yikIEezn2YA1eMb4wgxdNYil
	 QjNgV39WAsF7pbgJ9fmBuxAE6SNAM0zJVOUgzRbfnVWdLUvdwEA+7MBrN57zbfWqYl
	 JR4lx6DhKk8mlmO4gMRnDXFfyBgQXZUFUnlVS6EK3FFBibYJIkUUOCrJOVNVUIKOsu
	 /M64p8fOV6IglkxmzmvbY3uIQLbISWQFf1xumwGcfCJ6WcRibxoYFrOApMRAJbp/jq
	 FwZjFIAPe79EQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D42A2607E4;
	Thu, 22 Oct 2026 06:24:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 44887356
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 06:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A1B740075
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 06:24:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NIszk8EjrO-j for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 06:24:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3C1ED40042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792650245;
 b=LLXD3gUT9Pv/p+pSbbWbsuPtOpA9o7TUuPMRZGn0bIY4F4fZwwN7TUjvbVAygLwm+2lu
 l5vqXxlavAzzHTDQzQw4l564K6srPdNasu/ET2AUuK8nlWGK25YWw7y3IdY8AazD2x31Y
 xfnqvy25TQr5gDOwWV7BhCXUYKpy91Xl5jJKX832lDyAyksha7RXQ4T+YPmZOiCAnKf3O
 bWADBKXmAafClX4Yh3a8JPiqsQo4WvXTzWq+9M9UzlX63awSCTHmgQ27EvSO+/yF5Qzfo
 W+YAtD+EuRuKScZu+vKz9kWo9OjIykpXiC9LWnbCXkA88St5N/bC/sroxEQ4J4Dzx8g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792650245;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=UUu2Nfw/Pu63sc3JGm70UXdgH0FBcq2UodGrXgLqjUM=;
 b=B61AE9FXzlnFCS0Ym1yHDUEK2S7e/QC7TP7T9fqhO/MG7JGN0RtOMJfHRWXsYd3jAwsA
 xQ8ByQSwa4urPYcvFBWtiHH3VtsJ3FF0l2xAV+nFmiAeIWx9Oq//nUjWXRB+XbdOpDkxK
 iG0Y4RkNd+amnVogAc0Yr6mgx8CS+KJwVVShQhWTTBmT8lpBVI+zb/Lg0S321KJI45QUL
 cZXSIk6VXE/mpXo9pJfoniKtq3kcbE10B7jHAjB8UppSm/Qt1xZAiNgS2YOlBvgT0rlpL
 UZ+8C8C3H6a6N1GXCZNgiwjo52SnRUNDGVCpa5eK3shFvOVsXDpdxRp9qgb39tGE5tQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=iNt4XSuD; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::11"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C1ED40042
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 06:24:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 281CD200500;
 Thu, 22 Oct 2026 08:23:57 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Thu, 22 Oct 2026 08:23:57 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 22 Oct 2026 08:23:57 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20261022060218.752140-1-bernd@kuhls.net>
References: <20261022060218.752140-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.20
Message-ID: <8bdd24b5505cf81952931c38a57772fb@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] {toolchain,
 linux-headers}: add support for 7.3 headers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 22/10/2026 08:02, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
