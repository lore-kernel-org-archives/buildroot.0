From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 9 Oct 2017 23:25:23 +0300
Subject: [Buildroot] [PATCH v2] configs/imx6-sabresd: Add VPU decoding
 support
In-Reply-To: <1507579948-22128-1-git-send-email-festevam@gmail.com>
References: <1507579948-22128-1-git-send-email-festevam@gmail.com>
Message-ID: <20171009202523.ntymaz2dpdfy3atu@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio,

On Mon, Oct 09, 2017 at 05:12:28PM -0300, Fabio Estevam wrote: 
> diff --git a/configs/imx6-sabresd_qt5_defconfig b/configs/imx6-sabresd_qt5_defconfig
> index 832e326..a056b87 100644
> --- a/configs/imx6-sabresd_qt5_defconfig
> +++ b/configs/imx6-sabresd_qt5_defconfig
> @@ -75,3 +75,23 @@ BR2_PACKAGE_QT5BASE_GIF=y
>  BR2_PACKAGE_QT5BASE_JPEG=y
>  BR2_PACKAGE_QT5CINEX=y
>  BR2_PACKAGE_QT5CINEX_HD=y
> +
> +# NXP firmware package
> +BR2_PACKAGE_FREESCALE_IMX=y
> +BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q=y
> +BR2_PACKAGE_FIRMWARE_IMX=y
> +
> +# libdrm tests
> +BR2_PACKAGE_LIBDRM_INSTALL_TESTS=y
> +
> +# gstreamer-1.0
> +BR2_PACKAGE_GSTREAMER1=y
> +BR2_PACKAGE_GST1_PLUGINS_GOOD=y
> +BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2=y
> +BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2_PROBE=y
> +BR2_PACKAGE_GST1_PLUGINS_BAD=y
> +BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOPARSERS=y
> +BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_KMS=y
> +
> +# For automatic firmware loading
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y

Are you sure this is necessary for the kernel to load the firmware? As far as 
I know, recent kernels can load firmware files directly from the filesystem, 
with no need for a userspace helper.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
