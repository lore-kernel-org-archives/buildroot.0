Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF23606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 18:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=T58MBMmw
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E444407C4;
	Sat, 24 Oct 2026 18:12:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xKwm1UP752Oy; Sat, 24 Oct 2026 18:12:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 211D640787
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792865542;
	b=ozSeLNxDIUoAiaSH2HBKdXEBajn1hoCQ9iP5IPPJq1Z9kOTR4y4WYIHWR2WJwMv6Ha1X
	 7qYx78wJzgfTt98sS7UNM6yxRkXXki2XJsnR+yAZTwEa2HsVKeZLBNLrA6ncYxLdht//h
	 SY8j6rgLsRb0YQoqzuVQMjXpyJ60moR6uuakv2/vuapP78hQHg1jMGK2fYd32C643RH+z
	 2rA5vnX9u7A8toWSn1+Bqg+uGJcrD/Icu6zdGfjsnxICnwtkckP+a7mrh4dhQiq5CjVJz
	 43WeAEIPQkHrp5DRjFw6Qgly0EcCD2oxiSltZ+D8Xi+r2d8d/mLRjyGGRleMEsByzcQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792865542;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=EOohC7kEv9PqFLgowkTK0hYw22d9Zpaxn6Dd4msQwM0=;
	b=Xx2OpQHBjy+raS85qZJf8beC9EeAsnH3+/6cX90PKjiJvoY5fElOmoPSafo6PuAg1IN2
	 iA5XETm9P7hNKe4iCK7XVTeSVB0/g7FFQSzGh2JfjSoLsV33qsLpMw2EhTsMNYdUPT8oW
	 P+TqH7k6u8jEo/frSEUWbuRjsYfICx27TPsKNt1trjFiI2VJKWJ61/TR5Odfan9daiD7Z
	 wNDEOCejIhtVeWyc0rCYhT+ZddaLg19Q9vmeHa/YS2aCRxoOM6AFUQMXPWunKyYCNO8UZ
	 Gh5jDffe1yZU3z82XyGphbOVOj8XDblh55+YsOQWuJcwrwp5wSULVrnnwc6lqHQalbA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792865542;
	bh=EOohC7kEv9PqFLgowkTK0hYw22d9Zpaxn6Dd4msQwM0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=T58MBMmwllgcP0Cm5wZUsqNHfjmaU8VOnJCWrpwoKKfkHErI7s2TjHIjT7u2IIEiT
	 4nzyWrXNAfVju2TnwpTHTWQbMPbjM3QnaZhdd/4twXozm1RjhkLK0Jv83xPlWPzMYs
	 xNElZGvEwo8Fuqfc6UiiHrasSdVut4LlzGwUla30Y0PDfejU7rtX2StvBGOEh3Zm40
	 6HPQKg+c2/iqFuFpRIRFk1BRpO2eOR3EyXcanas4xfolpua8SoKHgFm05eLTTOy1QE
	 HUFQYRMQk5/908g+5AG5lb71JQRT8fbNQZZzlQJO+Zonkkn3DoS4UirdwhJCM+GZAR
	 FKRM8ffYEQAqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 211D640787;
	Sat, 24 Oct 2026 18:12:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 539814D1
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 399674009F
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:12:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BisAi6MwGOG1 for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 18:12:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 29BD440049
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792865540;
 b=Y+D5wL5bcvokHGBd5sxbxdViuu/I/lcCaYgfICSa/ft04L3MrsT4p07gYZJXhbjqsfOS
 c/FDng+vAxgQrTyQusbe0WyO5XbobiwQExzpv13h7/llIdrvRyMCkQyZ+easYlg53f/Sc
 c4dxAkxDeOunrG/biXuUsXtVfj8LyUgMIpeH9P9juzcUZzt7ZmXdrwsOviN1Yf+BoqBfi
 SbXAA26wmtMGl+sjXI7KbYkJPfmSZpUld1PUaDiGqB+kX1lzRyESWTrpp3WUlS+9EebA8
 LppB0K19zfZaFqViGF49BPn8mO8IO2Io+HGBP4cyHJKKhn+3ekgrrZ9Mo/R648MjE0g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792865540;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=xL06P8vy9uNsOdxca6cs85ALx1n2nw+yZz7j02fR8X8=;
 b=qQTPL3+IspGCuqS7GJ2UyEhf2N8SeqZc5ZkUoe6Bgw9KIU4cbFGm7PIxU+uiZ/y8uocg
 ToqVJgaM0m8lwaRTTbU4JPcANzXxGNpTRzmAIxHxefxeWTsuhSkFtHB9oVzLiZf3lvGbc
 zru92RznjWlaZ0wgZcMgl7p3utyiQINMts1EekLhT3hP+g5YDpPZ4lCexU9XOhiU+BQwc
 e62E2UedCP6CthL/elc0umdSjoGxSCMlN2P6lHCz6IkYWmsXo1VlnX2a42OHMThyB+lGB
 rNa6PQzyqbobFTLhAtS5fgXBp2CztckRfLTokKAr/M7fZXD8HbtdargOGuZZpy3AQRA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=bLqPK6AU; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::11"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29BD440049
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:12:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 8C3AB2003C8;
 Sat, 24 Oct 2026 20:12:16 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 24 Oct 2026 20:12:16 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 24 Oct 2026 20:12:16 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261003033954.462113-2-james.hilliard1@gmail.com>
References: <20261003033954.462113-1-james.hilliard1@gmail.com>
 <20261003033954.462113-2-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <76ffbee1b97bb433902b1651bc737f21@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 2/3] package/python-hpack: bump to version
 4.2.0
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

On 03/10/2026 05:39, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Patch 2 and 3 applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
