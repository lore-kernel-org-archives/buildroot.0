Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C163C433F5
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 20:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3B5D60BC5;
	Mon, 31 Jan 2022 20:16:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oz28WwFbeMVn; Mon, 31 Jan 2022 20:16:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 302F360B2C;
	Mon, 31 Jan 2022 20:16:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F0CF81BF36A
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 20:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB64540125
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 20:16:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cd1_jcWDqOP0 for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 20:16:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C22840120
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 20:16:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.243.59])
 by smtp6-g21.free.fr (Postfix) with ESMTP id 26DE97802E5;
 Mon, 31 Jan 2022 21:16:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1643660194;
 bh=JFynh0NImEvhNAQqGrnPxU7GAXNk0ewG7ixLCSQqCBs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=m9Af5qHX3gpNGpO1UQHhCk4AhnKDwDUkfzvV5r6aAs3phLE7NqrkEf0li9QP7Endh
 RtENnrIlWn3febK/2nTpNK6ahApYqR4s99o5HW51kPph4V5xIdF2GtHhkYjfNnlfAx
 jrh6k8BO8VxT2uM/XVmcZ5GECWE1Jr51HtXTd0VRRhH7Am6E2uPJ8WNtjTbP3cuUgI
 61fRfiJypg1t3PKvvAbyseal2YgsgJSGH5ot+cOVFlZI60HlGO7qQqgtHXsyKNYgCA
 n4tIGXp8sDCZZcKE82+m/z4RJzLPL0/dgY8ByrSVYfjaxgCSuXnCUOCODWHCMcPxh2
 YLIeK7DOconbw==
Received: from [37.164.159.196]
	by webmail.free.fr
MIME-Version: 1.0
Date: Mon, 31 Jan 2022 21:16:34 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20220130225207.04efc439@windsurf>
References: <20220128205201.2798205-1-fontaine.fabrice@gmail.com>
 <20220130225207.04efc439@windsurf>
Message-ID: <e6af5774ccdc1df4f6167307e0377fc2@free.fr>
X-Sender: ju.o@free.fr
User-Agent: Webmail Free/1.3.3
Subject: Re: [Buildroot] [PATCH 1/2] package/glslsandbox: kms needs gbm
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, Fabrice, Yann,

