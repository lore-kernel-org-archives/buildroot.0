Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEF1C433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 07:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06806405C1;
	Mon, 10 Jan 2022 07:18:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9JsjR2RZ6PGJ; Mon, 10 Jan 2022 07:18:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4C4B405C2;
	Mon, 10 Jan 2022 07:18:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F7911BF334
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E070408FE
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:18:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j-vkTZVVFuw7 for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 07:18:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA23C408FA
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 07:18:40 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id e5so8066462wmq.1
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 23:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=KlUXZJjs1m9i9Y0JDuK/Jzon2YGDT98BueshxjO+Bdg=;
 b=DJOmsIjg17hKLiqutbKkV3xfIuK3RueHeD1y1CeeTlr9yoNqwBlSWz4EjNPy3zxjht
 IJapII/eWHGktTSIvSbzsc22IrsG7mliZRPE4JP4T6bOnb61jR3B2INbWsrFgGfo5jRi
 nY+sF+Zi97XKlS9Q4O+WKr0KSa4cZT+bhsCisxFd5VnawJwZi3HjzUg+Uv47eCQ7fi6J
 ulMW86/Ibvfffe0uZHcJfXsl+h7hc3yN/SDiVJa8g/qTUjhsGedXTBCGWxlfwRN2aQJs
 SlPyXqmS3dQb2OhCeNL7aVdF9mCC8ZBYd1mXmTHoumNwrPtDl6tnICxx24Hj5e03sceC
 7Vnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=KlUXZJjs1m9i9Y0JDuK/Jzon2YGDT98BueshxjO+Bdg=;
 b=7hGL+vlTLOX/NcG14k1BfqvgBptEitIPVOx7BvG3pJX1gHhx7PxU6zfer7NXjJrBOr
 T9/kp+aM6g39y150uROsgMYXN3AOQcfxlc5KF1dKFJS/FDLtKxTKS8LIjXancymfLHrj
 pMtMBdBQpw97vvJikJLvygosGyRA1VaKWUUHV02amxJMyfHdh3e6p+Ra+4D5KFK/b91x
 4xY3nSdOscLJ6vYuiH4GxwhMXLpF9Ocz4wzp3v7sHUWJH+sOS6OHMCV877YKy5TCQQDQ
 WWYWwQqU1Qw6bXWxUFdMRBJi2UYaNU2jVvuHtHxS22YBgEBlldwnfZFyEMo4QBNU0TFP
 ac7A==
X-Gm-Message-State: AOAM532bW3Rb/I64D8J3VknLIiIbHB7fnKGhFM7IrsiCRi44lDg7ZYTO
 vlnwMy4YBxWFx7REL4oLfyWNpJco+fxxWOyd
X-Google-Smtp-Source: ABdhPJwSpVEylTfqM2eM43xyDBLlN2z9exnrQkEpUBeGbMZz6J7uFU9N9uRjPIB8Ujimpi6Ma2gtnQ==
X-Received: by 2002:a1c:c915:: with SMTP id f21mr20733377wmb.39.1641799118931; 
 Sun, 09 Jan 2022 23:18:38 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id m6sm6452428wrp.34.2022.01.09.23.18.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 23:18:38 -0800 (PST)
Message-ID: <2a9ec923-a4dc-8555-1c98-3562c2f7d3ef@mind.be>
Date: Mon, 10 Jan 2022 08:18:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Uladzimir Bely <wiselord1983@gmail.com>, buildroot@buildroot.org
References: <20220105214046.14890-1-wiselord1983@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220105214046.14890-1-wiselord1983@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/linux-firmware: add option for
 Cypress FullMAC
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



On 05/01/2022 22:40, Uladzimir Bely wrote:
> Since 2016, Cypress is in charge of supporting old Broadcom wireless
> chips and producing new ones. Newer firmwares for now come with
> a different license and have anoter location in a package.
> 
> Now, most of Broadcom FullMac firmwares in brcm/ directory should now
> be just symlinks to the corresponding files in cypress/ directory.

  It's not actually most, just about half.

> 
> Respectively, it also makes sence to autoselect corresponding CYPRESS
> options if user selectes BRCM wireless stuff.

  This looked very suspicious at first, but indeed, with our linux-firmware 
infrastructure, this is the only reasonable way we can make sure that all the 
BCM firmware blobs are actually installed.

  Applied to master, thanks.

  Regards,
  Arnout

