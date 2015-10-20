From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Oct 2015 09:19:18 +0200
Subject: [Buildroot] [PATCH] mpkimage: new package
In-Reply-To: <1445291141-6182-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1445291141-6182-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20151020091918.79212c0f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime,

On Mon, 19 Oct 2015 23:45:41 +0200, Maxime Hadjinlian wrote:

> diff --git a/package/Config.in.host b/package/Config.in.host
> index 1f69687..a4662d7 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -15,6 +15,7 @@ menu "Host utilities"
>  	source "package/imx-usb-loader/Config.in.host"
>  	source "package/lpc3250loader/Config.in.host"
>  	source "package/mke2img/Config.in.host"
> +	source "package/mkpimage/Config.in.host"

Do we really need a visible Config.in option for this tool? Can't it
simply be used as a dependency of U-Boot, as proposed by Jan in his
patch series ?

> diff --git a/package/mkpimage/mkpimage.mk b/package/mkpimage/mkpimage.mk
> new file mode 100644
> index 0000000..d6dcdd2
> --- /dev/null
> +++ b/package/mkpimage/mkpimage.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# mkpimage
> +#
> +################################################################################
> +
> +# source included in the package
> +# came from barebox's repository:
> +# http://git.pengutronix.de/?p=barebox.git;a=blob;f=scripts/socfpga_mkimage.c;h=1a7a66d98841e9f52c3ea49c651286aa1412c9a5;hb=HEAD
> +HOST_MKPIMAGE_SOURCE =
> +HOST_MKPIMAGE_LICENSE = GPLv2
> +
> +define HOST_MKPIMAGE_BUILD_CMDS
> +    $(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) \
> +        package/mkpimage/mkpimage.c -o $(@D)/mkpimage

Use tabs for indentation.

> +endef
> +
> +define HOST_MKPIMAGE_INSTALL_CMDS
> +    $(INSTALL) -D -m 755 $(@D)/mkpimage $(HOST_DIR)/usr/bin/mkpimage

Ditto.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
