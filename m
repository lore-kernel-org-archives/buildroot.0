From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 20 Feb 2017 13:50:30 +0200
Subject: [Buildroot] [PATCH 4/4] configs/mx6sx_udoo_neo: Bump to kernel
 4.10
In-Reply-To: <1487591019-22587-4-git-send-email-festevam@gmail.com>
References: <1487591019-22587-1-git-send-email-festevam@gmail.com>
 <1487591019-22587-4-git-send-email-festevam@gmail.com>
Message-ID: <20170220115030.elwab4i7ddxl5klp@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio,

On Mon, Feb 20, 2017 at 08:43:39AM -0300, Fabio Estevam wrote:
> The imx6sx-udoo-neo dts patches have been upstreamed in kernel 4.10,
> so bump to this version and remove the local patches.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

[snip]

> diff --git a/configs/mx6sx_udoo_neo_defconfig b/configs/mx6sx_udoo_neo_defconfig
> index a465eb9..53f0ee8 100644
> --- a/configs/mx6sx_udoo_neo_defconfig
> +++ b/configs/mx6sx_udoo_neo_defconfig
> @@ -3,11 +3,10 @@ BR2_cortex_a9=y
>  BR2_ARM_ENABLE_NEON=y
>  BR2_ARM_ENABLE_VFP=y
>  BR2_ARM_FPU_VFPV3=y
> -# Linux headers same as kernel, a 4.9 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
> +# Linux headers same as kernel, a 4.10 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y

Well, this is definitely future thinking.

>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/udoo/neo/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/udoo/neo/post-image.sh"
> -BR2_GLOBAL_PATCH_DIR="board/udoo/neo/patches"
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
>  BR2_TARGET_UBOOT=y
> @@ -19,7 +18,7 @@ BR2_TARGET_UBOOT_SPL=y
>  BR2_TARGET_UBOOT_SPL_NAME="SPL"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.10"
>  BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sx-udoo-neo-basic imx6sx-udoo-neo-full imx6sx-udoo-neo-extended"

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
