From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2010 19:42:51 +0100
Subject: [Buildroot] [pull request] Pull request for branch misc-fixes5
Message-ID: <cover.1266691382.git.thomas.petazzoni@free-electrons.com>
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

Thomas Petazzoni (16):
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
      merge with libpng for host
      ace_of_penguins: mark as BROKEN
      dependencies: add gzip and bzip2 as base dependencies

 package/Makefile.in                                |    6 ++-
 package/automake/automake.mk                       |    2 +-
 package/games/ace_of_penguins/Config.in            |    1 +
 package/games/ace_of_penguins/ace_of_penguins.mk   |    2 +-
 package/libpng/libpng.mk                           |    5 ++
 package/libxml2/libxml2.mk                         |    2 +
 package/libxslt/libxslt.mk                         |    8 ++
 package/x11r7/libxcb/libxcb.mk                     |    4 +-
 package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk |    4 +-
 package/x11r7/xfont_encodings/xfont_encodings.mk   |    1 +
 package/x11r7/xfont_font-util/xfont_font-util.mk   |   74 ++------------------
 package/x11r7/xlib_libfontenc/xlib_libfontenc.mk   |    3 +
 package/zlib/zlib.mk                               |   24 ++++++
 toolchain/ccache/ccache.mk                         |    3 -
 toolchain/dependencies/dependencies.sh             |    2 +-
 15 files changed, 63 insertions(+), 78 deletions(-)

Thanks,
-- 
Thomas Petazzoni
