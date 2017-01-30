From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Jan 2017 21:24:20 +0100
Subject: [Buildroot] [PATCH v2 1/2] board: add support for chiliBoard
In-Reply-To: <20170130183617.9388-1-m.niestroj@grinn-global.com> (Marcin
 Niestroj's message of "Mon, 30 Jan 2017 19:36:16 +0100")
References: <20170130183617.9388-1-m.niestroj@grinn-global.com>
Message-ID: <874m0g70uj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marcin" == Marcin Niestroj <m.niestroj@grinn-global.com> writes:

 > Board support package includes:
 >  * Buildroot defconfig
 >  * Mainline Linux kernel v4.9.5

You're actually using 4.9.6.

>  * Mainline U-Boot (current HEAD revision is used, as board support
 >    patches are not in stable release yet)
 >  * genimage config to create sdcard image
 >  * Board readme.txt

 > Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
 > ---
 > Changes v1 -> v2:
 >  * U-Boot is fetched from mainline with specific git revision, as
 >    board support patches were just applied. This means that all U-Boot
 >    patches in Buildroot were dropped.

Wee!

> +++ b/configs/grinn_chiliboard_defconfig
 > @@ -0,0 +1,28 @@
 > +BR2_arm=y
 > +BR2_cortex_a8=y
 > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 > +BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"

This is not strictly needed as you boot with console=ttyO0, and default
is "console", but ok.

> +BR2_SYSTEM_DHCP="eth0"
 > +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/grinn/chiliboard/post-image.sh"
 > +BR2_LINUX_KERNEL=y
 > +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
 > +BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 > +BR2_LINUX_KERNEL_DTS_SUPPORT=y
 > +BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-chiliboard"
 > +BR2_TARGET_ROOTFS_EXT2=y
 > +BR2_TARGET_ROOTFS_EXT2_4=y
 > +BR2_TARGET_UBOOT=y
 > +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 > +BR2_TARGET_UBOOT_CUSTOM_GIT=y
 > +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.denx.de/u-boot.git"

I've changed this to use http://git.denx.de/u-boot.git as some users are
behind firewalls not allowing git://.

Committed with that changed, thanks.

-- 
Bye, Peter Korsgaard
