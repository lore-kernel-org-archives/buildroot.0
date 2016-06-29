From: Julien Floret <julien.floret@6wind.com>
Date: Wed, 29 Jun 2016 15:46:07 +0200
Subject: [Buildroot] [PATCH 00/24] Drop unused host packages
Message-ID: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A lot of host packages are never built, because they don't have a
Config.in option, and are never referenced in other packages'
dependencies.

This series removes them to avoid maintaining unneeded code; they
will still be in git history if some are needed again in the future.

The other motivation behind this cleanup is that I'm starting to think
about a new proposal for speeding up the Makefile parsing, similar to
what Thomas proposed here:
http://lists.busybox.net/pipermail/buildroot/2014-March/092548.html

As Thomas explained, this change would imply adding blind Config.in
options for all host packages. It's quite a big change, so a little
preliminary cleanup could help.

Julien Floret (24):
  x11r7: drop unused host variants
  sepolgen: drop unused host package
  attr: drop unused host variant
  directfb: drop unused host variant
  erlang-goldrush: drop unused host variant
  jsmin: drop unused host variant
  libatomic_ops: drop unused host variant
  libconfuse: drop unused host variant
  libpthread-stubs: drop unused host variant
  libsemanage: drop unused host variant
  libsodium: drop unused host variant
  lzip: drop unused host variant
  pax-utils: drop unused host variant
  perl-file-util: drop unused host variant
  python-jinja2: drop unused host variant
  python-mako: drop unused host variant
  sdl_image: drop unused host variant
  setools: drop unused host variant
  xutil_util-macros: drop unused host variant
  bzip2: drop unused host variant
  python-markupsafe: drop unused host variant
  sdl: drop unused host variant
  sqlite: drop unused host variant
  ustr: drop unused host variant

 package/attr/attr.mk                               |  7 ----
 package/bzip2/bzip2.mk                             | 15 -------
 package/directfb/directfb.mk                       | 17 --------
 package/erlang-goldrush/erlang-goldrush.mk         |  1 -
 package/jsmin/jsmin.mk                             |  9 -----
 package/libatomic_ops/libatomic_ops.mk             |  1 -
 package/libconfuse/libconfuse.mk                   |  1 -
 package/libpthread-stubs/libpthread-stubs.mk       |  1 -
 package/libsemanage/libsemanage.mk                 | 32 ---------------
 package/libsodium/libsodium.mk                     |  1 -
 package/lzip/lzip.mk                               | 14 -------
 package/pax-utils/pax-utils.mk                     |  4 --
 package/perl-file-util/perl-file-util.mk           |  2 -
 package/python-jinja2/python-jinja2.mk             |  3 --
 package/python-mako/python-mako.mk                 |  4 --
 package/python-markupsafe/python-markupsafe.mk     |  1 -
 package/sdl/sdl.mk                                 | 11 ------
 package/sdl_image/sdl_image.mk                     | 12 ------
 package/sepolgen/sepolgen.hash                     |  2 -
 package/sepolgen/sepolgen.mk                       | 30 --------------
 package/setools/setools.mk                         | 46 ----------------------
 package/sqlite/sqlite.mk                           |  1 -
 package/ustr/ustr.mk                               |  1 -
 package/x11r7/libxcb/libxcb.mk                     |  3 --
 package/x11r7/xfont_encodings/xfont_encodings.mk   |  1 -
 package/x11r7/xlib_libX11/xlib_libX11.mk           |  6 ---
 package/x11r7/xlib_libXau/xlib_libXau.mk           |  1 -
 package/x11r7/xlib_libXcursor/xlib_libXcursor.mk   |  1 -
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk       |  1 -
 package/x11r7/xlib_libXfixes/xlib_libXfixes.mk     |  1 -
 package/x11r7/xlib_libXfont/xlib_libXfont.mk       |  3 --
 package/x11r7/xlib_libXrender/xlib_libXrender.mk   |  1 -
 package/x11r7/xlib_libfontenc/xlib_libfontenc.mk   |  1 -
 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk   |  1 -
 package/x11r7/xlib_xtrans/xlib_xtrans.mk           |  1 -
 .../x11r7/xproto_fixesproto/xproto_fixesproto.mk   |  1 -
 .../xproto_fontcacheproto/xproto_fontcacheproto.mk |  1 -
 .../x11r7/xproto_fontsproto/xproto_fontsproto.mk   |  1 -
 .../x11r7/xproto_inputproto/xproto_inputproto.mk   |  1 -
 package/x11r7/xproto_kbproto/xproto_kbproto.mk     |  1 -
 .../x11r7/xproto_renderproto/xproto_renderproto.mk |  1 -
 .../x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk |  2 -
 package/x11r7/xproto_xextproto/xproto_xextproto.mk |  2 -
 .../xproto_xf86bigfontproto.mk                     |  1 -
 package/xutil_util-macros/xutil_util-macros.mk     |  1 -
 45 files changed, 249 deletions(-)
 delete mode 100644 package/sepolgen/sepolgen.hash
 delete mode 100644 package/sepolgen/sepolgen.mk

-- 
2.1.0
