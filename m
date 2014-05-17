From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 17 May 2014 17:57:28 +0200
Subject: [Buildroot] [PATCH v8 00/28] xbmc: bump version to 13.0-Gotham
Message-ID: <1400342276-10303-1-git-send-email-bernd.kuhls@t-online.de>
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


Bernd Kuhls (28):
  xproto_dri3proto: New package
  mesa3d: Bump version to 10.2-rc3
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
  rtmpdump: Add KSV patch
  xbmc: bump version to 13.0
  xbmc-pvr-addons: Version bump to xbmc Gotham-compatible addon
  xbmc-addon-xvdr: Version bump to xbmc Gotham-compatible addon
  xbmc: Add host-gettext dependency
  xbmc: Allow compilation with uClibc
  xbmc: Add X.org/OpenGL support
  xbmc: Add VA-API support
  xbmc: Add alsa support
  xbmc: Add lame support
  xbmc: Disable broken rsxs screensaver
  xbmc: Add option for Goom screensaver
  xbmc: add nasm/yasm dependency
  xbmc: Fix TexturePacker compile

 package/libdrm/Config.in                           |    1 -
 package/x11r7/xlib_libXfont/xlib_libXfont.mk       |    2 +-
 .../xlib_libXpm/xlib_libXpm-0001-detect-fork.patch |   66 --------------------
 package/x11r7/xlib_libXpm/xlib_libXpm.mk           |    1 -
 4 files changed, 1 insertion(+), 69 deletions(-)
 delete mode 100644 package/x11r7/xlib_libXpm/xlib_libXpm-0001-detect-fork.patch

-- 
1.7.10.4
