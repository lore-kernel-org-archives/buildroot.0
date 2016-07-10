From: Foxtrot Mike <fulcrummike@hotmail.com>
Date: Sun, 10 Jul 2016 18:04:07 +0000
Subject: [Buildroot] raspberry3_defconfig error
Message-ID: <HK2PR0401MB1329D3F86C57BD1E93FC6137B33E0@HK2PR0401MB1329.apcprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I am trying to create a customized linux for raspberry pi 3. I have 
installed buildroot2016.5 with all the dependencies. I am trying to 
compile everything with the default configuration file by executing:

$ make raspberrypi3_defconfig
$ make

It fails with the following errors:

========================================================================

 >>> linux-headers 26f3b72a9c049be10e6af196252283e1f6ab9d1f Downloading
Doing full clone
Cloning into bare repository 
'linux-headers-26f3b72a9c049be10e6af196252283e1f6ab9d1f'...
remote: Counting objects: 5034470, done.
remote: Compressing objects: 100% (2553/2553), done.
  error: RPC failed; curl 56 SSL read: 
error:00000000:lib(0):func(0):reason(0), errno 104
fatal: The remote end hung up unexpectedly
fatal: early EOF
fatal: index-pack failed
--2016-07-11 01:48:20-- 
http://sources.buildroot.net/linux-26f3b72a9c049be10e6af196252283e1f6ab9d1f.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)... 176.9.16.109
Connecting to sources.buildroot.net 
(sources.buildroot.net)|176.9.16.109|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2016-07-11 01:48:22 ERROR 404: Not Found.

package/pkg-generic.mk:113: recipe for target 
'/home/foxtrot/Downloads/buildroot-2016.05/output/build/linux-headers-26f3b72a9c049be10e6af196252283e1f6ab9d1f/.stamp_downloaded' 
failed
make: *** 
[/home/foxtrot/Downloads/buildroot-2016.05/output/build/linux-headers-26f3b72a9c049be10e6af196252283e1f6ab9d1f/.stamp_downloaded] 
Error 1


=========================================================================

The default config file is:

-------------------------------------------------------------------------

BR2_arm=y
BR2_cortex_a7=y
BR2_ARM_EABIHF=y
BR2_ARM_FPU_NEON_VFPV4=y

BR2_TOOLCHAIN_BUILDROOT_CXX=y

BR2_SYSTEM_DHCP="eth0"

# Linux headers same as kernel, a 4.4 series
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y

BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="26f3b72a9c049be10e6af196252283e1f6ab9d1f"
BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"

# Build the DTB from the kernel sources
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2710-rpi-3-b"

BR2_PACKAGE_RPI_FIRMWARE=y
# BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is not set

# Required tools to create the SD image
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y

# Filesystem / image
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
# BR2_TARGET_ROOTFS_TAR is not set
BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"

-------------------------------------------------------------------------

I tried this procedure twice, using 'make distclean' for a clean 
restart. Got the same error.

It is my first time experimenting with customized linux. Any help would 
be appreciated!

Regards,
Fulcrum
