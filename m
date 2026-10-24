Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED142606A31B
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SMpUD9lT
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F39DD80F7E;
	Sat, 24 Oct 2026 21:15:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F1ZDhAiJgWnx; Sat, 24 Oct 2026 21:15:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C95B080F72
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792876544;
	b=pwSCkdEi4dpDeaYI5kf2P3lLYlCL415jQqmLSE76ymR1oRqlmysrfAxvs8vYGPSdYkll
	 vOm1D/KLG5fXD2oTwHU4aBY91seGPkd1TNDE7CalT8fVBJwNDz4jF6Aq0KBLYmIpKnLo0
	 qv3AR6W+wo7F4TRmpWQQpGNOA9hMLazi/yt3GogpRtCXcqHTmjh4nzgFv0Nk3SqPUaen2
	 t9JGZXrXWaZlqvfnsPcbs4t4VGfB3ivnz9l885uZgUYWEoPyM+cldvLLiKAgt3qwE9BmY
	 8h4OKO54W/J1MdlmFiMN5ssyg7dYEwnC2jYzzgLW4maRB3o4xGVdAYKlpPbRa3Sx13Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792876544;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=2WB9QgmOaXV76gt3oN5zWM0aOKO8wOlma8VQ/rpo9Wk=;
	b=I9BKl5gn33mSk1kzfcBIvu/hcImmIz2ZId/rb/SB4W37ItwcohBRTva4eOQf828Cu/Be
	 Q0F4yhbRMkfOsVA/tgOGXQkjhqdwVb7P9MnRu8wRM6bmeHqxV9Upm3hH5kPROnImZP84f
	 BJswrwQjqtevxQeJVKVLi2BuWTmSdaO+ss2UVhIXfMaNAc7twJGhjRPD1igfrvpw2iJI3
	 Cvy87/aJuadrV3F8aA/PE9OnHl8byxhNdWRrS5Ru6AAo66ROLVON/rQ7Th4VulM8crBv0
	 7SdhC2XkPr+daRievuxNgJhGs5hhidw3ghykAWzNHMVBk+m2bGKu0ZnAQUuo2m0LahA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792876544;
	bh=2WB9QgmOaXV76gt3oN5zWM0aOKO8wOlma8VQ/rpo9Wk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SMpUD9lThVOwC5sGe5k1RnS1L7uwNBkIrz4krKZmvSQliNG2XNMASPBeqEWIuN+1d
	 cTWsCsk3Nw5N/LEL0AkPxeRFdtc8kHKq9jAfClb9PlC3tM2avXgT3z3o7AB4wtiqmc
	 QUACQlcuW7eZp8Xk/jBWjN2DFnYWjyFQvXx6T3CBxBBNTaF3ictiy7I0k6Fbqe1S4m
	 h0YqQlTRZZPEorUOWAEmAjvwTWSKRrsBnloyXfDu5qBw7/0CsEUr+isQAo8fXHIPYv
	 uuqSDCXih6I1QO2Jr8e/Gt4BC5o8dGcUhgn8lJY1+dA+/q1HaUa44CPp/8rIbOEB0I
	 tM2bQhtMclC4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C95B080F72;
	Sat, 24 Oct 2026 21:15:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FF79380
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2138C406BE
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:15:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wGgSlDknHkQE for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:15:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7EE8F406A0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792876541;
 b=jF8fenBw8mNOQNPdnXUDVRJ/W1hOvgBLmO7CkJbb4hk1gGUV5HRdJySnKOqmLtV4UWsc
 nZ23qiPnzNqI7l6jdIBsOojDlxbEEXBZjDVfWBmQGyiOEGSGA/g6rkPOxleAGm+tEhT8e
 SjNt7VfONm3zTgeg2mox0J8gn7lGLyGEm8AgYGad9bZh6g7rXDFlIu//UnBxPqBGPNmQG
 o/ECo49lIyyYgt6FVa45bDcclHVNTg+HEwJfir5JeeDJQ18Leh9rpF5hdqc+LSOFzDvoV
 WSjtzY2v6564VSyWexcSqtRagY4EPpTUi5nEosQHNUQ0CZOJtc3oD6BOtjrH+Y9NKaQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792876541;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=K20CdL4YT8Ro2To8uol6mIqFLB2YuSjiHUNI8z4v3Co=;
 b=pfuCmt12unS3UA1K1lTEMXMC2wxkAtWqSyhfdun5r8M1OJAV8JF7QACh3SkWD3b71F89
 5vfJ7ArZML65HnPBVWflvrrWmDCoSdxFtuogk385IsP4U2a1lksTS56baMKxIAZ9G0tNS
 Zd4DX6gpSQYYLoHDA1tjJmoKPFiTxFbZoTse+luKozb1vGM8IJ0jBMog7flNi2qcLHyAq
 AMBWTR14irmA9w9Nx67ua3ij6ZMM1MEUz/JXcEnJZGeujyk3AWDjpnxze9pyHGepv89Xj
 c9JMAu7YD+5j+DGeRhoDxGAv1Ow04jQ4Hn9BHOehWxtqLB1uykU5GR46zXUmFUqEF9g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Ezcw+rCA; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7EE8F406A0
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:15:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id E6AC2C6344F
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:16:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 69C0860769;
 Sat, 24 Oct 2026 21:15:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6A1C410328DD2; 
 Sat, 24 Oct 2026 23:15:37 +0200 (CEST)
Date: Sat, 24 Oct 2026 23:15:36 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <at0f9XP1vB7bIY15@windsurf>
References: <20261024191354.3287020-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261024191354.3287020-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: bump version to
 20261019
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

On Sat, Oct 24, 2026 at 09:13:54PM +0200, Bernd Kuhls wrote:
> Updated the hash of the WHENCE file, due to firmware additions and
> firmware changes, but no changes to the redistribution/licensing
> conditions.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
