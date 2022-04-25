Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46643C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 20:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD5FF82871;
	Mon, 25 Apr 2022 20:06:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pKb3xa0xo-tV; Mon, 25 Apr 2022 20:06:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC63E814B8;
	Mon, 25 Apr 2022 20:06:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 78BC11BF2AB
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 666F3410A5
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:06:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mix6U3VbVO2Z for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 20:06:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 022204091D
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 20:06:41 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id p4so4181985edx.0
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 13:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=73ZYZQ0ZoPDoo17d0Pe0X3c57YUPUXTvjSfWjFCoFsc=;
 b=Pg+l74bPWiZ3ZGfC7cSIXotFrfTGNd3+J1HOU9k7TJfRdzvKYNaUp87U8zipRprs+2
 O4ETNxoRNhqNKf8e3NERPJvVswOOHM89n2ZqNjmprV2/Aw/Sv5xfhVuwOotT9puEw02s
 hNB7W22MY4zsJJLNHDC6Qo5IngpVW5Nbf/M2DelekxNBZjGTjcIbEqliqgwS40sHQxCh
 h+OqojcYWewEBkyCbLuhx56cW5YbEWpCLEG2HWLFro5XdK/BFX24XiqurZXFo6FkOqPs
 m+EH/Utqi56dJ1sUqXB+9xTAvTUNe+dBIz5hceiXJj4aRvgTfPfaBh7nSXAmamE1g/1h
 Aw0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=73ZYZQ0ZoPDoo17d0Pe0X3c57YUPUXTvjSfWjFCoFsc=;
 b=Pq3lxlJSrYjMH2Y2Cqwtgqlpu/rqNJhCa1JML94rT3HZjlDzxW5CX1BcrQJ9g9fOUd
 gMHN45/3wrc7KbVK3sYeul0HjE4XxnNsAkhxTYNyWFfjoiShcWxDlmrVigrSx72YsJPr
 4/Jq8GGrry1GP7IqGajL4eua0X/JI5Vtw/frwHX6EBxMr5weKwcVg1krwXEWK6NI4ajS
 6ulLG+whprZjwe6PX9ynGWkMlzZZQgpA4W43fDwhtncNSw3bEejMhRHB4ByGlZJboeoh
 cxHNT2wB8z5AV9p3EwfHysbFlKVy96qNXE8v3PPXqkBlgiVm0rcriXZ8Wjp3uQutwFAJ
 H4mA==
X-Gm-Message-State: AOAM5318ps/EhIpoZdkVynDYK3+0DdFF2HlRcqRqb2I0BA2o+f2Q3Xqq
 ShyDnQuSlgeyFfMfDicV+rr/d/Z4ONqfiQ==
X-Google-Smtp-Source: ABdhPJxsFNZFwphfWDz86BK/UD4f3j1veD8jNFsZJLsmy+MMVWMRuqEwFnxpjAqwJkHXvqmZSRM5Jw==
X-Received: by 2002:a05:6402:40d1:b0:425:f2cf:eb59 with SMTP id
 z17-20020a05640240d100b00425f2cfeb59mr3899291edb.66.1650917200186; 
 Mon, 25 Apr 2022 13:06:40 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 bl20-20020a170906c25400b006efeef97b1esm3911313ejb.206.2022.04.25.13.06.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 13:06:39 -0700 (PDT)
Message-ID: <ced10b92-0f95-fe1a-1b57-c178b210d6ae@mind.be>
Date: Mon, 25 Apr 2022 22:06:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Kris Bahnsen <kris@embeddedTS.com>, buildroot@buildroot.org
References: <20220422223611.10443-1-kris@embeddedTS.com>
 <20220422223611.10443-3-kris@embeddedTS.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220422223611.10443-3-kris@embeddedTS.com>
