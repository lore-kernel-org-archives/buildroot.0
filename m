From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 06 Feb 2013 21:33:00 +0100
Subject: [Buildroot] [PATCH] Add Gnublin board support
In-Reply-To: <1360174408-18232-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1360174408-18232-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <5112BDFC.5020002@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/02/13 19:13, Zoltan Gyarmati wrote:
> diff --git a/configs/gnublin_defconfig b/configs/gnublin_defconfig
> new file mode 100644
> index 0000000..3664b96
> --- /dev/null
> +++ b/configs/gnublin_defconfig
> @@ -0,0 +1,25 @@
> +BR2_arm=y
> +BR2_arm926t=y
> +BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
> +BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
> +BR2_TOOLCHAIN_BUILDROOT_WCHAR=y

  Why are these selected?

> +BR2_TARGET_GENERIC_ISSUE="Welcome to Gnublin"
> +BR2_TARGET_GENERIC_PASSWD_SHA256=y
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV=y

  Why is this one selected?

> +BR2_PACKAGE_LIBFFI=y
> +BR2_PACKAGE_NCURSES=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y

  Why do you need these packages?

> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_BLOCKS=512000

  You should mention in the README that the SD card size should be at 
least 514MB (strange number by the way - wouldn't it make more sense to 
set the size at 475000 so it may actually fit on a 500MB SD card?)


  Regards,
  Arnout

> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARDNAME="GNUBLIN"
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="git://gitorious.org/u-boot-gnublin-support/u-boot-gnublin-support.git"
> +BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="2009.11_gnublin_support_v2"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://gitorious.org/linux-3-7-gnublin/linux-3-7-gnublin.git"
> +BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="gnublin_support_v1"
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/gnublin/gnublin_kernel_config"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
