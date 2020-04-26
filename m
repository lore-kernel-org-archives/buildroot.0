From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 Apr 2020 15:13:13 +0200
Subject: [Buildroot] [PATCH v3 2/2] package/cage: new package
In-Reply-To: <20191110200638.3570497-3-aperez@igalia.com>
References: <20191110200638.3570497-1-aperez@igalia.com>
 <20191110200638.3570497-3-aperez@igalia.com>
Message-ID: <20200426151313.24991447@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have applied, with some changes. See below.

On Sun, 10 Nov 2019 22:06:38 +0200
Adrian Perez de Castro <aperez@igalia.com> wrote:

> diff --git a/package/Config.in b/package/Config.in
> index d426d05832..4031d27e99 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -337,6 +337,7 @@ comment "QT libraries and helper libraries"
>  	source "package/quazip/Config.in"
>  	source "package/qwt/Config.in"
>  endif
> +	source "package/cage/Config.in"

This was not sorted alphabetically, as reported by check-package. Also,
cage is not really a "Graphics library", I moved it to "Graphics
applications" instead.

> diff --git a/package/cage/Config.in b/package/cage/Config.in
> new file mode 100644
> index 0000000000..bfa777fb1f
> --- /dev/null
> +++ b/package/cage/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_CAGE
> +	bool "cage"
> +	depends on !BR2_STATIC_LIBS # wlroots -> wayland
> +	depends on BR2_INSTALL_LIBSTDCPP # wlroots -> wayland

wlroots doesn't carry a C++ dependency, so I dropped this.

> +	depends on BR2_TOOLCHAIN_HAS_THREADS # wlroots -> wayland
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # wlroots

wlroots doesn't carry this dependency, so I dropped it.

> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # wlroots

wlroots doesn't carry this dependency, so I dropped it.

> +	depends on BR2_ENABLE_LOCALE # wlroots -> libinput
> +	depends on BR2_PACKAGE_HAS_UDEV # wlroots -> libinput
> +	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # wlroots
> +	depends on BR2_PACKAGE_MESA3D_OPENGL_ES # wlroots

Also, the Config.in comments about the dependencies were missing, so
I've added them.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
