From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  1 May 2014 20:17:49 +0200
Subject: [Buildroot] [PATCH 0/8] mesa3d version bump, fix xbmc compile errors
Message-ID: <1398968277-9044-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

testing this defconfig

BR2_TOOLCHAIN_EXTERNAL=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_XBMC=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y

several compile errors happened, this patch series should fix them. Please note
that the compile errors also happen with mesa3d 10.0.4, the version is unrelated
but removes the ugly BR2_PACKAGE_HOST_LIBXML2_PYTHON hack.

Regards, Bernd


Bernd Kuhls (8):
  mesa3d: Bump version to 10.1.1
  mesa3d: Depend on xorg meta package instead of xserver_xorg-server
  mesa3d: compile fixes
  xbmc: add nasm/yasm dependency
  mesa3d: Remove dependency for the libxml2 module of host-python
  xbmc: Fix ffmpeg cross compile
  xbmc: Add -DMESA_EGL_NO_X11_HEADERS to cflags to fix compile without
    X.org
  xbmc: Fix TexturePacker compile

 package/libxml2/Config.in                          |    3 -
 package/libxml2/libxml2-python2.patch              |   27 -
 package/libxml2/libxml2.mk                         |   14 -
 package/mesa3d/Config.in                           |   23 +-
 package/mesa3d/mesa3d-0002-gbm-without-dri.patch   |   31 +
 package/mesa3d/mesa3d-0003-shared-glapi.patch      |   57 ++
 package/mesa3d/mesa3d-0004-no_python_libxml2.patch |  699 ++++++++++++++++++++
 package/mesa3d/mesa3d.mk                           |    9 +-
 package/xbmc/xbmc.mk                               |    8 +
 9 files changed, 810 insertions(+), 61 deletions(-)
 delete mode 100644 package/libxml2/libxml2-python2.patch
 create mode 100644 package/mesa3d/mesa3d-0002-gbm-without-dri.patch
 create mode 100644 package/mesa3d/mesa3d-0003-shared-glapi.patch
 create mode 100644 package/mesa3d/mesa3d-0004-no_python_libxml2.patch

-- 
1.7.10.4
