Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF602C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 20:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C3E140103;
	Sun,  9 Jan 2022 20:23:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t7CpCpSTNEPp; Sun,  9 Jan 2022 20:23:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D2544058A;
	Sun,  9 Jan 2022 20:23:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6605B1BF44C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 545858141F
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:23:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BwduU5G0kfWb for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 20:23:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 946FF81419
 for <buildroot@busybox.net>; Sun,  9 Jan 2022 20:23:09 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id w26so1630870wmi.0
 for <buildroot@busybox.net>; Sun, 09 Jan 2022 12:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=y+DKP0EzyIUyFvCw+kX+Z75LOPf1dLR6wYK1ed4L7mA=;
 b=Gg2XV5iogZD58BeROax7E7C1nPCAnItmO8joCTqXIujVV7Vad0rtG1E+mLgCKfXTWe
 kFo0ffP/W7Pm/PaOYA6kK4yfsaU6LLulSCfJaqA0IeMVgjzK0kVEU/SHhs5Jqk9uTdax
 M3uVZ2+/RJcbZ3SU5p7o+UDFCOL7y6/8JurqWhBrf/W6iDs/6PXiWtI91uBxYEojBFGX
 jEbWEDeUmDsuvYdUzf/qE9ofJxobawKtNuUiN9jO+pLdWPEORK9QVBnCF0Nwhe2aIpM2
 toQ/GthoaLsU4kon7LAtdQDt9ehRHKq+KUH5G++hPQqit4R7oXWT1m0j27gvJOGaGw2Q
 2BYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=y+DKP0EzyIUyFvCw+kX+Z75LOPf1dLR6wYK1ed4L7mA=;
 b=nXIIlM45Ftb2rGeGMvZHcXt1wsla8F17sd9R1R24JE6HBqKpxzdAXXBGxE/MI8A3t1
 VitrQ3L+7VNYmyQxFLDE7NHDOhNPhDMG40TbanI4oG8dR5YRIs+RtTwoOhQDFBrf+fnW
 uekrzDIWQT6A/Z/a0pEtPAbL0XXylrNF3SAJC2COJozqJe+qVWpEgPWGFvbTc5CRO8O4
 2TP6wjpOXb9GRhtkaLsHySzT3CrKxGBLDx1qSDe0pgz6fxqz8t9eB1DnkiFCCl5QwJEV
 k/XhwXLsh38YgeXQekyKmI41viYWiuKQghEAjUMg2FnvLGCPhqfX4g7Zsfu/Tq84FvyC
 BwZw==
X-Gm-Message-State: AOAM531DeMfDFyb/Olnsmjm19cJs6KR5MxyVCArBmPbpFWSWL8NJwpD6
 Zv7KGVQ3WwoZx8g/rPuVMB0gm16EjteHMITD
X-Google-Smtp-Source: ABdhPJxOqJpr2GeII7/8Hbxv3I/FVtafXcogH0fhp5tH21cj+wOfSzuHd5z1tJzjCAqNfNfyyVCpew==
X-Received: by 2002:a05:600c:3ac5:: with SMTP id
 d5mr19470042wms.32.1641759787833; 
 Sun, 09 Jan 2022 12:23:07 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id b13sm4968894wrh.32.2022.01.09.12.23.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 12:23:07 -0800 (PST)
Message-ID: <c59eb44a-c626-99a1-ffa5-67d5dc3af7e2@mind.be>
Date: Sun, 9 Jan 2022 21:23:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@busybox.net
References: <20210110222833.26301-1-ps.report@gmx.net>
 <20210110222833.26301-5-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210110222833.26301-5-ps.report@gmx.net>
Subject: Re: [Buildroot] [RFC v2 04/12] package/mesa3d: DRI3 with GLX needs
 xshmfence
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>, Julien Corjon <corjon.j@ecagroup.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/01/2021 23:28, Peter Seiderer wrote:
> Fixes for the following defconfig:
> 
>    BR2_arm=y
>    BR2_cortex_a72=y
>    BR2_ARM_FPU_NEON_VFPV4=y
>    BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
>    BR2_TOOLCHAIN_BUILDROOT_CXX=y
>    BR2_PACKAGE_MESA3D=y
>    BR2_PACKAGE_MESA3D_DRI3=y
>    BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y
>    BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D=y
>    BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4=y
>    BR2_PACKAGE_MESA3D_OPENGL_GLX=y
> 
> this configure error:
> 
>    .../build/mesa3d-20.3.2/meson.build:1772:6: ERROR: Dependency "xshmfence" not found, tried pkgconfig and cmake
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>    - new patch
> ---
>   package/mesa3d/Config.in | 5 +++--
>   package/mesa3d/mesa3d.mk | 6 +++---
>   2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 7a976f4b2c..8a01fa95e2 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -17,6 +17,8 @@ if BR2_PACKAGE_MESA3D
>   
>   config BR2_PACKAGE_MESA3D_DRI3
>   	bool "Enable DRI3 support"
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_MESA3D_OPENGL_GLX
> +	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_MESA3D_OPENGL_GLX

  This was already done, but without the depends on and without the if GLX. I'm 
not entirely sure if the if GLX is actually needed. But really, mesa3d needs a 
big overhaul where the Config.in is compared to the meson.build to check how the 
dependencies and interactions *really* work.

  Therefore, I've marked this patch as Superseded.

  Regards,
  Arnout

>   	help
>   	  Enable DRI3 support.
>   
> @@ -398,7 +400,7 @@ comment "Vulkan drivers"
>   config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
>   	bool "Vulkan Intel driver"
>   	depends on BR2_i386 || BR2_x86_64
> -	# depends on BR2_TOOLCHAIN_HAS_SYNC_4 because of libxshmfence only
> +	# depends on BR2_TOOLCHAIN_HAS_SYNC_4 because of dri3/libxshmfence only
>   	# in case GLX is enabled but the following results in 'recursive
>   	# dependency detected!', so simple depend always on BR2_TOOLCHAIN_HAS_SYNC_4
>   	# depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_MESA3D_OPENGL_GLX # libxshmfence in case GLX is enabled
> @@ -408,7 +410,6 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
>   	select BR2_PACKAGE_EXPAT
>   	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_MESA3D_OPENGL_GLX
>   	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
> -	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_MESA3D_OPENGL_GLX
>   	help
>   	  Vulkan driver for Intel hardware from Ivy Bridge onward.
>   
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 967b86810f..31f1c12d63 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -38,6 +38,9 @@ endif
>   
>   ifeq ($(BR2_PACKAGE_MESA3D_DRI3),y)
>   MESA3D_CONF_OPTS += -Ddri3=enabled
> +ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
> +MESA3D_DEPENDENCIES += xlib_libxshmfence
> +endif
>   else
>   MESA3D_CONF_OPTS += -Ddri3=disabled
>   endif
> @@ -146,9 +149,6 @@ ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),)
>   MESA3D_CONF_OPTS += \
>   	-Dvulkan-drivers=
>   else
> -ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL)$(BR2_PACKAGE_MESA3D_OPENGL_GLX),yy)
> -MESA3D_DEPENDENCIES += xlib_libxshmfence
> -endif
>   MESA3D_CONF_OPTS += \
>   	-Dvulkan-drivers=$(subst $(space),$(comma),$(MESA3D_VULKAN_DRIVERS-y))
>   endif
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
