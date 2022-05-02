Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64716C433EF
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 21:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 093C860F3D;
	Mon,  2 May 2022 21:26:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XM3LckF-hHBB; Mon,  2 May 2022 21:26:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5E55608D8;
	Mon,  2 May 2022 21:26:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 06AC41BF2BC
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7BF64169B
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:26:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WC916m4nVuVF for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 21:26:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D43841696
 for <buildroot@buildroot.org>; Mon,  2 May 2022 21:26:43 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id kq17so30071092ejb.4
 for <buildroot@buildroot.org>; Mon, 02 May 2022 14:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=f8xmsoxTZmw0yysGSAvI5RWnR0WvWCjQIx6t2tTJ0pg=;
 b=VuJ3PSG7aWskcb5IFVZU9/UJ4BvW25rXL8A0XkRdBQjBxZSpKulvLiXQL3SbyTycVX
 yjFRTCzrc3m+SBBpqjz2vZKnvYvMxB094Qv35YQrT2GZhvaCI4in2q8KB5mG9Gk8ZqVZ
 Y0yxd2iebdTLLAP1TmqS6Mbmk782spITF3qChGXcNQfYoSgUdeKAW5nsI7W9Y1Yki6k7
 3PSUP+mo92yNd8Vd6wiqgHEiJ+arnDc8bWZJ64hi3LKrXgG5LUD2vD7VBbq6FJq7mGyZ
 4ua5I60m2PeZpdkRl5foHdJ5eyDJ7adiqbftI/a9xYn/K9S2f0yojKsE1FN4QObSfmGX
 1fQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=f8xmsoxTZmw0yysGSAvI5RWnR0WvWCjQIx6t2tTJ0pg=;
 b=4uD3A5zyQIHh1FNX/5s4+mi7FyjGLtXkz+BOFA7o10eDr42u9fg5rmeAufGjj3+x/u
 WdP1/Sg7ruH8KjwIY4bTeslc7E704DYfwSNQ2+xZUMiuPlc4V4PH0j6MHUBNqh938tfa
 ic3FHq+X/AXto52n/Xns84SLhR4bWc7nxCjoNtJpHiQqzweGp3gY0JteRdTWihpQnm/j
 3nYiJMefnoi7laerf92daA+UqqNUDXaSuWVD0FZBOf1e1Q2b3p3oiJsMmbY+4rNGalGD
 0Iy/iXkIYYjb8lHWOaaAVUm22N5z8jY+fOdVFHrTkSP/z73IPUVunnmHtJ2s6yklAg6E
 DI8g==
X-Gm-Message-State: AOAM5338ymXx+NO3o0oSzMV1Fn5w9AZp3BDchCZkrqiAfP+Q0KHKZb1E
 xheozR7LvJkTwNQwH3e+wyrJoq8eb0bzbA==
X-Google-Smtp-Source: ABdhPJzHJhId57RZ8uYH2cco1GGeRay0fCU/MgKIbG93ue9oZ8gYzijbwTvfXXUVjDU9481ihWI1tg==
X-Received: by 2002:a17:906:7c96:b0:6f3:b6c4:7b2 with SMTP id
 w22-20020a1709067c9600b006f3b6c407b2mr12889476ejo.676.1651526802172; 
 Mon, 02 May 2022 14:26:42 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 h25-20020a1709070b1900b006f3ef214e36sm3890705ejl.156.2022.05.02.14.26.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 14:26:41 -0700 (PDT)
