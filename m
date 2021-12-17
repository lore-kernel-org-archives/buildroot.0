Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD75CC433FE
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 21:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A413B84D06;
	Fri, 17 Dec 2021 21:51:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B5ieHBudssxU; Fri, 17 Dec 2021 21:51:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA8D284CFB;
	Fri, 17 Dec 2021 21:51:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 70D3F1BF358
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B95983E74
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:51:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3edugtHZKeRN for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 21:51:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 999C483E32
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 21:51:39 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id b7so12949187edd.6
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 13:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QqZKVME/EZWt2MC9PYJ4+MrvTSSo1UNJ96XvcNXAteQ=;
 b=dSy1Vhn2f5MGB34wmPHoDo5UXOHRXHhhFKsNL/cPCT9UpLOOl0hl5/b5Tx6/5OHP1J
 7T0CB9AUehH+uMBbP7oM1OSzI4NngkYc5MAA1HI6+jtbhKGJip5JJ1eirx5FEKYRFUPr
 XOZ7zTNktRiTCqyTj/t5NVDzyZzlCRlCsmWKaKT+00EUWf0nlqqfP3+HCgi8KDQ4atjm
 uEeritYSpcSPIJvM9+ttE+V6rv64C9QIbgvRTHsMTBjM1yMGaz2Vt4yX5Jg9sh9LJcQA
 uq+hNGrjOMn5ifq4IK9P6JHGG22Lr0Ed1IJH+ERDOz1Et46UmevE5k4Zb6IshfdSa7Iq
 c7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QqZKVME/EZWt2MC9PYJ4+MrvTSSo1UNJ96XvcNXAteQ=;
 b=NNvBc4WDhzE2YzFUyUnBPM18u8Owxb0aIsexLIT4WxPJPKb0zRKZtNstt7jgALBmCH
 Nrm4rtEAR64s+GZoGGmPRHWL2RtaQDemFvnIaifFOspuSh15oJfIra3oV6aJrt1iVyKK
 v9dz6S4wAGe49eHHhA5V+agIMV/B2EPVbab7yUM8xyNo4PWm+Hnge0FNMCTrxGOpI1f5
 IHU/JKM1EbosiJefiOwRV8u376Au77Db32ZmeEB233tqhrEJgDCuspJWWHB5XlZ7MVi5
 ahTuIlfj5zpUsccOxs7ZMEtb66UzgkQnHbh9+8VSn9EKzJe7OX+HOSh+bzJwBVvOGV24
 oG+g==
X-Gm-Message-State: AOAM532QrzYhqo5v6yGtBMWHRfoKh2t6VGDU+uJkibHieK52LUfHoO5I
 4bn98LmJTZiZ0qgDndjg1sTHKA==
X-Google-Smtp-Source: ABdhPJyBzKmO5KTNh28xfcoIqPjht5oWbEa7dk7HtskdLzJB839rQNz7wLyf3is4qt6yau6YCRHlgw==
X-Received: by 2002:a17:907:720b:: with SMTP id
 dr11mr3994893ejc.93.1639777897798; 
 Fri, 17 Dec 2021 13:51:37 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id t5sm4019413edd.68.2021.12.17.13.51.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 13:51:37 -0800 (PST)
Message-ID: <4b880aca-3e37-18b6-9564-31bb80ed3349@mind.be>
Date: Fri, 17 Dec 2021 22:51:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Dario Binacchi <dariobin@libero.it>, buildroot@buildroot.org
References: <20211212123753.11848-1-dariobin@libero.it>
 <20211212123753.11848-5-dariobin@libero.it>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211212123753.11848-5-dariobin@libero.it>
