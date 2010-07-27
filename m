From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 16:46:09 +0200
Subject: [Buildroot] [pull request] Pull request for branch various-bumps
Message-ID: <cover.1280241791.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This stack of patches does a number of things :

 * Bumps WebKit/Midori/Cairo/Glib/ATK/Pango/libsoup

 * Adds a new libgail package, which is a new dependency of WebKit

 * Solves bug #1051 (webkit build issue), #1405 (webkit build issue),
   #829 (webkit build issue) and probably #1741 (gettext build issue,
   but rather related to the toolchain)

 * Fixes the build of icu after changes to the definition of
   TARGET_CXX that have been merged some time ago.

Thanks,

Thomas

The following changes since commit 3435c1afb58307240be8e4607b5bb7d239fac4e9:
  Peter Korsgaard (1):
        kconfig: implement KCONFIG_PROBABILITY for rand{,package}config

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot various-bumps

Lionel Landwerlin (4):
      libglib2: bump to 2.24.0
      atk: bump to 1.30
      pango: bump to 1.28
      package: add libgail package

Thomas Petazzoni (12):
      webkit: bump to webkitgtk 1.2.3
      midori: bump to 0.2.6
      icu: add quotes around TARGET_CXX
      cairo: bump to 1.8.10
      libsoup: bump version to 2.31.2
      xkeyboard-config: add dependency on host-xapp_xkbcomp
      xserver: tell the X server where fonts are installed
      xserver: Add xkeyboard-config as a dependency
      midori: make sure it can't be selected if webkit can't be enabled
      webkit: the X11 variant needs libXt
      webkit: Fix build failure on uClibc
      Create <tuple>/lib -> <sysroot>/lib symlink before installing cross gcc

 package/Config.in                                  |    1 +
 package/atk/atk.mk                                 |    6 +-
 package/cairo/cairo-1.6.4-directfb-all.patch       | 1012 --------------------
 package/cairo/cairo-1.8.10-directfb.patch          |   39 +
 package/cairo/cairo.mk                             |    3 +-
 package/icu/icu.mk                                 |    2 +-
 package/libgail/Config.in                          |   15 +
 .../libgail-1.22.3-Relax-X11-dependencies.patch    |   42 +
 package/libgail/libgail.mk                         |   28 +
 package/libglib2/Config.in                         |    1 +
 package/libglib2/libglib2.mk                       |    8 +-
 package/libsoup/libsoup.mk                         |    9 +-
 package/midori/Config.in                           |    7 +-
 package/midori/midori-0.0.18-webkit.patch          |   67 --
 package/midori/midori.mk                           |   27 +-
 package/pango/pango.mk                             |    7 +-
 package/webkit/Config.in                           |    2 +
 package/webkit/gtk-doc.make                        |  173 ----
 ...webkit-1.2.3-fix-build-issue-with-old-gtk.patch |   22 +
 .../webkit/webkit-1.2.3-pthread_getattr_np.patch   |   79 ++
 package/webkit/webkit-r30267-trunc.patch           |   11 -
 package/webkit/webkit.mk                           |   22 +-
 package/x11r7/libxcb/libxcb.mk                     |    3 +
 package/x11r7/pthread-stubs/pthread-stubs.mk       |    1 +
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk         |    2 +
 package/x11r7/xcb-proto/xcb-proto.mk               |    1 +
 package/x11r7/xkeyboard-config/xkeyboard-config.mk |    2 +-
 package/x11r7/xlib_libX11/xlib_libX11.mk           |    3 +
 package/x11r7/xlib_libXau/xlib_libXau.mk           |    4 +
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk       |    4 +
 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk   |    4 +
 .../x11r7/xproto_inputproto/xproto_inputproto.mk   |    1 +
 package/x11r7/xproto_kbproto/xproto_kbproto.mk     |    1 +
 .../x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk |    1 +
 package/x11r7/xproto_xextproto/xproto_xextproto.mk |    1 +
 .../xproto_xf86bigfontproto.mk                     |    1 +
 package/x11r7/xserver_xorg-server/Config.in        |    1 +
 .../xserver_xorg-server/xserver_xorg-server.mk     |    4 +-
 .../x11r7/xutil_util-macros/xutil_util-macros.mk   |    1 +
 target/Config.in.arch                              |    5 +
 toolchain/external-toolchain/ext-tool.mk           |    2 +-
 toolchain/gcc/gcc-uclibc-4.x.mk                    |    8 +-
 42 files changed, 326 insertions(+), 1307 deletions(-)
 delete mode 100644 package/cairo/cairo-1.6.4-directfb-all.patch
 create mode 100644 package/cairo/cairo-1.8.10-directfb.patch
 create mode 100644 package/libgail/Config.in
 create mode 100644 package/libgail/libgail-1.22.3-Relax-X11-dependencies.patch
 create mode 100644 package/libgail/libgail.mk
 delete mode 100644 package/midori/midori-0.0.18-webkit.patch
 delete mode 100644 package/webkit/gtk-doc.make
 create mode 100644 package/webkit/webkit-1.2.3-fix-build-issue-with-old-gtk.patch
 create mode 100644 package/webkit/webkit-1.2.3-pthread_getattr_np.patch
 delete mode 100644 package/webkit/webkit-r30267-trunc.patch

Thanks,
-- 
Thomas Petazzoni
