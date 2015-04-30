From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 30 Apr 2015 11:03:25 +0200
Subject: [Buildroot] [v6,15/15] qmx6_qt5_demo_defconfig: new defconfig
In-Reply-To: <1421451251-23366-16-git-send-email-jezz@sysmic.org>
References: <1421451251-23366-16-git-send-email-jezz@sysmic.org>
Message-ID: <20150430090325.GO24549@t450s.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Sat, Jan 17, 2015 at 12:34:11AM +0100, J?r?me Pouiller wrote:
> This new defconfig is based on qmx6_defconfig. In add:
> - it enable support for graphical drivers
> - it enable Qt5 (eglfs)
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  configs/qmx6_qt5_demo_defconfig | 57 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 configs/qmx6_qt5_demo_defconfig
> 
> diff --git a/configs/qmx6_qt5_demo_defconfig b/configs/qmx6_qt5_demo_defconfig
> new file mode 100644
> index 0000000..22c6e15
> --- /dev/null
> +++ b/configs/qmx6_qt5_demo_defconfig
> @@ -0,0 +1,57 @@
> +# architecture
> +BR2_arm=y
> +BR2_cortex_a9=y
> +BR2_KERNEL_HEADERS_VERSION=y
> +BR2_DEFAULT_KERNEL_VERSION="3.10.17"
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
> +BR2_TOOLCHAIN_BUILDROOT_EGLIBC=y
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y
> +
> +# system
> +BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
> +
> +# kernel
> +# Notice you need a recent version of u-boot (with DT support) to be able
> +# to boot this kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://git.congatec.com/arm/qmx6_kernel.git"
> +# Last version of branch cgt_imx_3.10.17_1.0.0
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="9bafbcba67f7bb2a48a5e05998cecb1165aa444f"
> +BR2_LINUX_KERNEL_DEFCONFIG="qmx6"
> +BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-qmx6"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +
> +# Graphics drivers
> +BR2_PACKAGE_FREESCALE_IMX=y
> +BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q=y
> +BR2_PACKAGE_GPU_VIV_BIN_MX6Q=y
> +BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_FB=y
> +
> +# Enable Qt5
> +BR2_PACKAGE_QT5=y
> +BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
> +BR2_PACKAGE_QT5BASE_GUI=y
> +BR2_PACKAGE_QT5BASE_EGLFS=y
> +BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
> +BR2_PACKAGE_QT5BASE_DEFAULT_QPA="eglfs"
> +BR2_PACKAGE_QT5BASE_PNG=y
> +
> +# u-boot
> +# Change boardname depending of your product number
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARDNAME="cgt_qmx6_pn016103"
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://git.congatec.com/arm/qmx6_uboot.git"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="6388c474189b42c07bb865dd604c74483da099f3"
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.pn016103.imx"
> +
> +# Images
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_3=y
> +
> +# Usefull host packages
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y

Although I couldn't try on a Congatec board, the patch looks good and
it builds fine.

Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>
[build test only]

Regards,
Gary
