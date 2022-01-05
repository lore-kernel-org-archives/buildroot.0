Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E951C433EF
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 10:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 222046FB3F;
	Wed,  5 Jan 2022 10:04:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dHGaFW7YX_wH; Wed,  5 Jan 2022 10:04:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78C2060783;
	Wed,  5 Jan 2022 10:04:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 57C231BF589
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 10:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4636B60592
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 10:04:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id usW7OMRUtFPH for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 10:04:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 46BFA600C6
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 10:04:32 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id o6so159848539edc.4
 for <buildroot@buildroot.org>; Wed, 05 Jan 2022 02:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=r+47yO3GeoQCxVv0ddkFy5QFvrysmSqHkCSN11gPLRk=;
 b=VSJRbIHTVs5eowbg+OFUysG0I8oD2wyUQHDXQiz1emMAVqp2qu1IPEXU2inAyPam62
 M/mTzwDw6LOlKDZo0Xbd/s72NUvaowP3ZlK0LP2fNkKRRpTi6totqHopU5435hlVAPP3
 bp4PBphpvLiGzfUcDKvY1wCoQN3maKfRJZ5J4xO4OqT3QbxBQx3qUUHCRMENTojADx6F
 kXuVOWFoIUrSn4UtGj9LqRJ3c0eLMhLXFpwWZba2PUhXBx3eCftBnlLaMmUb8YTK5gD0
 ac/t0H1Ym0M8RQ4d86vZoLab6pfnfiSQRWerrvxgFoeoSKLj71cwGfwCyHTnROUklhtf
 faYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=r+47yO3GeoQCxVv0ddkFy5QFvrysmSqHkCSN11gPLRk=;
 b=I/OHjqB+YER2/HdKnQwg+PH053ApeaLtrUq7L0Q7PSZ97djGz3vGuwcptC0BS+q5pY
 Swj54TRr+ZME2JOY+ndirGwDSZsccyAhgvoGfq7Pr8bnp44GNjELJnYQorfHFXEvFS1S
 QYAtUHgA1aUEwOeCR6Et3yFmQjrd4pNL/t/JfQk5PP7Qczvstr0yHgp4LA2ZqfbhYv6B
 OJpkYrYGZROFaL02+45qMwUR/OiCwYMd+Yp55h7EoqVLPZfeiKoqKBskDFIMTYJb9C/X
 cZ5BFU3fJsijdZ4gIZ6hpaXbFvxVCIo9uP6HRIovzG9nktUTG91/63wYDlPBP81B4bhL
 NGPg==
X-Gm-Message-State: AOAM532PkAyfdtq8LqeWrppyR3Oi03LBHsYTG1WF3TbXDT07fbO5Hn4d
 fOyw9/SRoQfH+AxxpuHxVvGTYw==
X-Google-Smtp-Source: ABdhPJxhuOqcBuSlUUCQeknYSH18zhM4TV5oqeM6r2w7LeQRs1SiLY+ZSfJWgjUyzTqcNwFygVVUUg==
X-Received: by 2002:a05:6402:11cf:: with SMTP id
 j15mr53507257edw.220.1641377070406; 
 Wed, 05 Jan 2022 02:04:30 -0800 (PST)
Received: from [10.101.1.216] (ip-185-104-137-32.ptr.icomera.net.
 [185.104.137.32])
 by smtp.gmail.com with ESMTPSA id f14sm15628231eds.20.2022.01.05.02.04.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 02:04:29 -0800 (PST)
Message-ID: <2033c239-7959-0072-464f-7090b4c736cc@mind.be>
Date: Wed, 5 Jan 2022 11:04:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20200410123207.3145145-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20200410123207.3145145-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/2]
 package/x11r7/xdriver_xf86-video-amdgpu: needs opengl
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/04/2020 14:32, Bernd Kuhls wrote:
> The package needs dri.h
> https://cgit.freedesktop.org/xorg/driver/xf86-video-amdgpu/tree/src/amdgpu_probe.c#n53
> https://cgit.freedesktop.org/xorg/driver/xf86-video-amdgpu/tree/src/drmmode_display.c#n50
> 
> which is only provided by xserver_xorg-server when opengl is enabled:
> https://git.buildroot.net/buildroot/tree/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk#n123
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> The build error was not recorded by the autobuilders because they fail
> already during at configure stage due to wrong dependencies for glamor
> support fixed in the second patch of this series.
> 
>   package/x11r7/xdriver_xf86-video-amdgpu/Config.in | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/Config.in b/package/x11r7/xdriver_xf86-video-amdgpu/Config.in
> index c42255f55c..fb18c0d812 100644
> --- a/package/x11r7/xdriver_xf86-video-amdgpu/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-amdgpu/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_AMDGPU
>   	bool "xf86-video-amdgpu"
>   	depends on BR2_USE_MMU # libdrm
>   	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER
> +	depends on BR2_PACKAGE_MESA3D_OPENGL_GLX # dri.h

  The condition in xorg-server is:

ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri --enable-glx
XSERVER_XORG_SERVER_DEPENDENCIES += libgl
else
XSERVER_XORG_SERVER_CONF_OPTS += --disable-dri --disable-glx
endif

So this should depend on HAS_LIBGL, no?


>   	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # gbm

  This one should probably also switch to the new gbm option.

  Regards,
  Arnout

>   	select BR2_PACKAGE_LIBDRM
>   	select BR2_PACKAGE_LIBDRM_AMDGPU
> @@ -14,4 +15,5 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_AMDGPU
>   comment "xf86-video-amdgpu needs egl/opengl support from mesa3d"
>   	depends on BR2_USE_MMU
>   	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL || \
> +		!BR2_PACKAGE_MESA3D_OPENGL_GLX || \
>   		!BR2_PACKAGE_MESA3D_DRI_DRIVER
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
