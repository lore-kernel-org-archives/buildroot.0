Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8690AC433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 21:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18C5880B97;
	Sun,  9 Jan 2022 21:36:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tXOy_t3XCjZy; Sun,  9 Jan 2022 21:36:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C23F80B98;
	Sun,  9 Jan 2022 21:36:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 125811BF3C0
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 21:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 011BB80B98
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 21:36:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wFfScTXkoP8Y for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 21:36:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2238780B97
 for <buildroot@busybox.net>; Sun,  9 Jan 2022 21:36:31 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 o203-20020a1ca5d4000000b003477d032384so4581166wme.2
 for <buildroot@busybox.net>; Sun, 09 Jan 2022 13:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fA9EcInRtNMjTuhJkV4IfV/Bzs+TK+RQHhrBmZ3UhC0=;
 b=FbQrxvuFawfcEyVzldrhxXWSLA1k6zy6Q0q6eMfj2MkHpy7louFJm8u9Cdvo4XCfsz
 ONwGHaF6oZDe4nzUAmt9U31H8CJ2QHM74C2U/QE2CLC8I9CBIlIQxzEjg/gBrjqnl/Kl
 luDLzGnPPtOUMLk1Auq06Yt/U7P/pSe+JW2yDmR0PYrclJEXCPea9UL5mQlwu/DmsM92
 eFde4O5HsS64wKeNiRvomWiCRhS0r3xgSXw9uCn5M1bNNmh6924xPN92laO9dH9GWV7c
 PGef8HVb+s56J5IuooJRGfmcoyep9pHOjODF/xZLvPL+rFYJKEYQ2ixHpWXmCuzs3JHM
 98uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fA9EcInRtNMjTuhJkV4IfV/Bzs+TK+RQHhrBmZ3UhC0=;
 b=uxlMMICwkuvt7K7ISft5U96UgvliCT/5xbALugjbUlsr8LppeqrbrxqWY9ws1t3zPP
 n34MYA3Xkm/3EuKbSYrBqrpsHGwZmVK0Sbuz67KUPM+iAER6WBOTalLhLKof3EVQOCDG
 lmtM2ydOuG5PQ4glRWOu/PrRyjrtnzgyBN8nR7Hm+PvESifKai3gyUlnGZh5muM3u5Zy
 9cJU7fmL9/dIF8OJBIVzvoUqxaEb4irz9i/xkoS2qEzlE2Hr8hPwwQgFKK6RpD/daohF
 REDcg2HkV6JdvxoEG6a/P7mpiWqK3IVeOl2O3Py/7wSwZM5w2s7fncYC5HZh2sVlSCVs
 lGYQ==
X-Gm-Message-State: AOAM530O1HjS9W4KhEJdJ/kmz8cBWVNzbpP2+QLL/sp6VVm/ycbbXdiq
 LZlhpoceTLCO9X4gjJYiiKCccg==
X-Google-Smtp-Source: ABdhPJzhb4Zs+rJDkJtWatlHZfL4328WeOxTRLUZMLRmFqfZznIwkqAqTJdG3EskO3zKPJXV4xFieQ==
X-Received: by 2002:a1c:a747:: with SMTP id q68mr18192452wme.98.1641764189354; 
 Sun, 09 Jan 2022 13:36:29 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id v3sm5022894wro.42.2022.01.09.13.36.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 13:36:29 -0800 (PST)
Message-ID: <b5d438c9-035a-9c97-00da-5e8e00bafc19@mind.be>
Date: Sun, 9 Jan 2022 22:36:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@busybox.net
References: <20210110222833.26301-1-ps.report@gmx.net>
 <20210110222833.26301-12-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210110222833.26301-12-ps.report@gmx.net>
Subject: Re: [Buildroot] [RFC v2 11/12] package/vulkan-tools: add XCB support
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
>    - new patch
> ---
>   package/vulkan-tools/Config.in       | 14 ++++++++++++++
>   package/vulkan-tools/vulkan-tools.mk |  8 +++++++-
>   2 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/package/vulkan-tools/Config.in b/package/vulkan-tools/Config.in
> index 54fa539dab..14c4059074 100644
> --- a/package/vulkan-tools/Config.in
> +++ b/package/vulkan-tools/Config.in
> @@ -12,6 +12,20 @@ config BR2_PACKAGE_VULKAN_TOOLS
>   
>   	  https://github.com/KhronosGroup/Vulkan-Tools
>   
> +if BR2_PACKAGE_VULKAN_TOOLS
> +
> +config BR2_PACKAGE_VULKAN_TOOLS_XCB
> +	bool "X.org XCB support"
> +	depends on BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_XLIB_LIBX11
> +	select BR2_PACKAGE_LIBXCB
> +	select BR2_PACKAGE_VULKAN_LOADER_XCB
> +
> +comment "X.org XCB support available if X.org is enabled"
> +	depends on !BR2_PACKAGE_XORG7
> +
> +endif # BR2_PACKAGE_VULKAN_TOOLS
> +
>   comment "vulkan-tools needs a toolchain w/ C++, dynamic library, threads, gcc >= 4.9"
>   	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
>   		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> diff --git a/package/vulkan-tools/vulkan-tools.mk b/package/vulkan-tools/vulkan-tools.mk
> index 129efddf3b..5b4d761ddb 100644
> --- a/package/vulkan-tools/vulkan-tools.mk
> +++ b/package/vulkan-tools/vulkan-tools.mk
> @@ -16,10 +16,16 @@ VULKAN_TOOLS_CONF_OPTS += \
>   	-DBUILD_VULKANINFO=ON \
>   	-DBUILD_ICD=OFF \
>   	-DINSTALL_ICD=OFF \
> -	-DBUILD_WSI_XCB_SUPPORT=OFF \
>   	-DBUILD_WSI_XLIB_SUPPORT=OFF \
>   	-DBUILD_WSI_WAYLAND_SUPPORT=OFF \
>   	-DBUILD_WSI_DIRECTFB_SUPPORT=OFF \
>   	-DUSE_CCACHE=OFF
>   
> +ifeq ($(BR2_PACKAGE_VULKAN_TOOLS_XCB),y)

  Same, BR2_PACKAGE_LIBXCB.

> +VULKAN_TOOLS_DEPENDENCIES += libxcb xlib_libX11

  Hm, maybe this should go together with BUILD_WSI_XLIB_SUPPORT ?

  Regards,
  Arnout

> +VULKAN_TOOLS_CONF_OPTS += -DBUILD_WSI_XCB_SUPPORT=ON
> +else
> +VULKAN_TOOLS_CONF_OPTS += -DBUILD_WSI_XCB_SUPPORT=OFF
> +endif
> +
>   $(eval $(cmake-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
