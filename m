From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Dec 2017 23:04:01 +0100
Subject: [Buildroot] [PATCH v3 3/4] atf: add support for Marvell Armada
 SoCs
In-Reply-To: <20171203181818.10087-4-geomatsi@gmail.com>
References: <20171203181818.10087-1-geomatsi@gmail.com>
 <20171203181818.10087-4-geomatsi@gmail.com>
Message-ID: <20171203230401.57bc589c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 Dec 2017 21:18:17 +0300, Sergey Matyukevich wrote:

> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> index 7b1cc6ebb6..035f7de189 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -39,6 +39,17 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += SCP_BL2=$(BINARIES_DIR)/scp-fw.bin
>  ARM_TRUSTED_FIRMWARE_DEPENDENCIES += vexpress-firmware
>  endif
>  
> +ifeq ($(BR2_TARGET_BINARIES_MARVELL),y)
> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += SCP_BL2=$(BINARIES_DIR)/scp-fw.bin
> +ARM_TRUSTED_FIRMWARE_DEPENDENCIES += binaries-marvell
> +endif
> +
> +ifeq ($(BR2_TARGET_MV_DDR_MARVELL),y)
> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
> +	MV_DDR_PATH=$(BUILD_DIR)/mv-ddr-marvell

I've changed that to:

	MV_DDR_PATH=$(MV_DDR_MARVELL_DIR)

which avoids the need for the symlink you were creating in
mv-ddr-marvell.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
