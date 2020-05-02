From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 May 2020 23:34:09 +0200
Subject: [Buildroot] [PATCH] configs/orangepi_rk3399: new defconfig
In-Reply-To: <1588444408-20285-1-git-send-email-sunil@amarulasolutions.com>
References: <1588444408-20285-1-git-send-email-sunil@amarulasolutions.com>
Message-ID: <20200502233409.4a90d4b2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 May 2020 00:03:28 +0530
sunil at amarulasolutions.com wrote:

>  N:	Suniel Mahesh <sunil@amarulasolutions.com>
>  F:	board/firefly/
> +F:	board/orangepi/

This puts you a contact for all board/orangepi/ boards, not just this
one. Is this expected?

> +# Bootloader
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.04"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi-rk3399"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> +BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y

Are you sure these two options are needed? In fact the others rk3399
defconfigs are wrong, and all what they need is Python 3.x. Could you
check my series at:

  http://patchwork.ozlabs.org/project/buildroot/list/?series=174258

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
