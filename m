From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 26 May 2015 10:19:29 +0200
Subject: [Buildroot] [PATCH v2 00/13] Update Freescale packages to
	3.10.53-1.1.0_GA
Message-ID: <1432628382-16799-1-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This series aims at updating all the Freescale packages to version
3.10.53-1.1.0_GA. This is based on the updates made in the meta-fsl-am
layer on Jan 27, 2015.
https://github.com/Freescale/meta-fsl-arm/commits/master

All the patches are pretty straight forward apart from the graphics
package update which I based on Antoine Tenart patch. I will detail
the changes and the testing on every patch.

v1 -> v2:
- Add renamed graphics package to Config.in.legacy
- Rework Boundary u-boot scripts copy/generation to remove binary blobs

In order to test as much features as I could at once, here is my
configuration (using Nitrogen6x):
BR2_arm=y
BR2_cortex_a9=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TARGET_OPTIMIZATION="-pipe"
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
BR2_ROOTFS_POST_BUILD_SCRIPT="board/boundarydevices/nitrogen6x/post-build.sh"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/tarball/98c0fdbe/linux-imx6-98c0fdbe.tar.gz"
BR2_LINUX_KERNEL_DEFCONFIG="nitrogen6x"
BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-nit6xlite imx6dl-nitrogen6_vm imx6dl-nitrogen6x imx6q-nitrogen6x imx6q-nitrogen6_max imx6q-sabrelite"
BR2_LINUX_KERNEL_INSTALL_TARGET=y
BR2_PACKAGE_GSTREAMER=y
BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_AUDIOTESTSRC=y
BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC=y
BR2_PACKAGE_GST_PLUGINS_GOOD=y
BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_AUTODETECT=y
BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ID3DEMUX=y
BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MATROSKA=y
BR2_PACKAGE_GST_FSL_PLUGINS=y
BR2_PACKAGE_GSTREAMER1=y
BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOTESTSRC=y
BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC=y
BR2_PACKAGE_GST1_PLUGINS_GOOD=y
BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUTODETECT=y
BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ID3DEMUX=y
BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MATROSKA=y
BR2_PACKAGE_GST1_IMX=y
BR2_PACKAGE_GST1_LIBAV=y
BR2_PACKAGE_STRACE=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
BR2_PACKAGE_QT5BASE_EXAMPLES=y
BR2_PACKAGE_QT5BASE_OPENGL_ES2=y
BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
BR2_PACKAGE_QT5BASE_XCB=y
BR2_PACKAGE_QT5BASE_DEFAULT_QPA="xcb"
BR2_PACKAGE_QT5BASE_GIF=y
BR2_PACKAGE_QT5BASE_JPEG=y
BR2_PACKAGE_QT5BASE_PNG=y
BR2_PACKAGE_QT5QUICKCONTROLS=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR=y
BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV=y
BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX_VIV=y
BR2_PACKAGE_XTERM=y
BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q=y
BR2_PACKAGE_IMX_GPU_VIV=y
BR2_PACKAGE_IMX_GPU_VIV_EXAMPLES=y
BR2_PACKAGE_I2C_TOOLS=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_CFFI=y
BR2_PACKAGE_PYTHON_SETUPTOOLS=y
BR2_PACKAGE_LIBSHA1=y
BR2_PACKAGE_TIFF=y
BR2_PACKAGE_OPENSSH=y
BR2_PACKAGE_RSYNC=y
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BOARDNAME="nitrogen6q"
BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/u-boot-imx6/tarball/21eb4146/u-boot-21eb4146.tar.gz"
BR2_TARGET_UBOOT_FORMAT_IMX=y
BR2_PACKAGE_HOST_E2FSPROGS=y
BR2_PACKAGE_HOST_GENEXT2FS=y
BR2_PACKAGE_HOST_UBOOT_TOOLS=y

Regards,
Gary

Antoine Tenart (1):
  gpu-viv-bin-mx6q: bump to 5.0.11.p4.1

