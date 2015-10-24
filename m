From: maitysanchayan at gmail.com <maitysanchayan@gmail.com>
Date: Sat, 24 Oct 2015 21:24:13 +0530
Subject: [Buildroot] [PATCH] configs: Add support for Toradex Colibri
	Vybrid modules
In-Reply-To: <f63a9e7f3d885880c6b55b89eec4aa739b497ea1.1445312793.git.maitysanchayan@gmail.com>
References: <f63a9e7f3d885880c6b55b89eec4aa739b497ea1.1445312793.git.maitysanchayan@gmail.com>
Message-ID: <20151024155413.GB13156@Sanchayan-Arch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Ping?

Is there something more I need to work on to get this in acceptable state?

- Sanchayan.

On 15-10-20 09:19:01, Sanchayan Maity wrote:
> This patch adds a minimal default configuration for Colibri Vybrid
> modules which has been tested on Colibri Vybrid VF50 and VF61.
> 
> Vybrid is well supported in mainline kernel by Toradex however we
> use the custom git branches maintained by Toradex. The configuration
> only builds a minimal root filesystem. Support for u-boot and flash
> scripts is not added.
> 
> Signed-off-by: Sanchayan Maity <maitysanchayan@gmail.com>
> ---
>  configs/colibri_vf_defconfig | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 configs/colibri_vf_defconfig
> 
> diff --git a/configs/colibri_vf_defconfig b/configs/colibri_vf_defconfig
> new file mode 100644
> index 0000000..d096754
> --- /dev/null
> +++ b/configs/colibri_vf_defconfig
> @@ -0,0 +1,34 @@
> +BR2_arm=y
> +BR2_cortex_a5=y
> +BR2_ARM_EABIHF=y
> +BR2_ARM_ENABLE_NEON=y
> +BR2_ARM_FPU_NEON_VFPV4=y
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_PACKAGE_HOST_GDB=y
> +BR2_PACKAGE_HOST_GDB_PYTHON=y
> +BR2_GDB_VERSION_7_8=y
> +BR2_TARGET_GENERIC_HOSTNAME="colibri-vf"
> +BR2_TARGET_GENERIC_ISSUE="Colibri VF 20151007"
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.toradex.com/linux-toradex.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="db509ca6ce2a4c04fe0d2a2e0611bb917ebe4aa8"
> +BR2_LINUX_KERNEL_DEFCONFIG="colibri_vf"
> +BR2_LINUX_KERNEL_ZIMAGE=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="vf610-colibri-eval-v3 vf500-colibri-eval-v3"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_PACKAGE_GDB=y
> +BR2_PACKAGE_IPROUTE2=y
> +BR2_TARGET_ROOTFS_UBIFS=y
> +BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
> +BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE=0x800
> +BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=8112
> +BR2_TARGET_ROOTFS_UBIFS_RT_LZO=y
> +BR2_TARGET_ROOTFS_UBIFS_NONE=y
> +BR2_TARGET_ROOTFS_UBIFS_OPTS="--space-fixup"
> +BR2_TARGET_ROOTFS_UBI=y
> +BR2_TARGET_ROOTFS_UBI_PEBSIZE=0x20000
> +BR2_TARGET_ROOTFS_UBI_SUBSIZE=2048
> +BR2_TARGET_ROOTFS_UBI_OPTS=""
> -- 
> 2.6.1
> 
