Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D66C38142
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 15:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 265B24168E;
	Sat, 28 Jan 2023 15:37:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 265B24168E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lt9PCbP92vSX; Sat, 28 Jan 2023 15:37:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 480A5416B5;
	Sat, 28 Jan 2023 15:37:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 480A5416B5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8D0A31BF2B3
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 15:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67164405F3
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 15:37:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67164405F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9aLxupynM8Kf for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 15:37:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 354964035D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 354964035D
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 15:37:48 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id B0E055FF7A;
 Sat, 28 Jan 2023 16:37:35 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 28 Jan 2023 16:37:35 +0100
Date: Sat, 28 Jan 2023 16:37:35 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230128153735.GD2632@scaer>
References: <20220924210221.1490924-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220924210221.1490924-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1674920265;
 bh=awm3NrDzYSmmx3yYEUAkmEk3XjUL6MAey573dzg25pk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U5mM1jEk+nAvP2tvr9Q0akUmTne0dy7qo10nXDGMC+9zlKt966F7aYlYNKtoQXehu
 xusDSOXBVeWvpvLYPOncfIqKdsOHAZO8JqOUoJfQd8utl15EWw0vZUD4kM1MedGRel
 +Avt5jo4Tpstf32W58zvdOVTJMfMZU2oPaGOb95qXksyqGx+ZkhHGKJcidkEGq5QtO
 qtE3Zhg0NMW8r0DyP5cVLh4Fx5FnJG1qtRXLwr6o4hQLi1ES7Vvx0/GxkVD9no0bnA
 AYWGh5aJKBvVZv+rELLQ43xbAK55eqdwNEUTMA7HvqkL3ZOT5Hw3rBroxYFDM5J9VK
 MJdk0leJ6vbgg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=U5mM1jEk
Subject: Re: [Buildroot] [PATCH v2] package/opengl/libegl: remove
 BR2_PACKAGE_HAS_LIBEGL_WAYLAND
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Gary Bisson <bisson.gary@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, buildroot@buildroot.org,
 Adrian Perez de Castro <aperez@igalia.com>,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

+Maxime Chevallier for the rockchip package...

On 2022-09-24 23:02 +0200, Thomas Petazzoni spake thusly:
> Since wayland 1.15 (upstream commit
> 549a5ea710f4da1a5749587176d39fef1ded4077), libwayland-egl.so is
> provided by the wayland package, so there is no longer a question of
> whether libwayland-egl.so is provided by the particular EGL
> implementation. See the Wayland commit log:
> 
>     wayland-egl: import libwayland-egl.so frontend library from Mesa
> 
>     Currently the client-facing libwayland-egl API is defined by a header
>     file shipped by Wayland, but the implementation is left to each vendor.
> 
>     This can cause collisions when multiple implementations are installed on
>     the same system. Importing the implementation into Wayland with a stable
>     and versioned driver-facing ABI allows multiple drivers to coexist on
>     the same system.
> 
>     Pull the sample implementation from Mesa commit 677edff5cfd
>     ("wayland-egl: rework and simplify wl_egl_window initialization")
>     It has been used by the Mesa open source drivers, NVIDIA and others[1].
> 
>     v2: Reword commit message, rebase on top of newer Mesa.
> 
>     [1] https://github.com/thayama/wayland-egl

Then we'll have an issue with rockchip-mali, which does install its own
version:

   31 ifeq ($(BR2_PACKAGE_WAYLAND),y)
   32 ROCKCHIP_MALI_SUFFIX = -wayland-gbm
   33 ROCKCHIP_MALI_PKGCONFIG_FILES += wayland-egl
   34 ROCKCHIP_MALI_LIB_SYMLINKS += libwayland-egl.so
   35 ROCKCHIP_MALI_DEPENDENCIES += wayland
   36 else

The topic recently poped up on IRC, and it's been reported that the
libwayland-egl as provided by wayland, is not compatible with the
rockchip blob.

However, the repositroy where we are supposed to grab the rockchip-mali
blobs no longer exists;

    ROCKCHIP_MALI_SITE = $(call github,rockchip-linux,libmali,$(ROCKCHIP_MALI_VERSION))

    https://github.com/rockchip-linux/libmali -> 404

