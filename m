From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Oct 2020 10:51:07 +0100
Subject: [Buildroot] [PATCH 1/3] configs/qcom_db410c: Add support for
 Dragonboard410c SBC Adds basic support for the DB410c SBC. Builds the
 qualcomm kernel version 5.4 arm64. Adds the device's graphics firmware.
In-Reply-To: <20201027075056.10753-1-mikeframpo@gmail.com>
References: <20201027075056.10753-1-mikeframpo@gmail.com>
Message-ID: <20201027105107.2ea0e6c7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mike,

On Tue, 27 Oct 2020 20:50:54 +1300
Mike Frampton <mikeframpo@gmail.com> wrote:

> Signed-off-by: Mike Frampton <mikeframpo@gmail.com>
> ---
>  configs/qcom_db410c_defconfig | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 configs/qcom_db410c_defconfig

This looks good overall, but as explained in the review of the other
patches, this patch should come last in the series, once all the
preparation is done (adding a package for the firmware, host-abootimg
support). Also:

 - The commit title shoudld be just "configs/qcom_db410c: new defconfig"

 - An entry in the DEVELOPERS file should be added for the defconfig
   file and the board/qcom/db410c/ directory

 - A readme.txt should be added in board/qcom/db410c/readme.txt.

> diff --git a/configs/qcom_db410c_defconfig b/configs/qcom_db410c_defconfig
> new file mode 100644
> index 0000000000..835e34453d
> --- /dev/null
> +++ b/configs/qcom_db410c_defconfig
> @@ -0,0 +1,24 @@
> +# Architecture
> +BR2_aarch64=y

Perhaps set the specific sub-architecture being used ?

> +
> +# Toolchain options
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
> +
> +# Firmware
> +BR2_PACKAGE_LINUX_FIRMWARE=y
> +BR2_PACKAGE_LINUX_FIRMWARE_QCOM_VENUS=y
> +BR2_PACKAGE_LINUX_FIRMWARE_QCOM_ADRENO=y
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://git.linaro.org/landing-teams/working/qualcomm/kernel.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="release/qcomlt-5.4"
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="apq8016-sbc"
> +
> +# Filesystem
> +BR2_TARGET_ROOTFS_EXT2=y
> +

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
