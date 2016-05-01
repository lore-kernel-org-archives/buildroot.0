From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 May 2016 14:34:40 +0200
Subject: [Buildroot] [PATCH v6 2/3] barebox: support auxiliary config
 build
In-Reply-To: <f070ae02cf8e605859c8e3e64b6f5f4e864b951c.1461531859.git.pieter@boesman.nl>
References: <cover.1461531859.git.pieter@boesman.nl>
 <f070ae02cf8e605859c8e3e64b6f5f4e864b951c.1461531859.git.pieter@boesman.nl>
Message-ID: <20160501143440.68983c1e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Apr 2016 23:15:24 +0200, Pieter Smith wrote:
> Adds support to build barebox with an auxiliary config.
> 
> This is useful for building an SPL (Secondary Program Loader) in addition to
> the traditional TPL (Tertiary Program Loader). The Beaglebone Black for example
> has two barebox configurations:
> - am335x_defconfig builds the full barebox bootloader with device tree, and
> - am335x_mlo_defconfig builds the smaller MLO bootloader that loads the full
>   barebox bootloader from the eMMC or SD card.
> 
> Tested with the following defconfig:
> 
>   # architecture
>   BR2_arm=y
>   BR2_cortex_a8=y
>   BR2_ARM_EABIHF=y
> 
>   # system
>   BR2_TARGET_GENERIC_HOSTNAME="beaglebone"
>   BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
>   BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW=y
> 
>   # filesystem
>   BR2_PACKAGE_AM33X_CM3=y
>   BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_4=y
> 
>   # bootloader
>   BR2_TARGET_BAREBOX=y
>   BR2_TARGET_BAREBOX_BOARD_DEFCONFIG="am335x"
>   BR2_TARGET_BAREBOX_IMAGE_FILE="images/barebox-am33xx-beaglebone.img"
>   BR2_TARGET_BAREBOX_CUSTOM_ENV=y
>   BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH="board/beaglebone/barebox/barebox.env"
>   BR2_TARGET_BAREBOX_AUX=y
>   BR2_TARGET_BAREBOX_AUX_BOARD_DEFCONFIG="am335x_mlo"
>   BR2_TARGET_BAREBOX_AUX_IMAGE_FILE="images/barebox-am33xx-beaglebone-mlo.img"
> 
>   # kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_USE_DEFCONFIG=y
>   BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
>   BR2_LINUX_KERNEL_ZIMAGE=y
> 
>   # use the barebox built-in dtb
>   # BR2_LINUX_KERNEL_DTS_SUPPORT is not set
> 
> Signed-off-by: Pieter Smith <pieter@boesman.nl>
> ---
>  boot/barebox/Config.in                    | 15 ++++++++
>  boot/barebox/barebox-aux/Config.in        | 60 +++++++++++++++++++++++++++++++
>  boot/barebox/barebox-aux/barebox-aux.hash |  1 +
>  boot/barebox/barebox-aux/barebox-aux.mk   |  8 +++++
>  boot/barebox/barebox.mk                   |  1 +
>  5 files changed, 85 insertions(+)
>  create mode 100644 boot/barebox/barebox-aux/Config.in
>  create mode 120000 boot/barebox/barebox-aux/barebox-aux.hash
>  create mode 100644 boot/barebox/barebox-aux/barebox-aux.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
