Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35373C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 20:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D75AB82883;
	Mon, 25 Apr 2022 20:07:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ikTt9DGB24n0; Mon, 25 Apr 2022 20:07:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C308082864;
	Mon, 25 Apr 2022 20:07:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A618D1BF2AB
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 944F74159D
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:07:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qWbfvFg1VCb7 for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 20:07:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5276C4091D
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 20:07:34 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id k23so31817629ejd.3
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 13:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Ozmjv6pXYt0wstqIxXECWi2cFfISjsuwnuHYy9Q1xLs=;
 b=chzJsjW+Icu9TVOAcVtqf2eK9WitJaAweKtzrch8ShnIDgWuFnRphn82SqjEv5G0+M
 Q4vtCOyWxQmOATeYDGooYPxwI9V7FkIFppk1Ab+7tf2jV/n/EjlHkSUOYE9B+CEq8mDP
 wPk6kuLrZIQ0ZEx04xA/3T8Z51pC5AGRHWSZ4zCUzuYc7oaKX2LLFMeF8iVYzZ64GjpH
 x/9Yz1dZpEakz5LMd1kO7FyVHrGHWzRvUr4nOCDIQPpA7y43D740TlvE7EMqskqYvrxY
 iFSbStMN+aIwDTrBLjaXp+4SNJqiUxH8xMiyl1uAhX2Obe0cHuDmKzKaA7Rye0xwVXHa
 rm7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Ozmjv6pXYt0wstqIxXECWi2cFfISjsuwnuHYy9Q1xLs=;
 b=1U+2RvkEQPmiFnGnvb/NfjAYLNb591voXuCR8f9I4976efknzSXY2ULNChSoF3yaLa
 7Fosy2PUsh7rFR690LWUCtcJcxO/NvsQBr8f/WJci+eaSCY0pCXa7BZxYWjvPqeHGitv
 A4b9ItD8/fHZMr9tl6OE7m/FKyKbBCiHT+xcEKf8XMuF0OOt6uVyAxLuNBvcH2gsgVPD
 T3f7f+fZzBSrUPZnvi+kgvn4afLB2vhhIFKje4aVFXQDS7ODMzOMmahvyaV8yDpte3wt
 TUOcewAh/MZ/UwdGHEJj3mchB2shYjpPPjmNz/vj9h9WCBI8aDCrozGMvE/9xnOImGw4
 zi/w==
X-Gm-Message-State: AOAM532Isf20b6QZIQ8TaECUOBuvnj3jSqtV5sA2ugIwSAaeV2yZ+zDt
 Dishp8wQWYv8ZGs3PyOb4Cu0EQ==
X-Google-Smtp-Source: ABdhPJyaPtbTjag/6sVJlwbb+S8IwCsmt1Sx4caaVip3GgI7m3rg3dfc1UBw+GJdfKQFkEsNa9gSeg==
X-Received: by 2002:a17:907:869e:b0:6ef:6e01:bb28 with SMTP id
 qa30-20020a170907869e00b006ef6e01bb28mr18221411ejc.606.1650917252367; 
 Mon, 25 Apr 2022 13:07:32 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a056402084800b004207931a9cbsm5287376edz.36.2022.04.25.13.07.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 13:07:32 -0700 (PDT)
Message-ID: <81c16e83-25d8-d047-4752-b33daa2e91f4@mind.be>
Date: Mon, 25 Apr 2022 22:07:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Kris Bahnsen <kris@embeddedTS.com>, buildroot@buildroot.org
References: <20220422223611.10443-1-kris@embeddedTS.com>
 <20220422223611.10443-4-kris@embeddedTS.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220422223611.10443-4-kris@embeddedTS.com>
Subject: Re: [Buildroot] [PATCH v2 3/4] configs: add WILC3000_FIRMWARE to
 compatible devices
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Eugen Hristev <eugen.hristev@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mark Featherston <mark@embeddedTS.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/04/2022 00:36, Kris Bahnsen via buildroot wrote:
> The update to wilc-firmware added firmware files for WILC3000
> devices as a separate config option. All Atmel/Microchip defconfigs
> that previously only had WILC1000_FIRMWARE either have WILC3000
> Wi-Fi hardware (WILC3000 is the same silicon but with BLE added)

  For the ones which have a WILC3000, there's no point to include the WILC1000 
firmware, right?

  Anyway, applied to master as is, thanks. Can be fixed up later.

  Regards,
  Arnout

