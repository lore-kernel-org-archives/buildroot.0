From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 29 Mar 2014 21:56:04 +0100
Subject: [Buildroot] [PATCH 00/91] Update mesa3d & xorg
Message-ID: <BLU0-SMTP39628D1C21A39FA8BD40475D9610@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this is a follow-up patch to replace v8 of my last patch series which
updated only mesa3d and xserver_xorg-server.

This patch includes and replaces the forementioned patch series and
catches, hopefully, all version bumps for xorg packages. Some packages
had to be patched for compatability with xorg-server 1.15, these patches
were mostly taken from upstream.

Regards, Bernd


*** BLURB HERE ***

Bernd Kuhls (91):
  mesa3d: pull out from x11
  mesa3d: modularize and bump to version 10.0.4
  xorg: Bump xserver_xorg-server version to 1.15.0
  pkgconf: rewrite variable sdkdir, needed by xdriver_xf86-video-intel
  xdriver_xf86-video-intel: Bump version to 2.99.911
  Remove package xdriver_xf86-video-newport
  xlib_libFS: Bump version to 1.0.6
  xutil_util-macros: Bump version to 1.19.0
  xcb-util-wm: Bump version to 0.4.1
  xdriver_xf86-input-evdev: Bump version to 2.8.2
  xdriver_xf86-input-joystick: Bump version to 1.6.2
  xdriver_xf86-input-keyboard: Bump version to 1.8.0
  xdriver_xf86-input-mouse: Bump version to 1.9.0
  xdriver_xf86-input-synaptics: Bump version to 1.7.4
  xdriver_xf86-input-vmmouse: Bump version to 13.0.0
  xdriver_xf86-video-vmware: Bump version to 13.0.2, add mesa3d
    dependency
  xdriver_xf86-video-ast: Bump version to 0.99.9
  xdriver_xf86-video-mga: Bump version to 1.6.3
  xdriver_xf86-video-r128: Bump version to 6.9.2
  xdriver_xf86-video-savage: Bump version to 2.3.7
  xdriver_xf86-video-fbdev: Bump version to 0.4.4
  xdriver_xf86-video-geode: Bump version to 2.11.15
  xdriver_xf86-video-glide: Bump version to 1.2.2
  xdriver_xf86-video-vesa: Bump version to 2.3.3
  xdriver_xf86-video-dummy: Bump version to 0.3.7
  xdriver_xf86-video-neomagic: Bump version to 1.2.8
  xdriver_xf86-video-openchrome: Bump version to 0.3.3
  xdriver_xf86-video-cirrus: Bump version to 1.5.2
  xdriver_xf86-video-mach64: Bump version to 6.9.4, add correct mesa3d
    dependency
  xdriver_xf86-video-nv: Bump version to 2.1.20
  xdriver_xf86-video-voodoo: Bump version to 1.2.5
  xdriver_xf86-video-trident: Bump version to 1.3.6
  xdriver_xf86-video-tga: Bump version to 1.2.2
  xdriver_xf86-video-tdfx: Bump version to 1.4.5
  xdriver_xf86-video-sis: Bump version to 0.10.7
  xdriver_xf86-video-siliconmotion: Bump version to 1.7.7
  xdriver_xf86-video-i128: Bump version to 1.3.6
  xdriver_xf86-video-glint: Bump version to 1.2.8
  xdriver_xf86-video-ark: Bump version to 0.7.5
  xdriver_xf86-video-ati: Version bump 6.14.6
  xapp_xrandr: Bump version to 1.4.2
  xapp_xauth: Bump version to 1.0.8
  xapp_xbacklight: Bump version to 1.2.1
  xapp_xrdb: Bump version to 1.1.0
  xapp_xmodmap: Bump version to 1.0.8
  xapp_xlsclients: Bump version to 1.1.3
  xapp_xkill: Bump version to 1.0.4
  xapp_xinit: Bump version to 1.3.3
  xapp_xclock: Bump version to 1.0.7
  xapp_xman: Bump version to 1.1.3
  xapp_xwd: Bump version to 1.0.6
  xapp_xset: Bump version to 1.2.3
  xapp_xprop: Bump version to 1.2.2
  xapp_xload: Bump version to 1.1.2
  xapp_iceauth: Bump version to 1.0.6
  xapp_xhost: Bump version to 1.0.6
  xapp_xfd: Bump version to 1.1.2
  xapp_mkfontscale: Bump version to 1.1.1
  xapp_xdpyinfo: Bump version to 1.3.1
  xapp_bitmap: Bump version to 1.0.7
  xapp_xwininfo: Bump version to 1.1.3
  xapp_xrefresh: Bump version to 1.0.5
  xapp_xfontsel: Bump version to 1.0.5
  xapp_appres: Bump version to 1.0.4
  xapp_xfs: Bump version to 1.1.3
  xapp_sessreg: Bump version to 1.0.8
  xapp_twm: Bump version to 1.0.8
  xapp_rstart: Bump version to 1.0.5
  xapp_xvinfo: Bump version to 1.1.2
  xapp_xstdcmap: Bump version to 1.0.3
  xapp_xsm: Bump version to 1.0.3
  xapp_xkbutils: Bump version to 1.0.4
  xapp_xfsinfo: Bump version to 1.0.4
  xapp_xev: Bump version to 1.2.1
  xapp_xsetroot: Bump version to 1.1.1
  xapp_rgb: Bump version to 1.0.5
  xapp_ico: Bump version to 1.0.4
  xapp_xcalc: Bump version to 1.0.5
  xapp_beforelight: Bump version to 1.0.5
  xapp_bdftopcf: Bump version to 1.0.4
  xapp_xvidtune: Bump version to 1.0.3
  xapp_xmessage: Bump version to 1.0.4
  xapp_xmag: Bump version to 1.0.5
  xapp_xgc: Bump version to 1.0.4
  xapp_xditview: Bump version to 1.0.3
  xapp_viewres: Bump version to 1.0.4
  xapp_showfont: Bump version to 1.0.4
  xapp_editres: Bump version to 1.0.6
  xapp_fstobdf: Bump version to 1.0.5
  xapp_fslsfonts: Bump version to 1.0.4
  xapp_xlsfonts: Bump version to 1.0.4

 package/Config.in                                  |    1 +
 package/mesa3d/Config.in                           |  118 +++++++++++++++++++
 package/mesa3d/mesa3d.mk                           |  119 ++++++++++++++++++++
 ...ariable.patch => pkgconf-01-fix-variable.patch} |    4 +-
 package/x11r7/Config.in                            |    2 -
 package/x11r7/mesa3d/Config.in                     |   14 ---
 package/x11r7/mesa3d/mesa3d-uclibc-locale.patch    |   56 ---------
 package/x11r7/mesa3d/mesa3d.mk                     |   40 -------
 package/x11r7/xapp_appres/xapp_appres.mk           |    2 +-
 package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk       |    2 +-
 package/x11r7/xapp_beforelight/xapp_beforelight.mk |    2 +-
 package/x11r7/xapp_bitmap/xapp_bitmap.mk           |    2 +-
 package/x11r7/xapp_editres/xapp_editres.mk         |    2 +-
 package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk     |    2 +-
 package/x11r7/xapp_fstobdf/xapp_fstobdf.mk         |    2 +-
 package/x11r7/xapp_iceauth/xapp_iceauth.mk         |    2 +-
 package/x11r7/xapp_ico/xapp_ico.mk                 |    2 +-
 package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk |    2 +-
 package/x11r7/xapp_rgb/xapp_rgb.mk                 |    2 +-
 package/x11r7/xapp_rstart/xapp_rstart.mk           |    2 +-
 package/x11r7/xapp_sessreg/xapp_sessreg.mk         |    2 +-
 package/x11r7/xapp_showfont/xapp_showfont.mk       |    2 +-
 package/x11r7/xapp_twm/xapp_twm.mk                 |    2 +-
 package/x11r7/xapp_viewres/xapp_viewres.mk         |    2 +-
 package/x11r7/xapp_xauth/xapp_xauth.mk             |    2 +-
 package/x11r7/xapp_xbacklight/xapp_xbacklight.mk   |    4 +-
 package/x11r7/xapp_xcalc/xapp_xcalc.mk             |    2 +-
 package/x11r7/xapp_xclock/xapp_xclock.mk           |    2 +-
 package/x11r7/xapp_xditview/xapp_xditview.mk       |    2 +-
 package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk       |    2 +-
 package/x11r7/xapp_xev/xapp_xev.mk                 |    2 +-
 package/x11r7/xapp_xfd/xapp_xfd.mk                 |    2 +-
 package/x11r7/xapp_xfontsel/xapp_xfontsel.mk       |    2 +-
 package/x11r7/xapp_xfs/xapp_xfs.mk                 |    2 +-
 package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk         |    2 +-
 .../xapp_xgc/xapp_xgc-replace-ac-check-file.patch  |   29 -----
 package/x11r7/xapp_xgc/xapp_xgc.mk                 |    3 +-
 package/x11r7/xapp_xhost/xapp_xhost.mk             |    2 +-
 package/x11r7/xapp_xinit/xapp_xinit.mk             |    2 +-
 package/x11r7/xapp_xkbutils/xapp_xkbutils.mk       |    2 +-
 package/x11r7/xapp_xkill/xapp_xkill.mk             |    2 +-
 package/x11r7/xapp_xload/xapp_xload.mk             |    2 +-
 package/x11r7/xapp_xlsclients/xapp_xlsclients.mk   |    2 +-
 package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk       |    2 +-
 package/x11r7/xapp_xmag/xapp_xmag.mk               |    2 +-
 package/x11r7/xapp_xman/xapp_xman.mk               |    5 +-
 package/x11r7/xapp_xmessage/xapp_xmessage.mk       |    2 +-
 .../x11r7/xapp_xmodmap/xapp_xmodmap-asprintf.patch |   69 ------------
 package/x11r7/xapp_xmodmap/xapp_xmodmap.mk         |    4 +-
 package/x11r7/xapp_xprop/xapp_xprop.mk             |    2 +-
 package/x11r7/xapp_xrandr/xapp_xrandr.mk           |    2 +-
 package/x11r7/xapp_xrdb/xapp_xrdb.mk               |    2 +-
 package/x11r7/xapp_xrefresh/xapp_xrefresh.mk       |    2 +-
 package/x11r7/xapp_xset/xapp_xset.mk               |    2 +-
 package/x11r7/xapp_xsetroot/xapp_xsetroot.mk       |    2 +-
 package/x11r7/xapp_xsm/xapp_xsm.mk                 |    2 +-
 package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk       |    2 +-
 package/x11r7/xapp_xvidtune/xapp_xvidtune.mk       |    2 +-
 package/x11r7/xapp_xvinfo/xapp_xvinfo.mk           |    2 +-
 package/x11r7/xapp_xwd/xapp_xwd.mk                 |    2 +-
 package/x11r7/xapp_xwininfo/xapp_xwininfo.mk       |    2 +-
 package/x11r7/xcb-util-wm/xcb-util-wm.mk           |    2 +-
 .../xdriver_xf86-input-evdev.mk                    |    2 +-
 .../xdriver_xf86-input-joystick.mk                 |    2 +-
 .../xdriver_xf86-input-keyboard.mk                 |    2 +-
 .../xdriver_xf86-input-mouse.mk                    |    2 +-
 .../xdriver_xf86-input-synaptics.mk                |    2 +-
 .../xdriver_xf86-input-vmmouse.mk                  |    2 +-
 .../xdriver_xf86-video-ark-0001-mibstore.patch     |   40 +++++++
 .../xdriver_xf86-video-ark.mk                      |    2 +-
 .../xdriver_xf86-video-ast.mk                      |    2 +-
 .../xdriver_xf86-video-ati-0001-noxaa.patch        |   17 +++
 .../xdriver_xf86-video-ati-0002-mibstore.patch     |   33 ++++++
 ...iver_xf86-video-ati-0003-DamageUnregister.patch |   28 +++++
 .../xdriver_xf86-video-ati.mk                      |    3 +-
 .../xdriver_xf86-video-cirrus.mk                   |    2 +-
 .../xdriver_xf86-video-dummy.mk                    |    2 +-
 .../xdriver_xf86-video-fbdev.mk                    |    2 +-
 .../xdriver_xf86-video-geode-0001-include.patch    |   17 +++
 .../xdriver_xf86-video-geode.mk                    |    2 +-
 .../xdriver_xf86-video-glide.mk                    |    2 +-
 .../xdriver_xf86-video-glint-0001-mbstring.patch   |   35 ++++++
 .../xdriver_xf86-video-glint.mk                    |    2 +-
 .../xdriver_xf86-video-i128-0001-mbstring.patch    |   35 ++++++
 .../xdriver_xf86-video-i128.mk                     |    2 +-
 package/x11r7/xdriver_xf86-video-intel/Config.in   |   15 ++-
 .../xdriver_xf86-video-intel.mk                    |   18 ++-
 package/x11r7/xdriver_xf86-video-mach64/Config.in  |    3 +-
 .../xdriver_xf86-video-mach64.mk                   |    2 +-
 .../xdriver_xf86-video-mga.mk                      |    2 +-
 .../xdriver_xf86-video-neomagic.mk                 |    2 +-
 package/x11r7/xdriver_xf86-video-newport/Config.in |    9 --
 .../xdriver_xf86-video-newport.mk                  |   14 ---
 .../xdriver_xf86-video-nv-0001-mibstore.patch      |   86 ++++++++++++++
 .../xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk |    2 +-
 ...86-video-openchrome-0.2.904-cross-compile.patch |   21 ----
 .../xdriver_xf86-video-openchrome.mk               |    7 +-
 .../xdriver_xf86-video-r128.mk                     |    2 +-
 .../xdriver_xf86-video-savage.mk                   |    2 +-
 ..._xf86-video-siliconmotion-0001-smi_driver.patch |   27 +++++
 .../xdriver_xf86-video-siliconmotion.mk            |    2 +-
 ...tch => xdriver_xf86-video-sis-0001-cross.patch} |    0
 .../xdriver_xf86-video-sis-0002-mibstore.patch     |   34 ++++++
 ...river_xf86-video-sis-0003-xf86UnMapVidMem.patch |   86 ++++++++++++++
 .../xdriver_xf86-video-sis-0004-xf86Priv.patch     |   43 +++++++
 .../xdriver_xf86-video-sis-0005-hvdisplay.patch    |   46 ++++++++
 .../xdriver_xf86-video-sis-0006-fixwarnings.patch  |   67 +++++++++++
 .../xdriver_xf86-video-sis-0007-xi.patch           |   24 ++++
 .../xdriver_xf86-video-sis.mk                      |    2 +-
 ...ch => xdriver_xf86-video-tdfx-0001-cross.patch} |    0
 .../xdriver_xf86-video-tdfx-0002-mibstore.patch    |   36 ++++++
 .../xdriver_xf86-video-tdfx.mk                     |    2 +-
 .../xdriver_xf86-video-tga-0001-mibstore.patch     |   47 ++++++++
 .../xdriver_xf86-video-tga.mk                      |    2 +-
 .../xdriver_xf86-video-trident-0001-mibstore.patch |   34 ++++++
 .../xdriver_xf86-video-trident-0002-xaa.patch      |   39 +++++++
 .../xdriver_xf86-video-trident.mk                  |    2 +-
 .../xdriver_xf86-video-vesa.mk                     |    2 +-
 package/x11r7/xdriver_xf86-video-vmware/Config.in  |    2 +
 .../xdriver_xf86-video-vmware.mk                   |    4 +-
 .../xdriver_xf86-video-voodoo.mk                   |    2 +-
 package/x11r7/xlib_libFS/xlib_libFS.mk             |    2 +-
 package/x11r7/xserver_xorg-server/Config.in        |    1 +
 .../xserver_xorg-server-02-cve-2013-1940.patch     |   34 ------
 ...ut-allocate-enough-space-for-null-charact.patch |   59 ----------
 .../xserver_xorg-server/xserver_xorg-server.mk     |    9 +-
 .../x11r7/xutil_util-macros/xutil_util-macros.mk   |    2 +-
 127 files changed, 1141 insertions(+), 456 deletions(-)
 create mode 100644 package/mesa3d/Config.in
 create mode 100644 package/mesa3d/mesa3d.mk
 rename package/pkgconf/{pkgconf-fix-variable.patch => pkgconf-01-fix-variable.patch} (88%)
 delete mode 100644 package/x11r7/mesa3d/Config.in
 delete mode 100644 package/x11r7/mesa3d/mesa3d-uclibc-locale.patch
 delete mode 100644 package/x11r7/mesa3d/mesa3d.mk
 delete mode 100644 package/x11r7/xapp_xgc/xapp_xgc-replace-ac-check-file.patch
 delete mode 100644 package/x11r7/xapp_xmodmap/xapp_xmodmap-asprintf.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark-0001-mibstore.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati-0001-noxaa.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati-0002-mibstore.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati-0003-DamageUnregister.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode-0001-include.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint-0001-mbstring.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128-0001-mbstring.patch
 delete mode 100644 package/x11r7/xdriver_xf86-video-newport/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk
 create mode 100644 package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv-0001-mibstore.patch
 delete mode 100644 package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome-0.2.904-cross-compile.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion-0001-smi_driver.patch
 rename package/x11r7/xdriver_xf86-video-sis/{xdriver_xf86-video-sis-0.10.0.patch => xdriver_xf86-video-sis-0001-cross.patch} (100%)
 create mode 100644 package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0002-mibstore.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0003-xf86UnMapVidMem.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0004-xf86Priv.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0005-hvdisplay.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0006-fixwarnings.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0007-xi.patch
 rename package/x11r7/xdriver_xf86-video-tdfx/{xdriver_xf86-video-tdfx-1.4.0.patch => xdriver_xf86-video-tdfx-0001-cross.patch} (100%)
 create mode 100644 package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx-0002-mibstore.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga-0001-mibstore.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident-0001-mibstore.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident-0002-xaa.patch
 delete mode 100644 package/x11r7/xserver_xorg-server/xserver_xorg-server-02-cve-2013-1940.patch
 delete mode 100644 package/x11r7/xserver_xorg-server/xserver_xorg-server-03-Revert-kinput-allocate-enough-space-for-null-charact.patch

-- 
1.7.10.4
