From: dev_stefan <dev-blst@gmx.de>
Date: Tue, 13 Mar 2018 00:22:37 +0100
Subject: [Buildroot] Linker error while building glibc
Message-ID: <03BF469D-1273-46FF-9282-82A829CD81C4@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, 

I want to build a image from my beaglebone, but if i add some target packages eg. Python i got a linker error:
 
init.c:(.text+0x54): undefined reference to 'main'
collect2: error: ld returned 1 exit status

while building libzlib 1.2.11.

But there are familiar errors if I enable other packages. 

I use buildroot version 2018.02 on ubuntu 14.04 LTS. 

Here is my config (working): 

BR2_arm=y 
2 BR2_cortex_a8=y 
3 BR2_ARM_FPU_NEON=y 
4 BR2_GLOBAL_PATCH_DIR="board/testo/beagleBoneTesto/patches" 
5 BR2_SSP_ALL=y 
6 BR2_RELRO_FULL=y 
7 BR2_FORTIFY_SOURCE_2=y 
8 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y 
9 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y 
10 BR2_BINUTILS_VERSION_2_30_X=y 
11 BR2_GCC_VERSION_7_X=y 
12 BR2_TOOLCHAIN_BUILDROOT_CXX=y 
13 BR2_GCC_ENABLE_LTO=y 
14 BR2_TARGET_GENERIC_ISSUE="Welcome to Testo BeagleBone " 
15 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y 
16 BR2_TARGET_GENERIC_GETTY_PORT="ttyO0" 
17 BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y 
18 BR2_ROOTFS_OVERLAY="board/testo/beagleBoneTesto/add2rootfs" 
19 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/testo/beagleBoneTesto/post-image.sh" 
20 BR2_LINUX_KERNEL=y 
21 BR2_LINUX_KERNEL_CUSTOM_GIT=y 
22 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/beagleboard/linux.git" 
23 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="5d84ea71b463b8c98bad9fcd8d92e0781a0e5b2a" 
24 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y 
25 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/testo/beagleBoneTesto/linux.config" 
26 BR2_LINUX_KERNEL_DTS_SUPPORT=y 
27 BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y 
28 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/testo/beagleBoneTesto/dts/am335x-bbt.dts" 
29 BR2_PACKAGE_BUSYBOX_CONFIG="board/testo/beagleBoneTesto/busybox.config" 
30 BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y 
31 BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES=y 
32 BR2_PACKAGE_BUSYBOX_WATCHDOG=y 
33 BR2_PACKAGE_SWUPDATE=y 
34 # BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE is not set 
35 BR2_TARGET_ROOTFS_EXT2=y 
36 BR2_TARGET_ROOTFS_EXT2_4=y 
37 BR2_TARGET_ROOTFS_EXT2_SIZE="256M" 
38 BR2_TARGET_UBOOT=y 
39 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y 
40 BR2_TARGET_UBOOT_CUSTOM_VERSION=y 
41 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.01" 
42 BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG=y 
43 BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE="board/testo/beagleBoneTesto/uboot.config" 
44 BR2_TARGET_UBOOT_NEEDS_DTC=y 
45 # BR2_TARGET_UBOOT_FORMAT_BIN is not set 
46 BR2_TARGET_UBOOT_FORMAT_IMG=y 
47 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y 
48 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="spl/u-boot-spl.bin" 
49 BR2_TARGET_UBOOT_SPL=y 
50 BR2_TARGET_UBOOT_SPL_NAME="MLO" 
51 BR2_PACKAGE_HOST_DOSFSTOOLS=y 
52 BR2_PACKAGE_HOST_GENIMAGE=y 
53 BR2_PACKAGE_HOST_MTOOLS=y 



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180313/9edb35b0/attachment-0001.html>
