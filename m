From: =?utf-8?B?R2HDq2w=?= PORTAY <gael.portay@collabora.com>
Date: Tue, 4 Dec 2018 05:14:43 -0500
Subject: [Buildroot] [PATCH] igt-gpu-tools: add new package
In-Reply-To: <20181204022701.28095-1-gael.portay@collabora.com>
References: <20181204022701.28095-1-gael.portay@collabora.com>
Message-ID: <20181204090832.2eu5q5kow5spwjgu@archlinux.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

I am responding to myself :/

On Mon, Dec 03, 2018 at 09:27:01PM -0500, Ga?l PORTAY wrote:
> diff --git a/package/igt-gpu-tools/Config.in b/package/igt-gpu-tools/Config.in
> new file mode 100644
> index 0000000000..73e217e93c
> --- /dev/null
> +++ b/package/igt-gpu-tools/Config.in
> @@ -0,0 +1,27 @@
> +config BR2_PACKAGE_IGT_GPU_TOOLS
> +	bool "igt-gpu-tools"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm libunwind
> +	depends on !BR2_STATIC_LIBS # kmod libunwind
> +	depends on BR2_USE_MMU # procps-ng
> +	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # procps-ng
> +	depends on BR2_PACKAGE_HAS_OPENSSL
> +	depends on BR2_PACKAGE_HAS_UDEV
> +	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS # libunwind
> +	select BR2_PACKAGE_CAIRO
> +	select BR2_PACKAGE_CAIRO_PNG
> +	select BR2_PACKAGE_KMOD
> +	select BR2_PACKAGE_LIBDRM

select BR2_PACKAGE_LIBGLIB2 appears to be missing here.

> +	select BR2_PACKAGE_LIBUNWIND
> +	select BR2_PACKAGE_LIBPCIACCESS

The two selects above are not properly alphabetically sorted.

> +	select BR2_PACKAGE_PIXMAN
> +	select BR2_PACKAGE_PROCPS_NG
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  IGT GPU Tools is a collection of tools for development and
> +	  testing of the DRM drivers.
> +
> +	  https://cgit.freedesktop.org/drm/igt-gpu-tools/
> +
> +comment "igt-gpu-tools needs udev /dev management and openssl library"
> +        depends on !BR2_PACKAGE_IGT_GPU_TOOLS
> +        depends on !BR2_PACKAGE_HAS_UDEV || !BR2_PACKAGE_HAS_OPENSSL

Regards,
Gael
