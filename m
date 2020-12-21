From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 21 Dec 2020 21:39:49 +0100
Subject: [Buildroot] [PATCH v1 0/2] Raspberry Pi - bump kernel version to
 967d45b (5.10.1)
Message-ID: <20201221203952.22168-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Raspberry Pi - bump kernel version to 967d45b (5.10.1).

Tested with the following defconfig on RPi 4 (with
'dtoverlay=vc4-kms-v3d-pi4' enabled):

  BR2_aarch64=y
  BR2_cortex_a72=y
  BR2_ARM_FPU_VFPV4=y
  BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
  BR2_PACKAGE_GLIBC_UTILS=y
  BR2_BINUTILS_VERSION_2_35_X=y
  BR2_GCC_VERSION_10_X=y
  BR2_TOOLCHAIN_BUILDROOT_CXX=y
  BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
  BR2_SYSTEM_DHCP="eth0"
  BR2_GENERATE_LOCALE="en_US"
  BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4-64/post-build.sh"
  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4-64/post-image.sh"
  BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay --aarch64"
  BR2_LINUX_KERNEL=y
  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
  BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,967d45b29ca2902f031b867809d72e3b3d623e7a)/linux-967d45b29ca2902f031b867809d72e3b3d623e7a.tar.gz"
  BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
  BR2_LINUX_KERNEL_DTS_SUPPORT=y
  BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-4-b"
  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
  BR2_PACKAGE_STRACE=y
  BR2_PACKAGE_DEJAVU=y
  BR2_PACKAGE_MESA3D=y
  BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y
  BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D=y
  BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4=y
  BR2_PACKAGE_MESA3D_OPENGL_ES=y
  BR2_PACKAGE_QT5=y
  BR2_PACKAGE_QT5BASE_EXAMPLES=y
  BR2_PACKAGE_QT5BASE_GUI=y
  BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
  BR2_PACKAGE_QT5BASE_EGLFS=y
  BR2_PACKAGE_QT5BASE_FONTCONFIG=y
  BR2_PACKAGE_QT5BASE_HARFBUZZ=y
  BR2_PACKAGE_QT5BASE_GIF=y
  BR2_PACKAGE_QT5BASE_JPEG=y
  BR2_PACKAGE_QT5BASE_PNG=y
  BR2_PACKAGE_RPI_FIRMWARE=y
  BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
  BR2_TARGET_ROOTFS_EXT2=y
  BR2_TARGET_ROOTFS_EXT2_4=y
  BR2_TARGET_ROOTFS_EXT2_SIZE="384M"
  # BR2_TARGET_ROOTFS_TAR is not set
  BR2_PACKAGE_HOST_DOSFSTOOLS=y
  BR2_PACKAGE_HOST_GENIMAGE=y
  BR2_PACKAGE_HOST_MTOOLS=y


Peter Seiderer (2):
  configs/raspberrypi*: bump kernel version to 967d45b (5.10.1)
  package/rpi-firmware: bump version to d016a6e

 configs/raspberrypi0_defconfig         | 6 +++---
 configs/raspberrypi0w_defconfig        | 6 +++---
 configs/raspberrypi2_defconfig         | 6 +++---
 configs/raspberrypi3_64_defconfig      | 6 +++---
 configs/raspberrypi3_defconfig         | 6 +++---
 configs/raspberrypi3_qt5we_defconfig   | 6 +++---
 configs/raspberrypi4_64_defconfig      | 6 +++---
 configs/raspberrypi4_defconfig         | 6 +++---
 configs/raspberrypi_defconfig          | 6 +++---
 package/rpi-firmware/rpi-firmware.hash | 2 +-
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 11 files changed, 29 insertions(+), 29 deletions(-)

-- 
2.29.2
