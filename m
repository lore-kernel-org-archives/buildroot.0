Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDFEC433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 22:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B203E60E65;
	Mon, 20 Dec 2021 22:35:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cZK4_KKFV3SU; Mon, 20 Dec 2021 22:35:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14CFC60E39;
	Mon, 20 Dec 2021 22:35:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DA65D1BF5A6
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D707C60E39
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:34:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D9ALkexxAp0y for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 22:34:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 03A8F605BA
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 22:34:57 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id b13so15735316edd.8
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 14:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=unXAmWXCjcigkYsn/WkPlfwoMMOsHVOEtED96PU/GyA=;
 b=UNte8CghmT+QM6xKctmtvF0s1Tf7yNty9vHF5udA3XDX7Oo/RknAvfKmBMOqihua9N
 l22ZR3xYjaFnk3UlX0iktsV21qYBEzsD6cH3BeiqTL9Mzk2HWoVR1r61zsyJLhuJ4/4c
 nhEzFSDpwNug9Jc+eyJtl57/HWQU+V6Vh3JlJ2UhDeYUCrq52LeWRR7h9g09tFzZkIQ0
 i/YqoE0MVBZJMUiSw9w0Oe6uiXCStX2+kRXEjiZcs1vRALtx6LXEpA5AoxsmSpBY20a6
 qB+amYN9ccjbJLkcoqptNE2/0TKnPpS1c0/KkfHXDSWLhFGSx3VK9Gh7hx8U+3AwyEUS
 cpUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=unXAmWXCjcigkYsn/WkPlfwoMMOsHVOEtED96PU/GyA=;
 b=U6za6K2xeOq7Nt2Psk8KZbD3y98XSz3CfhAVKyDY7XctKXYNcCPIyG0OndBNXERcIa
 tO5HtO0ZpCLnAdbusH/tPy1kEBgicXJeYmaCg2JUQVgG4d9zbeHSIBLn4w91+m4xvkU0
 64ts/IxlEb1A7K795qyL9QxtjHZb2P1mkyROKeJdjAYznQltkPa4KMf8Kwkm/ugIR35L
 3eztI8nVssMnSV53Z4LQmC4ag7nq1KBG/LjobxDgggyzsGQSR3HTkAd0PrU0FFYFvodH
 wwhCybyB+IOv8UYIeoknx9B/V7M2HOzDDYj4RV5dw9kVK6b5G4J2ifVg4+sypDAxYfwZ
 UUUA==
X-Gm-Message-State: AOAM533nKXHVXxJTWNnJs8AQtvzm96nncZRBm4Na44CBbRZwvwy46n4U
 dDERTkdykvj8esR+XaDfknWebA==
X-Google-Smtp-Source: ABdhPJz7w/i4rl/plHgX3S/zj+sRDxNpCxPtwj44FgfIDmnPW0LdNtjg3oeeGFDN2ZFkqpwmuHsnkA==
X-Received: by 2002:a17:906:7217:: with SMTP id
 m23mr205891ejk.735.1640039696263; 
 Mon, 20 Dec 2021 14:34:56 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id gb10sm791563ejc.49.2021.12.20.14.34.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 14:34:55 -0800 (PST)
Message-ID: <7a83327c-5600-754c-0c6e-aad38b9bbda3@mind.be>
Date: Mon, 20 Dec 2021 23:34:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211217190853.18713-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211217190853.18713-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/3] package/gupnp-dlna: add introspection
 support
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/12/2021 20:08, Fabrice Fontaine wrote:
> - introspection support is needed to build latest rygel version
> - build vala bindings to avoid a build failure as already done in other
>    packages such as gssdp in commit
>    d513e55930eda15a5fb15e00c1da774e6c18f66c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Both applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/gupnp-dlna/gupnp-dlna.mk | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gupnp-dlna/gupnp-dlna.mk b/package/gupnp-dlna/gupnp-dlna.mk
> index 85d30b7cd2..dd548e3e2d 100644
> --- a/package/gupnp-dlna/gupnp-dlna.mk
> +++ b/package/gupnp-dlna/gupnp-dlna.mk
> @@ -15,9 +15,14 @@ GUPNP_DLNA_LICENSE_FILES = COPYING
>   GUPNP_DLNA_INSTALL_STAGING = YES
>   GUPNP_DLNA_DEPENDENCIES = host-pkgconf libglib2 libxml2
>   
> -GUPNP_DLNA_CONF_OPTS = \
> -	--disable-introspection \
> -	--disable-legacy-gstreamer-metadata-backend
> +GUPNP_DLNA_CONF_OPTS = --disable-legacy-gstreamer-metadata-backend
> +
> +ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> +GUPNP_DLNA_CONF_OPTS += --enable-introspection
> +GUPNP_DLNA_DEPENDENCIES += host-vala gobject-introspection
> +else
> +GUPNP_DLNA_CONF_OPTS += --disable-introspection
> +endif
>   
>   ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
>   GUPNP_DLNA_CONF_OPTS += --enable-gstreamer-metadata-backend
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
