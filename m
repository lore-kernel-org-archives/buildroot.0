From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Jul 2020 10:42:30 +0200
Subject: [Buildroot] [PATCH v2 10/13] package/libblockdev: add support
 for swap plugin
In-Reply-To: <20200724232601.2441272-11-aduskett@gmail.com>
References: <20200724232601.2441272-1-aduskett@gmail.com>
 <20200724232601.2441272-11-aduskett@gmail.com>
Message-ID: <20200725104230.5e80d391@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 24 Jul 2020 16:25:58 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/libblockdev/Config.in      | 4 ++++
>  package/libblockdev/libblockdev.mk | 7 ++++++-
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
> index 82e317b25f..9d5d4e6071 100644
> --- a/package/libblockdev/Config.in
> +++ b/package/libblockdev/Config.in
> @@ -57,6 +57,10 @@ config BR2_PACKAGE_LIBBLOCKDEV_PARTED
>  comment "part plugin needs a toolchain w/ locale"
>  	depends on !BR2_ENABLE_LOCALE
>  
> +config BR2_PACKAGE_LIBBLOCKDEV_SWAP
> +	bool "swap"
> +	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID

I think we should also select BR2_PACKAGE_UTIL_LINUX here.

> +ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_SWAP),y)
> +LIBBLOCKDEV_CONF_OPTS += --with-swap

No build-time dependency on util-linux ?

> +else
> +LIBBLOCKDEV_CONF_OPTS += --without-swap
> +endif
> +
>  $(eval $(autotools-package))

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
