From: Peter Seiderer <ps.report@gmx.net>
Date: Sun,  6 Dec 2020 12:42:43 +0100
Subject: [Buildroot] [PATCH v1 0/5] Raspberry Pi kernel/firmware/userland
 update
Message-ID: <20201206114248.24700-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


- rpi-bt-firmware/rpi-wifi-firmware patches taken from [1], [2]
- add updated/latest rpi-firmware bump
- add rpi kernel version bump
- add rpi-userland version bump

Tested with the following defconfig on Raspberry Pi 3 Model B+:

  BR2_arm=y
  BR2_cortex_a53=y
  BR2_ARM_FPU_NEON_VFPV4=y
  BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
  BR2_PACKAGE_GLIBC_UTILS=y
  BR2_BINUTILS_VERSION_2_35_X=y
  BR2_GCC_VERSION_10_X=y
  BR2_TOOLCHAIN_BUILDROOT_CXX=y
  BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
  BR2_SYSTEM_DHCP="eth0"
  BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
  BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay"
  BR2_LINUX_KERNEL=y
  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
  BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,f4b5d0de4ffad239ed01ce08d49d4f7eeeccb1a6)/linux-f4b5d0de4ffad239ed01ce08d49d4f7eeeccb1a6.tar.gz"
  BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
  BR2_LINUX_KERNEL_DTS_SUPPORT=y
  BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2710-rpi-3-b bcm2710-rpi-3-b-plus bcm2710-rpi-cm3"
  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
  BR2_PACKAGE_QT5=y
  BR2_PACKAGE_QT5BASE_EXAMPLES=y
  BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
  BR2_PACKAGE_QT5BASE_EGLFS=y
  BR2_PACKAGE_QT5BASE_FONTCONFIG=y
  BR2_PACKAGE_QT5BASE_HARFBUZZ=y
  BR2_PACKAGE_QT5BASE_GIF=y
  BR2_PACKAGE_QT5BASE_JPEG=y
  BR2_PACKAGE_QT5BASE_PNG=y
  BR2_PACKAGE_QT5QUICKCONTROLS=y
  BR2_PACKAGE_QT5QUICKCONTROLS2=y
  BR2_PACKAGE_RPI_BT_FIRMWARE=y
  BR2_PACKAGE_RPI_FIRMWARE=y
  BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG=y
  BR2_PACKAGE_RPI_WIFI_FIRMWARE=y
  BR2_PACKAGE_RPI_USERLAND_HELLO=y
  BR2_TARGET_ROOTFS_EXT2=y
  BR2_TARGET_ROOTFS_EXT2_4=y
  BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
  # BR2_TARGET_ROOTFS_TAR is not set
  BR2_PACKAGE_HOST_DOSFSTOOLS=y
  BR2_PACKAGE_HOST_GENIMAGE=y
  BR2_PACKAGE_HOST_MTOOLS=y

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20201122214304.266821-2-davidb at 230ruedubac.fr/
[2] https://patchwork.ozlabs.org/project/buildroot/patch/20201122214304.266821-4-davidb at 230ruedubac.fr/

David Barbion (2):
  package/rpi-bt-firmware: bump version to 9c0ffe9
  package/rpi-wifi-firmware: bump version to 9c0ffe9

Peter Seiderer (3):
  configs/raspberrypi*: bump kernel version to f4b5d0d (5.4.80)
  package/rpi-firmware: bump version to 08ed7a0
  package/rpi-userland: bump version to 093b30b

 configs/raspberrypi0_defconfig                   | 2 +-
 configs/raspberrypi0w_defconfig                  | 2 +-
 configs/raspberrypi2_defconfig                   | 2 +-
 configs/raspberrypi3_64_defconfig                | 2 +-
 configs/raspberrypi3_defconfig                   | 2 +-
 configs/raspberrypi3_qt5we_defconfig             | 2 +-
 configs/raspberrypi4_64_defconfig                | 2 +-
 configs/raspberrypi4_defconfig                   | 2 +-
 configs/raspberrypi_defconfig                    | 2 +-
 package/rpi-bt-firmware/rpi-bt-firmware.hash     | 2 +-
 package/rpi-bt-firmware/rpi-bt-firmware.mk       | 2 +-
 package/rpi-firmware/rpi-firmware.hash           | 2 +-
 package/rpi-firmware/rpi-firmware.mk             | 2 +-
 package/rpi-userland/rpi-userland.hash           | 2 +-
 package/rpi-userland/rpi-userland.mk             | 2 +-
 package/rpi-wifi-firmware/rpi-wifi-firmware.hash | 4 ++--
 package/rpi-wifi-firmware/rpi-wifi-firmware.mk   | 2 +-
 17 files changed, 18 insertions(+), 18 deletions(-)

-- 
2.29.2
