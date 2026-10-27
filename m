Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6C1606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 20:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nje2Xg7s
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27159406E4;
	Tue, 27 Oct 2026 20:03:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1MhSw2eawMVx; Tue, 27 Oct 2026 20:03:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F0DF640707
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793131420;
	b=FS9GnWpVhznpyFt35PoWKrssdZjoXUlz7ClXnBEayK2Juwm6/CnHazaOeBG1BLkY9Pfk
	 0Wkk5FDpiAsEAYCSF/DVOW1VJZYPqD+pkL9iBuirpBhHtYaMDdy1hSs3tU/ts5uVtHSHS
	 LRM2oQTLH190xS3KG7++CGJH2MsqdTesOChHUL9adt8jv6EBfHNkJCXMxEix5FuRHYFWv
	 C4Xq/SG3xQ+cYtZetpLRh7dA0NGjuSY2T7Ru7X6UnfwYSPCNRCUgM/AJq2DCCApYn8duL
	 kW1fVl4sjbUB0wVWjDcznyXQMtk+NuGp86jiKopuXvZOiHDGT6MKu1Nt+AKN4OhnJ/w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793131420;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=jVug4ZLP1kwLW6qTlJ+Wt4hvEox6g03CuoapRNnXFTo=;
	b=QMfMW9n/E7C1v74WJ1ERm/ZjrSFKpDSFXC4t36N/zHmFn1FlduO5BFhlPSz2yBZPXjNT
	 6toxAJjilposzH5idcGCFlG8B7A+ctqaHEeI4qnna1Ga28k7PxJBDL2AMsjEoJ/PDp/S9
	 1WDSg6Uu3jDuXsghYDf34aINl/hZpyqPVoyWdaq2qNjngEZdB78btJMyRDJSEmMNdsrpu
	 vDa0Y+AKVxoaBTQbaKF1rYj07JURu8TOS2OYVFIsQHKbvDofcaYCc6mXycLZgKqv1fw4g
	 jE4ZWT1U+M2kM0MkxweVOtq0l2j/7PhRheMHoak1wIx5bQP3aDNFnj86p6bT9GofXsw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793131420;
	bh=jVug4ZLP1kwLW6qTlJ+Wt4hvEox6g03CuoapRNnXFTo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nje2Xg7scunU1Sz6CcbXmJsArcpGgEWFDy4adYLfSGcI/ESiwuKLjVOEWmXx7OOib
	 RGF6v+U1t7fbZjXhUqr9WlLgbXSQZZForTlpIkcPLePqnfRjVKtfx+jTM9/rl8CXCO
	 xJgneJwuparA3ZiphEEjykNoBviug6LEkrnYmu5M3dVVtmqKfVVHOEETuepb08Mcyv
	 PdyDnb1JK56xxER8OkJNOf4EdnhXXWo2Sykl2A4F+T5WqcE4Gzxru4BjJvdvlKzGih
	 GapiZ8Hwqym1nX7eP52pIReJD5M96G57Fs8BQtJ6uSIWC3hnspSUxIXPB7otvmgwUt
	 LYRn2okKWXsJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0DF640707;
	Tue, 27 Oct 2026 20:03:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EF26A279
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECFD66061D
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:03:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aty8bY5dSVUR for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 20:03:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2188C60681
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793131417;
 b=PX1JJ8fXFzA8xkR1K6lU5iU2JImQ9+xrSGCGrCpQ6SGaWK0jSIfwKg0KnwUXu0UHf9eN
 itp1cV/OCzYsprifmf/qtanaDfoe1SPYxWRFyQYHBTjThy3XJdXQQSZUoIohCt8D3qIMh
 Pf5dxZ+p7PXnZ/7wpWXIS72//T8ajhxTfgQL3vdHbhBfXYlhLcZT8uY2etWTgiFltJ2Su
 CLfBZEyGSvDafBZuTtzOm/t2JI40NUj5DnwVyRDvSFn9v7cFMTHznyzFO0dl9+8CLakiH
 S04OY8EVyhfBbXqK455grpmqYDUkQrXiB9UDb9x0yYVoo1johW5telVSO9nd3LfbASA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793131417;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=L8ux7m+TbGOCWazSGdo9hXlTAlxf7FLIU2o9DhejJQE=;
 b=DyPTxqq4OGgh1916faaFMj41tGGtiwS1defc4nDVhwrKm32Lru9fP0PCFIJCQwvIcHGq
 u5gi52oUUeXWK8VU6m6AGqYb+hQJS49BkBUgy0wkaWn1RtqMJtcWeoWU2YfPHP2zKApvy
 TZ+jy0gZkwDrAxG5Rg4G5hJxQOWLY5bLX9O0ZfpPQ/xNI5HzI3EkQGYtIBSP7yG0UWYT0
 /dZAq0YHSiVsMcMuWgk4ZgQpUCprlqu4WnOPzry8w2NqqegHzfmaDPpBWfZZ9i3DPK6wq
 MxIdogN4xS/p9ufVouixXaxImfbn1a69WbNsS/OOtowJpHsOux+hzBrm7492BKK8lGQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=RP2Gb9yH; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2188C60681
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:03:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D2FB24E41336
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:03:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8A75A603BD;
 Tue, 27 Oct 2026 20:03:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 886261032907F; Tue, 27 Oct 2026 21:03:29 +0100 (CET)
Date: Tue, 27 Oct 2026 21:03:29 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
Message-ID: <auEDjYKWiNJ7rCVl@windsurf>
References: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
 <20261027164013.1602502-9-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261027164013.1602502-9-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 09/14] board/mender: change device type
 to compatible-types
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

On Tue, Oct 27, 2026 at 05:40:06PM +0100, Adam Duskett wrote:
> Newer versions of mender-artifact echo deprecation warnings when using
> the --device-type argument and tell users to use --compatible-types.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

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
