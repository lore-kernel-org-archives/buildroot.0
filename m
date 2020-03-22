From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 22 Mar 2020 16:52:14 +0100
Subject: [Buildroot] [PATCH] configs/qemu_riscv{32,
 64}_virt_defconfig: Remove BR2_TARGET_GENERIC_GETTY_PORT
In-Reply-To: <1583583630-25647-1-git-send-email-bmeng.cn@gmail.com>
References: <1583583630-25647-1-git-send-email-bmeng.cn@gmail.com>
Message-ID: <8db0057c-b6a4-97ad-9446-c6a6aed558f3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 07/03/2020 ? 13:20, Bin Meng a ?crit?:
> Currently BR2_TARGET_GENERIC_GETTY_PORT is set to ttyS0 in both
> qemu_riscv32_virt and qemu_riscv64_virt defconfig files. This
> limits usecases when the same one rootfs could be used on QEMU
> 'sifive_u' machine and SiFive HiFive Unleashed board.
> 
> Remove it so that the default boot console can be used.

By doing this change, we need to check if -nographic is used to start qemu (so
the serial port is the default console) or if console=ttyS0 is used in the
kernel command line.

riscv32 and risc64 are both using -nographic to start Qemu.

Your use case is similar to the one from [1]

[1]
https://git.buildroot.net/buildroot/commit/?id=131300e6f1d0745a1455d246684550e6ecb68549

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain


> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
> 
>  configs/qemu_riscv32_virt_defconfig | 1 -
>  configs/qemu_riscv64_virt_defconfig | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
> index 914eada..093d888 100644
> --- a/configs/qemu_riscv32_virt_defconfig
> +++ b/configs/qemu_riscv32_virt_defconfig
> @@ -5,7 +5,6 @@ BR2_RISCV_32=y
>  # System
>  BR2_SYSTEM_DHCP="eth0"
>  BR2_TARGET_GENERIC_GETTY=y
> -BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
>  BR2_GLOBAL_PATCH_DIR="board/qemu/riscv32-virt/patches/"
>  
>  # Filesystem
> diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
> index 5c52f7a..54390fc 100644
> --- a/configs/qemu_riscv64_virt_defconfig
> +++ b/configs/qemu_riscv64_virt_defconfig
> @@ -5,7 +5,6 @@ BR2_RISCV_64=y
>  # System
>  BR2_SYSTEM_DHCP="eth0"
>  BR2_TARGET_GENERIC_GETTY=y
> -BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
>  
>  # Filesystem
>  BR2_TARGET_ROOTFS_EXT2=y
> 
