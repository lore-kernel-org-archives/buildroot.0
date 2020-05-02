From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 May 2020 21:54:16 +0200
Subject: [Buildroot] [PATCH] configs/qemu_riscv64_virt: update
 defconfigs to Linux 5.4.35
In-Reply-To: <20200426100448.655706-1-romain.naour@gmail.com>
References: <20200426100448.655706-1-romain.naour@gmail.com>
Message-ID: <20200502195416.GT15673@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2020-04-26 12:04 +0200, Romain Naour spake thusly:
> Contrary to riscv32, the qemu_riscv64_virt defconfig doesn't needs
> any specific change. It could have been updated to Linux 5.4.35 in
> the commit 80a044703a40bd7418a2b906ff08362ef5460b87.
> 
> So, update the kernel version to 5.4.35.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Tested locally.
> ---
>  configs/qemu_riscv64_virt_defconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
> index a376b7dec2..dbe6107b62 100644
> --- a/configs/qemu_riscv64_virt_defconfig
> +++ b/configs/qemu_riscv64_virt_defconfig
> @@ -13,13 +13,13 @@ BR2_TARGET_ROOTFS_EXT2=y
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
> -# Linux headers same as kernel, a 5.1 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_1=y
> +# Linux headers same as kernel, a 5.4 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.1.12"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.35"
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_LINUX_KERNEL_IMAGE=y
>  
> -- 
> 2.25.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
