From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 23:34:26 +0200
Subject: [Buildroot] [PATCH v2 1/1] vte: new package
In-Reply-To: <20180116231558.7316-1-stefan.froberg@petroprogram.com>
References: <20180116231558.7316-1-stefan.froberg@petroprogram.com>
Message-ID: <20180428233426.409defbf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 17 Jan 2018 01:15:58 +0200, Stefan Fr?berg wrote:

> diff --git a/package/vte/Config.in b/package/vte/Config.in
> new file mode 100644
> index 0000000000..43c6dd0948
> --- /dev/null
> +++ b/package/vte/Config.in
> @@ -0,0 +1,34 @@
> +config BR2_PACKAGE_VTE
> +	bool "vte"
> +	depends on BR2_USE_WCHAR
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_MMU
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
> +		BR2_PACKAGE_HAS_LIBGL
> +	depends on BR2_PACKAGE_XORG7

To be honest, I'm starting to wonder if a "depends on
BR2_PACKAGE_LIBGTK3" wouldn't make much sense in such situations. It is
likely that someone wanting to use "vte" will know that he needs
libgtk3.

But OK, I've kept it as-is.
> +comment "vte needs an OpenGL or an OpenGL-EGL/wayland backend"
> +	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +	depends on !BR2_PACKAGE_HAS_LIBEGL_WAYLAND && \
> +		!BR2_PACKAGE_HAS_LIBGL
> +

There was an empty new line here, which I removed.

> +VTE_VERSION = 0.48.3
> +VTE_SOURCE = vte-$(VTE_VERSION).tar.xz
> +VTE_SITE = http://ftp.gnome.org/pub/gnome/sources/vte/0.48
> +VTE_DEPENDENCIES = host-pkgconf libgtk3 libxml2 pcre2
> +VTE_LICENSE = LGPL-2.1-or-later

Changed this to LGPL-2.1+, as per our conventions.

And applied. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