Subject: Re: [Buildroot] [RESEND PATCH v2,
 4/4] configs/stm32f4{2|6}9_*_defconfig: rename configurations
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
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/12/2021 13:37, Dario Binacchi wrote:
> The name of the configurations are now more explicit. As a result, the
> readme files have also been changed.
> 
> Signed-off-by: Dario Binacchi <dariobin@libero.it>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../stm32f469-disco/{flash.sh => flash_sd.sh}                 | 0
>   .../stm32f469-disco/{linux.fragment => linux-sd.fragment}     | 0
>   board/stmicroelectronics/stm32f469-disco/readme.txt           | 4 ++--
>   board/stmicroelectronics/stm32f469-disco/readme_xip.txt       | 2 +-
>   ...tm32f429_disco_defconfig => stm32f429_disco_xip_defconfig} | 0
>   ...stm32f469_disco_defconfig => stm32f469_disco_sd_defconfig} | 2 +-
>   6 files changed, 4 insertions(+), 4 deletions(-)
>   rename board/stmicroelectronics/stm32f469-disco/{flash.sh => flash_sd.sh} (100%)
>   rename board/stmicroelectronics/stm32f469-disco/{linux.fragment => linux-sd.fragment} (100%)
>   rename configs/{stm32f429_disco_defconfig => stm32f429_disco_xip_defconfig} (100%)
>   rename configs/{stm32f469_disco_defconfig => stm32f469_disco_sd_defconfig} (97%)
> 
> diff --git a/board/stmicroelectronics/stm32f469-disco/flash.sh b/board/stmicroelectronics/stm32f469-disco/flash_sd.sh
> similarity index 100%
> rename from board/stmicroelectronics/stm32f469-disco/flash.sh
> rename to board/stmicroelectronics/stm32f469-disco/flash_sd.sh
> diff --git a/board/stmicroelectronics/stm32f469-disco/linux.fragment b/board/stmicroelectronics/stm32f469-disco/linux-sd.fragment
> similarity index 100%
> rename from board/stmicroelectronics/stm32f469-disco/linux.fragment
> rename to board/stmicroelectronics/stm32f469-disco/linux-sd.fragment
> diff --git a/board/stmicroelectronics/stm32f469-disco/readme.txt b/board/stmicroelectronics/stm32f469-disco/readme.txt
> index 4d178b40d6..99d26ccb66 100644
> --- a/board/stmicroelectronics/stm32f469-disco/readme.txt
> +++ b/board/stmicroelectronics/stm32f469-disco/readme.txt
> @@ -7,13 +7,13 @@ configuration for the STM32F469 Discovery evaluation platform.
>   Building
>   --------
>   
> -  make stm32f469_disco_defconfig
> +  make stm32f469_disco_sd_defconfig
>     make
>   
>   Flashing
>   --------
>   
> -  ./board/stmicroelectronics/stm32f469-disco/flash.sh output/
> +  ./board/stmicroelectronics/stm32f469-disco/flash_sd.sh output/
>   
>   It will flash the U-boot bootloader.
>   
> diff --git a/board/stmicroelectronics/stm32f469-disco/readme_xip.txt b/board/stmicroelectronics/stm32f469-disco/readme_xip.txt
> index 632d221ba1..7c20c2d015 100644
> --- a/board/stmicroelectronics/stm32f469-disco/readme_xip.txt
> +++ b/board/stmicroelectronics/stm32f469-disco/readme_xip.txt
> @@ -19,6 +19,6 @@ Building
>   Flashing
>   --------
>   
> -  ./board/stmicroelectronics/stm32f469-disco/flash.sh output/
> +  ./board/stmicroelectronics/stm32f469-disco/flash_xip.sh output/
>   
>   It will flash binary to internal flash memory.
> diff --git a/configs/stm32f429_disco_defconfig b/configs/stm32f429_disco_xip_defconfig
> similarity index 100%
> rename from configs/stm32f429_disco_defconfig
> rename to configs/stm32f429_disco_xip_defconfig
> diff --git a/configs/stm32f469_disco_defconfig b/configs/stm32f469_disco_sd_defconfig
> similarity index 97%
> rename from configs/stm32f469_disco_defconfig
> rename to configs/stm32f469_disco_sd_defconfig
> index 438d32150c..5ad4068e5e 100644
> --- a/configs/stm32f469_disco_defconfig
> +++ b/configs/stm32f469_disco_sd_defconfig
> @@ -8,7 +8,7 @@ BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.14.12"
>   BR2_LINUX_KERNEL_DEFCONFIG="stm32"
> -BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0x00000000.config board/stmicroelectronics/stm32f469-disco/linux.fragment"
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0x00000000.config board/stmicroelectronics/stm32f469-disco/linux-sd.fragment"
>   BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
>   BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
