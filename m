From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 13 Nov 2017 16:52:15 +0200
Subject: [Buildroot] [PATCH/next 4/5] solidrun/macchiatobin: add new
 board
In-Reply-To: <20171112201646.15558-5-geomatsi@gmail.com>
References: <20171112201646.15558-1-geomatsi@gmail.com>
 <20171112201646.15558-5-geomatsi@gmail.com>
Message-ID: <20171113145215.vc3ip3kxuawcpogx@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sergey,

On Sun, Nov 12, 2017 at 11:16:45PM +0300, Sergey Matyukevich wrote: 
> diff --git a/configs/solidrun_macchiatobin_mainline_defconfig b/configs/solidrun_macchiatobin_mainline_defconfig
> new file mode 100644
> index 0000000000..ab82865a0d
> --- /dev/null
> +++ b/configs/solidrun_macchiatobin_mainline_defconfig
> @@ -0,0 +1,46 @@
> +BR2_aarch64=y
> +
> +#
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
> +BR2_TARGET_GENERIC_HOSTNAME="mcbin"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for Marvell MacchiatoBin"
> +
> +# Firmware
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/MarvellEmbeddedProcessors/atf-marvell.git"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="atf-v1.3-armada-17.10"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="a80x0_mcbin"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="USE_COHERENT_MEM=0"
> +
> +BR2_TARGET_ARMADA_FIRMWARE=y
> +BR2_TARGET_ARMADA_FIRMWARE_IMAGE="mrvl_scp_bl2_8040.img"
> +BR2_TARGET_ARMADA_FIRMWARE_VERSION="binaries-marvell-armada-17.10"

It turns out that this firmware is not required, at least for the mainline 
kernel. The system boots just fine without it. It might be needed for the 
Marvell provided kernel. I didn't check that.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
