Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68841C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 20:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1231A83EB9;
	Thu, 14 Apr 2022 20:24:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lEOJHaI4sSlV; Thu, 14 Apr 2022 20:24:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17BAC83E0F;
	Thu, 14 Apr 2022 20:24:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C12931BF393
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE8DF83E0F
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:24:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2brZx73VVctE for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 20:24:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85EE383366
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 20:24:53 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id s25so7304425edi.13
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 13:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lwwRxSWQjQWRmDC5eyp5yULYRwQNMZ6fpVORBvKPiWM=;
 b=FZf4l3sLUMP4e88GptWouWDgM/6AE9DXX6pAdYTWprJPftkL5rNNPSyCMtfIUcI/fk
 t+H4mcJr9pOD5mnmc0dnZ2YGAvPUpCQA6mEoytntygyWZuVhbkuBKPLB/Iw1HvfD7ZmQ
 OaAa0qIuPVQWZoCVSLjSj+PQ+LcqO3sC7HZ78i3GgUmG2Sro1N9Z2GjqSIgRrQkRCuvn
 m9Ir3HL97j8m3IJuPivq9a6Ga+P9/d3yNdlSFX403mm/NZymqlYL+POQNsvXwGzhO0ws
 4mTtqh6PZyRrmDC8Po08ZXnVSXKZyvE7eEVlGaOC+TFBPBHlNf5aY4BtQnjyMIAbhF5d
 +6pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lwwRxSWQjQWRmDC5eyp5yULYRwQNMZ6fpVORBvKPiWM=;
 b=IrFfIXqmZsnn23XnzNMeegq5fba+WZs+2/eykbv42SvurMnz5JFIRDiHhLeTp1Ibjz
 VEpMAuVSW2PuOsb4/hJvjgJn0iwlYi0aSGEiA127AE0btsHvF2L3m/EgR4yHX5sB3jf0
 pYHj9JK8dzHFwo6Xfra5Ifu2vUK9T7FVEie6gexuxw9e/9Nv7MGaMdOCA/9oV5qpFd/p
 kNH30paTv/VP8AJAkaldVwAoWPYkOFTnTy9IF1CnsGlkfqgGhjMhkibyi4CrnCefgfiG
 GcjGxbJ+T/WjN3X/P1FkMxe4d65yUtIg8CwhfbjTkE8YwzPWdmzfLiO0uzV2BoGPWyhU
 QKZg==
X-Gm-Message-State: AOAM531nOF7U2yy0zL+CtFK6LH3N5lAStpPCHAcAmaQQKQ8mYM1UhmDa
 +A6wVssE0GboIUxcpfgXwTaXKg==
X-Google-Smtp-Source: ABdhPJyRJ0VxRslmO7jHlGhROxuEfHhTm847ic3rxLA8ChoGYmpMOwGJrSmYSzJy+Z8Et0h6gEbZhQ==
X-Received: by 2002:aa7:dcd3:0:b0:41d:70e4:bf4d with SMTP id
 w19-20020aa7dcd3000000b0041d70e4bf4dmr4854540edu.223.1649967891778; 
 Thu, 14 Apr 2022 13:24:51 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 lb4-20020a170907784400b006e0d13f65e5sm991352ejc.167.2022.04.14.13.24.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 13:24:51 -0700 (PDT)
Message-ID: <7714f9e1-751c-0b3a-c785-3f76919c281e@mind.be>
Date: Thu, 14 Apr 2022 22:24:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: yegorslists@googlemail.com, buildroot@buildroot.org
References: <20220411090723.13504-1-yegorslists@googlemail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220411090723.13504-1-yegorslists@googlemail.com>
Subject: Re: [Buildroot] [PATCH] package/wpa_supplicant: enable libnl for
 the WIRED driver
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/04/2022 11:07, yegorslists--- via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> BR2_PACKAGE_WPA_SUPPLICANT_WIRED also enables the MACSEC_LINUX
> driver. This driver requires libnl.
> 
> Also fix CONFIG_DRIVER_MACSEC option to enable only the generic
> Linux driver and not QCA extensions.
> 
> Fixes:
> http://autobuild.buildroot.net/results/2dea7dee521794b306cc610601fda322987e6cd0
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>   package/wpa_supplicant/Config.in         |  2 ++
>   package/wpa_supplicant/wpa_supplicant.mk | 11 +++++++++--
>   2 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
> index 8f095cdf2d..0094531548 100644
> --- a/package/wpa_supplicant/Config.in
> +++ b/package/wpa_supplicant/Config.in
> @@ -41,6 +41,8 @@ config BR2_PACKAGE_WPA_SUPPLICANT_WEXT
>   
>   config BR2_PACKAGE_WPA_SUPPLICANT_WIRED
>   	bool "Enable wired support"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl

  You also need to add a comment for this.

> +	select BR2_PACKAGE_LIBNL
>   	select BR2_PACKAGE_WPA_SUPPLICANT_EAP
>   	help
>   	  Include the "wired" driver, so the internal IEEE 802.1x
> diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
> index a2ca8a0b30..ac66d1f7e0 100644
> --- a/package/wpa_supplicant/wpa_supplicant.mk
> +++ b/package/wpa_supplicant/wpa_supplicant.mk
> @@ -63,11 +63,18 @@ WPA_SUPPLICANT_CONFIG_DISABLE += \
>   	CONFIG_FILS
>   endif
>   
> -ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WIRED),)
> +ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WIRED),y)
> +WPA_SUPPLICANT_DEPENDENCIES += host-pkgconf libnl
> +WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_LIBNL32
> +WPA_SUPPLICANT_CONFIG_ENABLE += \

  This looks a bit kludgy, just put everything in a single CONFIG_ENABLE.

  Applied to master with those two fixed, thanks.

  Regards,
  Arnout

> +	CONFIG_DRIVER_WIRED \
> +	CONFIG_MACSEC \
> +	CONFIG_DRIVER_MACSEC_LINUX
> +else
>   WPA_SUPPLICANT_CONFIG_DISABLE += \
>   	CONFIG_DRIVER_WIRED \
>   	CONFIG_MACSEC \
> -	CONFIG_DRIVER_MACSEC
> +	CONFIG_DRIVER_MACSEC_LINUX
>   endif
>   
>   ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_HOTSPOT),)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
