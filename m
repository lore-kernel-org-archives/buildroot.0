Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25BC606A31B
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 18:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=M3If2ege
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C3BE405AA;
	Sun, 25 Oct 2026 18:00:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DSdu9RUc9_L0; Sun, 25 Oct 2026 18:00:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B998A405A5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792951256;
	b=X3rZVT02Nx1GghsBzXbPjnlkHmjaXHnKKrDH0gIk5TE0WCaNm7Oy0+U560UlC2gnY2HI
	 nhjEXRCb3MZfX3WIkVll/LZhjqptIo1BfSFcAUf/01GysHRCKyfiksJFdf9TJWpgoDyyn
	 8n0FHEKm8AdxolWk4qPvkvFdfJ8pwFezGQqbi7tzWom88lXWXDJ5uWwrXwQ0zaiQTFwb6
	 g9MrZyJTDi3UKJjscNT1FiM0XjgAiO+scjBiQykxTLCsowtsHPnnAy20qUR3A3WGs5DuL
	 HDkzxtacwbcDCskbRum5pIuXFJbMb0m+ZfRbLWVzP5kX2iRTJDC81FTfyM0u0BVBlWw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792951256;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ECeeGkGEjRJ2bF0uKwY5sWxkIpY/Ws+GZHjxFhSUu94=;
	b=iZgPsDXGuvASlAcviWLmSQu7Ic3ohBCJSw5043DrvWlHcfXyOXFXomn4IhFZF/cJfHbt
	 UiixxBFLOUQRem7ThcFi4C1EnJ3SQlU5C61+0ybx++LS86lEWSLozMJCHiu7mpU8N8ZIG
	 zsuhb6tarLUcxrjbAWyfikLbBkp5On8vpZ+o7248x1hfHwdOZq0zC1nOwV0cN2Ic00MV7
	 Xtdllxk7Gx3SWiY/PV+yeVuXITroSqTyPjqeIzkmnXr5qgrzKQB2eiH7Dp+WX7zN1cEuB
	 jo6RlKtH/BXiiap4IA8KITilcZUEj673bMc3BCz/7ae6TizdJNZP53cRMNH4r3T7IIw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792951256;
	bh=ECeeGkGEjRJ2bF0uKwY5sWxkIpY/Ws+GZHjxFhSUu94=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=M3If2ege/qncclPkPp/C9uEeRrw4OnQv61T0WO4NAYGUd0bgKc4lppsIki/06Sicx
	 hluSpBN+jNOkLTps/kBYcywCsijPEISic5rVQIso6y0X7uASpG8UeSS/x48cF3GBg9
	 Q2IqUF4RjtXmI5IyWYlFHXEhUHLV2hGwIjidI/GNRs+CBRFVO2NrHg79ue6RqsroV9
	 +XAAlDvdDs2kevJweNZQGVkzAAbMxzwG19c+Rtk3R9y6PlBzZxS/mLCBpPWDctVPuD
	 9sDfsfRqQcnyliSMfKtNCzoUJ3xwo7kqYeiRdB6VhgNWB7eky/scqaaIa/eBjeO+Rn
	 Uh+qHjXrj18dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B998A405A5;
	Sun, 25 Oct 2026 18:00:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BA1B479F
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 18:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0971405A5
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 18:00:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aBzx3XHr-mmU for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 18:00:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9C915405A4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792951254;
 b=Kns049fDr3l11O5NIrdcg/KZ5wJXpx5G+RdgBZE3q89D6NrKFo399K+/T0iYGuAighKh
 1UVGbZ3CitZdFuLrG7dv1JiP7SNj7F5OM5HJVp+3y8hl96p+2GRpVvtyr4QFTTt29J/CK
 h7S0ZzyBQ8rOBYcMDOgwkbF9s3y+8Bt6MXlu5vOio4YCWsv/9Juu75XFD7EyriG04VzXf
 OTVUeMPPQWXFh4W0akSbxhtvYBh9GIKmSRL4db12b+eADrR+m4DA6SerTEgvnRoG+8KfI
 R0mqPrRb9X02QFlTWIAJwGMsll8OZWlVTwAZR+aHKaa1Pls78pJtnfPm2FxApiXk6Cg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792951254;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=SCmM9DDncPkzD/Li1kqwYD9PgkoPGLC+tAXmk+ycLz0=;
 b=Rw/znx4mL5sYSXV92uMZItS91pRaw8Haj/IiwDMrMTgrvJ8cvBAy+opC2sxd6ZhSsiuW
 E4Ya1lu2qkLV2XQ9LC0UR5m6JAhW5/yI55wxNfcD0mJmdDILeyKXmtLCnxPPa5Jte0ywS
 G0RrqbEUH7l0QJciC25ibY+y7PK0E+w3HPoBAoNmxoZNtQxXYg7pCMYva72oJhN/6CdtP
 tN4aAnulNxbqUg3Eiq787KnpOTv9Ky/j0bMZCCyJt1jxb9F8t4ZCoz7vL3tdcTxby9H6F
 Hfa8wbJgB7cG7Bkv4NKW2r76Xcox++Ojshd5ZFBI08r6gGlGpczF+1WNv3Uk/sz9jcg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=mnxMVACN; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C915405A4
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 18:00:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id CDC874E41308;
 Sun, 25 Oct 2026 18:00:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A16F160740;
 Sun, 25 Oct 2026 18:00:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BBC0410328E76; Sun, 25 Oct 2026 19:00:50 +0100 (CET)
Date: Sun, 25 Oct 2026 19:00:49 +0100
To: Andreas Ziegler <br025@umbiko.net>
Cc: buildroot@buildroot.org
Message-ID: <at5DqzNZnCORf3pF@windsurf>
References: <20261025104130.1580635-1-br025@umbiko.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261025104130.1580635-1-br025@umbiko.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/mpd: implement
 BR2_ENABLE_RUNTIME_DEBUG
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
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 25, 2026 at 11:41:28AM +0100, Andreas Ziegler wrote:
> MPD started during version 0.19 (2015) to insert runtime debug
> statements into the codebase. These are enclosed in preprocessor
> instructions:
> 
>   #ifndef NDEBUG
>   #endif
> 
> Fix the MPD build to observe the BR2_ENABLE_RUNTIME_DEBUG option. 
> 
> Signed-off-by: Andreas Ziegler <br025@umbiko.net>

Series applied, thanks! To be honest, I wasn't quite sure about PATCH
1/2, because I couldn't find any documentation about this NDEBUG
define, but I assume you're familiar with the mpd code base :-)

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
