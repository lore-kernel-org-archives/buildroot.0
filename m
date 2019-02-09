From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 Feb 2019 16:17:07 +0100
Subject: [Buildroot] [PATCH v3 3/3] boot: arm-trusted-firmware: add
 support for Marvell Armada 3700
In-Reply-To: <20190205104512.23718-4-kostap@marvell.com>
References: <20190205104512.23718-1-kostap@marvell.com>
 <20190205104512.23718-4-kostap@marvell.com>
Message-ID: <20190209161707.5ac029ca@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Commit title should be:

	boot/arm-trusted-firmware: add support for Marvell Armada 3700

On Tue, 5 Feb 2019 12:45:12 +0200
<kostap@marvell.com> wrote:

> From: Konstantin Porotchkin <kostap@marvell.com>
> 
> Add support for TF-A image builds for Marvell Armada 3700 family
> 
> Signed-off-by: Konstantin Porotchkin <kostap@marvell.com>
> ---
>  boot/arm-trusted-firmware/arm-trusted-firmware.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> index 23f493653d..3e490c03c4 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -52,6 +52,13 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += MV_DDR_PATH=$(MV_DDR_MARVELL_DIR)
>  ARM_TRUSTED_FIRMWARE_DEPENDENCIES += mv-ddr-marvell
>  endif
>  
> +ifeq ($(BR2_TARGET_A3700_UTILS_MARVELL),y)
> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += WTP=$(A3700_UTILS_MARVELL_DIR)
> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += CROSS_CM3=$(HOST_DIR)/bin/arm-none-eabi-

One assignment:

ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
	WTP=$(A3700_UTILS_MARVELL_DIR) \
	CROSS_CM3=$(HOST_DIR)/bin/arm-none-eabi-

> +ARM_TRUSTED_FIRMWARE_DEPENDENCIES += a3700-utils-marvell
> +ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-arm-gnu-rm-toolchain

One assignment:

ARM_TRUSTED_FIRMWARE_DEPENDENCIES += \
	a3700-utils-marvell \
	host-arm-gnu-rm-toolchain

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