Message-ID: <8a5671c1-59a0-32c1-393b-3b7c20e646cf@mind.be>
Date: Mon, 2 May 2022 23:26:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Sen Hastings <sen@phobosdpl.com>, buildroot@buildroot.org
References: <ccf280d8-9a86-84ad-9efb-20038c3f8418@phobosdpl.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <ccf280d8-9a86-84ad-9efb-20038c3f8418@phobosdpl.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/mesa3d: add kmsro driver
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
Cc: bernd.kuhls@t-online.de, romain.naour@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 28/04/2022 23:18, Sen Hastings wrote:
> Howdy,
> 
> After Mesa DRI swrast support was removed on 2021.05 I realized that
> GPU acceleration on my RPi 4 (Raspberry pi 4)
> had stopped/never actually worked. After transitioning from
> the deprecated Broadcom EGL library, the RPi 4 (at least) uses
> the VideoCore IV 3D (v3d) driver for rendering, and the
> VideoCore IV (vc4) driver for display output.
> These are "hooked" together with the kmsro driver,
> which was renamed/extended from the pl111 driver to be more generic
> in accomplishing this task.
> 
> https://forums.raspberrypi.com/viewtopic.php?f=67&p=1901014
> 
> http://lists.freedesktop.org/archives/mesa-dev/2019-January/214067.html
> 
> I use the RPi 4 as a specific example, but the kmsro driver is required
> for the task of attaching "render only" GPUs to any sort of
> external display controller/manager type deal.
> This is pretty common AFAIK on lots of SOCs.
> 
> Mesa supports this in combination with a few drivers, including:
> 
> Lima:
> https://docs.mesa3d.org/drivers/lima.html
> 
> Panfrost:
> https://docs.mesa3d.org/drivers/panfrost.html#building
> 
> v3d:
> https://docs.mesa3d.org/drivers/v3d.html
> 
> The current patch adds BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO
> and selects it (along with BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4)
> when BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D is enabled.
> 
> Perhaps it should also be selected in conjunction with
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA,
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST and others?
> 
> Again, technically this is not necessary if you don't want
> display output from your GPU.
> 
> Seeing that
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D
> selects
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
> 
> I assume the primary goal is to auto-select mesa driver options that
> yield functioning display output?
> 
> tldr: The kmsro driver is required to get actual display output
> from some "render only" GPU drivers.
> If a "render only" GPU driver is selected, should the
> kmsro driver be selected by default?
> 
> Signed-off-by: Sen Hastings <sen@phobosdpl.com>
> ---
>   package/mesa3d/Config.in | 14 +++++++++++++-
>   package/mesa3d/mesa3d.mk |  1 +
>   2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index e41da562dc..29e6b0d571 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -151,6 +151,17 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
>   	help
>   	  Mesa driver for iris-based Intel GPUs.
>   +config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO
> +	bool "Gallium kmsro driver"
> +	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> +	help
> +	  "kernel mode setting render-only" driver
> +	  "bridge" driver that hooks up render only GPUs to
> +	  external display controllers/engines.
> +	  Required for actual display output on some systems.
> +	  Must be used in conjunction with a GPU driver.
> +	  Supports: Etnaviv,freedreno,lima,panfrost,v3d
> +
>   config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA
>   	bool "Gallium lima driver"
>   	depends on (BR2_TOOLCHAIN_HAS_SYNC_4 && !BR2_RISCV_32) ||
> !BR2_PACKAGE_XORG7 # libxshmfence
> @@ -263,9 +274,10 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D
>   	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
>   	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>   	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4 # runtime
> +	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO
>   	select BR2_PACKAGE_MESA3D_OPENGL_EGL
>   	help
> -	  Driver for Broadcom VC6 (rpi4) GPUs (needs vc4).
> +	  Driver for Broadcom VC6 (rpi4) GPUs (needs vc4 and kmsro).
>    	  It requires a kernel 4.18+ with DRM V3D support enabled:
>   diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 9f375edc1f..8b9787aa54 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -102,6 +102,7 @@
> MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV)  +=
> etnaviv
>   MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO)
> += freedreno
>   MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915)     +=
> i915
>   MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS)     +=
> iris
> +MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO)    +=
> kmsro

  I was about to apply this (after fixing the horribly whitespace destruction), 
but then I noticed that mesa3d actually doesn't have kmsro as a gallium driver 
option. Instead, it is set automatically:

with_gallium_kmsro = with_gallium_v3d or with_gallium_vc4 or 
with_gallium_etnaviv or with_gallium_panfrost or with_gallium_lima or 
with_gallium_freedreno

  This has been the case since mesa3d was bumped to 21.1.0 in commit 
d51736f47296e3681cdb610765c73424272d42db. This was not part of 2021.05; however, 
at the time, the BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO still existed and it 
was automatically selected by vc4, panfrost, and others.

  So I don't understand why this patch is needed. Does it really have an effect 
for you? Can you explain how it works?


  Regards,
  Arnout


>   MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA)     +=
> lima
>   MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)  +=
> nouveau
>   MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST) +=
> panfrost
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
