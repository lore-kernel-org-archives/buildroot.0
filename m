From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 23 Jan 2015 22:20:06 +0100
Subject: [Buildroot] [PATCH v2 0/2] qt5multimedia: compile fix without
	opengl and enable gstreamer-1.x support
Message-ID: <1422048008-13659-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On top of Fatih A??c? patchset qt5: bump to version 5.4.0 ([1], [2] and [3])
a fix for compiling without opengl and a new version for enabling
qt5multimedia gstreamer-1.x support.

Tested on Raspberry Pi B+ with a little aplication using
the qt5multimedia framework for audio output (used
buildroot config [4]), so 
Tested-by: Peter Seiderer <ps.report@gmx.net> for Fatih A??c? patchset.

[1] https://patchwork.ozlabs.org/patch/431801/
[2] https://patchwork.ozlabs.org/patch/431803/
[3] https://patchwork.ozlabs.org/patch/431802/

[4] buildroot defconfig
-- begin --
BR2_arm=y
BR2_arm1176jzf_s=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_GLIBC_VERSION_2_20=y
BR2_BINUTILS_VERSION_2_25=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_HOST_GDB=y
BR2_PACKAGE_HOST_GDB_TUI=y
BR2_PACKAGE_HOST_GDB_PYTHON=y
BR2_GDB_VERSION_7_8=y
BR2_ENABLE_LOCALE_PURGE=y
BR2_INIT_SYSTEMD=y
BR2_TARGET_GENERIC_GETTY_PORT="tty1"
BR2_ROOTFS_OVERLAY="board/raspberrypi/rootfs-overlay"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/raspberrypi/linux.git"
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="b9c9f8fc69aaba236169798c18dc1590fccf7acd"
BR2_LINUX_KERNEL_PATCH="board/raspberrypi/linux-3.18"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/raspberrypi/linux-3.18-rapitopl.defconfig"
BR2_LINUX_KERNEL_ZIMAGE=y
BR2_LINUX_KERNEL_EXT_FBTFT=y
BR2_PACKAGE_ALSA_UTILS=y
BR2_PACKAGE_ALSA_UTILS_ALSACONF=y
BR2_PACKAGE_ALSA_UTILS_APLAY=y
BR2_PACKAGE_ALSA_UTILS_SPEAKER_TEST=y
BR2_PACKAGE_GSTREAMER1=y
BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOTESTSRC=y
BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA=y
BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OGG=y
BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VORBIS=y
BR2_PACKAGE_GST1_PLUGINS_GOOD=y
BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUDIOPARSERS=y
BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_FLAC=y
BR2_PACKAGE_SOX=y
BR2_PACKAGE_STRACE=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
BR2_PACKAGE_QT5BASE_WIDGETS=y
BR2_PACKAGE_QT5MULTIMEDIA=y
BR2_PACKAGE_DEJAVU=y
BR2_PACKAGE_LIBERATION=y
BR2_PACKAGE_RPI_FIRMWARE=y
BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS=y
BR2_PACKAGE_EVTEST=y
BR2_PACKAGE_I2C_TOOLS=y
BR2_PACKAGE_FONTCONFIG=y
BR2_PACKAGE_JPEG=y
BR2_PACKAGE_LIBPNG=y
BR2_PACKAGE_OPENSSH=y
-- end --

Peter Seiderer (2):
  qt5multimedia: fix compile without opengl
  qt5multimedia: enable gstreamer-1.x support

 ...ervideosurface-fix-compile-without-opengl.patch |   39 +
 .../qt5multimedia/0002-GStreamer-port-to-1.0.patch | 7649 ++++++++++++++++++++
 .../0003-Fix-GStreamer-port-to-1.0-compile.patch   |  121 +
 package/qt5/qt5multimedia/qt5multimedia.mk         |    6 +-
 4 files changed, 7814 insertions(+), 1 deletion(-)
 create mode 100644 package/qt5/qt5multimedia/0001-qpaintervideosurface-fix-compile-without-opengl.patch
 create mode 100644 package/qt5/qt5multimedia/0002-GStreamer-port-to-1.0.patch
 create mode 100644 package/qt5/qt5multimedia/0003-Fix-GStreamer-port-to-1.0-compile.patch

-- 
2.1.2
