From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 14:10:12 +0200
Subject: [Buildroot] [PATCH 1/1] configs: add espressobin ultra dts and
 bump kernel to 5.11.21
In-Reply-To: <20210517090450.2269951-1-troglobit@gmail.com>
References: <20210517090450.2269951-1-troglobit@gmail.com>
Message-ID: <20210518121012.GE2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joachim, All,

On 2021-05-17 11:04 +0200, Joachim Wiberg spake thusly:
> This patch adds support for the Globalscale EspressoBin Ultra, which is
> an evolution of the EspressoBin family.  Same SoC and switchcore, more
> Ethernet ports, including one PoE PD port.
> 
> Tested-by: Atallah Amine <amine_atallah@outlook.com>
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  configs/globalscale_espressobin_defconfig | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/configs/globalscale_espressobin_defconfig b/configs/globalscale_espressobin_defconfig
> index 50cfc6b530..37d9c1859c 100644
> --- a/configs/globalscale_espressobin_defconfig
> +++ b/configs/globalscale_espressobin_defconfig
> @@ -2,17 +2,17 @@ BR2_aarch64=y
>  BR2_cortex_a53=y
>  BR2_ARM_FPU_VFPV4=y
>  
> -# Linux headers same as kernel, a 5.6 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y
> +# Linux headers same as kernel, a 5.11 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_11=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.6.11"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.11.21"
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/globalscale/espressobin/linux-extras.config"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME="marvell/armada-3720-espressobin marvell/armada-3720-espressobin-emmc marvell/armada-3720-espressobin-v7 marvell/armada-3720-espressobin-v7-emmc"
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="marvell/armada-3720-espressobin marvell/armada-3720-espressobin-emmc marvell/armada-3720-espressobin-v7 marvell/armada-3720-espressobin-v7-emmc marvell/armada-3720-espressobin-ultra"
>  BR2_LINUX_KERNEL_INSTALL_TARGET=y
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>  
> -- 
> 2.25.1
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
