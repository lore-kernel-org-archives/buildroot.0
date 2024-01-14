Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC257C47077
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 10:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 548DF4177A;
	Sun, 14 Jan 2024 10:48:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 548DF4177A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dcIlfiUV9SGY; Sun, 14 Jan 2024 10:48:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7133041766;
	Sun, 14 Jan 2024 10:48:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7133041766
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 520671BF2E4
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 10:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2ADA241766
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 10:48:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2ADA241766
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nw98tos_aiWq for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 10:48:30 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1FFA64086F
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 10:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FFA64086F
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2B0D913F88F;
 Sun, 14 Jan 2024 11:48:23 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Jan 2024 11:48:22 +0100
Date: Sun, 14 Jan 2024 11:48:22 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <ZaO79g0Pj7qf7V2i@landeda>
References: <20230808064107.29318-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230808064107.29318-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705229307;
 bh=BR2T4knHPVMO4fWrn4fP6fQsqXIhsh9FC1hKDCrfd1c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hp0T++S6cvGYVSVc2BaDCMdD80CPfFxUAunEIz9XGRTW9lUZFfCNdWAtN6TBjkxiI
 df2SJx41vogD1HgW20KqFgYxNhdgshuNqrlFD2HD8E6DAuQGwm9CrqMtMQdjIDirrZ
 rvtRNpnErbdtunBqttgec7IjeHRIcCll90kYM2RGuKnrPl1Fs3DrP9+bsVQLQOTUnV
 WXrBSmR1fDS55yucv7EdwwNUOcMJsAZBvg5zbL+cHGo1/88H+14Va3fLTy6w7mCO6J
 hyb7S3N0XXUFDxfrp5CxmjSu1ZR8dAI6LRmabakV2P9Tmc1n3leZd5I/sdxAr1hbqk
 Pxc9SZO1r296Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Hp0T++S6
Subject: Re: [Buildroot] [PATCH/next v4 1/2] package/onevpl: new package
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Samuel Martin <s.martin49@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2023-08-08 08:41 +0200, Bernd Kuhls spake thusly:
> From: Bernd Kuhls <bernd.kuhls@t-online.de>
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
[--SNIP--]
> diff --git a/package/onevpl/Config.in b/package/onevpl/Config.in
> new file mode 100644
> index 0000000000..65a34185e3
> --- /dev/null
> +++ b/package/onevpl/Config.in
> @@ -0,0 +1,26 @@
> +config BR2_PACKAGE_ONEVPL_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_ARCH_IS_64
> +	default y if BR2_arm
> +
> +config BR2_PACKAGE_ONEVPL
> +	bool "onevpl"
> +	depends on BR2_PACKAGE_ONEVPL_ARCH_SUPPORTS
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on !BR2_STATIC_LIBS # dlfcn.h
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
> +	select BR2_PACKAGE_LIBDRM_INTEL if BR2_PACKAGE_LIBVA

This is incorrect, as BR2_PACKAGE_LIBDRM_INTEL needs i386 or x86_64, but
BR2_PACKAGE_ONEVPL_ARCH_SUPPORTS allows any 64-bit arch, like aarch64,
mips64, ppc64...

This is causing build failures, such as:

    http://autobuild.buildroot.org/results/8fa/8fa0f2cd7a027d3d8fae56125621b0b814e132da/

    make: Entering directory '/home/buildroot/autobuild/run/instance-0/buildroot'
    Makefile:576: *** libpciaccess is in the dependency chain of libdrm that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.
    make: Leaving directory '/home/buildroot/autobuild/run/instance-0/buildroot'

Can you look into that, please (note that you renamed the package to
libvpl later, so it would be nice to have a fix for master and one for
the 2023.11.x branch.

Regards,
Yann E. MORIN.

> +	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
> +	help
> +	  oneAPI Video Processing Library (oneVPL) dispatcher,
> +	  tools, and examples
> +
> +	  https://github.com/oneapi-src/oneVPL
> +
> +comment "onevpl needs a toolchain w/ dynamic library, gcc >= 7, C++, threads"
> +	depends on BR2_PACKAGE_ONEVPL_ARCH_SUPPORTS
> +	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
> +		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/onevpl/onevpl.hash b/package/onevpl/onevpl.hash
> new file mode 100644
> index 0000000000..c9ca1e6c04
> --- /dev/null
> +++ b/package/onevpl/onevpl.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  4411543519486a2450f6f5af06a077596e7888a551768594e9dfa2a46b23b6f5  onevpl-2023.3.1.tar.gz
> +sha256  bf1cfac2e2792b6e1e995ce103d70796aecaf2ec7e4c5fe5474f7acec7b4a677  LICENSE
> diff --git a/package/onevpl/onevpl.mk b/package/onevpl/onevpl.mk
> new file mode 100644
> index 0000000000..2033f755c0
> --- /dev/null
> +++ b/package/onevpl/onevpl.mk
> @@ -0,0 +1,43 @@
> +################################################################################
> +#
> +# onevpl
> +#
> +################################################################################
> +
> +ONEVPL_VERSION = 2023.3.1
> +ONEVPL_SITE = $(call github,oneapi-src,oneVPL,v$(ONEVPL_VERSION))
> +ONEVPL_LICENSE = MIT
> +ONEVPL_LICENSE_FILES = LICENSE
> +ONEVPL_INSTALL_STAGING = YES
> +ONEVPL_DEPENDENCIES = host-pkgconf
> +
> +ONEVPL_CONF_OPTS = \
> +	-DINSTALL_EXAMPLE_CODE=OFF
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +ONEVPL_CONF_OPTS += \
> +	-DCMAKE_CXX_FLAGS="-latomic"
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBVA),y)
> +ONEVPL_CONF_OPTS += -DENABLE_VA=ON
> +ONEVPL_DEPENDENCIES += libva
> +else
> +ONEVPL_CONF_OPTS += -DENABLE_VA=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_WAYLAND),y)
> +ONEVPL_CONF_OPTS += -DENABLE_WAYLAND=ON
> +ONEVPL_DEPENDENCIES += wayland wayland-protocols
> +else
> +ONEVPL_CONF_OPTS += -DENABLE_WAYLAND=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_XORG7),y)
> +ONEVPL_CONF_OPTS += -DENABLE_X11=ON
> +ONEVPL_DEPENDENCIES += libxcb xlib_libX11
> +else
> +ONEVPL_CONF_OPTS += -DENABLE_X11=OFF
> +endif
> +
> +$(eval $(cmake-package))
> -- 
> 2.39.2
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