Gary Bisson (12):
  libfslvpuwrap: bump version to 1.0.57
  libfslcodec: bump version to 4.0.2
  libfslparser: bump version to 4.0.2
  gst-fsl-plugins: bump version to 4.0.2
  imx-vpu: bump version to 5.4.27
  freescale-imx: bump to 3.10.53-1.1.0 GA release
  gpu-viv-bin-mx6q: rename package to imx-gpu-viv
  xdriver_xf86-video-imx-viv: bump to version 3.10.53-1.1.0 GA
  nitrogen6x_defconfig: bump version to 3.10.53_1.1.1_ga
  board/boundarydevices: rework and update u-boot scripts
  freescale_imx6*_defconfig: bump version to 3.10.53-1.1.0 GA
  qmx6_defconfig: bump version to 3.10.53_1.1.0

 Config.in.legacy                                   |  12 ++
 board/boundarydevices/nitrogen6x/6x_bootscript     | Bin 3207 -> 0 bytes
 board/boundarydevices/nitrogen6x/6x_bootscript.txt | 186 +++++++++++++++++++++
 .../nitrogen6x/{6x_upgrade => 6x_upgrade.txt}      | Bin 1465 -> 1393 bytes
 board/boundarydevices/nitrogen6x/post-build.sh     |   6 +-
 configs/freescale_imx6dlsabreauto_defconfig        |   6 +-
 configs/freescale_imx6dlsabresd_defconfig          |   7 +-
 configs/freescale_imx6qsabreauto_defconfig         |   6 +-
 configs/freescale_imx6qsabresd_defconfig           |   7 +-
 configs/freescale_imx6sololiteevk_defconfig        |   5 +-
 configs/nitrogen6x_defconfig                       |  11 +-
 configs/qmx6_defconfig                             |   8 +-
 package/freescale-imx/Config.in                    |   2 +-
 package/freescale-imx/freescale-imx.mk             |   2 +-
 .../0001-correct-HAL-include.patch                 |  16 --
 package/freescale-imx/gpu-viv-bin-mx6q/egl.pc      |  10 --
 package/freescale-imx/gpu-viv-bin-mx6q/glesv2.pc   |  10 --
 .../gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk           |  89 ----------
 package/freescale-imx/gpu-viv-bin-mx6q/vg.pc       |  10 --
 .../{gpu-viv-bin-mx6q => imx-gpu-viv}/Config.in    |  26 +--
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk   |  98 +++++++++++
 .../0001-vpu-io-fix-IOSystemInit-failure.patch     |  32 ----
 ...-lib-fix-IOGetVirtMem-return-value-checks.patch |  59 -------
 package/freescale-imx/imx-vpu/imx-vpu.mk           |   2 +-
 .../0002-Fix-bashism-in-configure-script.patch     |   4 +-
 .../gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk   |   2 +-
 package/gstreamer1/gst1-imx/Config.in              |   6 +-
 package/gstreamer1/gst1-imx/gst1-imx.mk            |   2 +-
 package/libfslcodec/libfslcodec.mk                 |   2 +-
 package/libfslparser/libfslparser.mk               |   2 +-
 ...-fix-tests-of-return-value-from-IOGetVirt.patch |  44 -----
 package/libfslvpuwrap/libfslvpuwrap.mk             |   2 +-
 package/qt5/qt5base/qt5base.mk                     |   2 +-
 .../0001-Fix-LoadExtenions.patch                   |  15 --
 package/x11r7/xdriver_xf86-video-imx-viv/Config.in |   6 +-
 .../xdriver_xf86-video-imx-viv.mk                  |   4 +-
 36 files changed, 355 insertions(+), 346 deletions(-)
 delete mode 100644 board/boundarydevices/nitrogen6x/6x_bootscript
 create mode 100644 board/boundarydevices/nitrogen6x/6x_bootscript.txt
 rename board/boundarydevices/nitrogen6x/{6x_upgrade => 6x_upgrade.txt} (92%)
 delete mode 100644 package/freescale-imx/gpu-viv-bin-mx6q/0001-correct-HAL-include.patch
 delete mode 100644 package/freescale-imx/gpu-viv-bin-mx6q/egl.pc
 delete mode 100644 package/freescale-imx/gpu-viv-bin-mx6q/glesv2.pc
 delete mode 100644 package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
 delete mode 100644 package/freescale-imx/gpu-viv-bin-mx6q/vg.pc
 rename package/freescale-imx/{gpu-viv-bin-mx6q => imx-gpu-viv}/Config.in (72%)
 create mode 100644 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
 delete mode 100644 package/freescale-imx/imx-vpu/0001-vpu-io-fix-IOSystemInit-failure.patch
 delete mode 100644 package/freescale-imx/imx-vpu/0002-vpu-lib-fix-IOGetVirtMem-return-value-checks.patch
 delete mode 100644 package/libfslvpuwrap/0001-vpu_wrapper-fix-tests-of-return-value-from-IOGetVirt.patch
 delete mode 100644 package/x11r7/xdriver_xf86-video-imx-viv/0001-Fix-LoadExtenions.patch

-- 
2.1.4
