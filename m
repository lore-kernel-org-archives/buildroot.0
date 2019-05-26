From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 May 2019 21:50:30 +0200
Subject: [Buildroot] [PATCH] boot/uboot: add initial environment support
In-Reply-To: <20190519191635.23814-1-michael@walle.cc>
References: <20190519191635.23814-1-michael@walle.cc>
Message-ID: <20190526215030.5c40a899@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Michael,

Thanks for this patch! See below a number of comments.

On Sun, 19 May 2019 21:16:35 +0200
Michael Walle <michael@walle.cc> wrote:

> Since v2019.07 U-Boot supports extracting the compiled-in environment.
> As a first step, add support to the environment generation in buildroot.
> In the future, the text file may also be injected into the target
> filesystem.

I'm not sure what you mean by "injected into the target filesystem".
How would this be useful ? U-Boot would pick the environment from the
root filesystem ?

> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 33b7e67ff7..92f00bf752 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -488,7 +488,19 @@ menuconfig BR2_TARGET_UBOOT_ENVIMAGE
>  	  The environment image will be called uboot-env.bin.
>  
>  if BR2_TARGET_UBOOT_ENVIMAGE
> +choice
> +	prompt "Environment image source"
> +	default BR2_TARGET_UBOOT_ENVIMAGE_CUSTOM
> +
> +config BR2_TARGET_UBOOT_ENVIMAGE_INITIAL
> +	bool "Using the initial environment file"

I'm not a fan of the "initial" terminology, although admittedly it's
the one apparently chosen upstream. "built-in" would be a lot more
logical, no ?

Also, I think this option needs a help text that describes what it
does, and the fact that it only works with U-Boot >= 2019.07.

> +config BR2_TARGET_UBOOT_ENVIMAGE_CUSTOM
> +	bool "Using a custom environment file"

Ditto, a help text would be good.

Other than that, looks good to me. Could you just fix those minor
details and send an updated version ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
