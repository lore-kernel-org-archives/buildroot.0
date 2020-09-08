From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Sep 2020 23:14:10 +0200
Subject: [Buildroot] [PATCH v2] configs/stm32mp157: remove extra
 metadata_csum mkfs option
In-Reply-To: <20200908183054.413318-1-b.bilas@grinn-global.com>
References: <20200908183054.413318-1-b.bilas@grinn-global.com>
Message-ID: <20200908211410.GA14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bartosz, All,

On 2020-09-08 20:30 +0200, Bartosz Bilas spake thusly:
> Since commit [1] there is no necessity to pass extra
> metadata_csum option due to changed env location
> in U-Boot so we can drop it completely.
> 
> [1] 76db1681da52342ca9f4fb7e6787bd83cc82f429:

I got confused, as there is not such commit in Buildroot. In fact, you
are referencing a U-Boot commit. I've made that clear int he commit log,
and applied to master, thanks.

Regards,
Yann E. MORIN.

> stm32mp1: use a specific SD/eMMC partition for U-Boot enviromnent
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---
>  v1 -> v2:
>   - missing SoB
> 
>  configs/stm32mp157a_dk1_defconfig | 1 -
>  configs/stm32mp157c_dk2_defconfig | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
> index be5ea7581f..f172539c02 100644
> --- a/configs/stm32mp157a_dk1_defconfig
> +++ b/configs/stm32mp157a_dk1_defconfig
> @@ -15,7 +15,6 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
>  BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
> -BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS="-O ^metadata_csum"
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
> index 86e1551a30..49cfb0733c 100644
> --- a/configs/stm32mp157c_dk2_defconfig
> +++ b/configs/stm32mp157c_dk2_defconfig
> @@ -15,7 +15,6 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
>  BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
> -BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS="-O ^metadata_csum"
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> -- 
> 2.28.0
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