Subject: Re: [Buildroot] [PATCH v2 2/4] package/wilc-firmware: rename from
 wilc1000-firmware
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
> Separates out WILC1000 and WILC3000 in to individual config options
> since in reality only one or the other set would be needed.
> 
> Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
> ---
>   DEVELOPERS                                         |  5 ++++-
>   package/Config.in                                  |  2 +-
>   .../{wilc1000-firmware => wilc-firmware}/Config.in |  9 +++++++--
>   .../wilc-firmware.hash}                            |  2 +-
>   .../wilc-firmware.mk}                              | 22 +++++++++++-----------
>   5 files changed, 24 insertions(+), 16 deletions(-)
>   rename package/{wilc1000-firmware => wilc-firmware}/Config.in (82%)
>   rename package/{wilc1000-firmware/wilc1000-firmware.hash => wilc-firmware/wilc-firmware.hash} (62%)
>   rename package/{wilc1000-firmware/wilc1000-firmware.mk => wilc-firmware/wilc-firmware.mk} (51%)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index ca9decb58f..fc0f52edf5 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1662,6 +1662,9 @@ F:	board/octavo/osd32mp1-red/
>   F:	configs/octavo_osd32mp1_brk_defconfig
>   F:	configs/octavo_osd32mp1_red_defconfig
>   
> +N:	Kris Bahnsen <kris@embeddedTS.com>
> +F:	package/wilc-firmware/
> +
>   N:	Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
>   F:	package/bcusdk/
>   F:	package/libpthsem/
> @@ -1759,7 +1762,7 @@ F:	package/python-json-schema-validator/
>   F:	package/python-keyring/
>   F:	package/python-simplejson/
>   F:	package/python-versiontools/
> -F:	package/wilc1000-firmware/
> +F:	package/wilc-firmware/
>   
>   N:	Maeva Manuel <maeva.manuel@oss.nxp.com>
>   F:	board/freescale/imx8qmmek/
> diff --git a/package/Config.in b/package/Config.in
> index 24f7af5ea8..1ff7f4cc66 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -432,7 +432,7 @@ menu "Firmware"
>   	source "package/sunxi-boards/Config.in"
>   	source "package/ts4900-fpga/Config.in"
>   	source "package/ux500-firmware/Config.in"
> -	source "package/wilc1000-firmware/Config.in"
> +	source "package/wilc-firmware/Config.in"
>   	source "package/wilink-bt-firmware/Config.in"
>   	source "package/zd1211-firmware/Config.in"
>   endmenu
> diff --git a/package/wilc1000-firmware/Config.in b/package/wilc-firmware/Config.in
> similarity index 82%
> rename from package/wilc1000-firmware/Config.in
> rename to package/wilc-firmware/Config.in
> index 0734c7ad99..72a9c73206 100644
> --- a/package/wilc1000-firmware/Config.in
> +++ b/package/wilc-firmware/Config.in
> @@ -1,5 +1,11 @@
> +config BR2_PACKAGE_WILC_FIRMWARE
> +	bool
> +	help
> +	  Provider package for WILC1000_FIRMWARE & WILC3000_FIRMWARE
> +
>   config BR2_PACKAGE_WILC1000_FIRMWARE
>   	bool "wilc1000-firmware"
> +	select BR2_PACKAGE_WILC_FIRMWARE

  This is not how we normally do thing. We normally have a package with sub-options:

config BR2_PACKAGE_FOO
...

if BR2_PACKAGE_FOO
config BR2_PACKAGE_FOO_WLC1000
config BR2_PACKAGE_FOO_WLC3000
endif


  However, the approach you took is pretty elegant, and I don't see anything 
wrong with it. So in the end I applied as is.

  Regards,
  Arnout

