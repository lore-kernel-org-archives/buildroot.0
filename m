Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F05C46CD3
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 18:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCA714052F;
	Sun, 24 Dec 2023 18:55:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCA714052F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7kWT7tk0mToI; Sun, 24 Dec 2023 18:55:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88DD140542;
	Sun, 24 Dec 2023 18:55:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88DD140542
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 258C21BF3BB
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 18:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2578813BE
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 18:55:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2578813BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bf86EiplcpAr for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 18:55:16 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 679B9813BC
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 18:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 679B9813BC
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4dc2:634f:d1a7:1769])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 4A4DC5FFC0;
 Sun, 24 Dec 2023 19:55:11 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Dec 2023 19:55:11 +0100
Date: Sun, 24 Dec 2023 19:55:11 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <ZYh-j6w4L936dLg_@landeda>
References: <20231221153620.237439-1-adam.duskett@amarulasolutions.com>
 <20231221153620.237439-2-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231221153620.237439-2-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703444113;
 bh=SDejA4OyJ4EdWkJ+htkInGc7Up73YZv+DDDen1kgNTc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V27o4PnS4uqBkuQs/oyL8cTb5R9zDscKYG9o7//wJOrXMU6s283vsH8HgoTc7Ruec
 9lwZZezn7jhHcC8j+27zwv0uQooe2CeLSNx6VUhBd/O1h89qU6Wiv98Mx9OHr5Hip4
 Bdzn6QKdO3c4mZmVx7dkSNDOTqV2tJ19n61E4cZSLca8+XeY6hnpbuzH1LargT4vnz
 sBqd0YoU6UdxEEgmNkTPtu/iKgNKArosuM/ZNe22UAgWWmmYrU/C/8gCMTF+Mv4RnK
 uqii9CaH+ygfBtNwGto9cxeD0iS9D3A+i1i6Y1Hlr/3ekeDrUrbqalfhzrj4Bw0tLL
 kWZ/FiS2Oanrw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=V27o4PnS
Subject: Re: [Buildroot] [PATCH v4 02/10] package/dmenu-wayland: new package
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
> This package is an alternative to dmenu for X.

I scratched my head around that one, because it is ambiguous: why is it
named dmenu-*wayland* if it is for X? OK, so it's the other way around:
dmenu is for X (only); dmenu is another implementation of dmenu, for
wayland. I rewrote the sentence to avoid the ambiguity (at least I find
the new wording less ambiguous).

> Sway uses it by default as its
> menu bar.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
[--SNIP--]
> diff --git a/package/dmenu-wayland/Config.in b/package/dmenu-wayland/Config.in
> new file mode 100644
> index 0000000000..e2af09080c
> --- /dev/null
> +++ b/package/dmenu-wayland/Config.in
> @@ -0,0 +1,26 @@
> +config BR2_PACKAGE_DMENU_WAYLAND
> +	bool "dmenu-wayland"
> +	depends on BR2_USE_MMU # pango
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # pango, wayland

Threqds also inherited because of libglib2.

> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango
> +	depends on !BR2_STATIC_LIBS # wayland
> +	depends on BR2_INSTALL_LIBSTDCPP # pango
> +	depends on BR2_USE_WCHAR # pango

Ditto wchar.

[--SNIP--]
> +comment "dmenu-wayland needs a toolchain w/ wchar, threads, C++, dynamic library, gcc >= 4.9"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_TOOLCHAIN_HAS_THREADS || \

I see that the naming of the variable is not obvious, and that the
manual is a bit ambiguous about it, but BR2_TOOLCHAIN_HAS_SYNC_4 is an
architecture dependency. As such, it should be used ti hide the comment,
like MMU.

I've fixed all these minor issues and applied to master, thanks.

Regards,
Yann E. MORIN.

> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || BR2_STATIC_LIBS || \
> +		!BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
> diff --git a/package/dmenu-wayland/dmenu-wayland.hash b/package/dmenu-wayland/dmenu-wayland.hash
> new file mode 100644
> index 0000000000..1248c4ad66
> --- /dev/null
> +++ b/package/dmenu-wayland/dmenu-wayland.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  56340e198a2c58468c6109f3bb07ab8a074487e67b0758b29c9d4fdce7c4d594  dmenu-wayland-a380201dff5bfac2dace553d7eaedb6cea6855f9.tar.gz
> +sha256  8d26bccf8a21c5e29dc756beef534403c935766c815bbb6e7eab0598632b9827  LICENSE
> diff --git a/package/dmenu-wayland/dmenu-wayland.mk b/package/dmenu-wayland/dmenu-wayland.mk
> new file mode 100644
> index 0000000000..33a73c0153
> --- /dev/null
> +++ b/package/dmenu-wayland/dmenu-wayland.mk
> @@ -0,0 +1,28 @@
> +################################################################################
> +#
> +# dmenu-wayland
> +#
> +################################################################################
> +
> +DMENU_WAYLAND_VERSION = a380201dff5bfac2dace553d7eaedb6cea6855f9
> +DMENU_WAYLAND_SITE = $(call github,nyyManni,dmenu-wayland,$(DMENU_WAYLAND_VERSION))
> +DMENU_WAYLAND_LICENSE = MIT
> +DMENU_WAYLAND_LICENSE_FILES = LICENSE
> +
> +# host-wayland is for wayland-scanner
> +DMENU_WAYLAND_DEPENDENCIES = \
> +	host-wayland \
> +	cairo \
> +	libglib2 \
> +	libxkbcommon \
> +	pango \
> +	wayland \
> +	wayland-protocols
> +
> +# By default, sway calls dmenu not dmenu-wl
> +define DMENU_WAYLAND_SYMLINK_DMENU_WL
> +	ln -sf dmenu-wl $(TARGET_DIR)/usr/bin/dmenu
> +endef
> +DMENU_WAYLAND_POST_INSTALL_TARGET_HOOKS += DMENU_WAYLAND_SYMLINK_DMENU_WL
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
