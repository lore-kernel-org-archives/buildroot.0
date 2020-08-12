From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Aug 2020 11:41:33 +0200
Subject: [Buildroot] [PATCH] configs/ci20: Use upstream Linux and U-Boot
In-Reply-To: <20200811154429.436747-1-ezequiel@vanguardiasur.com.ar>
References: <20200811154429.436747-1-ezequiel@vanguardiasur.com.ar>
Message-ID: <20200812114133.492bb1e3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Aug 2020 12:44:29 -0300
Ezequiel Garcia via buildroot <buildroot@busybox.net> wrote:

> From: Ezequiel Garcia <ezequiel@collabora.com>
> 
> The vendor kernel we are currently selecting no longer builds,
> and fails with a ton of:
> 
>                  from include/linux/list.h:8,
>                  from include/linux/module.h:9,
>                  from arch/mips/jz4740/prom.c:16:
> include/linux/log2.h:22:1: error: ignoring attribute 'noreturn' because it conflicts with attribute 'const' [-Werror=a
> ttributes]
>    22 | int ____ilog2_NaN(void);
>       | ^~~
> 
> We can't afford to fix that, so let's just move to upstream
> kernel and bootloader. It doesn't make much sense to keep
> using an unsupported kernel and bootloader at this point.
> 
> This means we will be missing some of the features supported
> by the vendor (such as HDMI support), but it is what it is.
> 
> Linux v5.7 and v5.4 have been tested to boot fine, the latter
> is picked for the defconfig.

I've added a reference to the Gitlab CI failure here.

> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_LATEST_VERSION=y

And changed this to use a fixed version instead of "latest version", so
that we're sure this defconfig will continue to build a U-Boot version
that was tested by someone.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
