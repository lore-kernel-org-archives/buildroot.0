From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Nov 2020 14:27:12 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/qcom-db410c-firmware: new
 package
In-Reply-To: <20201119090854.48955-2-mikeframpo@gmail.com>
References: <20201119090854.48955-1-mikeframpo@gmail.com>
 <20201119090854.48955-2-mikeframpo@gmail.com>
Message-ID: <20201119142712.5bb25684@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mike,

Thanks for this new iteration!

On Thu, 19 Nov 2020 22:08:52 +1300
Mike Frampton <mikeframpo@gmail.com> wrote:

> diff --git a/package/qcom-db410c-firmware/qcom-db410c-firmware.hash b/package/qcom-db410c-firmware/qcom-db410c-firmware.hash
> new file mode 100644
> index 0000000000..e8ac31eb39
> --- /dev/null
> +++ b/package/qcom-db410c-firmware/qcom-db410c-firmware.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  46953b974c5c58c7ca66db414437c0268b033ac9d28127e98d9c4e1a49359da5  linux-board-support-package-r1034.2.1.zip
> +sha256  11e60ad6f83c2a86e40dca374c24230b53650dd3e0adf2e72c15f8cafedc2e5a  LICENSE
> diff --git a/package/qcom-db410c-firmware/qcom-db410c-firmware.mk b/package/qcom-db410c-firmware/qcom-db410c-firmware.mk
> new file mode 100644
> index 0000000000..15c97e9dc2
> --- /dev/null
> +++ b/package/qcom-db410c-firmware/qcom-db410c-firmware.mk
> @@ -0,0 +1,41 @@
> +################################################################################
> +#
> +# qcom-db410c-firmware
> +#
> +################################################################################
> +
> +QCOM_DB410C_FIRMWARE_VERSION = 1034.2.1
> +QCOM_DB410C_FIRMWARE_BASE = linux-board-support-package-r$(QCOM_DB410C_FIRMWARE_VERSION)
> +QCOM_DB410C_FIRMWARE_SOURCE = $(QCOM_DB410C_FIRMWARE_BASE).zip
> +QCOM_DB410C_FIRMWARE_SITE = https://releases.linaro.org/96boards/dragonboard410c/qualcomm/firmware

I think you're missing

QCOM_DB410C_FIRMWARE_DEPENDENCIES = host-mtools

here, as your INSTALL_TARGET_CMDS is using $(HOST_DIR)/bin/mcopy.

Otherwise, it looks good to me!

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