On 30/01/2022 22:52, Thomas Petazzoni wrote:
> Hello Fabrice,
> 
> On Fri, 28 Jan 2022 21:52:00 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> 
>> diff --git a/package/glslsandbox-player/Config.in 
>> b/package/glslsandbox-player/Config.in
>> index 3aa6049dfb..e36e8d74c8 100644
>> --- a/package/glslsandbox-player/Config.in
>> +++ b/package/glslsandbox-player/Config.in
>> @@ -70,6 +70,7 @@ choice
>>  config BR2_PACKAGE_GLSLSANDBOX_PLAYER_KMS
>>  	bool "KMS/DRM/GBM"
>>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
>> +	depends on BR2_PACKAGE_HAS_LIBGBM
>>  	select BR2_PACKAGE_LIBDRM
> 
> So, yes, this is needed, but isn't sufficient. Indeed, now you can
> potentially enable glslsandbox-player even if you don't meet the
> dependency for at least one of the "Native windowing system" (see the
> choice...endchoice in the package Config.in).
> 
> The top-level BR2_PACKAGE_GLSLSANDBOX_PLAYER option is even carrying a
> "bogus" depends on BR2_TOOLCHAIN_HAS_THREADS to make sure that at least
> the BR2_PACKAGE_GLSLSANDBOX_PLAYER_KMS option is available.
> 
> But with your change, this is no longer true, and adding depends on
> BR2_PACKAGE_HAS_LIBGBM to the package top-level option doesn't make
> sense.
> 
> So I've tried to make sure that glslsandbox-player is only available
> when one of the windowing systems dependencies is met, by doing this:
> 
> diff --git a/package/glslsandbox-player/Config.in
> b/package/glslsandbox-player/Config.in
> index 2d15a7e270..35fe7b3c6a 100644
> --- a/package/glslsandbox-player/Config.in
> +++ b/package/glslsandbox-player/Config.in
> @@ -1,10 +1,20 @@
> +config BR2_PACKAGE_GLSLSANDBOX_SUPPORTS_WINDOWING_SYSTEM
> +       bool
> +       default y if BR2_PACKAGE_SUNXI_MALI_UTGARD
> +       default y if BR2_PACKAGE_MALI_T76X
> +       default y if BR2_PACKAGE_RPI_USERLAND
> +       default y if BR2_PACKAGE_SDL2_OPENGLES
> +       default y if BR2_PACKAGE_TI_SGX_UM
> +       default y if BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB
> +       default y if BR2_PACKAGE_WAYLAND
> +       default y if BR2_PACKAGE_XORG7
> +       default y if BR2_TOOLCHAIN_HAS_THREADS
> +
>  config BR2_PACKAGE_GLSLSANDBOX_PLAYER
>         bool "glslsandbox-player"
>         depends on BR2_PACKAGE_HAS_LIBEGL
>         depends on BR2_PACKAGE_HAS_LIBGLES
> -       # Doesn't really depend on threads, but this makes sure we have 
> at least
> -       # one native windowing system available, and is good enough in 
> practice.
> -       depends on BR2_TOOLCHAIN_HAS_THREADS
> +       depends on BR2_PACKAGE_GLSLSANDBOX_SUPPORTS_WINDOWING_SYSTEM
>         help
>           GLSL Sandbox standalone player allow one to run and render
>           (most of) nice shaders available online on the
> 
> (this would have been the change *before* your patch). But
> unfortunately, this causes Kconfig to goes nuts with a silly recursive
> dependency:
> 
> package/python3/Config.in:5:error: recursive dependency detected!
> package/python3/Config.in:5:	symbol BR2_PACKAGE_PYTHON3 is selected by
> BR2_PACKAGE_GLSLSANDBOX_PLAYER_SCRIPTS
> package/glslsandbox-player/Config.in:44:	symbol
> BR2_PACKAGE_GLSLSANDBOX_PLAYER_SCRIPTS depends on
> BR2_PACKAGE_GLSLSANDBOX_PLAYER
> package/glslsandbox-player/Config.in:13:	symbol
> BR2_PACKAGE_GLSLSANDBOX_PLAYER depends on
> BR2_PACKAGE_GLSLSANDBOX_SUPPORTS_WINDOWING_SYSTEM
> package/glslsandbox-player/Config.in:6:	symbol
> BR2_PACKAGE_GLSLSANDBOX_SUPPORTS_WINDOWING_SYSTEM depends on
> BR2_PACKAGE_SDL2_OPENGLES
> package/sdl2/Config.in:54:	symbol BR2_PACKAGE_SDL2_OPENGLES depends on
> BR2_PACKAGE_SDL2
> package/sdl2/Config.in:1:	symbol BR2_PACKAGE_SDL2 is selected by
> BR2_PACKAGE_FFMPEG_FFPLAY
> package/ffmpeg/Config.in:51:	symbol BR2_PACKAGE_FFMPEG_FFPLAY depends
> on BR2_PACKAGE_FFMPEG
> package/ffmpeg/Config.in:18:	symbol BR2_PACKAGE_FFMPEG is selected by
> BR2_PACKAGE_KODI
> package/kodi/Config.in:51:	symbol BR2_PACKAGE_KODI depends on
> BR2_PACKAGE_PYTHON3
> 
> which I have no idea how to resolve :-/

I would like to suggest the following:

glslsandbox-player introduced last year a "Null Windowing System", which 
does
not require anything.  See:
https://github.com/jolivain/glslsandbox-player/blob/v2021.08.24/src/native_gfx_nullws.c
Some ancient EGL implementations worked that way (TI SGX, i.MX5 AMD GPU, 
...).

Basically, this windowing system is always expected to compile. But it 
will not
always work at runtime.  (For an "always working" minimal configuration, 
for
testing for example, I would recommend a Mesa3D/GBM/KMS swrast/llvmpipe 
relying
on Kernel DRM VKMS).

This NullWS could be the fallback needed which is needed here.  The 
"bogus"
BR2_TOOLCHAIN_HAS_THREADS dependency could also be removed.

What do you think about that approach?

If you agree, I can send a patch for adding this NullWS.

After that, I think this patch proposed by Fabrice can be applied as is.

Best regards,

Julien.

> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
