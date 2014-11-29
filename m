From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Sat, 29 Nov 2014 10:12:37 +0100
Subject: [Buildroot] [PATCH v2 0/3] Add support for iMX5 GPU
Message-ID: <1417252360-10929-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is continuation of my previous serie called "Add Xorg support for imx6".
This time, it add support for iMX5 chipset. As fro iMX6, this work is mainly
adapted from Yocto.

v2:
  - Merge gpu-amd-bin-mx51 related patches
  - Use self-extractible helper
  - Remove 'See freescale-imx.mk' comment
  - Remove debug comment
  - Change BUILD_CMD in POST_PATCH_HOOK
  - Explain why we patch headers files in gpu-amd-bin-mx51
  - Add comment about use of gpu-amd-bin-mx51 on imx53
  - Add a comment about kernel dependency
  - Remove redondant dependencies on arm/imx53/gpu-mx51-xorg
  - Add dependencies on BR2_ARM_EABI (libz160 and gpu-amd-bin-mx51)
  - Clean dependencies on glibc, C++ and EABI: libz160 and
    gpu-amd-bin-mx51 directly depends on these features, xdriver
    indirectly depends on.
  - In xdriver, split comment about dependencies in two lines
  - Install libraies with execution bit set

J?r?me Pouiller (3):
  gpu-amd-bin-mx51: new package
  libz160: fix dependencies
  xdriver_xf86-video-imx: new package

 package/freescale-imx/Config.in                    |   1 +
 package/freescale-imx/gpu-amd-bin-mx51/Config.in   |  59 ++
 package/freescale-imx/gpu-amd-bin-mx51/egl.pc      |  10 +
 package/freescale-imx/gpu-amd-bin-mx51/glesv2.pc   |  10 +
 .../gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk           |  67 ++
 package/freescale-imx/gpu-amd-bin-mx51/vg.pc       |  10 +
 package/freescale-imx/libz160/Config.in            |   6 +
 package/x11r7/Config.in                            |   1 +
 .../0001-Update-to-newer-swap-macros.patch         |  65 ++
 .../0002-Fix-error-unknown-type-name-uint.patch    |  33 +
 .../0003-support-glibc-2.20.patch                  |  57 ++
 ...video-API-forward-and-backward-compatible.patch | 787 +++++++++++++++++++++
 ...-xf86-video-imxfb-fix-m4-hardcodded-paths.patch |  53 ++
 .../0006-xserver-1.14-compat.patch                 |  34 +
 package/x11r7/xdriver_xf86-video-imx/Config.in     |  33 +
 .../xdriver_xf86-video-imx.mk                      |  15 +
 16 files changed, 1241 insertions(+)
 create mode 100644 package/freescale-imx/gpu-amd-bin-mx51/Config.in
 create mode 100644 package/freescale-imx/gpu-amd-bin-mx51/egl.pc
 create mode 100644 package/freescale-imx/gpu-amd-bin-mx51/glesv2.pc
 create mode 100644 package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk
 create mode 100644 package/freescale-imx/gpu-amd-bin-mx51/vg.pc
 create mode 100644 package/x11r7/xdriver_xf86-video-imx/0001-Update-to-newer-swap-macros.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-imx/0002-Fix-error-unknown-type-name-uint.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-imx/0003-support-glibc-2.20.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-imx/0004-Make-video-API-forward-and-backward-compatible.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-imx/0005-xf86-video-imxfb-fix-m4-hardcodded-paths.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-imx/0006-xserver-1.14-compat.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-imx/Config.in
 create mode 100644 package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx.mk

-- 
1.9.1
