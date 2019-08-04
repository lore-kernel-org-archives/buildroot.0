From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Aug 2019 00:07:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/stellarium: new package
In-Reply-To: <20190804160432.19791-1-bernd.kuhls@t-online.de>
References: <20190804160432.19791-1-bernd.kuhls@t-online.de>
Message-ID: <20190805000752.06b970bf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Sun,  4 Aug 2019 18:04:32 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:


> diff --git a/package/stellarium/Config.in b/package/stellarium/Config.in
> new file mode 100644
> index 0000000000..4232f9ed1a
> --- /dev/null
> +++ b/package/stellarium/Config.in
> @@ -0,0 +1,27 @@
> +config BR2_PACKAGE_STELLARIUM
> +	bool "stellarium"
> +	depends on BR2_PACKAGE_QT5
> +	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
> +	depends on BR2_PACKAGE_HAS_LIBGL

Why do you have a depends on BR2_PACKAGE_HAS_LIBGL in addition to
BR2_PACKAGE_QT5_GL_AVAILABLE ? The Qt OpenGL support works with both
full OpenGL or OpenGL ES. Is there something in stellarium that limits
it to full OpenGL ?

> +	select BR2_PACKAGE_QT5BASE_CONCURRENT
> +	select BR2_PACKAGE_QT5BASE_GUI
> +	select BR2_PACKAGE_QT5BASE_NETWORK
> +	select BR2_PACKAGE_QT5BASE_OPENGL
> +	select BR2_PACKAGE_QT5BASE_PRINTSUPPORT
> +	select BR2_PACKAGE_QT5BASE_WIDGETS
> +	select BR2_PACKAGE_QT5LOCATION
> +	select BR2_PACKAGE_QT5MULTIMEDIA
> +	select BR2_PACKAGE_QT5SCRIPT if BR2_PACKAGE_QT5_JSCORE_AVAILABLE
> +	select BR2_PACKAGE_QT5SERIALPORT if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6

So how does it work when BR2_PACKAGE_QT5_JSCORE_AVAILABLE or
BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6 are not 'y' ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
