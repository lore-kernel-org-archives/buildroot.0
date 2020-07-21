From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 21 Jul 2020 21:05:46 +0200
Subject: [Buildroot] [PATCH v1 0/3] configs/raspberrypi*: bump kernel
 version to 5.4.x
Message-ID: <20200721190549.29166-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump raspberry pi configs/rpi-firmware/rpi-userland to kernel
vesion 5.4.x.

Testes on RPi4 (32-bit/64-bit) with the following defconfigs and
with both vc4/v3d device tree overlays ('dtoverlay=vc4-fkms-v3d'
and 'dtoverlay=vc4-kms-v3d-pi4').

For Qt graphics output QT_QPA_EGLFS_ALWAYS_SET_MODE=1 ([1]) or
QT_QPA_EGLFS_KMS_ATOMIC=1 ([2]) is needed, otherwise it will fail with:

  Could not queue DRM page flip on screen HDMI1 (Invalid argument)

Regards,
Peter


- RPi4 32-bit:

BR2_arm=y
BR2_cortex_a72=y
BR2_ARM_FPU_NEON_VFPV4=y
BR2_ENABLE_DEBUG=y
BR2_OPTIMIZE_3=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_SYSTEM_DHCP="eth0"
BR2_GENERATE_LOCALE="en_US"
BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4/post-build.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4/post-image.sh"
BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,1c64f4bc22811d2d371b271daa3fb27895a8abdd)/linux-1c64f4bc22811d2d371b271daa3fb27895a8abdd.tar.gz"
BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2711-rpi-4-b"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_PACKAGE_DEJAVU=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5BASE_EXAMPLES=y
BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
BR2_PACKAGE_QT5BASE_EGLFS=y
BR2_PACKAGE_QT5BASE_DEFAULT_QPA="eglfs"
BR2_PACKAGE_QT5BASE_FONTCONFIG=y
BR2_PACKAGE_QT5BASE_HARFBUZZ=y
BR2_PACKAGE_QT5BASE_GIF=y
BR2_PACKAGE_QT5BASE_JPEG=y
BR2_PACKAGE_QT5BASE_PNG=y
BR2_PACKAGE_QT5GRAPHICALEFFECTS=y
BR2_PACKAGE_QT5IMAGEFORMATS=y
BR2_PACKAGE_QT5QUICKCONTROLS=y
BR2_PACKAGE_QT5QUICKCONTROLS2=y
BR2_PACKAGE_RPI_FIRMWARE=y
BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
BR2_PACKAGE_LIBINPUT=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
BR2_TARGET_ROOTFS_TAR_GZIP=y
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y


- RPi4 64-bit:

BR2_aarch64=y
BR2_cortex_a72=y
BR2_ARM_FPU_VFPV4=y
BR2_ENABLE_DEBUG=y
BR2_OPTIMIZE_3=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_SYSTEM_DHCP="eth0"
BR2_GENERATE_LOCALE="en_US"
BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4-64/post-build.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4-64/post-image.sh"
BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay --aarch64"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,1c64f4bc22811d2d371b271daa3fb27895a8abdd)/linux-1c64f4bc22811d2d371b271daa3fb27895a8abdd.tar.gz"
BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-4-b"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_PACKAGE_DEJAVU=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5BASE_EXAMPLES=y
BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
BR2_PACKAGE_QT5BASE_EGLFS=y
BR2_PACKAGE_QT5BASE_DEFAULT_QPA="eglfs"
BR2_PACKAGE_QT5BASE_FONTCONFIG=y
BR2_PACKAGE_QT5BASE_HARFBUZZ=y
BR2_PACKAGE_QT5BASE_GIF=y
BR2_PACKAGE_QT5BASE_JPEG=y
BR2_PACKAGE_QT5BASE_PNG=y
BR2_PACKAGE_QT5GRAPHICALEFFECTS=y
BR2_PACKAGE_QT5IMAGEFORMATS=y
BR2_PACKAGE_QT5QUICKCONTROLS=y
BR2_PACKAGE_QT5QUICKCONTROLS2=y
BR2_PACKAGE_RPI_FIRMWARE=y
BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
BR2_PACKAGE_LIBINPUT=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
# BR2_TARGET_ROOTFS_TAR is not set
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y


[1] https://www.raspberrypi.org/forums/viewtopic.php?t=252614
[2] https://bugreports.qt.io/browse/QTBUG-72538


Peter Seiderer (3):
  package/rpi-firmware: bump version to 542aceb
  package/rpi-userland: bump version to 188d3bf
  configs/raspberrypi*: bump kernel version to 1c64f4b (5.4.51)

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
 package/rpi-userland/rpi-userland.hash | 2 +-
 package/rpi-userland/rpi-userland.mk   | 2 +-
 13 files changed, 31 insertions(+), 31 deletions(-)

-- 
2.27.0
