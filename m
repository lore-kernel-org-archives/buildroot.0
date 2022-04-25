Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206A9C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 20:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A709A814B8;
	Mon, 25 Apr 2022 20:04:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PhMtM8MzWiy0; Mon, 25 Apr 2022 20:04:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1B4C81439;
	Mon, 25 Apr 2022 20:04:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A88EF1BF2AB
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A15B760597
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:04:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id raUjmCs30jJW for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 20:04:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A532600CC
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 20:04:51 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id y3so11406217ejo.12
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 13:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=S8/ENVhxaHaYTdUg38zAgY2n5Eg+k6YkwVqMzBjhq2U=;
 b=S2WjPH99fxMzt+sQ1N9ZK6oEhhsjJ7qSXZVth4pGq0uwiytvFxjuvJca3P1ik4fc4U
 CMQMLhRmB7mlSKs+xoDoyxpfre9cWLDpX4JCNlqtcekfDuVu6Ys5I5TC4g13APKCG5kh
 FC+BB5WSB2GK25fkQK+To6Z3BcW0wOEiGNYKMSf/S0m19jP022OY19NLHvf2OyZwRqFp
 THGc1XBiWkRX+WcM9Nij8dAkCC+5nd41LefjlKN//VWlfQAEiSpx1d1+VwmXi51NUxUV
 nbeQqV5FZjf+Ky2zRzP6sa0D2hoRMphCGia6vM1ctnaGEnQpjTG0aPnBhJVcrvDkPYvx
 3dCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=S8/ENVhxaHaYTdUg38zAgY2n5Eg+k6YkwVqMzBjhq2U=;
 b=6jgpXf7Msje7G6Y6qz0Y1OBtryoq9n3RjQkumLFUdxrjta8u9JdWNbSde0ilQvqfIR
 2SnW9E0FCm0XBUsHqe8XAZxRzJqwFQb1mo58dKVorFbeyoizsjq3yVpFhsC5RwmPNYOs
 RWqobbt+XorXo3RHmgpOgPon2Iti6kTr3LNiat6fYOH2jpFOw+pia3xxZlAGSI9hsO2D
 qr6A1MA5VbbLjaM5nHuh1ZhP4BdsUDiMBui1ZJw6K8ytdH4nZYKjUXR7YV3fqPHNxPzi
 yDjyn+K1UWNBHiia/D8P8QbQupY5P1lTpbHwvIruS7hEFDgXrB/d46X/nthHzyWIPsCY
 DOHA==
X-Gm-Message-State: AOAM533miyZiTmdcQj0lArkXVKi28TBC3LNpZe5Bc+lB+mz5KgcPih9e
 8hdR+otunGYiX2uqjBXrU0rFlA==
X-Google-Smtp-Source: ABdhPJzuz8RzOYQYDwcugkJOUnJSP5fsSc2UudDpl9m5ycT5BJ4i0qHCAQiBVTIZNLECkZ5plxK7qw==
X-Received: by 2002:a17:906:e87:b0:6df:8602:5801 with SMTP id
 p7-20020a1709060e8700b006df86025801mr18298357ejf.140.1650917089290; 
 Mon, 25 Apr 2022 13:04:49 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 vr7-20020a170906bfe700b006e8325fe130sm3898301ejb.31.2022.04.25.13.04.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 13:04:48 -0700 (PDT)
Message-ID: <9223c80f-61a0-985f-7aba-fa6128286fa9@mind.be>
Date: Mon, 25 Apr 2022 22:04:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Kris Bahnsen <kris@embeddedTS.com>, buildroot@buildroot.org
References: <20220422223611.10443-1-kris@embeddedTS.com>
 <20220422223611.10443-2-kris@embeddedTS.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220422223611.10443-2-kris@embeddedTS.com>
Subject: Re: [Buildroot] [PATCH v2 1/4] package/wilc1000-firmware: bump to
 15.6
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
> Supports both WILC1000 (Wi-Fi only) and WILC3000 (Wi-Fi/BLE) hardware.
> 
> To support WILC3000 this commit adds a separate config option,
> the original config option from this package is still valid.
> 
> License information copied from Microchip's buildroot-external
> project.
> 
> Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>

  Applied to master, thanks, but with a few changes, see below.

