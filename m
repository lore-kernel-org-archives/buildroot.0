From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 31 Mar 2014 22:06:13 +0200
Subject: [Buildroot] [PATCH 00/16] XBMC Gotham Beta3
Message-ID: <1396296389-28821-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this patch series replaces yesterdays patch series 1-8/8.

patches 1-5: unrelated version bumps
patch 6: Kconfig comment for libdrm
patch 7: v4 of xdriver_xf86-video-intel version bump
patches 8-13: new packages needed for xbmc, especially for intel support
patch 14: first try to create an opengl virtual package
patch 15: WIP - xbmc version bump to Gotham Beta3 with uClibc support
                http://xbmc.org/xbmc-13-0-gotham-beta-3-returns/
          this patch includes the host-gawk patch:
          http://patchwork.ozlabs.org/patch/334971/
patch 16: WIP - Add xbmc-send script to send commands to xbmc

I consider patches 1-13 git-ready, for the rest I am waiting for feedback ;)

Regards, Bernd


Bernd Kuhls (16):
  pixman: Version bump 0.32.4
  xlib_xtrans: Version bump 1.3.4
  file: Version bump 5.18
  flex: Version bump 2.5.39
  sqlite: Version bump 3.8.4.2
  libdrm: Explain dependency on xorg in Kconfig
  xdriver_xf86-video-intel: Bump version to 2.99.911
  libva: new package
  libva-intel-driver: new package
  ffmpeg: Add libva support
  libglu: new package
  libglew: new package
  sdl: Add new dependency libglu for opengl support
  opengl: New virtual package
  xbmc: Bump version to Gotham_beta3
  xbmc: Add xbmc-send script to send commands to xbmc service

 package/Config.in                                  |    4 +
 package/ffmpeg/ffmpeg.mk                           |    8 +-
 package/file/file.mk                               |    2 +-
 package/flex/flex-prog-ar.patch                    |   11 ---
 package/flex/flex.mk                               |    2 +-
 package/libdrm/Config.in                           |    3 +
 package/libglew/Config.in                          |   19 +++++
 package/libglew/libglew-0001-lib64.patch           |   14 ++++
 package/libglew/libglew.mk                         |   40 ++++++++++
 package/libglu/Config.in                           |   10 +++
 package/libglu/libglu.mk                           |   19 +++++
 package/libva-intel-driver/Config.in               |   13 ++++
 package/libva-intel-driver/libva-intel-driver.mk   |   13 ++++
 package/libva/Config.in                            |   12 +++
 package/libva/libva.mk                             |   59 +++++++++++++++
 package/mesa3d/Config.in                           |    4 +
 package/opengl/Config.in                           |    1 +
 package/opengl/libgl/Config.in                     |    6 ++
 package/opengl/libgl/libgl.mk                      |   16 ++++
 package/pixman/pixman-01-loongson-cflags.patch     |   38 ----------
 package/pixman/pixman.mk                           |    2 +-
 package/sdl/sdl.mk                                 |    6 +-
 package/sqlite/sqlite.mk                           |    2 +-
 package/x11r7/xdriver_xf86-video-intel/Config.in   |   13 ++--
 .../xdriver_xf86-video-intel.mk                    |   31 ++++++--
 package/x11r7/xlib_xtrans/xlib_xtrans.mk           |    2 +-
 package/xbmc/Config.in                             |   26 ++++---
 package/xbmc/xbmc.mk                               |   79 +++++++++++++++++---
 28 files changed, 364 insertions(+), 91 deletions(-)
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
