Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C69C43334
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 22:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8D27842D6;
	Sun,  5 Jun 2022 22:02:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8e7q7OO0xcTj; Sun,  5 Jun 2022 22:02:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEAF7842B3;
	Sun,  5 Jun 2022 22:02:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 179A71BF310
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 22:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1B3741A4B
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 22:02:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oV4B5ECjHvw3 for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 22:02:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 60643415BB
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 22:02:15 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DC25A200006;
 Sun,  5 Jun 2022 22:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654466533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IGGGQ6K906FjSm86cyWlWuyrmgQ+u9LxH5t0hf4kub0=;
 b=Kb3gKXkrs3VfQMpSBKqqVE1iqT3298AeaM4V0X30lDEq3rAZeKzXCeZQSofqng0OTxzurZ
 iqbu++S1kk5zXYX6QHY0st8+JOcUD9QEFeI4VPpj6qPbe/PTK9nrgltNDAFtALYtjftDQR
 MDUKYQ+dw6ern8ADm1d9sa6N89BD2S73UNZ5nj+CzVUQZGV+DmPRmsq3ye26r+sJpJjuee
 B3m+02bj6teKOq64SxEldpB951qnvYhJbtaw42xdlZhX3AeDSKXsGj5Cn2eU2oESzf1j8K
 oSo1RDY8i0OzpJ77Gs0Yl0uIkwmn39f6V9M2YgODfFrPBt+B+18ojznGfNP72w==
Date: Mon, 6 Jun 2022 00:02:11 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220606000211.12a404d0@windsurf>
In-Reply-To: <20220514175612.2510884-6-bernd.kuhls@t-online.de>
References: <20220514175612.2510884-1-bernd.kuhls@t-online.de>
 <20220514175612.2510884-6-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 06/19] package/x11r7/xdriver_xf86-video-ati:
 switch dependency from mesa3d to libgbm
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Gary Bisson <bisson.gary@gmail.com>,
 =?UTF-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 14 May 2022 19:55:59 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> The package depends on gbm and not mesa3d:
> https://gitlab.freedesktop.org/xorg/driver/xf86-video-ati/-/blob/master/configure.ac#L155
> 
> Remove the dependency to BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON in order
> to prevent a circular dependency here. This option will be removed in
> a follow-patch anyway because Mesa3D will drop DRI drivers in version
> 22.x.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/xdriver_xf86-video-ati/Config.in             | 7 +++----
>  .../x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk | 1 +
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/x11r7/xdriver_xf86-video-ati/Config.in b/package/x11r7/xdriver_xf86-video-ati/Config.in
> index 1246014dca..81255d5a4c 100644
> --- a/package/x11r7/xdriver_xf86-video-ati/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-ati/Config.in
> @@ -1,15 +1,14 @@
>  config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI
>  	bool "xf86-video-ati"
>  	depends on BR2_i386 || BR2_x86_64 # DRI radeon r100 driver
> -	depends on BR2_PACKAGE_MESA3D
> +	depends on BR2_PACKAGE_HAS_LIBGBM
>  	select BR2_PACKAGE_LIBDRM
>  	select BR2_PACKAGE_LIBDRM_RADEON
> -	select BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
>  	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
>  	select BR2_PACKAGE_XORGPROTO
>  	help
>  	  ATI video driver
>  
> -comment "xf86-video-ati needs mesa3d"
> +comment "xf86-video-ati needs GBM"
>  	depends on BR2_i386 || BR2_x86_64
> -	depends on !BR2_PACKAGE_MESA3D
> +	depends on !BR2_PACKAGE_HAS_LIBGBM
> diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
> index edb8b11add..e7f5852811 100644
> --- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
> +++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
> @@ -11,6 +11,7 @@ XDRIVER_XF86_VIDEO_ATI_LICENSE = MIT
>  XDRIVER_XF86_VIDEO_ATI_LICENSE_FILES = COPYING
>  XDRIVER_XF86_VIDEO_ATI_DEPENDENCIES = \
>  	libdrm \
> +	libgbm \

Same question: we had a Config.in dependency on mesa3d, but no build
dependency, and now we have a build dependency on libgbm?

Could you explain this?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
