Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82667C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 20:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 394E6605A5;
	Sun,  9 Jan 2022 20:20:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9obQCPBOdshf; Sun,  9 Jan 2022 20:20:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BE0060BD0;
	Sun,  9 Jan 2022 20:20:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8DDDA1BF44C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7711981BC6
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:20:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZRktE9p5TbqY for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 20:19:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 54E4B81B71
 for <buildroot@busybox.net>; Sun,  9 Jan 2022 20:19:59 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 c126-20020a1c9a84000000b00346f9ebee43so6069365wme.4
 for <buildroot@busybox.net>; Sun, 09 Jan 2022 12:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ynjRJ4fi+6SwNa/ktOjSS9LxbzSuBBwUgDoAWiANJ2c=;
 b=A+PkBEM7ULeMZcQN1yxKLJT0RjnNEJpnimQDJt8ovhmzhG6x0UBpVv22hNJTmgH/Ne
 eahta299+WEPuPblOz2juHp9XDZPkT6NUPD7DbnKe5aKxR5KwSbbQzPFDa5zl416ZTFq
 lbGrJX05CDFrbtB0bN12mX31d/k9HgWPvfd7a9zWWj1cO0WdMamucWfLy9/eDHf3cnTK
 TW+HwRzpm4wXIstqENYZTCAIlqw3kzf/o2xXFJ39nxkkxeRqZ8TgLbAKjWYr/QD0HXky
 6mKhgH4EEKDT6AT5MNuAtYK5aegru09yD3iY5xpPXkcb+YKN6NQxfZv4w368z7c9VT4M
 /Bew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ynjRJ4fi+6SwNa/ktOjSS9LxbzSuBBwUgDoAWiANJ2c=;
 b=j7zbqriDRdcnypRBPeUCrvGbJw79FSU/b6bOY7wuUT+iU3dfichPOMXaGtCa5Dm/yv
 lMKwh8BBySfNslSfYIoQ5N1x0/9yJpM/Lz8btoPdg9TYrvvIKLMaRcMB2pJ4zkDoa0yY
 GT3msUex5YVmD6MzSN4RuwzuMvHxCDUp93pnZJKCBQuzZHxnIy6uIa6RVHbuuuiVQCHT
 0X5RpjnqkZ2yec0QkZJVMYgGt5QmbBcAU0Fy6HsifSjQRYv3W1nn86TlfgCUOtiQ+8tq
 ALxG5/LkBLmGwdsLrPZrJAOVRK7FXoc7Yomut5nPt77OmOXDXb7wtXpQrslQxk4OCF4O
 Hj2A==
X-Gm-Message-State: AOAM533qkpcPR7Mr1aGo6+zJjW1JTQj9CN6h+c+jQ1ag69xaZ583s/XL
 7j1vkOElZ8Dok7x+2eyLHRLoiA==
X-Google-Smtp-Source: ABdhPJxbHi5B7GuO1spGC3Jljcx8azSCzrEcpsgLJjxXImZz9cmksXdZHpHvj+9iQnb07BLQbM35Rg==
X-Received: by 2002:a05:600c:1c9f:: with SMTP id
 k31mr19503528wms.170.1641759597457; 
 Sun, 09 Jan 2022 12:19:57 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id q3sm4962500wrr.55.2022.01.09.12.19.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 12:19:56 -0800 (PST)
Message-ID: <d600d4a8-fd57-8981-1ced-aab20e1aac81@mind.be>
Date: Sun, 9 Jan 2022 21:19:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@busybox.net
References: <20210110222833.26301-1-ps.report@gmx.net>
 <20210110222833.26301-4-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210110222833.26301-4-ps.report@gmx.net>
Subject: Re: [Buildroot] [RFC v2 03/12] package/mesa3d: fix gbm config
 warning
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
>    BR2_x86_64=y
>    BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
>    BR2_TOOLCHAIN_BUILDROOT_CXX=y
>    BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
>    BR2_TARGET_GENERIC_GETTY_PORT="tty1"
>    BR2_PACKAGE_MESA3D=y
>    BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL=y
>    BR2_PACKAGE_MESA3D_OPENGL_EGL=y
>    BR2_PACKAGE_MESA3D_OPENGL_ES=y
> 
> this warning:
> 
>    WARNING: unmet direct dependencies detected for BR2_PACKAGE_MESA3D_GBM
>      Depends on [n]: BR2_PACKAGE_MESA3D [=y] && BR2_PACKAGE_MESA3D_DRIVER [=y] && (BR2_PACKAGE_MESA3D_DRI_DRIVER [=n] || BR2_PACKAGE_MESA3D_GALLIUM_DRIVER [=n] && BR2_PACKAGE_MESA3D_OPENGL_EGL [=y])
>      Selected by [y]:
>      - BR2_PACKAGE_MESA3D_OPENGL_EGL [=y] && BR2_PACKAGE_MESA3D [=y] && BR2_PACKAGE_MESA3D_DRIVER [=y]
> 
>    WARNING: unmet direct dependencies detected for BR2_PACKAGE_MESA3D_GBM
>      Depends on [n]: BR2_PACKAGE_MESA3D [=y] && BR2_PACKAGE_MESA3D_DRIVER [=y] && (BR2_PACKAGE_MESA3D_DRI_DRIVER [=n] || BR2_PACKAGE_MESA3D_GALLIUM_DRIVER [=n] && BR2_PACKAGE_MESA3D_OPENGL_EGL [=y])
>      Selected by [y]:
>      - BR2_PACKAGE_MESA3D_OPENGL_EGL [=y] && BR2_PACKAGE_MESA3D [=y] && BR2_PACKAGE_MESA3D_DRIVER [=y]
> 
> as BR2_PACKAGE_MESA3D_VULKAN_DRIVER selects BR2_PACKAGE_MESA3D_DRIVER which
> enables possible selection of BR2_PACKAGE_MESA3D_OPENGL_EGL selecting
> BR2_PACKAGE_MESA3D_GBM.
> 
> Selecting EGL with only a vulkan driver selected gives the following configure
> failure:
> 
>    .../build/mesa3d-20.3.2/meson.build:424:4: ERROR: Problem encountered: EGL requires dri
> 
> Note dri means here an dri or gallium driver (see meson.build and look
> for with_dri).
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>    - new patch
> ---
>   package/mesa3d/Config.in | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index d9c27f8b5c..7a976f4b2c 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -452,6 +452,8 @@ config BR2_PACKAGE_MESA3D_OPENGL_GLX
>   comment "OpenGL GLX support needs X11"
>   	depends on !BR2_PACKAGE_XORG7
>   
> +if BR2_PACKAGE_MESA3D_DRI_DRIVER || BR2_PACKAGE_MESA3D_GALLIUM_DRIVER

  Since there's only one symbol inside, we prefer "depends on"

  Applied to master with that fixed, thanks.

  Regards,
  Arnout


> +
>   config BR2_PACKAGE_MESA3D_OPENGL_EGL
>   	bool "OpenGL EGL"
>   	select BR2_PACKAGE_HAS_LIBEGL
> @@ -461,6 +463,8 @@ config BR2_PACKAGE_MESA3D_OPENGL_EGL
>   	  Use the Khronos EGL APIs. EGL is a window manager for OpenGL
>   	  applications similar to GLX, for X, and WGL, for Windows.
>   
> +endif # BR2_PACKAGE_MESA3D_DRI_DRIVER || BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> +
>   config BR2_PACKAGE_MESA3D_OPENGL_ES
>   	bool "OpenGL ES"
>   	select BR2_PACKAGE_HAS_LIBGLES
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
