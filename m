Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F9BC54E5D
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 10:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71F07813A1;
	Mon, 18 Mar 2024 10:31:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9LjJd3e2ujnv; Mon, 18 Mar 2024 10:31:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78392813A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78392813A3;
	Mon, 18 Mar 2024 10:31:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 16AE61BF39C
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 10:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10B0A813A3
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 10:31:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XQkEUERdGR1q for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 10:31:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2A4B4813A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A4B4813A1
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A4B4813A1
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 10:31:17 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33ed4dd8659so1386993f8f.0
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 03:31:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710757876; x=1711362676;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sCrJGuz5fZgsC/JL1s3C6TsnZ86F4mSy8lDsmTIsvUc=;
 b=wJVF73+jKuCxYoXL6hQcVb2MV3RmMGtW9xaTaDWQ7qlhhbK12s3296hGWN9708RmDl
 6dJbn8EHPf5dgpF6ahGyqhMGl7eNYPN+a745tDcumQ+u7QmAQLhcU7sahWUkD9a/u8K5
 pchiYaTkWEZmwYU4sJFjjfW8YhaMdFJYC7LYQpyUNmGS4t3O96fCutSrb20bC3O7Wnza
 AO5flsXvsjrAW1hQAu6l5Uipm2V/5ndXqxJapBPiWROxpC/5QNKUd1d0JDi1XTIWOC2b
 729ieRjF376+OE7c8H3hZJBZmDg5tqrw4Vaf6c5u+EHrZze7AUWYB5omDDuB+ntDhwQd
 /bSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6HhjleGqGeqspHPBh/AqbFYZ3ILntzPWgWowu5uKyrME/bu1huMeuNmPuPuAS1ca9QKJHyyH0hjQ+vYvATK0xc+G+HOJang==
X-Gm-Message-State: AOJu0Ywwk6Knm1Jpcm/uHuWLS1fJIO5SEZIWx6pUQixqNUSL/S/NJ/bp
 BUDFj8H8R2n3p8rikAW2+aWPyueMHUeFmDKBw8s88llj2lbd8CSn8+jAJzrVU6HkAugOSpVCFCI
 C
X-Google-Smtp-Source: AGHT+IEd3LYC1roaaoWfIfpBQg57qd2yJ8GIdsqINNgJp4AQvnipri1HA70XueDXM3q1QYAJHLvGHA==
X-Received: by 2002:a5d:498b:0:b0:33e:d6cb:34c4 with SMTP id
 r11-20020a5d498b000000b0033ed6cb34c4mr7508553wrq.4.1710757875505; 
 Mon, 18 Mar 2024 03:31:15 -0700 (PDT)
Received: from [10.1.0.191] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 q15-20020adff78f000000b0033e192a5852sm9478928wrp.30.2024.03.18.03.31.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 03:31:14 -0700 (PDT)
Message-ID: <8e616dda-c31b-484a-8ee5-77ced082691e@mind.be>
Date: Mon, 18 Mar 2024 11:31:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com>,
 buildroot@buildroot.org
References: <20240318092759.7874-1-javad.rahimipetroudi@mind.be>
In-Reply-To: <20240318092759.7874-1-javad.rahimipetroudi@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1710757876; x=1711362676; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sCrJGuz5fZgsC/JL1s3C6TsnZ86F4mSy8lDsmTIsvUc=;
 b=Odzml9+OCDVr/OzdLjl1UZCseFxUJhvXoxSrXz3LIOp4ApNYtxQX1yib9WzNw5+rZl
 Viwj9Q6mdsszTAi6Z7xyTT51Edls+XzB05r5v5a/rcJ88e60nLhbhPBRbl9pIMBeViUM
 2F8rBv7pF5xD2Sp5JQnVwf7esijx4hVmP1um6oslf6K0UQR7IvfAXlNQzYG111p47WDm
 qwhO243AuRuip+ildfts18cqlCht63Csc1/5rmPox23G8XEfPEKY3EjOaBYlET2K5S5O
 jDV19UPVaDnTx6ygVw1UGzWm0cB4n9NaKTDVCRRPZ3QpmBX1YR+Cn3Mb6Yh58+dk9Lpa
 a1Zw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Odzml9+O
Subject: Re: [Buildroot] [PATCH 1/2] configs/avenger96: bump Uboot version
 to 2024.01
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Marleen Vos <marleen.vos@mind.be>,
 Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/03/2024 10:27, Javad Rahimipetroudi wrote:
> This patch upgrades Uboot version on Avenger96 board
> 
> Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com>
> ---
>   board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf | 2 +-
>   configs/avenger96_defconfig                               | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf b/board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf
> index 5d506b3dae..7d6d7f8a44 100644
> --- a/board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf
> +++ b/board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf
> @@ -1,4 +1,4 @@
>   label stm32mp157c-dk2-buildroot
>     kernel /boot/zImage
>     devicetree /boot/stm32mp157a-dhcor-avenger96.dtb
> -  append root=/dev/mmcblk1p4 rootwait
> +  append root=/dev/mmcblk0p4 rootwait

  You should explain why this changes. It's particularly surprising that this 
changes since there is no change in the kernel...

  Regards,
  Arnout

> diff --git a/configs/avenger96_defconfig b/configs/avenger96_defconfig
> index 536899583c..45600ef2fe 100644
> --- a/configs/avenger96_defconfig
> +++ b/configs/avenger96_defconfig
> @@ -29,13 +29,13 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>   # Bootloaders
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.6"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.8"
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE="u-boot-nodtb.bin"
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157a-avenger96.dtb E=0 BL33_CFG=$(BINARIES_DIR)/u-boot.dtb"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 PLAT=stm32mp1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157a-dhcor-avenger96.dtb BL33_CFG=$(BINARIES_DIR)/u-boot.dtb"
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin *.stm32"
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
>   BR2_TARGET_UBOOT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
