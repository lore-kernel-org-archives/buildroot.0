From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu,  5 Sep 2013 23:25:14 -0500
Subject: [Buildroot] [PATCH v2 0/7] glmark2 and Mesa updates
Message-ID: <1378441521-10050-1-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series adds the glmark2 and mesa3d-demos with supporing updates to
the mesa3d, and libdrm stack.

v1->v2:
  - updates based on review.
  - add mesa3d-demos

Spenser Gilliland (7):
  libdrm: bump and add experimental ARM framebuffer support
  sunxi-cedarx: bump to newer version, use armel2 binaries, add demo
  mesa3d: pull out from x11
  mesa3d: modularize and bump to version 9.1.6
  libpng12: new package
  glmark2: new package
  mesa3d-demos: new package

 package/Config.in                                  |   4 +
 package/glmark2/Config.in                          |  16 +
 package/glmark2/glmark2-add-mali-support.patch     | 102 ++++++
 package/glmark2/glmark2-fix-add-GLchar.patch       |  17 +
 .../glmark2-gl-to-glesv2-on-drm-flavor.patch       |  25 ++
 package/glmark2/glmark2.mk                         |  69 ++++
 package/libdrm/Config.in                           |  68 +++-
 package/libdrm/libdrm.mk                           |  53 +++-
 package/libpng12/Config.in                         |   9 +
 package/libpng12/libpng12.mk                       |  18 ++
 package/mesa3d-demos/Config.in                     |   8 +
 .../mesa3d-demos/mesa3d-demos-optional-gl.patch    | 348 +++++++++++++++++++++
 package/mesa3d-demos/mesa3d-demos.mk               |  63 ++++
 package/mesa3d/Config.in                           | 180 +++++++++++
 package/mesa3d/mesa3d-cross-glsl-compiler.patch    |  41 +++
 package/mesa3d/mesa3d-gbm-without-dri.patch        |  30 ++
 package/mesa3d/mesa3d.mk                           | 123 ++++++++
 package/opengl/Config.in                           |   3 +
 package/opengl/libegl/libegl.mk                    |   4 +
 package/opengl/libgl/libgl.mk                      |  20 ++
 package/opengl/libgles/libgles.mk                  |   4 +
 package/opengl/libopenvg/libopenvg.mk              |   4 +
 package/sunxi-cedarx/Config.in                     |  10 +
 package/sunxi-cedarx/sunxi-cedarx.mk               |  26 +-
 package/x11r7/Config.in                            |   1 -
 package/x11r7/mesa3d/Config.in                     |  15 -
 package/x11r7/mesa3d/mesa3d-uclibc-locale.patch    |  56 ----
 package/x11r7/mesa3d/mesa3d.mk                     |  40 ---
 .../xserver_xorg-server/xserver_xorg-server.mk     |   4 +-
 29 files changed, 1222 insertions(+), 139 deletions(-)
 create mode 100644 package/glmark2/Config.in
 create mode 100644 package/glmark2/glmark2-add-mali-support.patch
 create mode 100644 package/glmark2/glmark2-fix-add-GLchar.patch
 create mode 100644 package/glmark2/glmark2-gl-to-glesv2-on-drm-flavor.patch
 create mode 100644 package/glmark2/glmark2.mk
 create mode 100644 package/libpng12/Config.in
 create mode 100644 package/libpng12/libpng12.mk
 create mode 100644 package/mesa3d-demos/Config.in
 create mode 100644 package/mesa3d-demos/mesa3d-demos-optional-gl.patch
 create mode 100644 package/mesa3d-demos/mesa3d-demos.mk
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