>   	help
>   	  Firmware for Microchip WILC1000 wireless device
>   
> @@ -12,9 +18,9 @@ config BR2_PACKAGE_WILC1000_FIRMWARE
>   
>   	  https://github.com/linux4wilc/firmware
>   
> -if BR2_PACKAGE_WILC1000_FIRMWARE
>   config BR2_PACKAGE_WILC3000_FIRMWARE
>   	bool "wilc3000-firmware"
> +	select BR2_PACKAGE_WILC_FIRMWARE
>   	help
>   	  Firmware for Microchip WILC3000 wireless device
>   
> @@ -26,4 +32,3 @@ config BR2_PACKAGE_WILC3000_FIRMWARE
>   	  These will be installed to /lib/firmware/mchp/
>   
>   	  https://github.com/linux4wilc/firmware
> -endif
> diff --git a/package/wilc1000-firmware/wilc1000-firmware.hash b/package/wilc-firmware/wilc-firmware.hash
> similarity index 62%
> rename from package/wilc1000-firmware/wilc1000-firmware.hash
> rename to package/wilc-firmware/wilc-firmware.hash
> index 9d55be9edc..2f1fc9964d 100644
> --- a/package/wilc1000-firmware/wilc1000-firmware.hash
> +++ b/package/wilc-firmware/wilc-firmware.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated
> -sha256  29bb5739136cdb4088cb52af59badce05cc7e562bca40e9f29fef7f8f7c19cb8  wilc1000-firmware-wilc_linux_15_6.tar.gz
> +sha256  29bb5739136cdb4088cb52af59badce05cc7e562bca40e9f29fef7f8f7c19cb8  wilc-firmware-wilc_linux_15_6.tar.gz
> diff --git a/package/wilc1000-firmware/wilc1000-firmware.mk b/package/wilc-firmware/wilc-firmware.mk
> similarity index 51%
> rename from package/wilc1000-firmware/wilc1000-firmware.mk
> rename to package/wilc-firmware/wilc-firmware.mk
> index 0af81c7110..19185bcb9b 100644
> --- a/package/wilc1000-firmware/wilc1000-firmware.mk
> +++ b/package/wilc-firmware/wilc-firmware.mk
> @@ -1,35 +1,35 @@
>   ################################################################################
>   #
> -# wilc1000-firmware
> +# wilc-firmware
>   #
>   ################################################################################
>   
> -WILC1000_FIRMWARE_VERSION = wilc_linux_15_6
> -WILC1000_FIRMWARE_SITE = $(call github,linux4wilc,firmware,$(WILC1000_FIRMWARE_VERSION))
> +WILC_FIRMWARE_VERSION = wilc_linux_15_6
> +WILC_FIRMWARE_SITE = $(call github,linux4wilc,firmware,$(WILC_FIRMWARE_VERSION))
>   
> -WILC1000_FIRMWARE_LICENSE = Microchip firmware
> -WILC1000_FIRMWARE_LICENSE_FILES = LICENSE.wilc_fw
> +WILC_FIRMWARE_LICENSE = Microchip firmware
> +WILC_FIRMWARE_LICENSE_FILES = LICENSE.wilc_fw
>   
>   ifeq ($(BR2_PACKAGE_WILC1000_FIRMWARE),y)
> -WILC1000_FIRMWARE_FILES += \
> +WILC_FIRMWARE_FILES += \
>   	wilc1000_wifi_firmware.bin
>   endif
>   
>   ifeq ($(BR2_PACKAGE_WILC3000_FIRMWARE),y)
> -WILC1000_FIRMWARE_FILES += \
> +WILC_FIRMWARE_FILES += \
>   	wilc3000_ble_firmware.bin \
>   	wilc3000_wifi_firmware.bin
>   endif
>   
> -define WILC1000_FIRMWARE_INSTALL_FILES
> +define WILC_FIRMWARE_INSTALL_FILES
>   	cd $(@D) && \
> -		$(TAR) cf install.tar $(sort $(WILC1000_FIRMWARE_FILES)) && \
> +		$(TAR) cf install.tar $(sort $(WILC_FIRMWARE_FILES)) && \
>   		$(TAR) xf install.tar -C $(TARGET_DIR)/lib/firmware/mchp
>   endef
>   
> -define WILC1000_FIRMWARE_INSTALL_TARGET_CMDS
> +define WILC_FIRMWARE_INSTALL_TARGET_CMDS
>   	$(INSTALL) -d -m 0755 $(TARGET_DIR)/lib/firmware/mchp/
> -	$(WILC1000_FIRMWARE_INSTALL_FILES)
> +	$(WILC_FIRMWARE_INSTALL_FILES)
>   endef
>   
>   $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
