Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC6DC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 21:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 203F44010E;
	Sun,  9 Jan 2022 21:47:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NkFMMbTqzpcK; Sun,  9 Jan 2022 21:47:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BDC8404D4;
	Sun,  9 Jan 2022 21:47:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3FC4B1BF3C0
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 21:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E02F81A39
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 21:47:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0FUa73RfyRm1 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 21:47:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 58B8F81959
 for <buildroot@busybox.net>; Sun,  9 Jan 2022 21:47:45 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 c126-20020a1c9a84000000b00346f9ebee43so6154867wme.4
 for <buildroot@busybox.net>; Sun, 09 Jan 2022 13:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=l3ZH3yGjIg7G9hAlBauuCiFfe/VW6bPpA6x4uMjVAFI=;
 b=F7FWusnXOOarM3c1G26JlIPKaHWpuTIyeV7czwLsxaKtDJ5oFVzZosnVxnnHQYOzqv
 Mtvflyzzbg5be01dZ7BWSp2jFIy5MfNLTwzapiGz/0Y6wS2BvxbMLhICOvJIBNjBOhm4
 SayR4hW1MiAF2htJW2T8NBTZB6L3wEcxUMMJ6IYMMpVjM2yuYLXvPlANrLOUh4c3uSFY
 cFH7Tspzqe3jUeUsbpVfRUTs12nyIaamzVXrv0xUxQSW8IM+jLtagAUh0aPX/YwI8kMe
 gRAEMN/20GAvTNUFEyvikRhp2SUghTifkkKu9qEJugPbIk9CHq7s6Rd0hefRycTwta7t
 KVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=l3ZH3yGjIg7G9hAlBauuCiFfe/VW6bPpA6x4uMjVAFI=;
 b=kTkyKXeFeey1GxposcjPx+sR4LyhFloRt43rsv8VSDcGM9GVdV4pMnJGPBsYjg6JHc
 LSa2f7nCW0jAi3n79wl2ATFEDlnKnE8GYlSskb5O7sFQuLvuwUmbsUZZEUhW6ziHiqE8
 vyD2PpLdAaAZQhs/qpKU+13ZF0Wz1ToNiTh7AMcozsMGwU44PKH6Hb+8k3OAY4ZIZfcy
 oXOCWWRch/9XpIUz4mp8EGRZLWUXu4feVYCWMzKFSGJrzDhWZAXIdXn1tctk7xQy20TJ
 j3b9+BJtKGSGbYE2M3AsFKo6lLkt5nCtAsKY+aesmOU7zEecr6fjappA3t5jhxE4jzoA
 1sDw==
X-Gm-Message-State: AOAM533diIChAevv9vlfC7TsIlecsT2pmT9VnKJj5ZnGwI/Rc0hHWy2v
 9Fk5OvhUvFCusj9d0gXn+c6nqa9lCTfY7JE0
X-Google-Smtp-Source: ABdhPJzCOJUHlDHEgMXl+u2toqxY4Y5PQVrbSdl7q3ICs2f+2tWMje1wxfXR+yh5Jnld64JdmE7N/g==
X-Received: by 2002:a1c:a9c2:: with SMTP id
 s185mr13402821wme.164.1641764863570; 
 Sun, 09 Jan 2022 13:47:43 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id z22sm5512615wmp.40.2022.01.09.13.47.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 13:47:43 -0800 (PST)
Message-ID: <74914dd5-1c62-1e3c-fd8b-a57bc33e5293@mind.be>
Date: Sun, 9 Jan 2022 22:47:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@busybox.net
References: <20210110222833.26301-1-ps.report@gmx.net>
 <20210110222833.26301-13-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210110222833.26301-13-ps.report@gmx.net>
Subject: Re: [Buildroot] [RFC v2 12/12] WIP: package/mesa3d: add vulkan
 swrast driver support
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
>    - no changes (besides clearifying notes comment)
> 
> Notes:
>    - link failure when selected stand alone, fine in case
>      vulkan-broadcom is selected too (selecting vulkan-intel
>      instead does not work)

  In future submissions, paste the link error so others can give some idea about 
debugging it.

> ---
>   package/mesa3d/Config.in | 13 +++++++++++++
>   package/mesa3d/mesa3d.mk |  1 +
>   2 files changed, 14 insertions(+)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 5da9bfe08a..66776c9ad9 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -429,6 +429,19 @@ comment "intel vulkan depends on X.org and needs a glibc toolchain w/ headers >=
>   	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 || \
>   		!BR2_TOOLCHAIN_USES_GLIBC || !BR2_PACKAGE_XORG7
>   
> +config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_SWRAST
> +	bool "Vulkan swrast driver"
> +	depends on !BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST

  These kind of dependencies are somewhat annoying, but OK. Fortunately, 
dri-swrast was removed upstream, so it's no longer relevant.


> +	select BR2_PACKAGE_EXPAT
> +	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER

  Implied by gallium-swrast.

  Regards,
  Arnout

> +	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
> +	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
> +	help
> +	  Vulkan swrast driver.
> +
> +comment "Vulkan swrast: Only one swrast provider can be built"
> +	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
> +
>   comment "Off-screen Rendering"
>   
>   config BR2_PACKAGE_MESA3D_OSMESA_CLASSIC
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 62dc7db91d..4679416b4d 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -121,6 +121,7 @@ MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON) += r100
>   # Vulkan Drivers
>   MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM) += broadcom
>   MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL)   += intel
> +MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_SWRAST) += swrast
>   
>   ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER),)
>   MESA3D_CONF_OPTS += \
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
