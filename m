Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811C9C433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 14:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A72783046;
	Sun, 10 Apr 2022 14:52:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hqtAEdfm1fVu; Sun, 10 Apr 2022 14:52:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35BFB817D3;
	Sun, 10 Apr 2022 14:52:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C1221BF3B5
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A834817D3
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:52:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AVd8DdJN1lah for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 14:52:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 42F3E80B85
 for <buildroot@busybox.net>; Sun, 10 Apr 2022 14:52:27 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id ks6so1453285ejb.1
 for <buildroot@busybox.net>; Sun, 10 Apr 2022 07:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=WL6xV/+BRaFPwiUYmLDdyxxpNHrjN7+ilCR5yRc/zTU=;
 b=BpirUbMQ5ihqNyDdnXhrUJh+Sv7Fdhc8r1QXle5lpwZoICwpYOV/gbOpAnC4ndB3Xe
 Xj9GyGuDvU8xkAVl/hwwE3+lYu9LZmRlH0Pm+kzxvH14LukAYCZdTWLS7vQQOafBrtCy
 MoRYRSN/vYJ+/CPgLQn0xkoTIU/HgrS5kEQsDVnx+RnNnsgG0yI4YcUcKBbBfRJkyciO
 tOlU7ex1j2+OUEcIz1akgi+uCbxieXbbuZeT/Ywiq7DFzNQS2/7Qys4MRb4KykioJ0kX
 n4wLuxF2NtU5drO/OabVi8KwiwTKreA/YT4NtvjrO8vtuURKRA2z8I2YJHZ91wqjtAax
 Fh/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=WL6xV/+BRaFPwiUYmLDdyxxpNHrjN7+ilCR5yRc/zTU=;
 b=F1J7omrySat97TKP3iWyUqJqF/xKXzsZqX8X/XFeOE0RFNFMBDruT7C5YpsUFhE/1u
 zNuH0oCNW65ygH2J9zLvJk0HPGgmWTy/n0a4AlwlQKXAYolZTc3wF7ukRHSu/agra7qx
 4zUBrZjHlRm2lNFGfmXRHVV0teS+/Ldd/LkZTCTivAGmLaF3R8ZDcOSpYILtuGM27JBy
 DbGsreNWLXyWI1gdmaAKnBhc4Eo/RoZmR3oLV6Os+1I60Z6TF7dBiiM6QMJP5B8YPR05
 hZ8EONP3jjEQh90EE3h1y01zyC6Lb/5iEcIlwBXnbJOuL7+JenIoxq98Oub0+ygKDfSV
 K/MA==
X-Gm-Message-State: AOAM530E8Kf/1rqGW2qDtOMkReVREjrLLXRF6mzOAiw26p3ijco4J+cF
 rGws7Hy//oSGvFm0mUv9O+9OcA==
X-Google-Smtp-Source: ABdhPJxZEhzJqsNVJcQoByasYZeJC792ORVHMq2W2u1wNmFB/Vxhm9bFG8/FQ6DUYDtBzZ9EDFndcg==
X-Received: by 2002:a17:907:da0:b0:6df:d4a4:9d0f with SMTP id
 go32-20020a1709070da000b006dfd4a49d0fmr27458784ejc.407.1649602345156; 
 Sun, 10 Apr 2022 07:52:25 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a17090622d100b006e87bcf7ae7sm1334871eja.208.2022.04.10.07.52.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Apr 2022 07:52:24 -0700 (PDT)
Message-ID: <ab3b69d8-11d7-83c9-8083-f19b3ad6a9f3@mind.be>
Date: Sun, 10 Apr 2022 16:52:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220404183504.2392930-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220404183504.2392930-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] configs/olimex_a20_olinuxino_lime*: bump
 Linux and U-Boot
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/04/2022 20:35, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

> ---
>   configs/olimex_a20_olinuxino_lime2_defconfig | 8 ++++----
>   configs/olimex_a20_olinuxino_lime_defconfig  | 8 ++++----
>   2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
> index b46cf3743..2f9594921 100644
> --- a/configs/olimex_a20_olinuxino_lime2_defconfig
> +++ b/configs/olimex_a20_olinuxino_lime2_defconfig
> @@ -4,8 +4,8 @@ BR2_cortex_a7=y
>   BR2_ARM_EABIHF=y
>   BR2_ARM_FPU_NEON_VFPV4=y
>   
> -# Linux headers same as kernel, a 5.14 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
> +# Linux headers same as kernel, a 5.15 LTS series

  Nice touch, adding this LTS bit.

  Regards,
  Arnout

> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   
>   # Toolchain
>   # glibc is needed for sunxi-mali-utgard package.
> @@ -23,7 +23,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.14.13"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.32"
>   BR2_LINUX_KERNEL_USE_DEFCONFIG=y
>   BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
>   BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
> @@ -45,7 +45,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime2"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
>   BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
> diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
> index 698137e46..e24857e0c 100644
> --- a/configs/olimex_a20_olinuxino_lime_defconfig
> +++ b/configs/olimex_a20_olinuxino_lime_defconfig
> @@ -4,8 +4,8 @@ BR2_cortex_a7=y
>   BR2_ARM_EABIHF=y
>   BR2_ARM_FPU_NEON_VFPV4=y
>   
> -# Linux headers same as kernel, a 5.14 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
> +# Linux headers same as kernel, a 5.15 LTS series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   
>   # Toolchain
>   # glibc is needed for sunxi-mali-utgard package.
> @@ -23,7 +23,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.14.13"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.32"
>   BR2_LINUX_KERNEL_USE_DEFCONFIG=y
>   BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
>   BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
> @@ -45,7 +45,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
>   BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
