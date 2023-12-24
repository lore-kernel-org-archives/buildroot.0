Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159C2C46CD2
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 21:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3F6E813E1;
	Sun, 24 Dec 2023 21:38:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3F6E813E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VEdhc668DD05; Sun, 24 Dec 2023 21:38:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB07B8140E;
	Sun, 24 Dec 2023 21:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB07B8140E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D8E361BF275
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 21:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B147F813FD
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 21:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B147F813FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BVyRGwBGt0Fe for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 21:38:36 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 72A86813E1
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 21:38:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72A86813E1
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4dc2:634f:d1a7:1769])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id E1C385FF88;
 Sun, 24 Dec 2023 22:38:30 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Dec 2023 22:38:30 +0100
Date: Sun, 24 Dec 2023 22:38:30 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <ZYik1ltZ2WuQMwBB@landeda>
References: <20231221153620.237439-1-adam.duskett@amarulasolutions.com>
 <20231221153620.237439-3-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231221153620.237439-3-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703453913;
 bh=WW4FM83uOSxKXJ7pLCmCk3E4UqqxmZcyTd86JYtDxb4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hAFQCUQlBexEydieiEsW2amuPk4RohvvJjfjq+vPHGHVOGeBgpo0x5mbsmHfbUxl+
 f0MUVinPj/T8AtLclBgCh1D2s/87d0r5S3nrImWh18ggnQZQcTKCS47CbUsXgIcZP9
 7tJup3vBJbkaX7qDfOuT3DsceQhfbWHva8HeExchXvXH/skMpk4IJVnY8XZXp1stM7
 I3EmOuC6Vn0QWUZfsEBqQhag869YOTK9tRSpEpOfMHN6kKrZWTWj++tVRs03OMLt1u
 +q3qwTzxld+BEIZi0/2y1eO4R6vOtRZju8zso4sIgj/4NZVCA+UVOFFjBHJbWO4Ycm
 fVsPPnsiAq6xw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hAFQCUQl
Subject: Re: [Buildroot] [PATCH v4 03/10] package/foot: new package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

On 2023-12-21 08:36 -0700, Adam Duskett spake thusly:
> This is the default terminal sway uses.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
[--SNIP--]
> diff --git a/package/foot/Config.in b/package/foot/Config.in
> new file mode 100644
> index 0000000000..a3894c5469
> --- /dev/null
> +++ b/package/foot/Config.in
> @@ -0,0 +1,36 @@
> +config BR2_PACKAGE_FOOT
> +	bool "foot"
> +	depends on !BR2_STATIC_LIBS # wayland -> dlfcn.h

As was noticed by Thomas on a previous patch in this series, only the
first-order dependencies need to be listed, so I dropped the dlfcn.h
part.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +	depends on BR2_TOOLCHAIN_HAS_THREADS # fcft, wayland
> +	select BR2_PACKAGE_FCFT
> +	select BR2_PACKAGE_FONTCONFIG
> +	select BR2_PACKAGE_FREETYPE
> +	select BR2_PACKAGE_LIBXKBCOMMON
> +	select BR2_PACKAGE_PIXMAN
> +	select BR2_PACKAGE_TLLIST
> +	select BR2_PACKAGE_WAYLAND
> +	select BR2_PACKAGE_WAYLAND_PROTOCOLS
> +	help
> +	  A fast, lightweight and minimalistic Wayland terminal
> +	  emulator.
> +	  NOTE: foot needs a working UTF-8 locale (BR2_GENERATE_LOCALE)
> +
> +	  https://codeberg.org/dnkl/foot
> +
> +if BR2_PACKAGE_FOOT
> +
> +config BR2_PACKAGE_FOOT_GRAPHEME_CLUSTERING
> +	bool "grapheme-clustering"
> +	select BR2_PACKAGE_UTF8PROC
> +	help
> +	  Enables grapheme clustering.
> +
> +config BR2_PACKAGE_FOOT_THEMES
> +	bool "themes"
> +	help
> +	  Install themes (predefined color schemes)
> +
> +endif # BR2_PACKAGE_FOOT
> +
> +comment "foot needs a toolchain w/ dynamic library, threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> diff --git a/package/foot/foot.hash b/package/foot/foot.hash
> new file mode 100644
> index 0000000000..f3bf0f6058
> --- /dev/null
> +++ b/package/foot/foot.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  8060ec28cbf6e2e3d408665330da4bc48fd094d4f1265d7c58dc75c767463c29  1.16.2.tar.gz
> +sha256  d534a23a31500a0ac958d9634b84f532bd73ff1aca1bb8f7debbcbebc16ff39a  LICENSE
> diff --git a/package/foot/foot.mk b/package/foot/foot.mk
> new file mode 100644
> index 0000000000..1595e2a718
> --- /dev/null
> +++ b/package/foot/foot.mk
> @@ -0,0 +1,50 @@
> +################################################################################
> +#
> +# foot
> +#
> +################################################################################
> +
> +FOOT_VERSION = 1.16.2
> +FOOT_SOURCE = $(FOOT_VERSION).tar.gz
> +FOOT_SITE = https://codeberg.org/dnkl/foot/archive
> +FOOT_LICENSE = MIT
> +FOOT_LICENSE_FILES = LICENSE
> +FOOT_DEPENDENCIES = \
> +	fcft \
> +	fontconfig \
> +	freetype \
> +	libxkbcommon \
> +	pixman \
> +	tllist \
> +	wayland \
> +	wayland-protocols
> +
> +FOOT_CONF_OPTS = \
> +	-Ddocs=disabled \
> +	-Dtests=false
> +
> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> +FOOT_DEPENDENCIES += systemd
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBUTEMPTER),y)
> +FOOT_DEPENDENCIES += libutempter
> +FOOT_CONF_OPTS += -Dutmp-backend='libutempter'
> +else
> +FOOT_CONF_OPTS += -Dutmp-backend='none'
> +endif
> +
> +ifeq ($(BR2_PACKAGE_FOOT_GRAPHEME_CLUSTERING),y)
> +FOOT_DEPENDENCIES += utf8proc
> +FOOT_CONF_OPTS += -Dgrapheme-clustering=enabled
> +else
> +FOOT_CONF_OPTS += -Dgrapheme-clustering=disabled
> +endif
> +
> +ifeq ($(BR2_PACKAGE_FOOT_THEMES),y)
> +FOOT_CONF_OPTS += -Dthemes=true
> +else
> +FOOT_CONF_OPTS += -Dthemes=false
> +endif
> +
> +$(eval $(meson-package))
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
