Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8B1C433EF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 14:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4E7E408F8;
	Sun, 30 Jan 2022 14:02:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wewsF9ZpFmCR; Sun, 30 Jan 2022 14:02:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE745408F2;
	Sun, 30 Jan 2022 14:02:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A0CC21BF592
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A030408F2
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:02:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3C5U_ZgKf8p5 for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 14:02:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B9F8408E7
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 14:02:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0FC981C0004;
 Sun, 30 Jan 2022 14:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643551364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ejOo5oEKXeK9XPe0aAV3ai/wREFM6vDBW4qkqYPpuKk=;
 b=NOD6E4bACJJLLgXFWpwWmN7siSuJ8Q7Duaqk7o3biIfoIGmyFbWejPZbqcfICy8pIuO/JJ
 BrJschyrWuugSOy98t3FVQLaIFvN4hyz/DyFEz58fC7MbKRZHEcnLmHzOVDBDx/iQRe7Tv
 lC8Ccc7md0uCiqRCp6Vsof++NZLJbi2C+Bzg/3xx5TsK46+sf5foMhzod76cqEkuhrNvbG
 qGe4oXZA5lp9vaeZLlSGfrQLRiUGAqVFBKraCT9/0V7+TQqJILg45jyQ40nmlHGFEz9QZ+
 +jp0N2PChWgC3vCvCUifJxqdmtFIHpUb4lbrJirax5Qf08U62/JbJsplUi+40w==
Date: Sun, 30 Jan 2022 15:02:43 +0100
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220130150243.5795f1fa@windsurf>
In-Reply-To: <20220129224651.1282263-3-romain.naour@gmail.com>
References: <20220129224651.1282263-1-romain.naour@gmail.com>
 <20220129224651.1282263-3-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/5] package/efl: rework eeze handling in
 Kconfig
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 29 Jan 2022 23:46:49 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> Commit [1] added eeze dependency using "depends on" to several efl
> options (drm, libmount) instead of selecting eeze and propagate the
> udev reverse dependency.

I do agree with changing from a "depends on BR2_PACKAGE_EFL_EEZE" to a
"depends BR2_PACKAGE_HAS_UDEV" + "select BR2_PACKAGE_EFL_EEZE".
However...

> The dependency between eeze, libinput, efl drm requires to add a new
> libinput option.

... I don't understand this justification. Could you clarify. Even
after reading PATCH 4/5, I don't get the relationship. PATCH 4/5 could
have been done (I guess using the same principle of "depends on
BR2_PACKAGE_EFL_EEZE".

> Rework eeze handling to use select BR2_PACKAGE_EFL_EEZE since the
> user is already aware of the udev dependency (BR2_PACKAGE_HAS_UDEV).

I don't understand why you say the user is already aware of the udev
dependency? Thanks to the comments?

>  comment "efl's libmount support needs udev /dev management (eeze)"

Remove the "eeze" between parenthesis here I believe.

> -	depends on !BR2_PACKAGE_EFL_EEZE
> +	depends on !BR2_PACKAGE_HAS_UDEV
>  
>  config BR2_PACKAGE_EFL_HAS_RECOMMENDED_CONFIG
>  	bool
> @@ -173,7 +174,7 @@ config BR2_PACKAGE_EFL_WAYLAND
>  	depends on BR2_PACKAGE_WAYLAND
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # Evas DRM Engine -> libdrm
>  	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # Evas DRM Engine
> -	depends on BR2_PACKAGE_EFL_EEZE # efl drm
> +	depends on BR2_PACKAGE_HAS_UDEV # efl drm (eeze)
>  	depends on BR2_PACKAGE_EFL_OPENGLES # OpenGL ES with EGL support only
>  	depends on BR2_ENABLE_LOCALE # efl-drm <- efl-elput <- linput
>  	select BR2_PACKAGE_EFL_DRM
> @@ -182,7 +183,7 @@ config BR2_PACKAGE_EFL_WAYLAND
>  comment "Wayland support needs udev /dev management (eeze), OpenGL ES w/ EGL, threads, locales"

Ditto.

>  	depends on BR2_PACKAGE_WAYLAND
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_MESA3D_OPENGL_EGL \
> -		|| !BR2_PACKAGE_EFL_OPENGLES || !BR2_PACKAGE_EFL_EEZE \
> +		|| !BR2_PACKAGE_EFL_OPENGLES || !BR2_PACKAGE_HAS_UDEV \
>  		|| !BR2_ENABLE_LOCALE
>  
>  choice
> @@ -215,9 +216,10 @@ endchoice # OpenGL support
>  
>  config BR2_PACKAGE_EFL_DRM
>  	bool "Evas DRM Engine"
> -	depends on BR2_PACKAGE_EFL_EEZE
> +	depends on BR2_PACKAGE_HAS_UDEV (eeze)

Does this line really parses correctly?

>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
>  	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # require libgbm from mesa3d
> +	select BR2_PACKAGE_EFL_EEZE
>  	select BR2_PACKAGE_LIBDRM
>  	select BR2_PACKAGE_LIBINPUT # For elput
>  	select BR2_PACKAGE_LIBXKBCOMMON
> @@ -232,7 +234,7 @@ config BR2_PACKAGE_EFL_DRM
>  
>  comment "Evas DRM Engine needs udev /dev management (eeze), mesa3d w/ EGL support, threads"

Remove the "eeze" between parenthesis.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
