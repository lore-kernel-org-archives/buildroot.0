Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92924C5AE59
	for <buildroot@archiver.kernel.org>; Tue,  3 Jun 2025 06:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 531318133E;
	Tue,  3 Jun 2025 06:22:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JYI3AUZga5NB; Tue,  3 Jun 2025 06:22:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76D1283385
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76D1283385;
	Tue,  3 Jun 2025 06:22:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CF97315F
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C018A813BA
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:22:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dRZgQHHIrmvT for <buildroot@buildroot.org>;
 Tue,  3 Jun 2025 06:22:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CB44881332
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB44881332
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB44881332
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:22:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E80741C1413; Tue,  3 Jun 2025 08:22:04 +0200 (CEST)
Message-ID: <cfa3188f-74e6-433e-9e70-4bd6afe7d8e0@rnout.be>
Date: Sat, 31 May 2025 19:01:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org,
 Juan Pablo MONTERO CASTRO <juanpablo.monterocastro@nxp.com>
References: <20250516192540.8D74686D6E@busybox.osuosl.org>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250516192540.8D74686D6E@busybox.osuosl.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748931725; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=vfJnHnjtzsyPNA66CQQGnUrttB7QBIHks5b25vlJtF0=;
 b=BAdifVCUu5Apf1tMv3Jk6qHSho3D+Mlblqa+RJYQ4DTT3sR4UWaF0Dyp6RGscM/1ZQ7+QJ
 +fUs0mXVyBUZ329AZ248tz2wCCat/9X6aqUpRK3UQgTNE7zsbGMzTKvSjliu5m6Ycc6TqU
 JhPdi812WMJ+DHI2KeRdJNveWx1BKa7uuBTNX5k1hmnZIjA+RGCbdNUWtWI3mEbwXuOamW
 efFO5/s0m36jNh4lsal/WZr7u9X2nS2eFEIfdj7uGBt3DJcx0l1F0sT4gJzKcSDHeJB2pW
 etdFXO9JC+UKq83JXngeM5orcXL6TZek1dw4gI2pLrwuR2mn/tYQ520OkZSrcg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=BAdifVCU
Subject: Re: [Buildroot] [git commit]
 package/freescale-imx/firmware-ele-imx: add support for i.MX 91 A0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/05/2025 21:24, Julien Olivain wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=1ce2484a8b11e51e0ecaa23c9ee9e6f1c7702b10
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Buildroot commit [1] introduced the firmware-ele-imx package and was
> using the "mx93a1-ahab-container.img" firmware image for i.MX91.
> 
> For i.MX91, it is in fact the firmware file "mx91a0-ahab-container.img"
> which needs to be used.
> 
> This commit adds this special case.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/69d127fe29dc8ca0321588ed19f14f644ff7e910
> 
> Signed-off-by: Juan Pablo MONTERO CASTRO <juanpablo.monterocastro@nxp.com>
> [Julien: split original commit 2/3]
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/freescale-imx/firmware-ele-imx/Config.in | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/freescale-imx/firmware-ele-imx/Config.in b/package/freescale-imx/firmware-ele-imx/Config.in
> index e8369f0102..d8a55ed219 100644
> --- a/package/freescale-imx/firmware-ele-imx/Config.in
> +++ b/package/freescale-imx/firmware-ele-imx/Config.in
> @@ -19,8 +19,7 @@ config BR2_PACKAGE_FIRMWARE_ELE_IMX_AHAB_CONTAINER_IMAGE
>   	default "mx8ulpa1-ahab-container.img" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULPA1
>   	default "mx8ulpa2-ahab-container.img" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULPA2
>   	default "mx93a0-ahab-container.img" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93A0
> -	default "mx93a1-ahab-container.img" if \
> -		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91 || \
> -		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93A1
> +	default "mx93a1-ahab-container.img" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93A1
> +	default "mx91a0-ahab-container.img" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91A0
>   
>   endif # BR2_PACKAGE_FIRMWARE_ELE_IMX
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
