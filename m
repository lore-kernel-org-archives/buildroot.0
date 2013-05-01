From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 May 2013 23:13:16 +0200
Subject: [Buildroot] [PATCH v2 2/3] configs: add defconfig for Telit
 EVK-PRO3
In-Reply-To: <1366184503-16875-3-git-send-email-fabio.porcedda@gmail.com>
References: <1366184503-16875-1-git-send-email-fabio.porcedda@gmail.com>
 <1366184503-16875-3-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20130501231316.35d6652f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Wed, 17 Apr 2013 09:41:42 +0200, Fabio Porcedda wrote:
> For more info, please find board/telit/evk-pro3/readme.txt
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> ---
>  ...04.0-0001-watchdog-add-keep-alive-support.patch |  88 ++++++++
>  ...02-watchdog-add-at91sam9-watchdog-support.patch | 228 +++++++++++++++++++++
>  ...0003-at91sam9260-9g20-add-wathdog-support.patch |  40 ++++
>  ...0004-at91sam9260-9g20-fix-wathdog-support.patch |  26 +++
>  ...13.04.0-0005-watchdog-enable-for-evk-pro3.patch |  26 +++
>  ...t91-at91_dt_defconfig-update-for-evk-pro3.patch |  44 ++++

That's quite a number of patches. I suppose they are all already
upstream, correct? If so, then maybe using a Git version would allow to
get rid of those patches in Buildroot, and then you could later on
submit a patch to update Barebox to the next stable version that
contains those patches? Maybe even Barebox 2013.05 will be released
soon with those patches?

> diff --git a/configs/telit_evk_pro3_defconfig b/configs/telit_evk_pro3_defconfig
> new file mode 100644
> index 0000000..f7df1e4
> --- /dev/null
> +++ b/configs/telit_evk_pro3_defconfig
> @@ -0,0 +1,16 @@
> +BR2_arm=y
> +BR2_PREFER_STATIC_LIB=y

This choice shouldn't be part of the defconfig.

> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y

This one generally isn't either, but I think we can be flexible on this
one.

> +BR2_PACKAGE_BUSYBOX_WATCHDOG=y
> +BR2_TARGET_ROOTFS_UBIFS=y
> +BR2_TARGET_ROOTFS_UBI=y
> +BR2_TARGET_BAREBOX=y
> +BR2_TARGET_BAREBOX_CUSTOM_VERSION=y
> +BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE="2013.04.0"
> +BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR="board/telit/evk-pro3"
> +BR2_TARGET_BAREBOX_BOARD_DEFCONFIG="telit_evk_pro3"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_PATCH="board/telit/evk-pro3"
> +BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
> +BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="evk-pro3"

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