> or have the capacity to have either WILC1000 or WILC3000 devices
> added to the system. Install all firmware blobs to these devices
> by default.
> 
> Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
> ---
>   configs/at91sam9x5ek_dev_defconfig                     | 1 +
>   configs/at91sam9x5ek_mmc_dev_defconfig                 | 1 +
>   configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig       | 1 +
>   configs/atmel_sama5d2_xplained_mmc_dev_defconfig       | 1 +
>   configs/atmel_sama5d3_xplained_dev_defconfig           | 1 +
>   configs/atmel_sama5d3_xplained_mmc_dev_defconfig       | 1 +
>   configs/atmel_sama5d4_xplained_dev_defconfig           | 1 +
>   configs/atmel_sama5d4_xplained_mmc_dev_defconfig       | 1 +
>   configs/microchip_sam9x60ek_mmc_dev_defconfig          | 1 +
>   configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig | 1 +
>   configs/microchip_sama5d2_icp_mmc_dev_defconfig        | 1 +
>   configs/microchip_sama7g5ek_mmc_dev_defconfig          | 1 +
>   12 files changed, 12 insertions(+)
> 
> diff --git a/configs/at91sam9x5ek_dev_defconfig b/configs/at91sam9x5ek_dev_defconfig
> index bfa8e95941..8714463d89 100644
> --- a/configs/at91sam9x5ek_dev_defconfig
> +++ b/configs/at91sam9x5ek_dev_defconfig
> @@ -47,6 +47,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
>   BR2_PACKAGE_MMC_UTILS=y
>   BR2_PACKAGE_MTD=y
>   BR2_PACKAGE_WILC1000_FIRMWARE=y
> +BR2_PACKAGE_WILC3000_FIRMWARE=y
>   BR2_PACKAGE_EVTEST=y
>   BR2_PACKAGE_I2C_TOOLS=y
>   BR2_PACKAGE_SETSERIAL=y
> diff --git a/configs/at91sam9x5ek_mmc_dev_defconfig b/configs/at91sam9x5ek_mmc_dev_defconfig
> index 2e1a5c7f59..9481594716 100644
> --- a/configs/at91sam9x5ek_mmc_dev_defconfig
> +++ b/configs/at91sam9x5ek_mmc_dev_defconfig
> @@ -50,6 +50,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
>   BR2_PACKAGE_MMC_UTILS=y
>   BR2_PACKAGE_MTD=y
>   BR2_PACKAGE_WILC1000_FIRMWARE=y
> +BR2_PACKAGE_WILC3000_FIRMWARE=y
>   BR2_PACKAGE_EVTEST=y
>   BR2_PACKAGE_I2C_TOOLS=y
>   BR2_PACKAGE_SETSERIAL=y
> diff --git a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
> index ba2fa46790..38618a5732 100644
> --- a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
> +++ b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
> @@ -39,6 +39,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
>   BR2_PACKAGE_MMC_UTILS=y
>   BR2_PACKAGE_MTD=y
>   BR2_PACKAGE_WILC1000_FIRMWARE=y
> +BR2_PACKAGE_WILC3000_FIRMWARE=y
>   BR2_PACKAGE_EVTEST=y
>   BR2_PACKAGE_I2C_TOOLS=y
>   BR2_PACKAGE_RNG_TOOLS=y
> diff --git a/configs/atmel_sama5d2_xplained_mmc_dev_defconfig b/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
> index a8b68ca0a2..1654408aa5 100644
> --- a/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
> +++ b/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
> @@ -53,6 +53,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
>   BR2_PACKAGE_MMC_UTILS=y
>   BR2_PACKAGE_MTD=y
>   BR2_PACKAGE_WILC1000_FIRMWARE=y
> +BR2_PACKAGE_WILC3000_FIRMWARE=y
>   BR2_PACKAGE_EVTEST=y
>   BR2_PACKAGE_I2C_TOOLS=y
>   BR2_PACKAGE_SETSERIAL=y
> diff --git a/configs/atmel_sama5d3_xplained_dev_defconfig b/configs/atmel_sama5d3_xplained_dev_defconfig
> index cdfd9de17e..64455cb2e0 100644
> --- a/configs/atmel_sama5d3_xplained_dev_defconfig
> +++ b/configs/atmel_sama5d3_xplained_dev_defconfig
> @@ -49,6 +49,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
>   BR2_PACKAGE_MMC_UTILS=y
>   BR2_PACKAGE_MTD=y
>   BR2_PACKAGE_WILC1000_FIRMWARE=y
> +BR2_PACKAGE_WILC3000_FIRMWARE=y
>   BR2_PACKAGE_EVTEST=y
>   BR2_PACKAGE_I2C_TOOLS=y
>   BR2_PACKAGE_SETSERIAL=y
> diff --git a/configs/atmel_sama5d3_xplained_mmc_dev_defconfig b/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
> index a2205aeefa..8f5724d631 100644
> --- a/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
> +++ b/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
> @@ -52,6 +52,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
>   BR2_PACKAGE_MMC_UTILS=y
>   BR2_PACKAGE_MTD=y
>   BR2_PACKAGE_WILC1000_FIRMWARE=y
> +BR2_PACKAGE_WILC3000_FIRMWARE=y
>   BR2_PACKAGE_EVTEST=y
>   BR2_PACKAGE_I2C_TOOLS=y
>   BR2_PACKAGE_SETSERIAL=y
> diff --git a/configs/atmel_sama5d4_xplained_dev_defconfig b/configs/atmel_sama5d4_xplained_dev_defconfig
> index f8783f5652..fab91cf0b3 100644
> --- a/configs/atmel_sama5d4_xplained_dev_defconfig
> +++ b/configs/atmel_sama5d4_xplained_dev_defconfig
> @@ -50,6 +50,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
>   BR2_PACKAGE_MMC_UTILS=y
>   BR2_PACKAGE_MTD=y
>   BR2_PACKAGE_WILC1000_FIRMWARE=y
> +BR2_PACKAGE_WILC3000_FIRMWARE=y
>   BR2_PACKAGE_EVTEST=y
>   BR2_PACKAGE_I2C_TOOLS=y
>   BR2_PACKAGE_SETSERIAL=y
> diff --git a/configs/atmel_sama5d4_xplained_mmc_dev_defconfig b/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
> index b4e99f658a..f9074e9862 100644
> --- a/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
> +++ b/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
> @@ -53,6 +53,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
>   BR2_PACKAGE_MMC_UTILS=y
>   BR2_PACKAGE_MTD=y
>   BR2_PACKAGE_WILC1000_FIRMWARE=y
> +BR2_PACKAGE_WILC3000_FIRMWARE=y
>   BR2_PACKAGE_EVTEST=y
>   BR2_PACKAGE_I2C_TOOLS=y
>   BR2_PACKAGE_SETSERIAL=y
> diff --git a/configs/microchip_sam9x60ek_mmc_dev_defconfig b/configs/microchip_sam9x60ek_mmc_dev_defconfig
> index 06e03967c4..2b4e234297 100644
> --- a/configs/microchip_sam9x60ek_mmc_dev_defconfig
> +++ b/configs/microchip_sam9x60ek_mmc_dev_defconfig
> @@ -36,6 +36,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
>   BR2_PACKAGE_MMC_UTILS=y
>   BR2_PACKAGE_MTD=y
>   BR2_PACKAGE_WILC1000_FIRMWARE=y
> +BR2_PACKAGE_WILC3000_FIRMWARE=y
>   BR2_PACKAGE_EVTEST=y
>   BR2_PACKAGE_I2C_TOOLS=y
>   BR2_PACKAGE_SETSERIAL=y
> diff --git a/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig b/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
> index 3bcd5f0200..f9aa6cdc05 100644
> --- a/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
> +++ b/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
> @@ -39,6 +39,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
>   BR2_PACKAGE_MMC_UTILS=y
>   BR2_PACKAGE_MTD=y
>   BR2_PACKAGE_WILC1000_FIRMWARE=y
> +BR2_PACKAGE_WILC3000_FIRMWARE=y
>   BR2_PACKAGE_EVTEST=y
>   BR2_PACKAGE_I2C_TOOLS=y
>   BR2_PACKAGE_SETSERIAL=y
> diff --git a/configs/microchip_sama5d2_icp_mmc_dev_defconfig b/configs/microchip_sama5d2_icp_mmc_dev_defconfig
> index 27d1d3409d..b1b22c1312 100644
> --- a/configs/microchip_sama5d2_icp_mmc_dev_defconfig
> +++ b/configs/microchip_sama5d2_icp_mmc_dev_defconfig
> @@ -32,6 +32,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
>   BR2_PACKAGE_MMC_UTILS=y
>   BR2_PACKAGE_MTD=y
>   BR2_PACKAGE_WILC1000_FIRMWARE=y
> +BR2_PACKAGE_WILC3000_FIRMWARE=y
>   BR2_PACKAGE_EVTEST=y
>   BR2_PACKAGE_SETSERIAL=y
>   BR2_PACKAGE_SPI_TOOLS=y
> diff --git a/configs/microchip_sama7g5ek_mmc_dev_defconfig b/configs/microchip_sama7g5ek_mmc_dev_defconfig
> index 6eb6c282e0..d68846e553 100644
> --- a/configs/microchip_sama7g5ek_mmc_dev_defconfig
> +++ b/configs/microchip_sama7g5ek_mmc_dev_defconfig
> @@ -30,6 +30,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
>   BR2_PACKAGE_MMC_UTILS=y
>   BR2_PACKAGE_MTD=y
>   BR2_PACKAGE_WILC1000_FIRMWARE=y
> +BR2_PACKAGE_WILC3000_FIRMWARE=y
>   BR2_PACKAGE_EVTEST=y
>   BR2_PACKAGE_RNG_TOOLS=y
>   # BR2_PACKAGE_RNG_TOOLS_JITTERENTROPY_LIBRARY is not set
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
