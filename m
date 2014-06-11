From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 11 Jun 2014 23:08:33 +0200
Subject: [Buildroot] =?utf-8?q?=5BPATCH_v13_00/19=5D_xbmc=3A_Add_support_f?=
	=?utf-8?q?or_uClibc_and_additional_packages?=
Message-ID: <1402520932-26672-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The series is compiled-tested using

BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_XBMC=y
BR2_PACKAGE_XBMC_AVAHI=y
BR2_PACKAGE_XBMC_DBUS=y
BR2_PACKAGE_XBMC_LIBBLURAY=y
BR2_PACKAGE_XBMC_LIBMICROHTTPD=y
BR2_PACKAGE_XBMC_LIBNFS=y
BR2_PACKAGE_XBMC_RTMPDUMP=y
BR2_PACKAGE_XBMC_LIBSHAIRPLAY=y
BR2_PACKAGE_XBMC_LIBSMBCLIENT=y
BR2_PACKAGE_XBMC_LIBTHEORA=y
BR2_PACKAGE_XBMC_LIBUSB=y
BR2_PACKAGE_XBMC_WAVPACK=y
BR2_PACKAGE_XBMC_GOOM=y
BR2_PACKAGE_XBMC_ADDON_XVDR=y
BR2_PACKAGE_XBMC_PVR_ADDONS=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR=y
BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL=y

Regards, Bernd

v13: - rebased
     - lots of patches removed after they were committed
v12: - rebased (no more RC versions ;))
     - bump xbmc to 13.1
       - github helper produces a wrong URL
         (wrong: xbmc-13.1-Gotham.tar.gz, correct: 13.1-Gotham.tar.gz),
         so I had to switch to _SOURCE until a fix is found
     - bump mesa3d version to 10.2.1
v11: - patch series updated by Yann
       - series re-ordering
       - add new required gconv-related patch
       - some commit logs massaging
v10: - reworked patch series based on comments by Yann
       - added comment to xproto_dri3proto
       - removed emtpy line from libva
       - added comment to libglu
     - fix libpng support in xbmc????s rsxs screensaver
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


Bernd Kuhls (19):
  mesa3d: Depend on xorg meta package instead of xserver_xorg-server
  mesa3d: Remove dependency for the libxml2 module of host-python
  mesa3d: Add dri3 support
  mesa3d: add dependency xproto_presentproto
  libva: new package
  libva-intel-driver: new package
  ffmpeg: Add libva support
  libglu: new package
  sdl: Add new dependency libglu for opengl support
  libglew: new package
  xdriver_xf86-video-intel: Bump version to 2.99.911
  xbmc: Add missing egl-related cflags
  xbmc: Allow compilation with uClibc
  xbmc: Add alsa support
  xbmc: Add lame support
  xbmc: Fix TexturePacker compile
  xbmc: Add X.org/OpenGL support
  xbmc: Add option for Goom screensaver
  xbmc: Add VA-API support

-- 
1.7.10.4
