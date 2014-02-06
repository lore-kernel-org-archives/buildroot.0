From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Thu, 6 Feb 2014 23:05:39 +0100
Subject: [Buildroot] [PATCH v3 4/4] beaglebone: change to zImage
In-Reply-To: <1391717684-4244-5-git-send-email-anders@chargestorm.se>
References: <1391717684-4244-1-git-send-email-anders@chargestorm.se>
 <1391717684-4244-5-git-send-email-anders@chargestorm.se>
Message-ID: <CALq67GBCrOGh_yxzjqcVXtUzoox=AEJaYJL27_UObB8qVMNyow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Anders, All,

On Thu, Feb 6, 2014 at 9:14 PM, Anders Darander <anders@chargestorm.se> wrote:
> The default U-Boot configuration is now to use a zImage instead of uImage.
>
> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
>  configs/beaglebone_defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
> index 6fa8226..062d711 100644
> --- a/configs/beaglebone_defconfig
> +++ b/configs/beaglebone_defconfig
> @@ -32,5 +32,6 @@ BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.ti.com/ti-linux-kernel/ti-linux-kern
>  BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="a4daf45088f752ed6b33239026518fc3d1bce2bc"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/beaglebone/linux-3.12.config"
> +BR2_LINUX_KERNEL_ZIMAGE=y

I would suggest merging this change with your previous patch -
"beaglebone: update to latest U-Boot" - because the upgrading of
u-boot is what is causing the change to zImage.

Thanks,
-Ryan
