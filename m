Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA04606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 08:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=k9/7vr9Y
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B54960649;
	Mon, 26 Oct 2026 08:10:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zALzzfaC1qsI; Mon, 26 Oct 2026 08:10:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 92E12605FC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793002251;
	b=oixgH77rnNjcQbQh0QEwNGrmqEe0eMmXmtX+efD0NBsbw4K+dUMnP7IfG4IOr9EAtOlz
	 cC9cs9+0wJ2xUANBMxaYqexdyc/jFyzmMGOmbbae7ZehluTBWqNceHvOzGc0wzXo49DU/
	 vnnRj6jQ/aYkUlEUvgjU48QLFV5fbDfvDtUIerGiOYlkxvGJ/x4L0kBX7f6QNorQSFhvD
	 kVY5I+QC/l4IUq7zKtZ5eOHrTLDhYMQb5xk79sEvJJVIcCpcJ6xsgulPZ+ID7s0J448ry
	 Luz227J7ebfW00O2o3GkChxm1vdlw7EqufDoOE/zIDaoseMZTjiuQYASFuvZGBr8bSQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793002251;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=9HsGSzh+iRm4ICBRbT8YVZBGPxEcwGcQXdWLmK/f5wo=;
	b=GuhA93vSRPnbi2Fa1mk2Y42Y9nPbqAC4NbkcIyqRAizPPaMGV+YP6bFdaznmpUCdVUsY
	 Asl22yYCkBUWehjY/fYaoT7JXF5BXQwQ9BAWFxJ8occWHMfs3f7Vq/Qz+zFMMozfkTTgK
	 sSl94nZFYEfKDzdqrcTE2ltkSI6CC3EUNFTK4Py5BUx5OnobSYH6uzsgEZ+ZY0r9UqBMC
	 kkVv9LaL7uO9dFxTX3FyPWvtl9FITNpxRoYG5EvvpgnCpLYiLs0C/EeVofilEW6dnDRiY
	 7w6fkzS3J/1RwLmyK+AamyHE2J7JiQDbuRurUCwTFea5SWW/efTBf/lwio/ERwVaUCg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793002251;
	bh=9HsGSzh+iRm4ICBRbT8YVZBGPxEcwGcQXdWLmK/f5wo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=k9/7vr9Yv+jdEavo54wWKqsdVCLl/Q9zVIJUdp1jU8DNpgIFXsXGhemRAt3FT2uS2
	 cpm80tvVeVwH3gp+0fEmT+AxEKy0xSJh8w/XLash5O3bAJdumduLrFaSqF9GcD5Sh9
	 5RyxvjZfSjZO09Hny7cYWju/P29Envy8GOT00rtl9Cw4q7m92WHfGdAmELqRKsQ4Hr
	 lqzq2u0QGV8BcAYR4ypCcicBUJnSLQLux4TGEEeXvomF0TVcun2A6kuXpRSw+53/gK
	 JUukRemQmAI2BS8EzlJk6hcypscKQXMt+zk5vVAG3NWcLvafMgfHt9UHfi+R4+Laz0
	 Wp92+xu517G6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92E12605FC;
	Mon, 26 Oct 2026 08:10:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 46B56235
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 08:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3864080DA7
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 08:10:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bt-2PzgsaANh for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 08:10:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A5A3380DA4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793002249;
 b=eQ5ojvYvoiN6yN8zQDCzTHnjiI9IhY8g2aGZ+ZxtoNup6iAQm4AN8muNfHfgxbcyOcuQ
 2PhbiSc1AvfoGBZoUK20BFsZqj/JJAaFaqSijI5yLmlGkhh8W4MTWnBWhM3yLRuAEcM/C
 x7qS9rjJhPDFUumKvvHfHDOUQy+kcEpFvkzaWw1QKZc/C8TnMnRXmXFHDX8779E4Oy9kA
 cbEqP91tU3owLnZaereP1PQk8VO4JFsrW+JMmsFd1pcx/OSHl56j8vtaBcSv4VrOyhZMc
 6J5b1Mv7WeZ92Jgq02oqu0mKlmuFIy26j/hylh5ZLgyDY1MEuNQUcvU6IocRemkS7eA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793002249;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=+TV3ZxjKjBDF2A0mpfVjui0LC0fu7goIQgz6dCobbZU=;
 b=VwIs0cxesPT5eyLgKpJBD7zTcCivXw/SShiyeNe7JVfh7wf6RvALV8wAOdhOK23FGKUI
 vdBHdzkKN5UCwSB5zD/YrGalxRz4+NJBfexzRpQ4GDcEM1WaWlv3RdTohKsMMINpcs0mB
 8jpxaHhasiSkX2BzEjMAup9CxgpSfoKU4ER+jwiAkzO9s6SDBfXPm6fmZ/kofDffzEEV4
 ziBsnmaF2gK/cg+4IDxNX1xLK2DRn/qrAWHOtGSx7u8z6rGYcPAFU8zVdwVN75fN2d+s7
 TOcVm9SZGKGefVJYn2/WJMLv73DP+4Dgf1DYsoGZnl9AdeDqbtN3NyQ8HHyzZHCkLmw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Ynp8ZkP2; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A5A3380DA4
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 08:10:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 5D8A91A132D;
 Mon, 26 Oct 2026 08:10:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 29A5F60740;
 Mon, 26 Oct 2026 08:10:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4B4F810329035; Mon, 26 Oct 2026 09:10:44 +0100 (CET)
Date: Mon, 26 Oct 2026 09:10:42 +0100
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <at8K_lNEvx9Lr4r8@windsurf>
References: <at7qe0JsJabHWlDV@waldemar-brodkorb.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <at7qe0JsJabHWlDV@waldemar-brodkorb.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/chawan: bump to 0.5.1
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

On Mon, Oct 26, 2026 at 06:51:55AM +0100, Waldemar Brodkorb wrote:
> For a Changelog see:
> https://chawan.net/news/chawan-0-5-1.html
> https://chawan.net/news/chawan-0-5-0.html
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

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
