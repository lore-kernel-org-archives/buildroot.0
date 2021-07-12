From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 13 Jul 2021 08:16:10 +1000
Subject: [Buildroot] [PATCH 5/9] board: Add Sipeed MAIX-Go support
In-Reply-To: <20210709063641.277005-6-damien.lemoal@wdc.com>
References: <20210709063641.277005-1-damien.lemoal@wdc.com>
 <20210709063641.277005-6-damien.lemoal@wdc.com>
Message-ID: <CAKmqyKOA-AkMGD-yJJ=hmL0WzZsGmCeEJp9juBCaEbTkuHmtEg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 9, 2021 at 4:37 PM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>
> Add two configuration files to support the RISC-V Canaan K210 SoC based
> Sipeed MAIX-Go board. These configurations are similar to the Sipeed
> MAIX-bit board configurations, differing only by the built-in device
> tree used.
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  board/sipeed/maix-go/linux-dtb.config   |  2 ++
>  configs/sipeed_maix_go_defconfig        | 23 +++++++++++++++++++++++
>  configs/sipeed_maix_go_sdcard_defconfig | 23 +++++++++++++++++++++++
>  3 files changed, 48 insertions(+)
>  create mode 100644 board/sipeed/maix-go/linux-dtb.config
>  create mode 100644 configs/sipeed_maix_go_defconfig
>  create mode 100644 configs/sipeed_maix_go_sdcard_defconfig
>
> diff --git a/board/sipeed/maix-go/linux-dtb.config b/board/sipeed/maix-go/linux-dtb.config
> new file mode 100644
> index 0000000000..ea8c30e266
> --- /dev/null
> +++ b/board/sipeed/maix-go/linux-dtb.config
> @@ -0,0 +1,2 @@
> +CONFIG_SOC_CANAAN_K210_DTB_BUILTIN=y
> +CONFIG_SOC_CANAAN_K210_DTB_SOURCE="sipeed_maix_go"
> diff --git a/configs/sipeed_maix_go_defconfig b/configs/sipeed_maix_go_defconfig
> new file mode 100644
> index 0000000000..c5df26340f
> --- /dev/null
> +++ b/configs/sipeed_maix_go_defconfig
> @@ -0,0 +1,23 @@
> +BR2_riscv=y
> +# BR2_COMPILER_PARANOID_UNSAFE_PATH is not set
> +BR2_KERNEL_HEADERS_5_13=y
> +# BR2_UCLIBC_INSTALL_UTILS is not set
> +BR2_GCC_VERSION_11_X=y
> +BR2_GCC_ENABLE_LTO=y
> +BR2_PACKAGE_HOST_ELF2FLT=y
> +# BR2_USE_MMU is not set
> +BR2_TARGET_GENERIC_HOSTNAME=""
> +BR2_INIT_NONE=y
> +BR2_ROOTFS_MERGED_USR=y
> +BR2_SYSTEM_DEFAULT_PATH="/bin:/sbin:/usr/bin:/usr/sbin"
> +BR2_ROOTFS_OVERLAY="board/canaan/k210-common/rootfs_overlay"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210"
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maix-go/linux-dtb.config"
> +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> +BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
> +BR2_PACKAGE_BUSYBOX_CONFIG="board/canaan/k210-common/busybox-tiny-initramfs.config"
> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
> +BR2_TARGET_ROOTFS_INITRAMFS=y
> +# BR2_TARGET_ROOTFS_TAR is not set
> diff --git a/configs/sipeed_maix_go_sdcard_defconfig b/configs/sipeed_maix_go_sdcard_defconfig
> new file mode 100644
> index 0000000000..dcea0a6044
> --- /dev/null
> +++ b/configs/sipeed_maix_go_sdcard_defconfig
> @@ -0,0 +1,23 @@
> +BR2_riscv=y
> +# BR2_COMPILER_PARANOID_UNSAFE_PATH is not set
> +BR2_KERNEL_HEADERS_5_13=y
> +# BR2_UCLIBC_INSTALL_UTILS is not set
> +BR2_GCC_VERSION_11_X=y
> +BR2_GCC_ENABLE_LTO=y
> +BR2_PACKAGE_HOST_ELF2FLT=y
> +# BR2_USE_MMU is not set
> +BR2_TARGET_GENERIC_HOSTNAME=""
> +BR2_INIT_NONE=y
> +BR2_ROOTFS_MERGED_USR=y
> +BR2_SYSTEM_DEFAULT_PATH="/bin:/sbin:/usr/bin:/usr/sbin"
> +BR2_ROOTFS_OVERLAY="board/canaan/k210-common/rootfs_overlay"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210_sdcard"
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maix-go/linux-dtb.config"
> +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> +BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
> +BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
> +BR2_TARGET_ROOTFS_EXT2=y
> +# BR2_TARGET_ROOTFS_TAR is not set
> --
> 2.31.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
