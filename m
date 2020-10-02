From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Fri, 2 Oct 2020 21:26:18 +0200
Subject: [Buildroot] [PATCH v2 3/4] configs/stm32mp157*: bump kernel
 version
In-Reply-To: <20201002142426.1375026-3-shlomi.39sd@gmail.com>
References: <20200927061606.10239-1-shlomi.39sd@gmail.com>
 <20201002142426.1375026-1-shlomi.39sd@gmail.com>
 <20201002142426.1375026-3-shlomi.39sd@gmail.com>
Message-ID: <b458e2d5-5f1e-b9c2-1265-046971b6e0b4@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Shlomi,

On 02.10.2020 16:24, Shlomi Vaknin wrote:
> Since kernel 5.7 is EOL now, this upgrades it to the latest version
> which is the default by buildroot.
>
> Signed-off-by: Shlomi Vaknin<shlomi.39sd@gmail.com>
> ---
>   configs/stm32mp157a_dk1_defconfig | 3 ---
>   configs/stm32mp157c_dk2_defconfig | 3 ---
>   2 files changed, 6 deletions(-)
>
> diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
> index 8197fcc31b..f72bdb49ed 100644
> --- a/configs/stm32mp157a_dk1_defconfig
> +++ b/configs/stm32mp157a_dk1_defconfig
> @@ -1,12 +1,9 @@
>   BR2_arm=y
>   BR2_cortex_a7=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_7=y
>   BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157a-dk1/overlay/"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32mp157a-dk1/genimage.cfg"
>   BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.7.10"
That's not a correct way to do that. You always have to specify kernel 
headers and kernel version, the current latest version
is 5.8.13 so if you wanna use this one you should set:


BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.13"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157a-dk1/linux.config"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
> diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
> index 15e1e85f69..9c688c6688 100644
> --- a/configs/stm32mp157c_dk2_defconfig
> +++ b/configs/stm32mp157c_dk2_defconfig
> @@ -1,12 +1,9 @@
>   BR2_arm=y
>   BR2_cortex_a7=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_7=y
same here
>   BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157c-dk2/overlay/"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32mp157c-dk2/genimage.cfg"
>   BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.7.10"
and here
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157c-dk2/linux.config"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
Best
Bartek
