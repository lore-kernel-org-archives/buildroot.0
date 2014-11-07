From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri,  7 Nov 2014 16:57:50 +0100
Subject: [Buildroot] [PATCH 0/4] Add support for iMX5 GPU
Message-ID: <1415375874-17331-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is continuation of my previous serie called "Add Xorg support for imx6".
This time, it add support for iMX5 chipset. As fro iMX6, this work is mainly
adapted from Yocto.


J?r?me Pouiller (4):
  libz160: new package
  gpu-amd-bin-mx51: new package
  gpu-amd-bin-mx51: install examples
  xdriver_xf86-video-imx: new package

 package/freescale-imx/Config.in                    |   4 +
 package/freescale-imx/gpu-amd-bin-mx51/Config.in   |  59 ++
 package/freescale-imx/gpu-amd-bin-mx51/egl.pc      |  10 +
 package/freescale-imx/gpu-amd-bin-mx51/glesv2.pc   |  10 +
 .../gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk           |  74 ++
 package/freescale-imx/gpu-amd-bin-mx51/vg.pc       |  10 +
 package/freescale-imx/libz160/Config.in            |   6 +
 package/freescale-imx/libz160/libz160.mk           |  40 ++
 package/x11r7/Config.in                            |   1 +
 package/x11r7/xdriver_xf86-video-imx/Config.in     |  35 +
 ...ideo-imx-0001-Update-to-newer-swap-macros.patch |  65 ++
 ...imx-0002-Fix-error-unknown-type-name-uint.patch |  33 +
 ...er_xf86-video-imx-0003-support-glibc-2.20.patch |  57 ++
 ...video-API-forward-and-backward-compatible.patch | 787 +++++++++++++++++++++
 ...-xf86-video-imxfb-fix-m4-hardcodded-paths.patch |  53 ++
 ...r_xf86-video-imx-0006-xserver-1.14-compat.patch |  34 +
 .../xdriver_xf86-video-imx.mk                      |  16 +
 17 files changed, 1294 insertions(+)
 create mode 100644 package/freescale-imx/gpu-amd-bin-mx51/Config.in
 create mode 100644 package/freescale-imx/gpu-amd-bin-mx51/egl.pc
 create mode 100644 package/freescale-imx/gpu-amd-bin-mx51/glesv2.pc
 create mode 100644 package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk
 create mode 100644 package/freescale-imx/gpu-amd-bin-mx51/vg.pc
 create mode 100644 package/freescale-imx/libz160/Config.in
 create mode 100644 package/freescale-imx/libz160/libz160.mk
 create mode 100644 package/x11r7/xdriver_xf86-video-imx/Config.in
 create mode 100644 package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx-0001-Update-to-newer-swap-macros.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx-0002-Fix-error-unknown-type-name-uint.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx-0003-support-glibc-2.20.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx-0004-Make-video-API-forward-and-backward-compatible.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx-0005-xf86-video-imxfb-fix-m4-hardcodded-paths.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx-0006-xserver-1.14-compat.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx.mk

-- 
1.9.1
