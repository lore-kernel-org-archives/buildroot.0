From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 25 May 2014 22:25:53 +0200
Subject: [Buildroot] [PATCH v10 00/29]  xbmc: bump version to 13.1 Beta2
Message-ID: <1401049582-2110-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the patch series combines my latest patches to bump xbmc.
It also adds uClibc support to xbmc, a mesa3d version bump
and several new packages to support the new xbmc release
along with libva to get the best out of Intel systems.

Regards, Bernd

v10: - reworked patch series based on comments by Yann
       - added comment to xproto_dri3proto
       - removed emtpy line from libva
       - added comment to libglu
     - fix libpng support in xbmc?s rsxs screensaver
     - bump mesa3d version to 10.2-rc4
v9: - reworked patch series based on comments by Yann & Arnout:
      - moved some patches before xbmc version bump for bisectability
      - removed iconv patch to SDL, to be checked later
      - removed rtmpdump/KSV patch from series, to be checked later
      - added description to mesa3d/xorg meta package dependency
      - reworked OpenGL/egl+gles logic in package/xbmc/
    - bump xbmc to 13.1 Beta2
    - cec needs udev to be useful
v8: - squashed "[v7 29/31] ffmpeg cross-compile" into
      "[v8 16/28] Gotham bump" (Thomas)
    - squashed "[v7 21/31] uclibc at arm" & "[v7 31/31] ipv6"
      patches into "[v8 20/28] uclibc" patch (Thomas/Yann)
    - xbmc-pvr-addons: updated comment (Yann)
v7: - rebased
    - bump mesa3d version to 10.2-rc3
    - included v2 of "xproto_dri3proto: New package"
v6: - bump mesa3d version to 10.2-rc2
    - bump libva and libva-intel-driver to 1.3.1


Bernd Kuhls (29):
  xproto_dri3proto: New package
  mesa3d: Bump version to 10.2-rc4, fix xa build
  mesa3d: Depend on xorg meta package instead of xserver_xorg-server
  mesa3d: add dependency xproto_presentproto
  mesa3d: Remove dependency for the libxml2 module of host-python
  mesa3d: Add dri3 support
  mesa3d: dri2 does not need udev support
  libva: new package
  libva-intel-driver: new package
  ffmpeg: Add libva support
  libglu: new package
  libglew: new package
  sdl: Add new dependency libglu for opengl support
  xdriver_xf86-video-intel: Bump version to 2.99.911
  xbmc - prepare for 13.x-Gotham: Add host-gettext dependency
  xbmc - prepare for 13.x-Gotham: Add host-nasm dependency
  xbmc - prepare for 13.x-Gotham: Add host-yasm dependency for
    MMX/64bit archs
  xbmc - prepare for 13.x-Gotham: Add missing egl-related cflags
  xbmc: bump version to 13.1 Beta2
  xbmc-pvr-addons: Version bump to xbmc Gotham-compatible addon
  xbmc-addon-xvdr: Version bump to xbmc Gotham-compatible addon
  xbmc: hdmi cec supports needs udev for device scanning
  xbmc: Allow compilation with uClibc
  xbmc: Add alsa support
  xbmc: Add lame support
  xbmc: Fix TexturePacker compile
  xbmc: Add X.org/OpenGL support
  xbmc: Add option for Goom screensaver
  xbmc: Add VA-API support

 package/Config.in                                  |    1 -
 package/libdrm/Config.in                           |    1 -
 package/libmms/Config.in                           |    8 +
 package/libmms/libmms.mk                           |    4 +-
 package/libudev/Config.in                          |    9 -
 package/libudev/libudev-0001-locale.patch          |   29 -
 package/libudev/libudev-0002-getenv.patch          |   23 -
 package/libudev/libudev-0003-clock.patch           |   42 -
 package/libudev/libudev.mk                         |   71 -
 package/python/python-110-optional-db.patch        |    2 +-
 package/rtmpdump/rtmpdump-0001-ksv.patch           | 3397 --------------------
 ...transmission-02-fix-cxx-check-with-ccache.patch |   44 +
 package/transmission/transmission.mk               |    2 +-
 package/x11r7/xlib_libXfont/xlib_libXfont.mk       |    2 +-
 14 files changed, 57 insertions(+), 3578 deletions(-)
 delete mode 100644 package/libudev/Config.in
 delete mode 100644 package/libudev/libudev-0001-locale.patch
 delete mode 100644 package/libudev/libudev-0002-getenv.patch
 delete mode 100644 package/libudev/libudev-0003-clock.patch
 delete mode 100644 package/libudev/libudev.mk
 delete mode 100644 package/rtmpdump/rtmpdump-0001-ksv.patch
 create mode 100644 package/transmission/transmission-02-fix-cxx-check-with-ccache.patch

-- 
1.7.10.4
