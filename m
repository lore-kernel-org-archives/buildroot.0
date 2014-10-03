From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri,  3 Oct 2014 14:43:21 +0200
Subject: [Buildroot] [PATCH 00/11] Add Xorg support for imx6
Message-ID: <1412340212-3089-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Main purpose of this serie is to add support of Vivante GPU (found on imx6) to
Xorg. This work is mainly adapted from Yocto.

J?r?me Pouiller (11):
  mesa3d: Fix package requirements
  freescale-imx: bump to version 3.10.17-1.0.1
  gpu-viv-bin-mx6q: provide libopenvg
  gpu-viv-bin-mx6q: fix compiling issues with EGL_API_FB
  gpu-viv-bin-mx6q: fix GLESv2 support
  gpu-viv-bin-mx6q: make fb/x11 choice explicit
  gpu-viv-bin-mx6q: change output selection mecanism
  xdriver_xf86-video-imx-viv: new package
  libdrm: fix support for xserver with Vivante drivers
  qt5base: fix Vivante x11/EGL configuration
  qmx6_defconfig: update

 board/congatec/qmx6/6q_bootscript.txt              |  2 -
 board/congatec/qmx6/post-build.sh                  |  7 ---
 configs/qmx6_defconfig                             | 49 +++++++++++++++--
 package/freescale-imx/freescale-imx.mk             |  2 +-
 package/freescale-imx/gpu-viv-bin-mx6q/Config.in   | 33 +++++++++++-
 package/freescale-imx/gpu-viv-bin-mx6q/egl.pc      |  2 +-
 package/freescale-imx/gpu-viv-bin-mx6q/glesv2.pc   |  2 +-
 .../gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk           | 38 ++++++-------
 package/freescale-imx/gpu-viv-bin-mx6q/vg.pc       |  2 +-
 package/libdrm/libdrm-0001-update-arm.patch        | 37 +++++++++++++
 package/mesa3d/Config.in                           |  3 ++
 package/mesa3d/mesa3d.mk                           |  3 ++
 .../qt5base-0001-Force_egl_visual_ID_33.patch      | 23 ++++++++
 .../qt5/qt5base/qt5base-0004-xcb-egl-fixes.patch   | 63 ++++++++++++++++++++++
 package/x11r7/Config.in                            |  1 +
 package/x11r7/xdriver_xf86-video-imx-viv/Config.in | 31 +++++++++++
 ...xf86-video-imx-viv-0001-Fix-LoadExtenions.patch | 15 ++++++
 .../xdriver_xf86-video-imx-viv.mk                  | 32 +++++++++++
 18 files changed, 306 insertions(+), 39 deletions(-)
 delete mode 100644 board/congatec/qmx6/6q_bootscript.txt
 delete mode 100755 board/congatec/qmx6/post-build.sh
 create mode 100644 package/libdrm/libdrm-0001-update-arm.patch
 create mode 100644 package/qt5/qt5base/qt5base-0001-Force_egl_visual_ID_33.patch
 create mode 100644 package/qt5/qt5base/qt5base-0004-xcb-egl-fixes.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-imx-viv/Config.in
 create mode 100644 package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv-0001-Fix-LoadExtenions.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk

-- 
2.1.0
