From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 23 Oct 2013 19:17:20 +0200
Subject: [Buildroot] No proc mounted
In-Reply-To: <OF01AFC7C1.742725D7-ON85257C0D.004704DA-85257C0D.00471678@LocalDomain>
References: <OFE26C9A8F.E4D8CD49-ON85257C0C.006AEB60-85257C0C.006B3127@ametek.com>
 <871u3datxn.fsf@dell.be.48ers.dk>
 <OF01AFC7C1.742725D7-ON85257C0D.004704DA-85257C0D.00471678@LocalDomain>
Message-ID: <526804A0.3030101@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/10/13 14:56, Naitik Amin wrote:
> Hi Peter,
>
> Here it is,
>
> BR2_arm=y
> BR2_cortex_a9=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED=y
> BR2_TOOLCHAIN_EXTERNAL_PATH="/opt/gcc-linaro-arm-linux-gnueabihf-4.7-2012.11-20121123_linux"
> BR2_TARGET_GENERIC_HOSTNAME="tr3000"
> BR2_TARGET_GENERIC_ROOT_PASSWD="root"
> BR2_TARGET_GENERIC_GETTY_BAUDRATE_57600=y
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> BR2_PACKAGE_USERAPPS=y
> BR2_TARGET_ROOTFS_CPIO=y
> BR2_TARGET_ROOTFS_EXT2=y
> BR2_TARGET_ROOTFS_EXT2_3=y
> BR2_TARGET_ROOTFS_JFFS2=y
> BR2_TARGET_UBOOT=y
> BR2_TARGET_UBOOT_BOARDNAME="socfpga_cyclone5"
> BR2_TARGET_UBOOT_CUSTOM_GIT=y
> BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="http://git.rocketboards.org/u-boot-socfpga.git"
> BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="rel_13.02 _RC10"
> BR2_TARGET_UBOOT_FORMAT_IMG=y
> BR2_TARGET_UBOOT_SPL=y
> BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.bin"
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_CUSTOM_GIT=y
> BR2_LINUX_KERNEL_CUSTOM_GIT
> _REPO_URL="http://git.rocketboards.org/linux-socfpga.git"
> BR2_LINUX_KERNEL_CUSTOM_GIT _VERSION="rel_13.07_RC0"
> BR2_LINUX_KERNEL_DEFCONFIG="socfpga"
> BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
> BR2_LINUX_KERNEL_DTS_SUPPORT=y
> BR2_LINUX_KERNEL_INTREE_DTS_NAME="socfpga_cyclone5"

  Nothing suspicious here... Is there any mount error reported on the 
console? Can you log in to the system? If so, can you try to mount /proc 
manually?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
