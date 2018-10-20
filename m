From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Oct 2018 00:24:10 +0200
Subject: [Buildroot] [PATCH 1/1] New board: FriendlyARM NanoPi Duo
In-Reply-To: <20180419093722.10667-1-sven.haardiek@iotec-gmbh.de>
References: <20180419093722.10667-1-sven.haardiek@iotec-gmbh.de>
Message-ID: <20181021002410.47982274@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sven,

On Thu, 19 Apr 2018 11:37:22 +0200, Sven Haardiek wrote:
> Introduce a new board the FriendlyARM NanoPi Duo.
> 
> - Due to the missing defconfigs and DTS in the mainline kernel and uboot, I
>   used the ones from the FriendlyARM github page.
> 
> - Most of the configuration was copied from the other friendlyarm boards.
> 
> Signed-off-by: Sven Haardiek <sven.haardiek@iotec-gmbh.de>

Thanks a lot for your contribution, and sorry for the very, very slow
response time. I'll add below a few comments, generally fairly minor.
If you could fix them, and submit an updated version of your patch, it
would be very nice.

First, the commit title should be something like this:

	configs/friendlyarm_nanopi_duo: new defconfig

Also, the DEVELOPERS file should be updated to add an entry that
associates your name/email with the defconfig and board directory.

> diff --git a/board/friendlyarm/nanopi-duo/genimage.cfg b/board/friendlyarm/nanopi-duo/genimage.cfg
> new file mode 100644
> index 0000000000..8b3cc1fe75
> --- /dev/null
> +++ b/board/friendlyarm/nanopi-duo/genimage.cfg
> @@ -0,0 +1,33 @@
> +image boot.vfat {
> +	vfat {
> +		files = {
> +			"zImage",
> +            "sun8i-h2-plus-nanopi-duo.dtb",
> +            "boot.scr"

The indentation looks odd here.


> diff --git a/configs/friendlyarm_nanopi_duo_defconfig b/configs/friendlyarm_nanopi_duo_defconfig
> new file mode 100644
> index 0000000000..8539deaccf
> --- /dev/null
> +++ b/configs/friendlyarm_nanopi_duo_defconfig
> @@ -0,0 +1,31 @@
> +BR2_arm=y
> +BR2_cortex_a7=y
> +BR2_ARM_FPU_VFPV4=y
> +BR2_TARGET_GENERIC_HOSTNAME="nanopi-duo"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the NanoPi DUO"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-duo/genimage.cfg"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/friendlyarm/linux.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="sunxi-4.16.y"

Please use a tag or exact SHA1 so that the build is reproducible.

> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/friendlyarm/u-boot.git"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="sunxi-v2017.x"

Here as well.

Other than that, looks good to me! Could you send an updated version?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
