From: Sunil Kumar Mahesh <sunil@amarulasolutions.com>
Date: Wed, 18 Mar 2020 19:13:51 +0530
Subject: [Buildroot] [PATCH v3 3/5] boot/arm-trusted-firmware: add
 support for rockchip rk3399
In-Reply-To: <1584538257-11932-4-git-send-email-sunil@amarulasolutions.com>
References: <1584538257-11932-1-git-send-email-sunil@amarulasolutions.com>
 <1584538257-11932-4-git-send-email-sunil@amarulasolutions.com>
Message-ID: <CAM+7aWu5Lf_Y5QWyo=rU80Y-D6H93srXASJRF=yeegJPR73Hrw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 18, 2020 at 7:02 PM <sunil@amarulasolutions.com> wrote:

Ignore this patch. Sorry

Suniel
>
> From: Suniel Mahesh <sunil@amarulasolutions.com>
>
> Add support for TF-A image builds for Rockchip rk3399 chip.
>
> Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>
> ---
> Changes for v3:
> - no change
>
> Changes for v2:
> - no changes
>
>  boot/arm-trusted-firmware/arm-trusted-firmware.mk | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> index 7722954..3002f5f 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -90,6 +90,10 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += MV_DDR_PATH=$(MV_DDR_MARVELL_DIR)
>  ARM_TRUSTED_FIRMWARE_DEPENDENCIES += mv-ddr-marvell
>  endif
>
> +ifeq ($(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM)),rk3399)
> +ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-arm-gnu-a-toolchain
> +endif
> +
>  ARM_TRUSTED_FIRMWARE_MAKE_TARGETS = all
>
>  ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP),y)
> --
> 2.7.4
>
