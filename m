Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28B0C43334
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 22:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46F9540D7C;
	Sun,  5 Jun 2022 22:01:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fDh6OuZA8pNh; Sun,  5 Jun 2022 22:01:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F79A4025F;
	Sun,  5 Jun 2022 22:01:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AA75D1BF310
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 22:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 997C660B3C
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 22:01:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id npjLaLSEb9Ls for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 22:01:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5700D60AAB
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 22:01:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E5A4FC0002;
 Sun,  5 Jun 2022 22:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654466482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UslclF4t8ybeVsiZ8UHQGvlmM/bX1GGJOZdVCT5zhqM=;
 b=PrfyRxixG8hLmabZ/3YhXs83ohRU6PFIJXNcprU0NlYPENHolMYItv7v6Jh5xjolYmXsmF
 GytgXy4/4ry3CPS5kZWo35+aR1cBzOYJnnbS6Y1uC4K3rt64G0MjPrgcwqA4yG/5Ch2Trp
 InxjvP9fOMmYQWsEa77WHBLEXjJmf7w16pggVNXTXm3CvB9sqxRqzmlCMySSs90n3V13LS
 Su4y8GZN8RDAVPi1HrCNXbWeHb4RQN0XpnP5tWM4rceOGkSjbKOUgrrZrltRT1Kao5ks1t
 tE8XrczTxKzkkKCwQB5WjEjqPorK2aOMgP7yCdBlo7Fll9ICO4+pZNXIvNaiJQ==
Date: Mon, 6 Jun 2022 00:01:20 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220606000120.052ee137@windsurf>
In-Reply-To: <20220514175612.2510884-4-bernd.kuhls@t-online.de>
References: <20220514175612.2510884-1-bernd.kuhls@t-online.de>
 <20220514175612.2510884-4-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 04/19]
 package/x11r7/xdriver_xf86-video-amdgpu: needs libgbm
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

Hello,

On Sat, 14 May 2022 19:55:57 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> The package depends on gbm:
> https://gitlab.freedesktop.org/xorg/driver/xf86-video-amdgpu/-/blob/master/configure.ac#L75
> 
> For details see
> http://lists.busybox.net/pipermail/buildroot/2022-April/641451.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Could you clarify if this is a fix, or an improvement?

If I understand correctly the discussion at
http://lists.busybox.net/pipermail/buildroot/2022-April/641451.html,
this driver used to require mesa3d+dri+egl (which guaranteed to provide
libgbm), but now only requires libgbm. If this is correct, then this
patch is not a fix, but an improvement, because it makes this package
available in a larger set of configurations.

Could you clarify this?

> diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
> index c34af6faf1..ba4ab43db2 100644
> --- a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
> +++ b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
> @@ -11,6 +11,7 @@ XDRIVER_XF86_VIDEO_AMDGPU_LICENSE = MIT
>  XDRIVER_XF86_VIDEO_AMDGPU_LICENSE_FILES = COPYING
>  XDRIVER_XF86_VIDEO_AMDGPU_DEPENDENCIES = \
>  	libdrm \
> +	libgbm \
>  	xlib_libXcomposite \
>  	xorgproto \
>  	xserver_xorg-server

Interesting, we had a Config.in dependency on mesa, but it was not a
build dependency, but libgbm is?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
