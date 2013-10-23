From: Naitik Amin <Naitik.Amin@ametek.com>
Date: Wed, 23 Oct 2013 08:56:27 -0400
Subject: [Buildroot] No proc mounted
In-Reply-To: <871u3datxn.fsf@dell.be.48ers.dk>
References: <OFE26C9A8F.E4D8CD49-ON85257C0C.006AEB60-85257C0C.006B3127@ametek.com>
 <871u3datxn.fsf@dell.be.48ers.dk>
Message-ID: <OF01AFC7C1.742725D7-ON85257C0D.004704DA-85257C0D.00471678@LocalDomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Here it is,

BR2_arm=y
BR2_cortex_a9=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED=y
BR2_TOOLCHAIN_EXTERNAL_PATH="/opt/gcc-linaro-arm-linux-gnueabihf-4.7-2012.11-20121123_linux"
BR2_TARGET_GENERIC_HOSTNAME="tr3000"
BR2_TARGET_GENERIC_ROOT_PASSWD="root"
BR2_TARGET_GENERIC_GETTY_BAUDRATE_57600=y
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_USERAPPS=y
BR2_TARGET_ROOTFS_CPIO=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_3=y
BR2_TARGET_ROOTFS_JFFS2=y
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BOARDNAME="socfpga_cyclone5"
BR2_TARGET_UBOOT_CUSTOM_GIT=y
BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="
http://git.rocketboards.org/u-boot-socfpga.git"
BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="rel_13.02_RC10"
BR2_TARGET_UBOOT_FORMAT_IMG=y
BR2_TARGET_UBOOT_SPL=y
BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.bin"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="
http://git.rocketboards.org/linux-socfpga.git"
BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="rel_13.07_RC0"
BR2_LINUX_KERNEL_DEFCONFIG="socfpga"
BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="socfpga_cyclone5"



From:   Peter Korsgaard <jacmet@uclibc.org>
To:     "Naitik Amin" <Naitik.Amin@ametek.com>, 
Cc:     buildroot at busybox.net, buildroot at uclibc.org
Date:   10/22/2013 05:15 PM
Subject:        Re: No proc mounted
Sent by:        Peter Korsgaard <jacmet@gmail.com>



>>>>> "Naitik" == Naitik Amin <Naitik.Amin@ametek.com> writes:

 > Hi there,
 > I have been generating the rootfs using buildroot. Then dd'ing the 
rootfs.ext3
 > to the rootfs partition on my sdcard. After inserting the sdcard into 
my
 > target, it comes up with no /proc, /sys etc...

 > In fstab, I do see the line which should mount /proc, but doesnt seem 
to
 > happen..

 > Any ideas..

 > $ cat /etc/fstab
 > # /etc/fstab: static file system information.
 > #
 > # <file system> <mount pt>     <type>   <options>         <dump> <pass>
 > /dev/root       /              ext2     rw,noauto         0      1
 > proc            /proc          proc     defaults          0      0
 > devpts          /dev/pts       devpts   defaults,gid=5,mode=620   0  0
 > tmpfs           /dev/shm       tmpfs    mode=0777         0      0
 > tmpfs           /tmp           tmpfs    defaults          0      0
 > sysfs           /sys           sysfs    defaults          0      0

Odd. Could you provide some more details, please? E.G. type 'make
savedefconfig' and paste the content of the 'defconfig' file here.

The default busybox init program runs mount -a, so all these should get
mounted. What happens if you manually run mount -a?

-- 
Bye, Peter Korsgaard



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131023/43b77a5c/attachment-0001.html>
