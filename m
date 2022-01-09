Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CFCC433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 21:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A31A401C2;
	Sun,  9 Jan 2022 21:31:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hIrhfwsp4H_T; Sun,  9 Jan 2022 21:31:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE74C401E1;
	Sun,  9 Jan 2022 21:31:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0FEF81BF3C0
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 21:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2568812E4
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 21:31:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9d0O2OQLRqh7 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 21:31:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E4AF2812C3
 for <buildroot@busybox.net>; Sun,  9 Jan 2022 21:31:46 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so4606657wmb.1
 for <buildroot@busybox.net>; Sun, 09 Jan 2022 13:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qkI3kXGvlijnqXPnMp1mPRi+MstHSoAEEg286nBySzI=;
 b=aLsrWYyijcWy2srJvz849WGY4bP4Q/f0DeN0clB1FuKJiav+Y75XSPxWlWNBnJq3v9
 SZzRZoI+JzJNN7zvvSUOE7CJtTuflWFsFDkXeoxsVnw7292eHt92wMeGt1l4aGUaon/e
 N5KfD9h08Y5cG1gglc301dhDwGOc1h1Oq7fvZvBR8eGK7s53EnCxGz5M6jj9zWTk9syt
 I5rT64V0WJIXuUcV8Tj4GpcILECubg5t4FrXO4/5YB2cyuPgmkrEw5kKXfZ/mXD3vq6G
 Q9txBNlBF+35BBi+3TBpiPAUtVjgn1NsAV7bth1YJiCbdUjMBXmRs9nUBjOxRi89Wmqu
 /ziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qkI3kXGvlijnqXPnMp1mPRi+MstHSoAEEg286nBySzI=;
 b=JW7JBGBovZSqYTTg/e3CNJorJU2QjHEUZX7yRwQDFdPZoWCZf5i6H8HSbRqqZB1YhC
 V3JIxLQxVmJvikTdQ3e6Gzrnm/235QGiLOA+RuXAA33hi26KEFKNV4vbsrrInt4VSIkO
 ZMOWuT7N/cQ6aaH0qZpLNxt8P2W522I7HOd5FN2Rloj2c4PD1323Zsx4PKprs5kv1vMo
 Pqj/DcGFSmSnUAWN2B5MlCkdyrERw9C0AVxH7twZ7hSwZIpCGdIbqggGKgv1EXC8mbSW
 XD8+/iH7/wbOLqyhl3xNOTQtr5Kg0601sLw5ev1YcapZ86b2LW/b3NC8TxtaVdLuXo0Z
 qu5w==
X-Gm-Message-State: AOAM532qnM0FUm6xK9WVgt4afVMeRZLJXKxlOrsa1sVUmhOPrGf5Ln9f
 e/5EKOlxbgQUdWchYoF+sTZfTA==
X-Google-Smtp-Source: ABdhPJymJ261RtgAPwONLhpatyjWbfqQaKu2isVMNFT/ffkEzCaUvkDuaMdV4u8fPn9sTofG9cAQ/A==
X-Received: by 2002:a1c:740e:: with SMTP id p14mr211253wmc.137.1641763904869; 
 Sun, 09 Jan 2022 13:31:44 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id f13sm5460191wri.51.2022.01.09.13.31.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 13:31:44 -0800 (PST)
Message-ID: <09e43668-2c6a-05c2-cb54-c2a2468f1ed8@mind.be>
Date: Sun, 9 Jan 2022 22:31:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@busybox.net
References: <20210110222833.26301-1-ps.report@gmx.net>
 <20210110222833.26301-10-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210110222833.26301-10-ps.report@gmx.net>
Subject: Re: [Buildroot] [RFC v2 09/12] package/qt5base: add vulkan option
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
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>    - no changes
> 
> Notes:
>    - eglfs/vulkan is only implemented for eglfs_viv
>      (see stub implementation for QEglFSDeviceIntegration::createPlatformVulkanInstance()
>      in src/plugins/platforms/eglfs/api/qeglfsdeviceintegration.cpp and
>      real implementation for QEglFSVivIntegration::createPlatformVulkanInstance()
>      in src/plugins/platforms/eglfs/deviceintegration/eglfs_viv/qeglfsvivintegration.cpp)
>    - or for xcb (see QXcbIntegration::createPlatformVulkanInstance()
>      in src/plugins/platforms/xcb/qxcbintegration.cpp)
> ---
>   package/qt5/qt5base/Config.in  | 11 +++++++++++
>   package/qt5/qt5base/qt5base.mk |  7 +++++++
>   2 files changed, 18 insertions(+)
> 
> diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
> index ee7c757c60..377a754f37 100644
> --- a/package/qt5/qt5base/Config.in
> +++ b/package/qt5/qt5base/Config.in
> @@ -175,6 +175,17 @@ config BR2_PACKAGE_QT5BASE_OPENGL_LIB
>   
>   endif
>   
> +config BR2_PACKAGE_QT5BASE_VULKAN
> +	bool "Vulkan support"
> +	# all vulkan-loader introduced dependencies superseeded by qt5 own ones
> +	# depends on BR2_INSTALL_LIBSTDCPP # vulkan-loader
> +	# depends on !BR2_STATIC_LIBS # vulkan-loader
> +	# depends on BR2_TOOLCHAIN_HAS_THREADS # vulkan-loader

  Just keep them, doesn't matter that qt5 already has them. Only if it becomes 
very complicated it's worth optimising it.

  However, shouldn't we have a virtual package to make sure there's also a 
vulkan provider, similar like we have for GL? Or isn't that needed because it's 
mediated through the loader library? It indeed doesn't look like Qt needs to 
link with the vulkan provider (i.e. mesa3d at this point).

  Regards,
  Arnout


> +	select BR2_PACKAGE_VULKAN_HEADERS
> +	select BR2_PACKAGE_VULKAN_LOADER
> +	help
> +	  This option enables Vulkan support.
> +
>   config BR2_PACKAGE_QT5BASE_LINUXFB
>   	bool "linuxfb support"
>   
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index 84e9fa4edb..3755e306d1 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -196,6 +196,13 @@ else
>   QT5BASE_CONFIGURE_OPTS += -no-opengl
>   endif
>   
> +ifeq ($(BR2_PACKAGE_QT5BASE_VULKAN),y)
> +QT5BASE_CONFIGURE_OPTS += -feature-vulkan
> +QT5BASE_DEPENDENCIES   += vulkan-headers vulkan-loader
> +else
> +QT5BASE_CONFIGURE_OPTS += -no-feature-vulkan
> +endif
> +
>   QT5BASE_DEFAULT_QPA = $(call qstrip,$(BR2_PACKAGE_QT5BASE_DEFAULT_QPA))
>   QT5BASE_CONFIGURE_OPTS += $(if $(QT5BASE_DEFAULT_QPA),-qpa $(QT5BASE_DEFAULT_QPA))
>   
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
