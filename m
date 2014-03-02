From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Sun, 02 Mar 2014 23:39:12 +0100
Subject: [Buildroot] [PATCH 04/19] package/libopenvg: rename the _HAS
 and _PROVIDES variables
In-Reply-To: <2f963768990b1c955d044e5f5d587f39e110bf01.1393778339.git.yann.morin.1998@free.fr>
References: <cover.1393778339.git.yann.morin.1998@free.fr>
 <2f963768990b1c955d044e5f5d587f39e110bf01.1393778339.git.yann.morin.1998@free.fr>
Message-ID: <5313B310.9080304@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Yann,

> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> The basic rule for a package is to have its options named
> after the package name. There is no reason this should not
> also be the case for virtual packages.
>
> Besides, this will allow us to switch libopenvg to use the
> soo-to-be-introduced virtual-package infrastructure.

soon-to-be-introduced

Regards,
Jerzy

>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Mike Zick <minimod@morethan.org>
> Reviewed-by: Samuel Martin <s.martin49@gmail.com>
> ---
>   package/cairo/cairo.mk                | 2 +-
>   package/opengl/libopenvg/Config.in    | 6 +++---
>   package/opengl/libopenvg/libopenvg.mk | 4 ++--
>   package/rpi-userland/Config.in        | 4 ++--
>   4 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
> index ddd57db..c566d4a 100644
> --- a/package/cairo/cairo.mk
> +++ b/package/cairo/cairo.mk
> @@ -61,7 +61,7 @@ else
>   	CAIRO_CONF_OPT += --disable-glesv2
>   endif
>   
> -ifeq ($(BR2_PACKAGE_HAS_OPENVG),y)
> +ifeq ($(BR2_PACKAGE_HAS_LIBOPENVG),y)
>   	CAIRO_CONF_OPT += --enable-vg
>   	CAIRO_DEPENDENCIES += libopenvg
>   else
> diff --git a/package/opengl/libopenvg/Config.in b/package/opengl/libopenvg/Config.in
> index 9d31525..53cde6a 100644
> --- a/package/opengl/libopenvg/Config.in
> +++ b/package/opengl/libopenvg/Config.in
> @@ -1,6 +1,6 @@
> -config BR2_PACKAGE_HAS_OPENVG
> +config BR2_PACKAGE_HAS_LIBOPENVG
>   	bool
>   
> -config BR2_PACKAGE_PROVIDES_OPENVG
> -	depends on BR2_PACKAGE_HAS_OPENVG
> +config BR2_PACKAGE_PROVIDES_LIBOPENVG
> +	depends on BR2_PACKAGE_HAS_LIBOPENVG
>   	string
> diff --git a/package/opengl/libopenvg/libopenvg.mk b/package/opengl/libopenvg/libopenvg.mk
> index f81db5e..1c6f929 100644
> --- a/package/opengl/libopenvg/libopenvg.mk
> +++ b/package/opengl/libopenvg/libopenvg.mk
> @@ -5,9 +5,9 @@
>   ################################################################################
>   
>   LIBOPENVG_SOURCE =
> -LIBOPENVG_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_OPENVG))
> +LIBOPENVG_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_LIBOPENVG))
>   
> -ifeq ($(BR2_PACKAGE_HAS_OPENVG),y)
> +ifeq ($(BR2_PACKAGE_HAS_LIBOPENVG),y)
>   ifeq ($(LIBOPENVG_DEPENDENCIES),)
>   $(error No libOpenVG implementation selected. Configuration error.)
>   endif
> diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
> index 7238092..76ea718 100644
> --- a/package/rpi-userland/Config.in
> +++ b/package/rpi-userland/Config.in
> @@ -6,7 +6,7 @@ config BR2_PACKAGE_RPI_USERLAND
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
>   	select BR2_PACKAGE_HAS_OPENGL_LIBEGL
>   	select BR2_PACKAGE_HAS_OPENGL_LIBGLES
> -	select BR2_PACKAGE_HAS_OPENVG
> +	select BR2_PACKAGE_HAS_LIBOPENVG
>   	select BR2_PACKAGE_HAS_LIBOPENMAX
>   	help
>   	  Raspberry Pi Userland contains the necessary library to use the
> @@ -25,7 +25,7 @@ config BR2_PACKAGE_PROVIDES_OPENGL_LIBEGL
>   config BR2_PACKAGE_PROVIDES_OPENGL_LIBGLES
>   	default "rpi-userland"
>   
> -config BR2_PACKAGE_PROVIDES_OPENVG
> +config BR2_PACKAGE_PROVIDES_LIBOPENVG
>   	default "rpi-userland"
>   
>   config BR2_PACKAGE_PROVIDES_LIBOPENMAX
