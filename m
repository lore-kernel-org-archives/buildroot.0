From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 28 May 2014 13:08:47 +0200
Subject: [Buildroot] [PATCH 0/30 v11] xbmc: bump version to 13.1 (branch
	yem/bernd/xbmc-10)
Message-ID: <cover.1401274944.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

This is version 11 of the XBMC bump to Gotham, initiated by Bernd.

This version reorders the series so that we can quickly bump XBMC, to
keep an iso-functional setup (mostly: on the Raspberry Pi), then new
required packages and dependencies, to finally enable building XBMC
on a full-openGL capable system.

I'm a bit disapointed I did not find enough free time to test the x86 +
full-openGL side of the series, but the bump in itself is already a good
thing.

Kudos to Bernd for the initial work (and conscencious re-spins when
asked to) :-)

Changes v10 -> v11:
  - series re-ordering
  - add new required gconv-related patch (to be discussed)
  - some commit logs massaging

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


Regards,
Yann E. MORIN.


The following changes since commit fe823b63741ba8eca70a534207d655f5affa927c:

  dropbear: fix missing directory with systemd (2014-05-28 10:01:44 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/bernd/xbmc-10

for you to fetch changes up to 3a8332b3d4dd4c21f13e4f7de796cb4da39e69cd:

  xbmc: Add VA-API support (2014-05-28 11:42:26 +0200)

----------------------------------------------------------------
Bernd Kuhls (29):
      xbmc: add host-gettext dependency
      xbmc: add host-nasm dependency
      xbmc: add host-yasm dependency for MMX/64bit archs
      xbmc: add missing egl-related cflags
      xbmc: hdmi cec supports needs udev for device scanning
      xbmc: bump version to 13.1-RC1
      xbmc-pvr-addons: bump to a version compatible with XBMC Gotham
      xbmc-addon-xvdr: bump to a version compatible with XBMC Gotham
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
      xbmc: Allow compilation with uClibc
      xbmc: Add alsa support
      xbmc: Add lame support
      xbmc: Fix TexturePacker compile
      xbmc: Add X.org/OpenGL support
      xbmc: Add option for Goom screensaver
      xbmc: Add VA-API support

Yann E. MORIN (1):
      toolchain: add option to copy the gconv libraries

 Makefile                                           |   6 +
 package/Config.in                                  |   4 +
 package/ffmpeg/ffmpeg.mk                           |   8 +-
 package/libglew/Config.in                          |  19 ++
 package/libglew/libglew.mk                         |  36 ++++
 package/libglu/Config.in                           |  10 +
 package/libglu/libglu.mk                           |  17 ++
 package/libva-intel-driver/Config.in               |  19 ++
 package/libva-intel-driver/libva-intel-driver.mk   |  29 +++
 package/libva/Config.in                            |  18 ++
 package/libva/libva-0001-no_test_decode.patch      |  17 ++
 package/libva/libva.mk                             |  56 ++++++
 package/libxml2/Config.in                          |   3 -
 package/libxml2/libxml2-python2.patch              |  27 ---
 package/libxml2/libxml2.mk                         |  16 +-
 package/mesa3d/Config.in                           |  24 +--
 .../mesa3d-0002-dri2-does-not-need-udev.patch      |  25 +++
 package/mesa3d/mesa3d.mk                           |  27 ++-
 package/sdl/sdl.mk                                 |   3 +-
 package/x11r7/Config.in                            |   1 +
 package/x11r7/xdriver_xf86-video-intel/Config.in   |   5 +-
 .../xdriver_xf86-video-intel.mk                    |  27 ++-
 package/x11r7/xproto_dri3proto/Config.in           |   4 +
 package/x11r7/xproto_dri3proto/xproto_dri3proto.mk |  16 ++
 .../xbmc-addon-xvdr-0001-foreign-automake.patch    |  28 ---
 package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk         |   7 +-
 package/xbmc-pvr-addons/xbmc-pvr-addons.mk         |   7 +-
 package/xbmc/Config.in                             |  59 +++++-
 package/xbmc/xbmc-0002-mathutil.patch              | 213 +++++++++++++++++++++
 package/xbmc/xbmc.mk                               |  89 +++++++--
 toolchain/toolchain-common.in                      |  10 +
 31 files changed, 698 insertions(+), 132 deletions(-)
 create mode 100644 package/libglew/Config.in
 create mode 100644 package/libglew/libglew.mk
 create mode 100644 package/libglu/Config.in
 create mode 100644 package/libglu/libglu.mk
 create mode 100644 package/libva-intel-driver/Config.in
 create mode 100644 package/libva-intel-driver/libva-intel-driver.mk
 create mode 100644 package/libva/Config.in
 create mode 100644 package/libva/libva-0001-no_test_decode.patch
 create mode 100644 package/libva/libva.mk
 delete mode 100644 package/libxml2/libxml2-python2.patch
 create mode 100644 package/mesa3d/mesa3d-0002-dri2-does-not-need-udev.patch
 create mode 100644 package/x11r7/xproto_dri3proto/Config.in
 create mode 100644 package/x11r7/xproto_dri3proto/xproto_dri3proto.mk
 delete mode 100644 package/xbmc-addon-xvdr/xbmc-addon-xvdr-0001-foreign-automake.patch
 create mode 100644 package/xbmc/xbmc-0002-mathutil.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
