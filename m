Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54773606A31A
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 21:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JseYExhv
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30AFC80F9E;
	Mon, 19 Oct 2026 21:50:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jqRDNdVFmWkv; Mon, 19 Oct 2026 21:50:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4180080C8E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792446610;
	b=N6GaKBzsFcizdMe6xLfRbIotslC+QYsd+zZtD7gU+xrrIxnBwt9YtVLd9Xv6G/PI7jQN
	 IMRBnFoJMzudD0ZNFW8ZrN2y1XC5h2pud1JddqkjJTwIlandeIOeoexCWeCb7uA0Fm0NL
	 bcLQ55b9LpwZ5kdWegubXSFBJ0/w19xMFDYdeNLDv+y47EkhyT96GYqMewnPv7ZX5UA2R
	 QYuGvAjFOjhCqDHNpv3m6f7LEVc9YaMVAvj0PxHJEdSblJgVYN7MGfv4pZClnyvUqKu+f
	 jGq6B1NDWStBYZh/DmtZzWodNe2mAu9g9MR+ohDhJtEj11D8Xm1TYPxXeV0zLlVud5Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792446610;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=qj2635LMXLOb2Ur51gZBnWY7m8cLUxAY8mv8aCLM0GY=;
	b=DXcXDYtGgpgVW0eRoLmHeC+HO/FeP1OayGwzwdwcarBx9AUYJA9qNbevDkjC/35uIeR2
	 4XW4YrkLoJa6wshGib+AUEwu89wtI5e1nBg+fHv6GlAVOryjPJH9A6GWs/32MVJr0f9aj
	 EOwCfl52WP7dQrXkqfV7AfqQApiqqyVO96hICLBq2abi0D8SMSd3rTNmanRchuW8X5ol4
	 tyYaimOHfujetqUnDdl45InvqXjw4TQPF+WKDwlAdeYKWt1ZqQ7JaTnSFf3q3BvyguIBI
	 iz/VYnDvmGeeHPlyLpj45Xf8CgyP8tsni7pndItj6ynNyJw41Nd/GZ/8YukL/f693Qw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792446610;
	bh=qj2635LMXLOb2Ur51gZBnWY7m8cLUxAY8mv8aCLM0GY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JseYExhvw+RaKDn44RT6Oi3Z57QCl/XSjcFMeHURUmVU1wA09F9ltYt6E06lO1t0h
	 KURzxLdJgrF7qiIapdym7kZ9vqHWHPMFBnH1i24GgAEATC9Tmm2tvqi7lP7MjjajBP
	 /pbZqke8B1SggpjKiSriqitNNfo5Px51Jp2zDw9S8oMJ38AfXsAamBVZt3fRmMYyzi
	 4xJJWw0ZRbvdOBhef8NrO7ow8aSs1ZjyAqF47xEqo4WG7EuU0lG450n1WBbMyB0USg
	 PfrjWQ29eqktikipL42Jl56pZ5Erv7wYnZv3oMKWlWrAkWpJoO9i/VzbGzPCuxutL1
	 pe6t0/ikWE1MA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4180080C8E;
	Mon, 19 Oct 2026 21:50:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 957CB23F
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92A2560792
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:50:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m7vZDUjHRqlc for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 21:50:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9779E60790
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792446607;
 b=Psvq1jKRsld1NJBEkbbIxCPB7x5XYiBXrcqIgwhkiz0G7kOuvbO9YEc7FMZttYwr9Egh
 Nwip2RbQRqhpKuxVYDcqha377JLC1QFroV0gGyPcWP6zArU8Pus3O0TpAz9VPdLk01kuz
 A3ZkNVVK3sey+uqCQt1eqwq/iOfGapsDNY0V+6RnKc/MrVF2XRjhPvEHkSkscnAWu/4EE
 rI4I1OiTy3E9QTCx9cQ/5ojn+NUrbX1NNu3ovAwTIt23IKejHf6JI2zJ6dJjWso2HWBZf
 8QP4Vaf0aq4oTPXtOFkxOfEio9UmTClYcUyoUoYBtan8gf9Gm2PIn4ChRk3CVPj/s/g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792446607;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=HWtGNwUYEjh1NVSA7/bHa5pUIN2I4AEUTygs2PMWVMI=;
 b=Xp9Oy9eyI9mtLHKwjY34gI1z3VCCU3ME8vLW1Wco0BBwy1qjsF2/Kq1fp/pN1DANACm+
 g2MheX44WpSrnE/64gII2BDZJ/NTTU9VEfM/zqk0RVrsicmtb49MWvcDSrKky8vse+pB6
 lCxLMAGxdwis2B1VnCD/rE5bjB8wY9RnPhR5cmRcj1PdCsCyFVpF/zothiEUADFwYOAPn
 AQJu3zHZ6B5ndYR+xY0qJGVkHmCekjgHDsTFBU+S5YhKJr+Bj5x7MQc5OxpTexJ7oejm0
 azss/wiW1f953OF+R8/L9enJ6KaQbeGcOgRsYZWoZd1xdZPsUikvWZRveRybK+q9Oag==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Q+SXDbRt; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9779E60790
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:50:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 118E11A124D;
 Mon, 19 Oct 2026 21:50:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D91E360582;
 Mon, 19 Oct 2026 21:50:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D19CD10328C52; 
 Mon, 19 Oct 2026 23:49:59 +0200 (CEST)
Date: Mon, 19 Oct 2026 23:49:59 +0200
To: Alsey Coleman Miller <alseycmiller@gmail.com>
Cc: buildroot@buildroot.org, Michael Fischer <mf@go-sys.de>
Message-ID: <ataQXJKOwbJ9orCu@windsurf>
References: <20260816191830.533747-1-alseycmiller@gmail.com>
 <20260816191830.533747-6-alseycmiller@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260816191830.533747-6-alseycmiller@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 5/8] package/sdl3_ttf: do not build the
 samples or install man pages
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Aug 16, 2026 at 03:18:27PM -0400, Alsey Coleman Miller wrote:
> SDLTTF_SAMPLES builds example programs that are not installed, and
> SDLTTF_INSTALL_MAN puts man pages on the target that Buildroot removes
> again. STRICT makes the build fail on a missing dependency rather than
> quietly dropping the feature it belongs to.
> 
> Also state SDLTTF_HARFBUZZ=OFF in the branch where harfbuzz is absent
> instead of relying on the default set above it, so both halves of the
> condition read the same way.
> 
> Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>

This patch did several unrelated things in the same commit, so I split
it up into several commits:

f9e468d6bb6556933fce7e9ac2dad35ed9fdc42f package/sdl3_ttf: put -DSDLTTF_HARFBUZZ=OFF where it belongs
b636e15bce8e3795c117d2dd57d43b25e2023733 package/sdl3_ttf: disable samples and man pages
6588d61513f8eccf8c9a1eae6185a286d47ece42 package/sdl3_ttf: be strict about dependencies

Thanks!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
