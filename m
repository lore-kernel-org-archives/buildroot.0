From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2010 18:46:38 +0100
Subject: [Buildroot] [pull request] Pull request for branch misc-fixes5
Message-ID: <cover.1266774432.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit c8ff60c8283b0ad116fcf43f485f199c29432c9d:
  Peter Korsgaard (1):
        CHANGES: add ace_of_penguins, rubix and xboard

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot misc-fixes5

Thomas Petazzoni (38):
      automake: add build dependency on host-autoconf
      ccache: remove cleanup of documentation
      libxml2: do not apply libtool patch when compiling for host
      libxslt: enable compilation on host
      libxcb: fix build with Buildroot compiled xsltproc
      xapp_mkfontscale: enable compilation for the host
      xfont_encoding: add mkfontscale on the host as dependency
      xlib_libfontenc: enable compilation on the host
      zlib: enable compilation on the host
      xfont_font-util: convert to the autotools infrastructure
      package infrastructure: add LD_LIBRARY_PATH
      libpng: enable compilation on the host
      ace_of_penguins: add dependency on host-libpng
      ace_of_penguins: mark as BROKEN
      dependencies: add gzip and bzip2 as base dependencies
      libgtk2: break the dependency of host-libgtk2 on host-cairo
      libxml-parser-perl: new package
      package infrastructure: add PERLLIB and LD_LIBRARY_PATH
      intltool: new package
      dependencies: add perl as a mandatory dependency
      gmpc: add dependency on host-intltool
      flex: install in the staging directory
      gob2: update dependency on flex
      shared-mime-info: run update-mime-database with correct env variables
      imagemagick: help configure to detect file_offset_bits
      imagemagick: use internal libtool
      iw: give path to pkg-config
      kexec: bump version to fix build failure
      matchbox: apply libtool patch to matchbox-desktop
      matchbox: fix dependency to not always rebuilt libmatchbox
      shared-mime-info: do not depend on phony target in hook
      dosfstools: make sure install targets aren't run everytime
      lvm2: prevent dmsetup from being re-installed every time
      libeXosip: do not re-run targets at every invocation of 'make'
      webkit: several build fixes
      webkit: make sure that people don't try to build with uClibc
      libsoup: remove --without-html-dir
      mplayer: use UTF-8 charset to avoid iconv dependency

 package/Config.in                                  |    2 +
 package/Makefile.in                                |   16 ++-
 package/automake/automake.mk                       |    2 +-
 package/dosfstools/dosfstools.mk                   |   32 ++--
 package/flex/flex.mk                               |    1 +
 package/games/ace_of_penguins/Config.in            |    1 +
 package/games/ace_of_penguins/ace_of_penguins.mk   |    2 +-
 package/gmpc/gmpc.mk                               |    2 +-
 package/gob2/Config.in                             |    1 +
 package/gob2/gob2.mk                               |    2 +-
 package/imagemagick/imagemagick.mk                 |   11 +-
 package/intltool/Config.in                         |    6 +
 package/intltool/intltook.mk                       |   16 ++
 package/iw/iw.mk                                   |    1 +
 package/kexec/kexec.mk                             |    2 +-
 package/libeXosip2/libeXosip2.mk                   |    6 +
 .../host-libgtk2-2.12.12-reduce-dependencies.patch |  200 ++++++++++++++++++++
 package/libgtk2/libgtk2.mk                         |   29 +++-
 package/libpng/libpng.mk                           |    5 +
 package/libsoup/libsoup.mk                         |    2 +-
 package/libxml-parser-perl/Config.in               |    6 +
 package/libxml-parser-perl/libxml-parser-perl.mk   |   32 +++
 package/libxml2/libxml2.mk                         |    2 +
 package/libxslt/libxslt.mk                         |    8 +
 package/lvm2/lvm2.mk                               |    2 +
 package/matchbox/matchbox.mk                       |    5 +-
 package/multimedia/mplayer/mplayer.mk              |    2 +-
 package/shared-mime-info/shared-mime-info.mk       |    6 +-
 package/webkit/Config.in                           |    5 +-
 package/webkit/gtk-doc.make                        |  173 +++++++++++++++++
 package/webkit/webkit.mk                           |    4 +-
 package/x11r7/libxcb/libxcb.mk                     |    4 +-
 package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk |    4 +-
 package/x11r7/xfont_encodings/xfont_encodings.mk   |    1 +
 package/x11r7/xfont_font-util/xfont_font-util.mk   |   74 +-------
 package/x11r7/xlib_libfontenc/xlib_libfontenc.mk   |    3 +
 package/zlib/zlib.mk                               |   24 +++
 toolchain/ccache/ccache.mk                         |    3 -
 toolchain/dependencies/dependencies.sh             |    2 +-
 39 files changed, 588 insertions(+), 111 deletions(-)
 create mode 100644 package/intltool/Config.in
 create mode 100644 package/intltool/intltook.mk
 create mode 100644 package/libgtk2/host-libgtk2-2.12.12-reduce-dependencies.patch
 create mode 100644 package/libxml-parser-perl/Config.in
 create mode 100644 package/libxml-parser-perl/libxml-parser-perl.mk
 create mode 100644 package/webkit/gtk-doc.make

Thanks,
-- 
Thomas Petazzoni
