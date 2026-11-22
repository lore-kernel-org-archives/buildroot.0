Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1DD606A320
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 11:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pQYdCDJ9
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FABC80E1A;
	Sun, 22 Nov 2026 11:15:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iiQyDOZMAvMS; Sun, 22 Nov 2026 11:15:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C03DF80E0C
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795346107;
	b=ctHr6vKieYLEb1SurY7vxl6vFypko/xDUWvMW7hpo5+Zm0u+9VI6oo9HFA49O5z3c0qF
	 C4yLlkE0cgr1gV41LnG/tGgH8AqpEEUyH0XkfHQx8SLupwdNEaVzMIEuwSjVdisdre6gO
	 0zhIkxrhOcmh4Ai9XyVBr5Ram6D3yVYy3X2AKTBs1GQBx924S/O67emToxRdWe/Qhjkn5
	 qtnEjOomhe+tV6Y1Ri6rmfxiGqtZQ7kJyOdGOruogSWBV199JNvzSvsyjYDRtuq4sI4Hd
	 VfLxUBk6MfIxS0zfMEN5LeTYvEOgmdq0Kz2EC35lQodPQWrpaVUalAZO/BbpcmhNjxQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795346107;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=afDebdoq1GPs2Ac9q4bbLNyK8+6ygN9b1p2xTjJr/ZQ=;
	b=FY/IWzEtf+lyGRjns/e/U2jFEWor1YP4uUz2Bv4ajrXZMAUFF3FICw3LRnoX+pzxkMS/
	 pKOwLGAotfUun3Np6+CD18VcR3iknms3KTti7QhtbNhvAjU9HwmGyIq5y7YCbt3c7ohjr
	 pT8MFXWq9HlZlR+qBTiQxWw9tTkODT18eu/ndNiAq6zyMA5NFw863yjzmhGUu5oJrM5T7
	 YZGjh6Q0CANz8tVzCoW3QmeGyZ8m9dUCMhcg/U5DUxklqxoPI0w5nyX18ddmcgVF2tSjw
	 OX/XWyufMh/32MOg8xPTY4DwelEZr1DHKlkGB2KJqlH0UiD3OPDFTJCdrRwHwh30Q7A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795346107;
	bh=afDebdoq1GPs2Ac9q4bbLNyK8+6ygN9b1p2xTjJr/ZQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pQYdCDJ9d/PeWd13PPJWGQmuoQxhlqZT5V9QogNb8JYqrHUlfb8QvH68ro7iCawZN
	 s69jAAIGU5kHNGP4CkuoCA7a1I0cXuazjHVRpYoKcH3MDNgbZRdSfAEDCrlUecafE2
	 SZjuHxBsYVqUUE0a5XDpCtQosqE0AGFPQ3AQJxXHX9Z9wC2503ApX+fTcqU8Ynr0ac
	 4GqhidwlrZDOeKuFUlS6wZYXFcUzXzc76TwuzRDZJ+RNF8EH4wWr0GaZahTeIWTvVC
	 XYYHmI80Pp941y04/sQ9+FWFE4kqxfZP/Ls91eTeKa4OB2iHzDkAyBUrDzrUyXpow4
	 EY1UWnYooW5Xg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C03DF80E0C;
	Sun, 22 Nov 2026 11:15:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2425222B
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 11:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15C714059B
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 11:15:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lNvdsVm0hYof for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 11:15:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B13FE40576
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B13FE40576
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 11:15:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 7BEAD19F59C;
 Sun, 22 Nov 2026 12:14:58 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Sun, 22 Nov 2026 12:14:58 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 22 Nov 2026 12:14:58 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>
In-Reply-To: <20261121200918.130286-1-bernd@kuhls.net>
References: <20261121200918.130286-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.21
Message-ID: <6eb594e8b029410c187ea52dae4c1680@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH/next 1/3] package/docker-cli: bump version
 to 29.10.0
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

On 21/11/2026 21:09, Bernd Kuhls wrote:
> https://docs.docker.com/engine/release-notes/29#29100
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
