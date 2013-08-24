From: Spenser Gilliland <spenser@gillilanding.com>
Date: Sat, 24 Aug 2013 14:41:55 -0500
Subject: [Buildroot] [PATCH 0/6] Sunxi fixes, improve Mesa3d Support,
	and add glmark2 benchmark application.
Message-ID: <1377373321-29732-1-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series improves Mesa support and adds the glmark2 benchmark.

Spenser Gilliland (6):
  libdrm: bump and add experimental ARM framebuffer support
  sunxi-mali: bug fixes for pc and init script
  sunxi-cedarx: bump to newer version, use armel2 binaries, add demo
  mesa3d: reorganize, modularize, and bump to version 9.1.6
  libpng12: new package
  glmark2: new package

 package/Config.in                                  |   3 +
 package/glmark2/Config.in                          |  49 ++++++
 package/glmark2/glmark2-add-mali-support.patch     | 102 ++++++++++++
 package/glmark2/glmark2-fix-add-GLchar.patch       |  17 ++
 .../glmark2-gl-to-glesv2-on-drm-flavor.patch       |  25 +++
 package/glmark2/glmark2.mk                         |  70 +++++++++
 package/libdrm/Config.in                           |  14 +-
 package/libdrm/libdrm.mk                           |  24 ++-
 package/libpng12/Config.in                         |   8 +
 package/libpng12/libpng12.mk                       |  18 +++
 package/mesa3d/Config.in                           | 172 +++++++++++++++++++++
 package/mesa3d/mesa3d-cross-glsl-compiler.patch    |  41 +++++
 package/mesa3d/mesa3d-gbm-without-dri.patch        |  30 ++++
 package/mesa3d/mesa3d.mk                           | 149 ++++++++++++++++++
 package/opengl/Config.in                           |   3 +
 package/opengl/libegl/libegl.mk                    |   4 +
 package/opengl/libgl/libgl.mk                      |  20 +++
 package/opengl/libgles/libgles.mk                  |   4 +
 package/opengl/libopenvg/libopenvg.mk              |   4 +
 package/sunxi-cedarx/Config.in                     |  10 ++
 package/sunxi-cedarx/sunxi-cedarx.mk               |  26 +++-
 package/sunxi-mali/S80mali                         |   2 +-
 package/sunxi-mali/glesv2.pc                       |   2 +-
 package/x11r7/Config.in                            |   1 -
 package/x11r7/mesa3d/Config.in                     |  15 --
 package/x11r7/mesa3d/mesa3d-uclibc-locale.patch    |  56 -------
 package/x11r7/mesa3d/mesa3d.mk                     |  40 -----
 .../xserver_xorg-server/xserver_xorg-server.mk     |   4 +-
 28 files changed, 767 insertions(+), 146 deletions(-)
 create mode 100644 package/glmark2/Config.in
 create mode 100644 package/glmark2/glmark2-add-mali-support.patch
 create mode 100644 package/glmark2/glmark2-fix-add-GLchar.patch
 create mode 100644 package/glmark2/glmark2-gl-to-glesv2-on-drm-flavor.patch
 create mode 100644 package/glmark2/glmark2.mk
 create mode 100644 package/libpng12/Config.in
 create mode 100644 package/libpng12/libpng12.mk
 create mode 100644 package/mesa3d/Config.in
 create mode 100644 package/mesa3d/mesa3d-cross-glsl-compiler.patch
 create mode 100644 package/mesa3d/mesa3d-gbm-without-dri.patch
 create mode 100644 package/mesa3d/mesa3d.mk
 create mode 100644 package/opengl/libgl/libgl.mk
 delete mode 100644 package/x11r7/mesa3d/Config.in
 delete mode 100644 package/x11r7/mesa3d/mesa3d-uclibc-locale.patch
 delete mode 100644 package/x11r7/mesa3d/mesa3d.mk

-- 
1.8.1.2
