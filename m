From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:20:29 +0200
Subject: [Buildroot] [PATCH 00/69] Remove automatic derivation of host
	dependencies
Message-ID: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The automatic derivation of host dependencies feature consists in
automatically deducing dependencies of a package host variant from the
dependencies of the target variant.

However, it causes some issues, and most host packages need different
dependencies than their target variants.

This series removes this feature in 3 steps:

1) patches 1 to 54 set explicit dependencies for all host packages that
   relied on automatic derivation (patches 1 to 54)
2) patch 55 removes the feature itself from buildroot infrastructure
3) patches 56 to 69 remove the empty dependencies definitions that had
   been added to avoid the automatic inheritance
   (as spotted by Arnout Vandecappelle)

Julien Floret (69):
  am335x-pru-package: add explicit dependencies for host variant
  axfsutils: add explicit dependencies for host variant
  bdwgc: add explicit dependencies for host variant
  cdrkit: add explicit dependencies for host variant
  cloog: add explicit dependencies for host variant
  cramfs: add explicit dependencies for host variant
  doxygen: add explicit dependencies for host variant
  dtc: add explicit dependencies for host variant
  e2tools: add explicit dependencies for host variant
  erlang-lager: add explicit dependencies for host variant
  expat: add explicit dependencies for host variant
  file: add explicit dependencies for host variant
  fontconfig: add explicit dependencies for host variant
  fwup: add explicit dependencies for host variant
  genimage: add explicit dependencies for host variant
  gmp: add explicit dependencies for host variant
  heimdal: add explicit dependencies for host variant
  imx-usb-loader: add explicit dependencies for host variant
  isl: add explicit dependencies for host variant
  libconfuse: add explicit dependencies for host variant
  libcroco: add explicit dependencies for host variant
  libftdi: add explicit dependencies for host variant
  libpng: add explicit dependencies for host variant
  libsepol: add explicit dependencies for host variant
  libtool: add explicit dependencies for host variant
  libusb-compat: add explicit dependencies for host variant
  libxml-parser-perl: add explicit dependencies for host variant
  lttng-babeltrace: add explicit dependencies for host variant
  lzop: add explicit dependencies for host variant
  mpc: add explicit dependencies for host variant
  mpfr: add explicit dependencies for host variant
  pixman: add explicit dependencies for host variant
  python-pycrypto: add explicit dependencies for host variant
  swig: add explicit dependencies for host variant
  wayland: add explicit dependencies for host variant
  libxcb: add explicit dependencies for host variant
  xapp_bdftopcf: add explicit dependencies for host variant
  xapp_mkfontdir: add explicit dependencies for host variant
  xapp_mkfontscale: add explicit dependencies for host variant
  xapp_xcursorgen: add explicit dependencies for host variant
  xapp_xkbcomp: add explicit dependencies for host variant
  xcb-proto: add explicit dependencies for host variant
  xfont_encodings: add explicit dependencies for host variant
  xfont_font-util: add explicit dependencies for host variant
  xlib_libX11: add explicit dependencies for host variant
  xlib_libXau: add explicit dependencies for host variant
  xlib_libXcursor: add explicit dependencies for host variant
  xlib_libXdmcp: add explicit dependencies for host variant
  xlib_libXfixes: add explicit dependencies for host variant
  xlib_libXfont: add explicit dependencies for host variant
  xlib_libXrender: add explicit dependencies for host variant
  xlib_libfontenc: add explicit dependencies for host variant
  xlib_libxkbfile: add explicit dependencies for host variant
  xutil_makedepend: add explicit dependencies for host variant
  infra: remove auto derivation of host dependencies
  xorriso: remove empty host dependencies definition
  tcl: remove empty host dependencies definition
  binutils: remove empty host dependencies definition
  boost: remove empty host dependencies definition
  dos2unix: remove empty host dependencies definition
  dosfstools: remove empty host dependencies definition
  gawk: remove empty host dependencies definition
  lua: remove empty host dependencies definition
  mtools: remove empty host dependencies definition
  ncurses: remove empty host dependencies definition
  pax-utils: remove empty host dependencies definition
  perl: remove empty host dependencies definition
  rpi-firmware: remove empty host dependencies definition
  tar: remove empty host dependencies definition

 package/am335x-pru-package/am335x-pru-package.mk   |  1 +
 package/axfsutils/axfsutils.mk                     |  2 +-
 package/bdwgc/bdwgc.mk                             |  1 +
 package/binutils/binutils.mk                       |  1 -
 package/boost/boost.mk                             |  2 --
 package/cdrkit/cdrkit.mk                           |  1 +
 package/cloog/cloog.mk                             |  2 +-
 package/cramfs/cramfs.mk                           |  1 +
 package/dos2unix/dos2unix.mk                       |  1 -
 package/dosfstools/dosfstools.mk                   |  3 ---
 package/doxygen/doxygen.mk                         |  2 +-
 package/dtc/dtc.mk                                 |  1 +
 package/e2tools/e2tools.mk                         |  1 +
 package/erlang-lager/erlang-lager.mk               |  1 +
 package/expat/expat.mk                             |  1 +
 package/file/file.mk                               |  1 +
 package/fontconfig/fontconfig.mk                   |  1 +
 package/fwup/fwup.mk                               |  1 +
 package/gawk/gawk.mk                               |  3 ---
 package/genimage/genimage.mk                       |  2 +-
 package/gmp/gmp.mk                                 |  1 +
 package/heimdal/heimdal.mk                         |  2 +-
 package/imx-usb-loader/imx-usb-loader.mk           |  2 +-
 package/isl/isl.mk                                 |  2 +-
 package/libconfuse/libconfuse.mk                   |  1 +
 package/libcroco/libcroco.mk                       |  1 +
 package/libftdi/libftdi.mk                         |  1 +
 package/libpng/libpng.mk                           |  1 +
 package/libsepol/libsepol.mk                       |  1 +
 package/libtool/libtool.mk                         |  1 +
 package/libusb-compat/libusb-compat.mk             |  1 +
 package/libxml-parser-perl/libxml-parser-perl.mk   |  2 +-
 package/lttng-babeltrace/lttng-babeltrace.mk       |  3 +++
 package/lua/lua.mk                                 |  3 ---
 package/lzop/lzop.mk                               |  1 +
 package/mpc/mpc.mk                                 |  1 +
 package/mpfr/mpfr.mk                               |  1 +
 package/mtools/mtools.mk                           |  4 +---
 package/ncurses/ncurses.mk                         |  1 -
 package/pax-utils/pax-utils.mk                     |  3 ---
 package/perl/perl.mk                               |  4 ----
 package/pixman/pixman.mk                           |  1 +
 package/pkg-autotools.mk                           |  9 ---------
 package/pkg-cmake.mk                               |  7 -------
 package/pkg-generic.mk                             |  4 ----
 package/pkg-python.mk                              | 15 ---------------
 package/pkg-rebar.mk                               | 14 --------------
 package/pkg-virtual.mk                             |  7 -------
 package/python-pycrypto/python-pycrypto.mk         |  1 +
 package/rpi-firmware/rpi-firmware.mk               |  1 -
 package/swig/swig.mk                               |  2 +-
 package/tar/tar.mk                                 |  1 -
 package/tcl/tcl.mk                                 |  1 -
 package/wayland/wayland.mk                         |  1 +
 package/x11r7/libxcb/libxcb.mk                     |  3 +++
 package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk       |  1 +
 package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk     |  1 +
 package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk |  2 ++
 package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk   |  2 ++
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk         |  1 +
 package/x11r7/xcb-proto/xcb-proto.mk               |  1 +
 package/x11r7/xfont_encodings/xfont_encodings.mk   |  2 ++
 package/x11r7/xfont_font-util/xfont_font-util.mk   |  1 +
 package/x11r7/xlib_libX11/xlib_libX11.mk           | 12 ++++++++++++
 package/x11r7/xlib_libXau/xlib_libXau.mk           |  2 ++
 package/x11r7/xlib_libXcursor/xlib_libXcursor.mk   |  3 +++
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk       |  1 +
 package/x11r7/xlib_libXfixes/xlib_libXfixes.mk     |  3 +++
 package/x11r7/xlib_libXfont/xlib_libXfont.mk       |  7 ++++++-
 package/x11r7/xlib_libXrender/xlib_libXrender.mk   |  3 +++
 package/x11r7/xlib_libfontenc/xlib_libfontenc.mk   |  1 +
 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk   |  1 +
 package/x11r7/xutil_makedepend/xutil_makedepend.mk |  1 +
 package/xorriso/xorriso.mk                         |  5 ++---
 74 files changed, 87 insertions(+), 96 deletions(-)

-- 
2.1.0
