From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  4 Feb 2020 15:44:10 +0100
Subject: [Buildroot] [PATCH v1 0/2] Raspberry Pi 4 - mesa3d support
Message-ID: <20200204144412.6666-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add Raspberry Pi 4 - mesa3d support, enables hardware supported
graphic output for RPi4 64bit using mesa3d.

Tested by adding DTB overlay 'dtoverlay=vc4-fkms-v3d' to config.txt and
running the following commands:

	$ QT_LOGGING_RULES="qt.qpa.*=true" /usr/lib/qt/examples/gui/analogclock/analogclock

	$ QT_LOGGING_RULES="qt.qpa.*=true" /usr/lib/qt/examples/quickcontrols/controls/gallery/gallery

Used defconfig:

BR2_aarch64=y
BR2_cortex_a72=y
BR2_ARM_FPU_VFPV4=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_ROOTFS_MERGED_USR=y
BR2_SYSTEM_DHCP="eth0"
BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4-64/post-build.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4-64/post-image.sh"
BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay --aarch64"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,64d0a9870ac14d5eb5253f67d984ae348eec1393)/linux-64d0a9870ac14d5eb5253f67d984ae348eec1393.tar.gz"
BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-4-b"
BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=y
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_STRACE=y
BR2_PACKAGE_DEJAVU=y
BR2_PACKAGE_KMSCUBE=y
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
BR2_PACKAGE_QT5QUICKCONTROLS=y
BR2_PACKAGE_QT5QUICKCONTROLS2=y
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
  package/mesa3d: add v3d driver support
  package/mesa3d: update vc4 help text

 package/mesa3d/Config.in | 18 ++++++++++++++++--
 package/mesa3d/mesa3d.mk |  3 +++
 2 files changed, 19 insertions(+), 2 deletions(-)

-- 
2.25.0
