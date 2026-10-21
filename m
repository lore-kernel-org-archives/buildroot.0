Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03D7606A31B
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 20:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nzQlK6BX
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B91A540E84;
	Wed, 21 Oct 2026 20:07:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AP9C53vlGCk8; Wed, 21 Oct 2026 20:07:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CB97140E51
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792613224;
	b=JhS8MXOXz69M4CsugvRuW9O9UhoZ06XLmoa5QGROB5XGVCnedQYgyur6R05Jcc3JyTF0
	 3IyylRM7PTk0wd2Q1KhXveWDcr44HhYFCGoNGCHdrHoNQFuZ+LAXzMeLP0RhrEsJuL6gT
	 FySgD6yZdOVlobwCpkflyhDcZdEdSci8rCmR3vecnsfKHO1k5p7nHcUT1yY6T5OeUAEuc
	 cBWxY4BU8OIRucUg7SsipWIviJ69r/DL2DSvabsN4jeiw00nC5eSonuptThEEQR/hoAC8
	 1oo+wHaTolwCvQwQkw0Ac0J3SBMr31eEmAU2wISo500+Xy4fZHFxEwEB+ErgNSXhQgQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792613224;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=5JDS+eGIQ8Q2Tn1bHzYel5ND8znO6fCEBUdmc2vYyDw=;
	b=HQzsSvq9VrvpPwhCtXrYz96Zy0XVFe37tqgN/Ct60dfqdY1mJSS+Pb1Bkf75Sgdumma9
	 CSMlUwKZRc12mIlmTj2DPJXm9C6yNRxDAnphHOdFaZdKwRfhgffL0sbWCpz8Ra3KC3uE1
	 ZpXW9tBuqiSHQtuI1tUdmfbN2Nly2n1MXa6MoUMYQHgY42TO6pN8HZUCEKfS9yMBlyQqB
	 tzox/+/I3G5Ryb6Z7+mBT3a7xQfoKJdLmGEysXWHgwF7sRgHDw+4fhd0AGlQ/YE0BqCHz
	 Ai/2/wTmVv9f9G6wps2YXUioTsBSw7u1xwBKO0+aquy8AVEh0l+WzwAXWNnCPOmBIsw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792613224;
	bh=5JDS+eGIQ8Q2Tn1bHzYel5ND8znO6fCEBUdmc2vYyDw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nzQlK6BX2vLbT0Si6lCmEHqrZ17P6zhKk4rKaTj0CAtTTriVdBRh37vrE2LsCI6jg
	 eCPMJeqWEySW7fyqQcIRBY/TrsVwf7N2TNrdFg666ZJx5qsl/xIgyoC8F/9i1taVwe
	 UHTR8Q8uyjgB3LOc4w1pKBYc36IEekrb5V2MWB22NeidXoDS4fS6s72+TzFNGWF5FF
	 vIioSR1UBd5llQXm7AOTM01HdsOgutUlG//4fxJ0WIqI5KFkSxMOX617nRqj4HTisU
	 sGmvAR+XpqC23crHeBmcqOVDAwPX8bvAMCGhlC6aOTuUd0eyvBoWNBzXmcU9yq/b5N
	 X8P+bEtWPMTQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB97140E51;
	Wed, 21 Oct 2026 20:07:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B2EE33C1
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 995CD4016D
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:07:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5WsT3dt3fXyi for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 20:07:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 28AA140042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792613221;
 b=fMO3UR77IOahvLdvlSyMxM68OSGQNqh49SO0U2iH46YnKL2cHDdtymSiIqsdzLIt9nPl
 aWRYusuXmHguZJWUUOB3q6DjRycMwrQjtXKzP0aggady9wr0P7ZQNS3/8A09XkM/C0qrg
 J5PPVvmmPWKOfrVyIp4oY/c/PtALAuDZIxP+no9styn6tqRbOjoCoZtov6Joz+OIyE0Rh
 1O3WIkzbbiEsSKvhESbKDmQ84Ycu8S3AsyqYrmEnwdwTj+UZST82PpfcIvKS0HaKhctjs
 6fFRORXyGJUBLlxxM+AHLV5bcvHaymzseoOZJOxaWyYHlj3IXZrtoIwz6yF+L8tWcmA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792613221;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=ctXFApJP3E1bzFWI61ffY13yrvq0qDqF7Y0rZlisNbg=;
 b=Et7lNCcCR49ftJM9V5YyhL0MkStM96RbPpuPVc1cqANw9gZlmYR6gGO9zX8LsFHvXgWq
 6LIDQfL+mHevhQfp4oLPZ+DK1rtrhmS3wkP1+sHjFpR/tTASqJcovXnFRaEMZAqf3AYQM
 9UzOACaxU0l1qiVh3xaz2AET5e+4ZT13DG3xVpS5mfUM0JR+d5ObPHqMN65SOai1JopCO
 6+zwxekh+wQGmCK2jsdrvIW35eoQ9tBSD/hjHaGNQL/wQA6SurOk6hFownHi3RDAShUXb
 UMqpa8U7gzmAxh9LfOqf7J5szut4Rw9NwuStMldzaLlUaOWkUNXLO23wjhouGpZyeKQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=wR2Udl0E; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 28AA140042
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:07:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 5D5664E41296
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:06:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2A45C606E3;
 Wed, 21 Oct 2026 20:06:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 17E3910328DD2; 
 Wed, 21 Oct 2026 22:06:53 +0200 (CEST)
Date: Wed, 21 Oct 2026 22:06:53 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>
Message-ID: <atkbIM2X44OCSixP@windsurf>
References: <20261020102906.1918308-1-peter@korsgaard.com>
 <20261020102906.1918308-4-peter@korsgaard.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261020102906.1918308-4-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 4/7] configs/imx93frdm_defconfig: new
 defconfig
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 12:28:58PM +0200, Peter Korsgaard wrote:
> The i.MX93 FRDM board is quite nicely supported in mainline, so add a
> defconfig using the latest mainline U-Boot/TF-A/Linux releases as an
> alternative to the vendor BSP used by freescale_imx93frdm_defconfig.
> 
> Mainline U-Boot uses binman to assemble the flash.bin boot image, so we do
> not need the imx9-bootloader-prepare.sh post-image script.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  DEVELOPERS                                    |  1 +
>  .../arm-trusted-firmware.hash                 |  1 +
>  .../imx93frdm/patches/linux/linux.hash        |  2 +
>  .../imx93frdm/patches/uboot/uboot.hash        |  1 +
>  configs/imx93frdm_defconfig                   | 46 +++++++++++++++++++
>  5 files changed, 51 insertions(+)
>  create mode 100644 configs/imx93frdm_defconfig

Don't we try to have a readme.txt file for each defconfig?

We already have board/freescale/imx93frdm/readme.txt that covers the
freescale_imx93frdm_defconfig. Should this readme.txt simply be
extended/updated to cover both the "vendor" defconfig and the
"upstream" defconfig?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
