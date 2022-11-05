Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE74C4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 18:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40A3D60AEB;
	Sat,  5 Nov 2022 18:14:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40A3D60AEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BAFugOp_4T91; Sat,  5 Nov 2022 18:14:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D0E960AAE;
	Sat,  5 Nov 2022 18:14:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D0E960AAE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B9F21BF375
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 18:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60D8D60AAE
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 18:14:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60D8D60AAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uVpxebZhSgtm for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 18:14:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D04E60A94
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D04E60A94
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 18:14:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b857:25fc:60e2:657f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id C2AAF5FF9D;
 Sat,  5 Nov 2022 19:14:24 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 05 Nov 2022 19:14:24 +0100
Date: Sat, 5 Nov 2022 19:14:24 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20221105181424.GK3918838@scaer>
References: <20221105075156.14160-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221105075156.14160-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667672066;
 bh=QthacSDNcTv2ou1ilkkXvPWkFAg/vXtqtSFJzmE8bQg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hg/OTbrAV6UIJwQ6Jd9P0elQRk+o0lEUii7p2zaU5yfzeyt5rPXQVXO2X32XdvbP+
 6tiVdEWsWeJ0AjHvaNUSxNaLsKJITK1sxoAQ8k0N5lq6fydIjcGHoSbtVvVVU6vZ8M
 FL2g2NrUSwJ6FnOf9j3qT6OgBwW38/MYQjkQwHqHgf6hrVM3VkRoAqacWpGhwT5Y7/
 z/AEiOGFbCAFB1L2s7gwEo2bsIzvnrbDZvl/oucFkQ5aun1JES9Z1MaDoDW9I8EmsG
 HugatpSr+Yx0dPEtHjdv16acraShH7RQoHW12C4WHLrwT/U1wRLO/TedxM0VQ+/xF8
 RzM3CtjZgikJQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Hg/OTbrA
Subject: Re: [Buildroot] [PATCH 1/1] package/libdcadec: remove package
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

Bernd, All,

On 2022-11-05 08:51 +0100, Bernd Kuhls spake thusly:
> Quoting https://github.com/foo86/dcadec
> 
> "This program is deprecated!
> 
>  This decoder has been fully integrated into FFmpeg master branch and
>  further development will continue there. Using FFmpeg for DTS decoding
>  is now recommended."

I've added a little blurb that the package has had no commit for the
past 7+ years, too.

> Fixes:
> http://autobuild.buildroot.net/results/1e63586c91a2670ecac2940f6e9840e6801c32f3/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Since we're now in feature-freeze, I was considering whther to apply to
master or next. I opted for master, as nothinf uses libdcadec in
Buildroot, and so removing it should not cause any issue (famous last
words).

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  Config.in.legacy                 |  8 ++++++++
>  DEVELOPERS                       |  1 -
>  package/Config.in                |  1 -
>  package/libdcadec/Config.in      |  7 -------
>  package/libdcadec/libdcadec.hash |  3 ---
>  package/libdcadec/libdcadec.mk   | 33 --------------------------------
>  6 files changed, 8 insertions(+), 45 deletions(-)
>  delete mode 100644 package/libdcadec/Config.in
>  delete mode 100644 package/libdcadec/libdcadec.hash
>  delete mode 100644 package/libdcadec/libdcadec.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 0e63d59a98..7458fa331e 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,14 @@ endif
>  
>  comment "Legacy options removed in 2022.11"
>  
> +config BR2_PACKAGE_LIBDCADEC
> +	bool "package was deprecated upstream, use ffmpeg instead"
> +	select BR2_LEGACY
> +	help
> +	  This decoder has been fully integrated into FFmpeg master
> +	  branch and further development will continue there. Using
> +	  FFmpeg for DTS decoding is now recommended.
> +
>  config BR2_KERNEL_HEADERS_5_17
>  	bool "kernel headers version 5.17.x are no longer supported"
>  	select BR2_LEGACY
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 4750c06b64..f7c6c71e6f 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -363,7 +363,6 @@ F:	package/libcdio/
>  F:	package/libcec/
>  F:	package/libcodec2/
>  F:	package/libcrossguid/
> -F:	package/libdcadec/
>  F:	package/libdeflate/
>  F:	package/libdrm/
>  F:	package/libdvbcsa/
> diff --git a/package/Config.in b/package/Config.in
> index d14e7473b6..c0ff8c9144 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1787,7 +1787,6 @@ menu "Multimedia"
>  	source "package/libbluray/Config.in"
>  	source "package/libcamera/Config.in"
>  	source "package/libcamera-apps/Config.in"
> -	source "package/libdcadec/Config.in"
>  	source "package/libdvbcsa/Config.in"
>  	source "package/libdvbpsi/Config.in"
>  	source "package/libdvbsi/Config.in"
> diff --git a/package/libdcadec/Config.in b/package/libdcadec/Config.in
> deleted file mode 100644
> index 2687a18187..0000000000
> --- a/package/libdcadec/Config.in
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -config BR2_PACKAGE_LIBDCADEC
> -	bool "libdcadec"
> -	help
> -	  dcadec is a free DTS Coherent Acoustics decoder with support
> -	  for HD extensions.
> -
> -	  https://github.com/foo86/dcadec
> diff --git a/package/libdcadec/libdcadec.hash b/package/libdcadec/libdcadec.hash
> deleted file mode 100644
> index 3c3e80e8a3..0000000000
> --- a/package/libdcadec/libdcadec.hash
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# Locally calculated
> -sha256  ed9d207fde3e8d576f3af8b0d1235b3371e315175757173689104efcaebf0d44  libdcadec-0.2.0.tar.gz
> -sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPLv2.1
> diff --git a/package/libdcadec/libdcadec.mk b/package/libdcadec/libdcadec.mk
> deleted file mode 100644
> index a3579ad632..0000000000
> --- a/package/libdcadec/libdcadec.mk
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -################################################################################
> -#
> -# libdcadec
> -#
> -################################################################################
> -
> -LIBDCADEC_VERSION = 0.2.0
> -LIBDCADEC_SITE = $(call github,foo86,dcadec,v$(LIBDCADEC_VERSION))
> -LIBDCADEC_LICENSE = LGPL-2.1+
> -LIBDCADEC_LICENSE_FILES = COPYING.LGPLv2.1
> -LIBDCADEC_INSTALL_STAGING = YES
> -
> -ifeq ($(BR2_STATIC_LIBS),)
> -LIBDCADEC_SHARED = CONFIG_SHARED=1
> -endif
> -
> -define LIBDCADEC_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> -		CFLAGS="$(TARGET_CFLAGS) -std=gnu99" \
> -		$(LIBDCADEC_SHARED) -C $(@D)
> -endef
> -
> -define LIBDCADEC_INSTALL_STAGING_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
> -		$(LIBDCADEC_SHARED) DESTDIR=$(STAGING_DIR) PREFIX=/usr install
> -endef
> -
> -define LIBDCADEC_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
> -		$(LIBDCADEC_SHARED) DESTDIR=$(TARGET_DIR) PREFIX=/usr install
> -endef
> -
> -$(eval $(generic-package))
> -- 
> 2.34.1
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
