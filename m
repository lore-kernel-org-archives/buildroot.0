From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Jul 2020 10:40:53 +0200
Subject: [Buildroot] [PATCH v2 07/13] package/libblockdev: add support
 for lvm plugin
In-Reply-To: <20200724232601.2441272-8-aduskett@gmail.com>
References: <20200724232601.2441272-1-aduskett@gmail.com>
 <20200724232601.2441272-8-aduskett@gmail.com>
Message-ID: <20200725104053.715fefa5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 24 Jul 2020 16:25:55 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/libblockdev/Config.in      | 9 +++++++++
>  package/libblockdev/libblockdev.mk | 8 +++++++-
>  2 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
> index 6f0b3435fe..9da9685bd9 100644
> --- a/package/libblockdev/Config.in
> +++ b/package/libblockdev/Config.in
> @@ -36,6 +36,15 @@ comment "filesystem plugin needs a toolchain w/ locale"
>  config BR2_PACKAGE_LIBBLOCKDEV_LOOP
>  	bool "loop"
>  
> +config BR2_PACKAGE_LIBBLOCKDEV_LVM2
> +	bool "lvm2"
> +	depends on BR2_ENABLE_LOCALE # parted
> +	select BR2_PACKAGE_PARTED

You're selecting parted here.

> +ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_LVM2),y)
> +LIBBLOCKDEV_DEPENDENCIES += lvm2

but don't make it a build-time dependency here.

Could you clarify ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
