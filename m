Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A219C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 21:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A183405B5;
	Sun,  9 Jan 2022 21:34:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ND7sIT2m9dQy; Sun,  9 Jan 2022 21:34:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67DE540591;
	Sun,  9 Jan 2022 21:34:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 933451BF3C0
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 21:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80A6F82410
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 21:34:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 54CuXQCgQ6Hj for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 21:34:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 688F481CFE
 for <buildroot@busybox.net>; Sun,  9 Jan 2022 21:34:02 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id t28so16424560wrb.4
 for <buildroot@busybox.net>; Sun, 09 Jan 2022 13:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Ohjjn96QCIZDVDSlSagW2L85J9Y60bA4FlDVAPx+Xmk=;
 b=EH42p86Pk6J7VMGDyPeFk62doUZOGIV4G1U0+SxWHDw+pBCX8PH0mWSGh5HlpkmEGb
 L7XKuA/5yiBS0BwJS6LTNLxfsT+gq9OLYTr0leun2k5oXvhtM2zuQYWkpugw22t3qY3K
 Si0/aORSGXQ8fLygIFcx2A3VBI1rIJdj/MhwHHvcs0KK6Gno0Q2irigFugonbkZoCKA4
 ejlMNcoYbobglzTkZhG7wVCLyJQllc5UtCn1upUTwgX1o2yQtQyl3vhgImQa6dnbY1gy
 qaOmGfELzpXtAyIESHaPUekI40CiyhJOdN3hYYl9JKizM5YHTW6CBWkcxezDxI9Hcapt
 l3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Ohjjn96QCIZDVDSlSagW2L85J9Y60bA4FlDVAPx+Xmk=;
 b=srZQkZgEbUd1F09CpWPIiGZLWsiu4qsy8SDzqajOZcmSqfDqfTPO5kiIrKDQAaHxVY
 H7mTLboQmy2mBJgWrPIQIsPKoz81AXs2L59TN4avK4sRkvcSMkVjcYxTHs7nEHMASLYc
 s+2dLscPK7nKZZFLGjV/Pa9/Ew7laCVDTR6WeO8OJt7g5ZwE4wllIxBMpQBEMea212pk
 BYeyv4dzxDruyh/Jy6vhpTqzGqNlHHt0teGEH/5I4ixUK7rN9tA3OTDsfMQCfNwhHPi1
 USz0mr7Q0iLnnTy8wpykJeWVO1lnDzKlR5LzrU7AjI8Fw30O7/VOyDiVHCogzV0xrEfm
 ymUw==
X-Gm-Message-State: AOAM530rDc46j7aaCOWc2Yv1496gPvtTQqOx5tDMRuXD/fdUldHr+U1L
 CgXNDhvUrBg0JN0taC8/dwDvqQ==
X-Google-Smtp-Source: ABdhPJwv11Y9RLOqw8F/npDsu4xAGDJRk5MSLxBCfsFPJxsNmjS5BoR5ziGGi2jCAHxTh+DZ4Omf1w==
X-Received: by 2002:a5d:6d4f:: with SMTP id k15mr48612915wri.345.1641764040527; 
 Sun, 09 Jan 2022 13:34:00 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id bg19sm5376403wmb.47.2022.01.09.13.33.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 13:33:59 -0800 (PST)
Message-ID: <08d28504-394a-9857-084b-b7cb107c87a8@mind.be>
Date: Sun, 9 Jan 2022 22:33:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@busybox.net
References: <20210110222833.26301-1-ps.report@gmx.net>
 <20210110222833.26301-11-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210110222833.26301-11-ps.report@gmx.net>
Subject: Re: [Buildroot] [RFC v2 10/12] package/vulkan-loader: add XCB
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
>   package/vulkan-loader/Config.in        | 12 ++++++++++++
>   package/vulkan-loader/vulkan-loader.mk |  8 +++++++-
>   2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/package/vulkan-loader/Config.in b/package/vulkan-loader/Config.in
> index 9c215dc9ce..6ec4b13030 100644
> --- a/package/vulkan-loader/Config.in
> +++ b/package/vulkan-loader/Config.in
> @@ -9,6 +9,18 @@ config BR2_PACKAGE_VULKAN_LOADER
>   
>   	  https://github.com/KhronosGroup/Vulkan-Loader
>   
> +if BR2_PACKAGE_VULKAN_LOADER
> +
> +config BR2_PACKAGE_VULKAN_LOADER_XCB
> +	bool "X.org XCB support"

  I don't think it makes much sense to make this a user-visible option.

> +	depends on BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_LIBXCB
> +
> +comment "X.org XCB support available if X.org is enabled"
> +	depends on !BR2_PACKAGE_XORG7
> +
> +endif # BR2_PACKAGE_VULKAN_LOADER
> +
>   comment "vulkan-loader needs a toolchain w/ C++, dynamic library, threads"
>   	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
>   		!BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/vulkan-loader/vulkan-loader.mk b/package/vulkan-loader/vulkan-loader.mk
> index 9c9ccb2458..f0c20f5687 100644
> --- a/package/vulkan-loader/vulkan-loader.mk
> +++ b/package/vulkan-loader/vulkan-loader.mk
> @@ -13,10 +13,16 @@ VULKAN_LOADER_INSTALL_STAGING = YES
>   VULKAN_LOADER_DEPENDENCIES = vulkan-headers
>   
>   VULKAN_LOADER_CONF_OPTS += \
> -	-DBUILD_WSI_XCB_SUPPORT=OFF \
>   	-DBUILD_WSI_XLIB_SUPPORT=OFF \
>   	-DBUILD_WSI_WAYLAND_SUPPORT=OFF \
>   	-DBUILD_WSI_DIRECTFB_SUPPORT=OFF \
>   	-DUSE_CCACHE=OFF
>   
> +ifeq ($(BR2_PACKAGE_VULKAN_LOADER_XCB),y)

  Just use BR2_PACKAGE_LIBXCB here.

  With that, this can be squashed in the patch that adds vulkan-loader (it's not 
complicated).

  Regards,
  Arnout

> +VULKAN_LOADER_DEPENDENCIES += libxcb
> +VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_XCB_SUPPORT=ON
> +else
> +VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_XCB_SUPPORT=OFF
> +endif
> +
>   $(eval $(cmake-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