[snip]
> diff --git a/package/wilc1000-firmware/wilc1000-firmware.hash b/package/wilc1000-firmware/wilc1000-firmware.hash
> index 5344efe517..9d55be9edc 100644
> --- a/package/wilc1000-firmware/wilc1000-firmware.hash
> +++ b/package/wilc1000-firmware/wilc1000-firmware.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256 a2e7a327dd545ba2051946f7613005cbde88fdd952afb8eecdd1dacda7e767d2  v14.1_Firmware.zip
> +sha256  29bb5739136cdb4088cb52af59badce05cc7e562bca40e9f29fef7f8f7c19cb8  wilc1000-firmware-wilc_linux_15_6.tar.gz

  Hash for the license file you added was missing.

> diff --git a/package/wilc1000-firmware/wilc1000-firmware.mk b/package/wilc1000-firmware/wilc1000-firmware.mk
> index 6f504d67a0..0af81c7110 100644
> --- a/package/wilc1000-firmware/wilc1000-firmware.mk
> +++ b/package/wilc1000-firmware/wilc1000-firmware.mk
> @@ -4,21 +4,32 @@
>  #
>  ################################################################################
>  
> -WILC1000_FIRMWARE_VERSION = 14.1
> -WILC1000_FIRMWARE_SITE = https://github.com/linux4sc/wireless-firmware/archive
> -WILC1000_FIRMWARE_SOURCE = v$(WILC1000_FIRMWARE_VERSION)_Firmware.zip
> +WILC1000_FIRMWARE_VERSION = wilc_linux_15_6
> +WILC1000_FIRMWARE_SITE = $(call github,linux4wilc,firmware,$(WILC1000_FIRMWARE_VERSION))
>  
> -WILC1000_FIRMWARE_LICENSE = PROPRIETARY
> +WILC1000_FIRMWARE_LICENSE = Microchip firmware

  We actually use proprietary to mark any non-open-source license. The idea is 
that SPDX is uses for the LICENSE variable (with an exception: adding + instead 
of -or-later, and no -only). This is not done consistently, but I don't want to 
go in the wrong direction :-). And maybe there's something to be said for using 
a more descriptive license name than proprietary, but this shouldn't be snuck in 
with a version bump.


  Regards,
  Arnout

> +WILC1000_FIRMWARE_LICENSE_FILES = LICENSE.wilc_fw
>   
> -define WILC1000_FIRMWARE_EXTRACT_CMDS
> -	$(UNZIP) -d $(BUILD_DIR) $(WILC1000_FIRMWARE_DL_DIR)/$(WILC1000_FIRMWARE_SOURCE)
> -	mv $(BUILD_DIR)/wireless-firmware-$(WILC1000_FIRMWARE_VERSION)_Firmware/* $(@D)
> -	rmdir $(BUILD_DIR)/wireless-firmware-$(WILC1000_FIRMWARE_VERSION)_Firmware
> +ifeq ($(BR2_PACKAGE_WILC1000_FIRMWARE),y)
> +WILC1000_FIRMWARE_FILES += \
> +	wilc1000_wifi_firmware.bin
> +endif
> +
> +ifeq ($(BR2_PACKAGE_WILC3000_FIRMWARE),y)
> +WILC1000_FIRMWARE_FILES += \
> +	wilc3000_ble_firmware.bin \
> +	wilc3000_wifi_firmware.bin
> +endif
> +
> +define WILC1000_FIRMWARE_INSTALL_FILES
> +	cd $(@D) && \
> +		$(TAR) cf install.tar $(sort $(WILC1000_FIRMWARE_FILES)) && \
> +		$(TAR) xf install.tar -C $(TARGET_DIR)/lib/firmware/mchp
>   endef
>   
>   define WILC1000_FIRMWARE_INSTALL_TARGET_CMDS
> -	$(INSTALL) -D -m 0644 $(@D)/wilc1003_firmware.bin \
> -		$(TARGET_DIR)/lib/firmware/atmel/wilc1003_firmware.bin
> +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/lib/firmware/mchp/
> +	$(WILC1000_FIRMWARE_INSTALL_FILES)
>   endef
>   
>   $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
