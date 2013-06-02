From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 02 Jun 2013 22:21:49 +0200
Subject: [Buildroot] [PATCH] Add support for the Calao-systems
	TNY-A9G20-LPW
In-Reply-To: <1370017868-30944-1-git-send-email-gregory.hermant@calao-systems.com>
 (Gregory Hermant's message of "Fri, 31 May 2013 18:31:08 +0200")
References: <1370017868-30944-1-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <87d2s4w9eq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gregory" == Gregory Hermant <gregory.hermant@calao-systems.com> writes:

 Gregory> Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
 Gregory> +++ b/configs/calao_tny_a9g20_lpw_defconfig
 Gregory> @@ -0,0 +1,15 @@
 Gregory> +BR2_arm=y
 Gregory> +BR2_PACKAGE_HOST_SAM_BA=y

I noticed that you've enabled devtmpfs in the kernel config, so I added
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y

 Gregory> +BR2_TARGET_ROOTFS_UBIFS=y
 Gregory> +BR2_TARGET_AT91BOOTSTRAP=y
 Gregory> +BR2_TARGET_AT91BOOTSTRAP_CUSTOM_PATCH_DIR="board/calao/tny-a9g20-lpw/"
 Gregory> +BR2_TARGET_AT91BOOTSTRAP_BOARD="tny_a9g20_lpw"
 Gregory> +BR2_TARGET_AT91BOOTSTRAP_NANDFLASH=y
 Gregory> +BR2_TARGET_BAREBOX=y
 Gregory> +BR2_TARGET_BAREBOX_BOARD_DEFCONFIG="tny_a9g20"


 Gregory> +BR2_LINUX_KERNEL=y
 Gregory> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 Gregory> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/calao/tny-a9g20-lpw/linux-3.9.config"

You should lock the kernel to 3.9 with something like:

BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.4"

And also select the same kernel headers version.

I've fixed that and added a few comments to defconfig and committed,
thanks.

-- 
Bye, Peter Korsgaard