> 
> This patch was created as a result of investigation the issue with
> broken wireless support for such popular boards as Raspberry Pi Zero W
> and BananaPi M2 Zero.
> 
> Signed-off-by: Uladzimir Bely <wiselord1983@gmail.com>
> ---
>   package/linux-firmware/Config.in           | 17 ++++++++++
>   package/linux-firmware/linux-firmware.hash |  1 +
>   package/linux-firmware/linux-firmware.mk   | 39 ++++++++++++++++++++++
>   3 files changed, 57 insertions(+)
> 
> diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
> index 622b1ee685..c94ffe24de 100644
> --- a/package/linux-firmware/Config.in
> +++ b/package/linux-firmware/Config.in
> @@ -140,11 +140,13 @@ config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_10K_QCA998X
>   
>   config BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX
>   	bool "Broadcom BRCM bcm43xx"
> +	select BR2_PACKAGE_LINUX_FIRMWARE_CYPRESS_CYW43XX
>   	help
>   	  Firmware files for the Broadcom bcm43xx SoftMAC and FullMAC.
>   
>   config BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX
>   	bool "Broadcom BRCM bcm43xxx"
> +	select BR2_PACKAGE_LINUX_FIRMWARE_CYPRESS_CYW43XXX
>   	help
>   	  Firmware files for the Broadcom bcm43xxx, SoftMAC and FullMAC.
>   
> @@ -158,6 +160,21 @@ config BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM4366C0
>   	help
>   	  Firmware file for the Broadcom 4366c0 FullMAC chip.
>   
> +config BR2_PACKAGE_LINUX_FIRMWARE_CYPRESS_CYW43XX
> +	bool "Cypress CY cyw43xx"
> +	help
> +	  Firmware files for the Cypress cyw43xx FullMAC.
> +
> +config BR2_PACKAGE_LINUX_FIRMWARE_CYPRESS_CYW43XXX
> +	bool "Cypress CY cyw43xxx"
> +	help
> +	  Firmware files for the Cypress cyw43xxx FullMAC.
> +
> +config BR2_PACKAGE_LINUX_FIRMWARE_CYPRESS_CYW54XXX
> +	bool "Cypress CY cyw54xxx"
> +	help
> +	  Firmware files for the Cypress cyw54xxx FullMAC.
> +
>   config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22260
>   	bool "Intel iwlwifi 22260"
>   	help
> diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
> index d8edb37628..4c73374138 100644
> --- a/package/linux-firmware/linux-firmware.hash
> +++ b/package/linux-firmware/linux-firmware.hash
> @@ -11,6 +11,7 @@ sha256  631065703055d11b099477c508508f20a80b202aad548a7726564bfa59a96c91  ath10k
>   sha256  8ce5c6ea0542bf4aac31fc3ae16a39792ad22d0eae4543063fac56fb3380f021  ath10k/QCA6174/hw3.0/notice_ath10k_firmware-6.txt
>   sha256  b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d  LICENCE.broadcom_bcm43xx
>   sha256  a5777f9e80aca0603b0648454de996168b1c530322550ccda94d6d78bcf6c061  LICENCE.chelsio_firmware
> +sha256  ae0db6cc4db33941148df0f67de53e76a77b1b5a46b3165edb7040aa2750015f  LICENCE.cypress
>   sha256  60fbc9cccb455e1a3306c97db942d6f24fa93664be61d54c497637e6d0e2ae83  LICENCE.fw_sst_0f28
>   sha256  5181b0b51efc79d5acb2c9bb92042878fdbad97a92114d4ab5e32e2b5b52fce4  LICENCE.ibt_firmware
>   sha256  0e0c11073ba3c832097da38e0905da36b8a3526f219407977b13b71c6675be7d  LICENCE.it913x
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index 281ed0189d..ac45bc8282 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -675,6 +675,45 @@ LINUX_FIRMWARE_FILES += brcm/brcmfmac4366c-pcie.bin
>   LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
>   endif
>   
> +# cyfmac43xx
> +ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CYPRESS_CYW43XX),y)
> +LINUX_FIRMWARE_FILES += \
> +	cypress/cyfmac4339-sdio.bin \
> +	cypress/cyfmac4354-sdio.bin \
> +	cypress/cyfmac4354-sdio.clm_blob \
> +	cypress/cyfmac4356-pcie.bin \
> +	cypress/cyfmac4356-pcie.clm_blob \
> +	cypress/cyfmac4356-sdio.bin \
> +	cypress/cyfmac4356-sdio.clm_blob \
> +	cypress/cyfmac4373-sdio.bin \
> +	cypress/cyfmac4373-sdio.clm_blob
> +LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.cypress
> +endif
> +
> +# cyfmac43xxx
> +ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CYPRESS_CYW43XXX),y)
> +LINUX_FIRMWARE_FILES += \
> +	cypress/cyfmac43012-sdio.bin \
> +	cypress/cyfmac43012-sdio.clm_blob \
> +	cypress/cyfmac43340-sdio.bin \
> +	cypress/cyfmac43362-sdio.bin \
> +	cypress/cyfmac43430-sdio.bin \
> +	cypress/cyfmac43430-sdio.clm_blob \
> +	cypress/cyfmac43455-sdio.bin \
> +	cypress/cyfmac43455-sdio.clm_blob \
> +	cypress/cyfmac43570-pcie.bin \
> +	cypress/cyfmac43570-pcie.clm_blob
> +LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.cypress
> +endif
> +
> +# cyfmac54xxx
> +ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CYPRESS_CYW54XXX),y)
> +LINUX_FIRMWARE_FILES += \
> +	cypress/cyfmac54591-pcie.bin \
> +	cypress/cyfmac54591-pcie.clm_blob
> +LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.cypress
> +endif
> +
>   # ql2xxx
>   ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QLOGIC_2XXX),y)
>   LINUX_FIRMWARE_FILES += \
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
