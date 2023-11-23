Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD607C5AD4C
	for <buildroot@archiver.kernel.org>; Thu, 23 Nov 2023 13:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DB3C4013D;
	Thu, 23 Nov 2023 13:45:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DB3C4013D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G3oPVHAK3dmp; Thu, 23 Nov 2023 13:45:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 607414023F;
	Thu, 23 Nov 2023 13:45:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 607414023F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DDD751BF368
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 13:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B628820BB
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 13:44:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B628820BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BaeQ4M500mu5 for <buildroot@lists.busybox.net>;
 Thu, 23 Nov 2023 13:44:58 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D4FE820BA
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 13:44:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D4FE820BA
Received: by mail.gandi.net (Postfix) with ESMTPSA id ED1A760003;
 Thu, 23 Nov 2023 13:44:54 +0000 (UTC)
Date: Thu, 23 Nov 2023 14:44:54 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231123144454.50fd7944@windsurf>
In-Reply-To: <20231123000819.488595-3-adam.duskett@amarulasolutions.com>
References: <20231123000819.488595-1-adam.duskett@amarulasolutions.com>
 <20231123000819.488595-3-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1700747095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v1WYiu2zQnxEFf9UewD/aQc+Uiks9RpBMdTY8Anz/mE=;
 b=CqEP1pDSYLkkqD4AgQ866s+O7CjRPotciST2Ze8t6fSaujD22vpB+c2cdleKynVialBhqU
 in0s01dMcXOoAyURr/4+wqBtLRIjUOkwuIgUEzl/IcWd0IpB3gqXL8L0ff/YmFPMUJ2Xv7
 JgGYVMTm9V0Y1I20yJNO+p9eCUGaJaRuViCiSGot5dRT4kfqPsYbmP39/+pzEJqPZyGKVA
 rNjSG7REjyrSSI/xJb3OGGYx+3Resr6xXeTSh+7aiW2bqEthuPQOLN3u4Chkr8qLifhWKF
 bvbWJk7uOaVuqUv8GnxQ0cREZemhqLfvrK+EEFm7RUvcW1vBgC60H48z1LAIlA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CqEP1pDS
Subject: Re: [Buildroot] [PATCH/next 02/13] package/dmenu-wayland: new
 package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adam,

On Wed, 22 Nov 2023 17:08:08 -0700
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> diff --git a/package/dmenu-wayland/Config.in b/package/dmenu-wayland/Config.in
> new file mode 100644
> index 0000000000..111bbfb434
> --- /dev/null
> +++ b/package/dmenu-wayland/Config.in
> @@ -0,0 +1,26 @@
> +config BR2_PACKAGE_DMENU_WAYLAND
> +	bool "dmenu-wayland"
> +	depends on BR2_USE_MMU # pango -> lib2

lib2 ?

> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # pango -> glib2, wayland
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuz
> +	depends on !BR2_STATIC_LIBS # wayland -> dlfcn.h
> +	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype support
> +	depends on BR2_USE_WCHAR # pango -> glib2

I think listing the first order dependency is enough.

> +DMENU_WAYLAND_VERSION = a380201dff5bfac2dace553d7eaedb6cea6855f9
> +DMENU_WAYLAND_SITE = https://github.com/nyyManni/dmenu-wayland.git
> +DMENU_WAYLAND_SITE_METHOD = git

Use the github macro?

> +DMENU_WAYLAND_LICENSE = MIT
> +DMENU_WAYLAND_LICENSE_FILES = LICENSE
> +
> +DMENU_WAYLAND_DEPENDENCIES = \
> +	cairo \
> +	libglib2 \
> +	libxkbcommon \
> +	pango \
> +	wayland \
> +	wayland-protocols
> +
> +# By default, sway calls dmenu not dmenu-wl
> +define DMENU_WAYLAND_SYMLINK_DMENU_WL
> +	cd $(TARGET_DIR)/usr/bin && \
> +	ln -sf dmenu-wl dmenu

I think:

	ln -sf dmenu-wl $(TARGET_DIR)/usr/bin/dmenu

achieves the same.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