Maxime, do you know wheter the libmali has moved somewhere else, or has
purely disapeared? What should we do with this package, now?

It seems it's been hidden somewhere in:
    https://github.com/JeffyCN/mirrors
    https://github.com/JeffyCN/mirrors/tree/libmali

What's the deal?

Regards,
Yann E. MORIN.

> Consequently, we remove the BR2_PACKAGE_HAS_LIBEGL_WAYLAND
> option. Packages that rely on BR2_PACKAGE_HAS_LIBGLES and
> BR2_PACKAGE_WAYLAND are guaranteed to have libwayland-egl.so.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> Changes since v1:
> - Fix Wayland 15 -> wayland 1.15 in commit log
> - Re-add BR2_PACKAGE_HAS_LIBEGL dependency in weston.mk
> ---
>  package/cage/Config.in                      | 4 +---
>  package/freescale-imx/imx-gpu-viv/Config.in | 1 -
>  package/kodi/Config.in                      | 1 -
>  package/libgtk3/Config.in                   | 8 ++++----
>  package/mesa3d/Config.in                    | 1 -
>  package/nvidia-driver/Config.in             | 1 -
>  package/opengl/libegl/Config.in             | 4 ----
>  package/vte/Config.in                       | 6 +++---
>  package/waffle/Config.in                    | 2 +-
>  package/waylandpp/Config.in                 | 6 +++---
>  package/weston/Config.in                    | 6 +++---
>  package/weston/weston.mk                    | 2 +-
>  package/wlroots/Config.in                   | 5 ++---
>  package/wpebackend-fdo/Config.in            | 6 +++---
>  package/wpewebkit/Config.in                 | 4 +---
>  15 files changed, 22 insertions(+), 35 deletions(-)
> 
> diff --git a/package/cage/Config.in b/package/cage/Config.in
> index 0844d6ff62..4f823c768c 100644
> --- a/package/cage/Config.in
> +++ b/package/cage/Config.in
> @@ -1,6 +1,5 @@
> -comment "cage needs udev, EGL w/ Wayland backend and OpenGL ES support"
> +comment "cage needs udev, EGL and OpenGL ES support"
>  	depends on !BR2_PACKAGE_HAS_LIBEGL || \
> -		!BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
>  		!BR2_PACKAGE_HAS_LIBGLES || \
>  		!BR2_PACKAGE_HAS_UDEV
>  
> @@ -13,7 +12,6 @@ config BR2_PACKAGE_CAGE
>  	depends on !BR2_STATIC_LIBS # wlroots
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # wlroots
>  	depends on BR2_PACKAGE_HAS_LIBEGL # wlroots
> -	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND # wlroots
>  	depends on BR2_PACKAGE_HAS_LIBGLES # wlroots
>  	depends on BR2_PACKAGE_HAS_UDEV # wlroots
>  	select BR2_PACKAGE_WLROOTS
> diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
> index 9ba3d0428e..fc59d9a548 100644
> --- a/package/freescale-imx/imx-gpu-viv/Config.in
> +++ b/package/freescale-imx/imx-gpu-viv/Config.in
> @@ -64,7 +64,6 @@ config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB
>  config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
>  	bool "Wayland"
>  	select BR2_PACKAGE_WAYLAND
> -	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
>  
>  endchoice
>  
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index 90710683db..1b1f39895e 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -31,7 +31,6 @@ config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND
>  	bool
>  	default y
>  	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
> -	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND # waylandpp
>  	depends on BR2_HOST_GCC_AT_LEAST_4_9 # waylandpp
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # waylandpp
>  	depends on BR2_INSTALL_LIBSTDCPP # waylandpp
> diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
> index bc8cacd9f5..41fe3dd64c 100644
> --- a/package/libgtk3/Config.in
> +++ b/package/libgtk3/Config.in
> @@ -6,10 +6,10 @@ comment "libgtk3 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
>  		!BR2_TOOLCHAIN_HAS_THREADS
>  
> -comment "libgtk3 needs an OpenGL or an OpenGL-EGL/wayland backend"
> +comment "libgtk3 needs an OpenGL or an OpenGL-EGL backend"
>  	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> -	depends on !BR2_PACKAGE_HAS_LIBEGL_WAYLAND && \
> +	depends on !BR2_PACKAGE_HAS_LIBEGL && \
>  		!BR2_PACKAGE_HAS_LIBGL
>  
>  config BR2_PACKAGE_LIBGTK3
> @@ -21,7 +21,7 @@ config BR2_PACKAGE_LIBGTK3
>  	depends on BR2_INSTALL_LIBSTDCPP # pango
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
> -	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
> +	depends on BR2_PACKAGE_HAS_LIBEGL || \
>  		BR2_PACKAGE_HAS_LIBGL
>  	select BR2_PACKAGE_ATK
>  	select BR2_PACKAGE_CAIRO
> @@ -69,7 +69,7 @@ comment "Wayland GDK backend needs an OpenGL EGL backend provided by mesa3d w/ h
>  config BR2_PACKAGE_LIBGTK3_WAYLAND
>  	bool "Wayland GDK backend"
>  	default y
> -	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
> +	depends on BR2_PACKAGE_HAS_LIBEGL
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
>  	select BR2_PACKAGE_WAYLAND
>  	select BR2_PACKAGE_WAYLAND_PROTOCOLS
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 40f7009492..e379255a01 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -378,7 +378,6 @@ config BR2_PACKAGE_MESA3D_OPENGL_EGL
>  	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>  	select BR2_PACKAGE_HAS_LIBEGL if !BR2_PACKAGE_LIBGLVND
>  	select BR2_PACKAGE_LIBGLVND_DISPATCH_EGL if BR2_PACKAGE_LIBGLVND
> -	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
>  	select BR2_PACKAGE_MESA3D_GBM
>  	help
>  	  Use the Khronos EGL APIs. EGL is a window manager for OpenGL
> diff --git a/package/nvidia-driver/Config.in b/package/nvidia-driver/Config.in
> index a8617a939b..e4a9dde0a0 100644
> --- a/package/nvidia-driver/Config.in
> +++ b/package/nvidia-driver/Config.in
> @@ -26,7 +26,6 @@ config BR2_PACKAGE_NVIDIA_DRIVER_XORG
>  	select BR2_PACKAGE_XLIB_LIBXEXT
>  	select BR2_PACKAGE_HAS_LIBGL
>  	select BR2_PACKAGE_HAS_LIBEGL
> -	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
>  	select BR2_PACKAGE_HAS_LIBGLES
>  
>  if BR2_PACKAGE_NVIDIA_DRIVER_XORG
> diff --git a/package/opengl/libegl/Config.in b/package/opengl/libegl/Config.in
> index a236998947..f46d09ed71 100644
> --- a/package/opengl/libegl/Config.in
> +++ b/package/opengl/libegl/Config.in
> @@ -1,10 +1,6 @@
>  config BR2_PACKAGE_HAS_LIBEGL
>  	bool
>  
> -config BR2_PACKAGE_HAS_LIBEGL_WAYLAND
> -	bool
> -	depends on BR2_PACKAGE_HAS_LIBEGL
> -
>  config BR2_PACKAGE_PROVIDES_LIBEGL
>  	string
>  	depends on BR2_PACKAGE_HAS_LIBEGL
> diff --git a/package/vte/Config.in b/package/vte/Config.in
> index 45d627885f..8a231a21af 100644
> --- a/package/vte/Config.in
> +++ b/package/vte/Config.in
> @@ -8,7 +8,7 @@ config BR2_PACKAGE_VTE
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_TOOLCHAIN_USES_MUSL
> -	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
> +	depends on BR2_PACKAGE_HAS_LIBEGL || \
>  		BR2_PACKAGE_HAS_LIBGL
>  	depends on BR2_PACKAGE_XORG7
>  	select BR2_PACKAGE_LIBGTK3
> @@ -31,9 +31,9 @@ comment "vte needs a uClibc or glibc toolchain w/ wchar, threads, C++, gcc >= 10
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
>  		BR2_TOOLCHAIN_USES_MUSL
>  
> -comment "vte needs an OpenGL or an OpenGL-EGL/wayland backend"
> +comment "vte needs an OpenGL or an OpenGL-EGL backend"
>  	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
>  	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> -	depends on !BR2_PACKAGE_HAS_LIBEGL_WAYLAND && \
> +	depends on !BR2_PACKAGE_HAS_LIBEGL && \
>  		!BR2_PACKAGE_HAS_LIBGL
> diff --git a/package/waffle/Config.in b/package/waffle/Config.in
> index ad622e9582..79cb4ca2ed 100644
> --- a/package/waffle/Config.in
> +++ b/package/waffle/Config.in
> @@ -4,7 +4,7 @@ config BR2_PACKAGE_WAFFLE_SUPPORTS_GLX
>  
>  config BR2_PACKAGE_WAFFLE_SUPPORTS_WAYLAND
>  	bool
> -	default y if BR2_PACKAGE_WAYLAND && BR2_PACKAGE_HAS_LIBEGL_WAYLAND
> +	default y if BR2_PACKAGE_WAYLAND && BR2_PACKAGE_HAS_LIBEGL
>  
>  config BR2_PACKAGE_WAFFLE_SUPPORTS_X11_EGL
>  	bool
> diff --git a/package/waylandpp/Config.in b/package/waylandpp/Config.in
> index 86ca965056..0713884d3e 100644
> --- a/package/waylandpp/Config.in
> +++ b/package/waylandpp/Config.in
> @@ -1,6 +1,6 @@
>  config BR2_PACKAGE_WAYLANDPP
>  	bool "waylandpp"
> -	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
> +	depends on BR2_PACKAGE_HAS_LIBEGL
>  	depends on BR2_HOST_GCC_AT_LEAST_4_9
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>  	depends on BR2_INSTALL_LIBSTDCPP
> @@ -10,9 +10,9 @@ config BR2_PACKAGE_WAYLANDPP
>  
>  	  https://github.com/NilsBrause/waylandpp
>  
> -comment "waylandpp needs an OpenGL-EGL/wayland backend, a toolchain w/ gcc >= 4.9, host gcc >= 4.9, C++ support"
> +comment "waylandpp needs an OpenGL-EGL backend, a toolchain w/ gcc >= 4.9, host gcc >= 4.9, C++ support"
>  	depends on BR2_PACKAGE_WAYLAND
> -	depends on !BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
> +	depends on !BR2_PACKAGE_HAS_LIBEGL || \
>  		!BR2_HOST_GCC_AT_LEAST_4_9 || \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
>  		!BR2_INSTALL_LIBSTDCPP
> diff --git a/package/weston/Config.in b/package/weston/Config.in
> index 3b4e932b7d..cba0469d16 100644
> --- a/package/weston/Config.in
> +++ b/package/weston/Config.in
> @@ -152,16 +152,16 @@ config BR2_PACKAGE_WESTON_DEMO_CLIENTS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # pango
>  	depends on BR2_USE_WCHAR # pango
>  	depends on BR2_PACKAGE_HAS_LIBGLES
> -	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
> +	depends on BR2_PACKAGE_HAS_LIBEGL
>  	select BR2_PACKAGE_PANGO
>  	help
>  	  This enables the installation of Weston's demo clients.
>  
> -comment "demo clients needs an OpenGL ES provider, an OpenEGL-capable Wayland backend and a toolchain w/ wchar, threads, C++, gcc >= 4.9"
> +comment "demo clients needs an OpenGL ES/EGL provider and a toolchain w/ wchar, threads, C++, gcc >= 4.9"
>  	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
>  		!BR2_USE_WCHAR || !BR2_PACKAGE_HAS_LIBGLES || \
> -		!BR2_PACKAGE_HAS_LIBEGL_WAYLAND || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +		!BR2_PACKAGE_HAS_LIBEGL || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>  
>  endif
> diff --git a/package/weston/weston.mk b/package/weston/weston.mk
> index 5e71473640..b0c4061836 100644
> --- a/package/weston/weston.mk
> +++ b/package/weston/weston.mk
> @@ -71,7 +71,7 @@ else
>  WESTON_CONF_OPTS += -Ddeprecated-weston-launch=false
>  endif
>  
> -ifeq ($(BR2_PACKAGE_HAS_LIBEGL_WAYLAND)$(BR2_PACKAGE_HAS_LIBGLES),yy)
> +ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGLES),yy)
>  WESTON_CONF_OPTS += -Drenderer-gl=true
>  WESTON_DEPENDENCIES += libegl libgles
>  ifeq ($(BR2_PACKAGE_PIPEWIRE)$(BR2_PACKAGE_WESTON_DRM),yy)
> diff --git a/package/wlroots/Config.in b/package/wlroots/Config.in
> index 84a4ef846e..de45c0c583 100644
> --- a/package/wlroots/Config.in
> +++ b/package/wlroots/Config.in
> @@ -1,6 +1,6 @@
> -comment "wlroots needs udev, EGL w/ Wayland backend and OpenGL ES support"
> +comment "wlroots needs udev, EGL and OpenGL ES support"
>  	depends on !BR2_PACKAGE_HAS_LIBEGL || \
> -		!BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
> +		!BR2_PACKAGE_HAS_LIBEGL || \
>  		!BR2_PACKAGE_HAS_LIBGLES || \
>  		!BR2_PACKAGE_HAS_UDEV
>  
> @@ -14,7 +14,6 @@ config BR2_PACKAGE_WLROOTS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm, wayland
>  	depends on BR2_PACKAGE_HAS_UDEV # libinput
>  	depends on BR2_PACKAGE_HAS_LIBEGL
> -	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
>  	depends on BR2_PACKAGE_HAS_LIBGLES
>  	select BR2_PACKAGE_LIBDRM
>  	select BR2_PACKAGE_LIBINPUT
> diff --git a/package/wpebackend-fdo/Config.in b/package/wpebackend-fdo/Config.in
> index 8a8c820c9b..9b4dd28741 100644
> --- a/package/wpebackend-fdo/Config.in
> +++ b/package/wpebackend-fdo/Config.in
> @@ -1,5 +1,5 @@
> -comment "wpebackend-fdo needs a toolchain w/ C++, wchar, threads, dynamic library and an OpenEGL-capable Wayland backend"
> -	depends on !BR2_PACKAGE_HAS_LIBEGL_WAYLAND || !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
> +comment "wpebackend-fdo needs a toolchain w/ C++, wchar, threads, dynamic library and EGL support"
> +	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
>  		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
>  
>  config BR2_PACKAGE_WPEBACKEND_FDO
> @@ -9,7 +9,7 @@ config BR2_PACKAGE_WPEBACKEND_FDO
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, libglib2
>  	depends on BR2_USE_WCHAR # libglib2
>  	depends on BR2_USE_MMU # libglib2
> -	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
> +	depends on BR2_PACKAGE_HAS_LIBEGL
>  	select BR2_PACKAGE_LIBEPOXY
>  	select BR2_PACKAGE_LIBGLIB2
>  	select BR2_PACKAGE_LIBWPE
> diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
> index 04ed40bd92..2a5905a30a 100644
> --- a/package/wpewebkit/Config.in
> +++ b/package/wpewebkit/Config.in
> @@ -27,8 +27,7 @@ comment "wpewebkit needs a toolchain w/ C++, wchar, threads, dynamic library, gc
>  comment "wpewebkit needs an OpenGL ES w/ EGL-capable Wayland backend"
>  	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
>  	depends on !BR2_BINFMT_FLAT
> -	depends on !BR2_PACKAGE_HAS_LIBGLES || !BR2_PACKAGE_HAS_LIBEGL \
> -		|| !BR2_PACKAGE_HAS_LIBEGL_WAYLAND
> +	depends on !BR2_PACKAGE_HAS_LIBGLES || !BR2_PACKAGE_HAS_LIBEGL
>  
>  config BR2_PACKAGE_WPEWEBKIT
>  	bool "wpewebkit"
> @@ -41,7 +40,6 @@ config BR2_PACKAGE_WPEWEBKIT
>  	depends on BR2_USE_WCHAR # icu, libsoup
>  	depends on BR2_PACKAGE_HAS_LIBGLES # libepoxy
>  	depends on BR2_PACKAGE_HAS_LIBEGL # libepoxy
> -	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND # wpebackend-fdo
>  	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
>  	select BR2_PACKAGE_CAIRO
>  	select BR2_PACKAGE_CAIRO_PNG

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
