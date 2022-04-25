Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42837C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 20:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E647C404F9;
	Mon, 25 Apr 2022 20:08:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sB_eIdbuHqEg; Mon, 25 Apr 2022 20:08:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E76C34014D;
	Mon, 25 Apr 2022 20:08:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 120101BF2AB
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D92FD4159D
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:08:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mJ8A0b6TGIK7 for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 20:08:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB8DC41609
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 20:08:17 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id m20so11063381ejj.10
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 13:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dE19xohOnOZk6/2clNb4bFEWq91Tq9EEmkYov1GUc6s=;
 b=b40NFt6Xfl8QWC80SH/G4bLcFcZJqk8mfZEutulVh+MPANSLgcaCZ3ELhMF3IY/eHJ
 8cckXhplV0Je2m5N/ofHaXOPHdhkpFiSl8rT3uByuAvcZwXW87G8NoE9nWXnMWttZYf1
 a4o9796I8aVvJu8qs/TN+WDZ6+ZSJvRla/33G3zxOIAl9u1rxHWldIMyzJxWj0zN8Phe
 xLpspPi9GXRIQRYzwdDG3c9nHsTJgxUyd0xRCl16hhNjZHj0aa0buWT7TNljGn58Bc/E
 CKHwZ2CkwTxMRZ8aL5ii/0a1lFaof0anpr4znTptKHGFGLXp35pXyx2vIj9GYfke0cEN
 jzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dE19xohOnOZk6/2clNb4bFEWq91Tq9EEmkYov1GUc6s=;
 b=QVrF0JEDF5gCrUx2J4L6sOaUa3eQh3sh7KXpPQVvKO/ScAMqvHp2aRjn9ong+y4A/9
 lGw1LMbucd2qSlXXFPL3mFSMR8RF3lClE/CWYOar3jGcoZQij/RO6FpdAqqAPimMmR9a
 ArwtVQdgplHipsgo9PUJsOYJ3uGK014cnBaNhoSX5TICAZsEq1ymaJO7P3wCsJ+V/uYg
 imVqFBqFDBjCiVHOJK7zmyi+U6bcbPSF5TOGNMqpbGb/i42260eGEwN4nT3hXSEFoj8P
 aot5L85NXVlIv8Woeqj289KcNYfVN5n7RdBywdbFmw/pC1ty4NhW6bUGbZsfKGVZtTZ4
 3Ssw==
X-Gm-Message-State: AOAM533epJTlQv0mXbk/9wthK3r/3hKCDGnQJ7Yx941tjOeovCkayU/R
 opI+hWuPqe4eKNsn/NIItw5AIQoy9ls2rg==
X-Google-Smtp-Source: ABdhPJzrSneuEoBGR/S35NYOU73deeueEkNoi+RHjbVAto8Z4S1uRpwNXIMeasaUjJlfpwYYH3PQHA==
X-Received: by 2002:a17:907:da7:b0:6df:9ff4:10c7 with SMTP id
 go39-20020a1709070da700b006df9ff410c7mr17481089ejc.106.1650917295902; 
 Mon, 25 Apr 2022 13:08:15 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 h23-20020a0564020e9700b00420fff23180sm4898513eda.41.2022.04.25.13.08.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 13:08:15 -0700 (PDT)
Message-ID: <bd22fe79-3af6-a1c6-d941-58265f715ac4@mind.be>
Date: Mon, 25 Apr 2022 22:08:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Kris Bahnsen <kris@embeddedTS.com>, buildroot@buildroot.org
References: <20220422223611.10443-1-kris@embeddedTS.com>
 <20220422223611.10443-5-kris@embeddedTS.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220422223611.10443-5-kris@embeddedTS.com>
Subject: Re: [Buildroot] [PATCH v2 4/4] package/wilc-driver: new package
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
> WILC1000/3000 driver pulled from at91-linux tree set-up to be built
> as an external module. Upstream Linux kernel does not support
> WILC3000 features at this time. This package is intended to bridge
> that gap until WILC1000/3000 is fully supported in kernel.
> 
> Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
[snip]
> diff --git a/package/wilc-driver/wilc-driver.hash b/package/wilc-driver/wilc-driver.hash
> new file mode 100644
> index 0000000000..b51591e8d8
> --- /dev/null
> +++ b/package/wilc-driver/wilc-driver.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  4796b1a53781f8702a335b0146d488a9422b71dab39f6f154f955b0ad1711199  wilc-driver-linux4microchip-2021.10-1.tar.gz

  Hash for license file missing again.
  Applied to master with that fixed, thanks.

  Regards,
  Arnout

> diff --git a/package/wilc-driver/wilc-driver.mk b/package/wilc-driver/wilc-driver.mk
> new file mode 100644
> index 0000000000..a89af30e29
> --- /dev/null
> +++ b/package/wilc-driver/wilc-driver.mk
> @@ -0,0 +1,29 @@
> +################################################################################
> +#
> +# wilc-driver
> +#
> +################################################################################
> +
> +WILC_DRIVER_VERSION = linux4microchip-2021.10-1
> +WILC_DRIVER_SITE = $(call github,embeddedTS,wilc3000-external-module,$(WILC_DRIVER_VERSION))
> +
> +WILC_DRIVER_LICENSE = GPL-2.0
> +WILC_DRIVER_LICENSE_FILES = LICENSE
> +
> +ifeq ($(BR2_PACKAGE_WILC_DRIVER_SPI),y)
> +WILC_DRIVER_MODULE_MAKE_OPTS += \
> +	CONFIG_WILC_SPI=m
> +endif
> +
> +ifeq ($(BR2_PACKAGE_WILC_DRIVER_SDIO),y)
> +WILC_DRIVER_MODULE_MAKE_OPTS += \
> +	CONFIG_WILC_SDIO=m
> +endif
> +
> +ifeq ($(BR2_PACKAGE_WILC_DRIVER_SDIO_OOB),y)
> +WILC_DRIVER_MODULE_MAKE_OPTS += \
> +	CONFIG_WILC_HW_OOB_INTR=y
> +endif
> +
> +$(eval $(kernel-module))
> +$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
