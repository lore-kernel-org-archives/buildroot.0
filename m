From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  3 Apr 2014 21:00:55 +0200
Subject: [Buildroot] [PATCH v4 00/37] XBMC Gotham Beta3 + misc stuff
Message-ID: <1396551692-12371-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

-----------------------------
Changelog:
v3: - rebased
    - removed flac version bump (Gustavo)
    - removed libfs version bump https://github.com/OpenELEC/OpenELEC.tv/commit/b55859
-----------------------------

this series replaces mondays patch series "[PATCH 00/16] XBMC Gotham Beta3".

patches 1-12: unrelated version bumps
patches 13-14: Kconfig comments
patches 15-20: Add virtual package for full-openGL (branch yem/fixes)
               (Yann, deprecated, but working - DO NOT COMMIT)
patches 21-26: new packages needed for xbmc, especially for intel support
patch 27: v5 of xdriver_xf86-video-intel version bump
patch 28: WIP - Add xbmc-send script to send commands to xbmc
patch 29: rebased http://patchwork.ozlabs.org/patch/334971/ (Ryan)
patches 30-37: WIP - xbmc version bump to Gotham Beta3 with uClibc support
               http://xbmc.org/xbmc-13-0-gotham-beta-3-returns/

I consider patches 1-14, 21-27 & 29 git-ready.

Regards, Bernd


Bernd Kuhls (31):
  pixman: Version bump 0.32.4
  xlib_xtrans: Version bump 1.3.4
  xapp_xauth: version bump 1.0.9
  file: Version bump 5.18
  flex: Version bump 2.5.39
  sqlite: Version bump 3.8.4.2
  libcdio: version bump 0.92
  libmodplug: version bump 0.8.8.5
  libogg: version bump 1.3.1
  taglib: version bump 1.9.1
  nasm: version bump 2.11.02
  php: version bump 5.5.11
  libdrm: Explain dependency on xorg in Kconfig
  mesa3d: Explain dependency for i965 DRI driver on xorg in Kconfig
  libva: new package
  libva-intel-driver: new package
  ffmpeg: Add libva support
  libglu: new package
  libglew: new package
  sdl: Add new dependency libglu for opengl support
  xdriver_xf86-video-intel: Bump version to 2.99.911
  xbmc: Add xbmc-send script to send commands to xbmc service
  [v3] xbmc: needs host-gawk
  WIP: xbmc: Bump version to Gotham_beta3
  WIP: xbmc: Allow compilation with uClibc
  WIP: xbmc: Add X.org support
  WIP: xbmc: Add VA-API support
  WIP: xbmc: Add alsa support
  WIP: xbmc: Add lame support
  WIP: xbmc: Disable broken rsxs screensaver
  WIP: xbmc: Add option for Goom screensaver

Yann E. MORIN (6):
  DO NOT COMMIT - package/libevas: quick fix to get rid of circular
    deps
  DO NOT COMMIT - package/libgl: introduce as a new virtual package for
    full-openGL providers
  DO NOT COMMIT - package/mesa3d: is a full-openGL provider if X.org is
    present
  DO NOT COMMIT - package/vlc: depends on the virtual package libgl
  DO NOT COMMIT - package/x11-video-drivers: do not select, but depends
    on mesa3d
  DO NOT COMMIT - package/xorg-server: do not force-select xf86driproto
    for mesa3d

 package/Config.in                                  |    4 +
 package/efl/libevas/Config.in                      |    2 +-
 package/ffmpeg/ffmpeg.mk                           |    8 +-
 package/file/file.mk                               |    2 +-
 package/flex/flex-prog-ar.patch                    |   11 ---
 package/flex/flex.mk                               |    2 +-
 package/libcdio/libcdio.mk                         |    2 +-
 package/libdrm/Config.in                           |    3 +
 package/libglew/Config.in                          |   19 +++++
 package/libglew/libglew-0001-lib64.patch           |   14 ++++
 package/libglew/libglew.mk                         |   40 ++++++++++
 package/libglu/Config.in                           |   10 +++
 package/libglu/libglu.mk                           |   19 +++++
 package/libmodplug/libmodplug.mk                   |    2 +-
 package/libogg/libogg.mk                           |    2 +-
 package/libva-intel-driver/Config.in               |   13 +++
 package/libva-intel-driver/libva-intel-driver.mk   |   13 +++
 package/libva/Config.in                            |   12 +++
 package/libva/libva.mk                             |   59 ++++++++++++++
 package/mesa3d/Config.in                           |    7 ++
 package/nasm/nasm.mk                               |    2 +-
 package/opengl/Config.in                           |    1 +
 package/opengl/libgl/Config.in                     |    6 ++
 package/opengl/libgl/libgl.mk                      |   16 ++++
 package/php/php.mk                                 |    2 +-
 package/pixman/pixman-01-loongson-cflags.patch     |   38 ---------
 package/pixman/pixman.mk                           |    2 +-
 package/sdl/sdl.mk                                 |    6 +-
 package/sqlite/sqlite.mk                           |    2 +-
 package/taglib/taglib.mk                           |    4 +-
 package/vlc/vlc.mk                                 |    4 +-
 package/x11r7/xapp_xauth/xapp_xauth.mk             |    2 +-
 package/x11r7/xdriver_xf86-video-ati/Config.in     |    5 +-
 package/x11r7/xdriver_xf86-video-glint/Config.in   |    5 +-
 package/x11r7/xdriver_xf86-video-intel/Config.in   |   18 +++--
 .../xdriver_xf86-video-intel.mk                    |   31 ++++++--
 package/x11r7/xdriver_xf86-video-mach64/Config.in  |    3 +
 package/x11r7/xdriver_xf86-video-mga/Config.in     |    5 +-
 .../x11r7/xdriver_xf86-video-openchrome/Config.in  |    5 +-
 package/x11r7/xdriver_xf86-video-r128/Config.in    |    5 +-
 package/x11r7/xdriver_xf86-video-savage/Config.in  |    5 +-
 package/x11r7/xdriver_xf86-video-sis/Config.in     |    5 +-
 package/x11r7/xdriver_xf86-video-tdfx/Config.in    |    5 +-
 package/x11r7/xdriver_xf86-video-vmware/Config.in  |    5 +-
 package/x11r7/xlib_xtrans/xlib_xtrans.mk           |    2 +-
 package/x11r7/xserver_xorg-server/Config.in        |    1 -
 package/xbmc/Config.in                             |   43 +++++++---
 package/xbmc/xbmc.mk                               |   84 +++++++++++++++++---
 48 files changed, 443 insertions(+), 113 deletions(-)
 delete mode 100644 package/flex/flex-prog-ar.patch
 create mode 100644 package/libglew/Config.in
 create mode 100644 package/libglew/libglew-0001-lib64.patch
 create mode 100644 package/libglew/libglew.mk
 create mode 100644 package/libglu/Config.in
 create mode 100644 package/libglu/libglu.mk
 create mode 100644 package/libva-intel-driver/Config.in
 create mode 100644 package/libva-intel-driver/libva-intel-driver.mk
 create mode 100644 package/libva/Config.in
 create mode 100644 package/libva/libva.mk
 create mode 100644 package/opengl/libgl/Config.in
 create mode 100644 package/opengl/libgl/libgl.mk
 delete mode 100644 package/pixman/pixman-01-loongson-cflags.patch

-- 
1.7.10.4
