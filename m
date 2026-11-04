Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17ED606C91E
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 20:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=B/qhxhZW
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86056605C9;
	Wed,  4 Nov 2026 20:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ekf5ATtMoTDJ; Wed,  4 Nov 2026 20:54:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2E0B860728
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793825649;
	b=TKBryJVBuOJxmB1qRUCC10RTcrol4G7YDgqm0EAI9/+zXn4WPHIRA3ZbbE3qd4vW7C9f
	 nUhY+1kEy/1gZ+aObIkJxxkZ/iIYxRUw4yiU/B/4gvn4E7IVsaNe2WKU/ljK2bIRnvPgU
	 WaGFzt3zI8b+1henhlRq25q7/VMjCvPCsNiIl2RFQ/rBD0ARv6yhwj8NFT0H2eUqOzAHI
	 zQgrrjgQ62SEPoLZ29B746mY5Rtolqhakuf8Cno2K8qCFJUttmmAtBu1mO6cn1nkAjJGZ
	 jzD0ZDmNBcuRCg7da6j9H5EuO6mnzOp5YI5sIrbcijYSMWa+lgHUZ8SR8j111Okutiw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793825649;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=CiROUpR2woTTwG/agtXUAZSDkb75LiH6ITUsskQgfVw=;
	b=rPozGc34Vh0t9YI7HHj1GnGmTIl/O8QQ6EpVpJbPVwfXgeZk+rFJugzqPIPWa7oVZ8UD
	 9aC2jb9UpH3HLWF3XOtXCHTyewON5WWCYLKA8iZZqZMwmcGYOAtv7RWRbz+zIb0gOF78Z
	 xbREUEKOx4xwNJbbplgPf69YGoeVmkSZ501YD7meRC6xS0kKbBEySeEiEV/LT6+7oWi90
	 Ef5vGKxy4dGytW15MyOyXCQk89CuJxI4cXBmAegiMi6u2OUfB3W4i/tLrfc+wTZ06bRvf
	 0EdNapYTFKImE1di3aGPaUcT/6NsSjjiHOkcusnGRYBu9KEj2sctaao3sy0QIs/dl0w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793825649;
	bh=CiROUpR2woTTwG/agtXUAZSDkb75LiH6ITUsskQgfVw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=B/qhxhZWax4nOjlmwX2XGcCx2TImgIup66jJStsLMZxthF7N2mn0UuDbxV7A7mdAp
	 iikdeS6iI7/v4LbdZi5uTRLCODHwVr8U7xzCoEVICIioenNme/RkuNrogr1mj/TMPh
	 /hw1nR63cbK51kVIUVdIq3azZQ0+gXM6t6/KiF8Vvy2Zk5cW9O8YNsLKIcJpmC2VII
	 YbWr8dD6zIbr0ZnumSv46hX1/Z+ykrCmCZtaqDTBomQIm3iKF2hB7qHcxg1IKtHj5j
	 1GxrX4CSyAAH4rGq/ua5AJyZzcSNfLkk+qhO/DdzG24vG8SlAm1sn/8cuFB+I/mzjv
	 /T+ccnMBl3rAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E0B860728;
	Wed,  4 Nov 2026 20:54:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3693631F
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 283C440217
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:54:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W5tdsD1BtioF for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 20:54:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3ECF94008E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3ECF94008E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:54:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id CC2C3C6914C
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:54:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A73EC5FAD2;
 Wed,  4 Nov 2026 20:54:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 36ECD10329245; Wed,  4 Nov 2026 21:53:58 +0100 (CET)
Date: Wed, 4 Nov 2026 21:53:58 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>
Message-ID: <auubMd7Istn2K-Ja@windsurf>
References: <20261104140941.2752868-1-angelo.compagnucci@gmail.com>
 <20261104140941.2752868-2-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261104140941.2752868-2-angelo.compagnucci@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/2] package/htpdate: remove package
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
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 03:09:41PM +0100, Angelo Compagnucci wrote:

> +config BR2_PACKAGE_HTPDATE
> +	bool "htpdate has been removed"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_HTTPDATE if BR2_USE_MMU

This "if BR2_USE_MMU" was not needed. BR2_PACKAGE_HTPDATE could anyway
already only be selected if BR2_USE_MMU=y, so there is no difference
here in terms of required options between BR2_PACKAGE_HTPDATE and
BR2_PACKAGE_HTTPDATE.

Applied with this minor change. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
