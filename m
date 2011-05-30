From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 May 2011 23:56:55 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.08/no-mmu-blackfin
Message-ID: <cover.1306792524.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here are some changes related, or loosely related to non-MMU and
Blackfin support.

The goal of the first commits is to allow a default configuration with
Blackfin selected to build properly (needs support for Blackfin
external toolchain, some Busybox configuration changes, etc.).

Then, we clarify a bit the usage of shared/static libraries.

Regards,

Thomas

The following changes since commit 9ab73b51e8f0f30e1720639d40732fa20aab9d1a:

  Update for 2011.05 (2011-05-27 16:18:21 +0200)

are available in the git repository at:
  http://free-electrons.com/~thomas/buildroot.git for-2011.08/no-mmu-blackfin

Thomas Petazzoni (8):
      blackfin: support external toolchains provided by blackfin.uclibc.org
      toolchain: introduce BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
      busybox: tune config according to BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
      busybox: adjust configuration for non-MMU targets
      Mark some packages as not usable on non-MMU systems
      Remove unused variable definitions
      package/autotools: add --{enable,disable}-{shared,static} automatically
      packages: remove --{enable,disable}-{shared,static} from autotools packages

 Makefile                                           |   10 -----
 package/Makefile.autotools.in                      |    2 +
 package/Makefile.in                                |    6 +++
 package/atk/atk.mk                                 |    6 +---
 package/berkeleydb/berkeleydb.mk                   |    1 -
 package/busybox/busybox.mk                         |   18 +++++++++
 package/directfb/directfb.mk                       |    4 --
 package/expat/expat.mk                             |    2 -
 package/fltk/fltk.mk                               |    2 +-
 package/fuse/libfuse.mk                            |    2 -
 package/gpsd/Config.in                             |    2 +
 package/gpsd/gpsd.mk                               |    1 -
 package/input-event-daemon/Config.in               |    2 +
 package/java/classpath/classpath.mk                |    3 +-
 package/java/jamvm/jamvm.mk                        |    3 +-
 package/kbd/Config.in                              |    2 +
 package/libconfuse/libconfuse.mk                   |    2 +-
 package/libdnet/libdnet.mk                         |    2 -
 package/libelf/libelf.mk                           |    2 +-
 package/libgail/libgail.mk                         |    3 --
 package/libglib2/libglib2.mk                       |    5 ---
 package/libgtk2/libgtk2.mk                         |    4 +--
 package/libidn/libidn.mk                           |    2 +-
 package/liblockfile/liblockfile.mk                 |    2 +-
 package/librsync/librsync.mk                       |    1 -
 package/libsoup/libsoup.mk                         |    2 -
 package/lzo/lzo.mk                                 |    2 -
 package/multimedia/alsa-lib/alsa-lib.mk            |    4 +--
 package/multimedia/ffmpeg/ffmpeg.mk                |    1 -
 package/multimedia/flac/flac.mk                    |    1 -
 package/neon/neon.mk                               |    2 +-
 package/pango/pango.mk                             |    3 +-
 package/samba/samba.mk                             |    2 -
 package/setserial/Config.in                        |    2 +
 package/sqlite/sqlite.mk                           |    4 +--
 package/sysstat/Config.in                          |    2 +
 package/tcl/tcl.mk                                 |    1 -
 package/tiff/tiff.mk                               |    2 -
 package/tslib/tslib.mk                             |    1 -
 package/x11r7/xapp_xman/xapp_xman.mk               |    4 +--
 .../xdriver_xf86-video-openchrome.mk               |    1 -
 package/x11r7/xlib_libFS/xlib_libFS.mk             |    2 +-
 package/x11r7/xlib_libICE/xlib_libICE.mk           |    1 -
 package/x11r7/xlib_libSM/xlib_libSM.mk             |    2 +-
 package/x11r7/xlib_libX11/xlib_libX11.mk           |    2 -
 .../x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk |    2 +-
 package/x11r7/xlib_libXau/xlib_libXau.mk           |    2 -
 package/x11r7/xlib_libXaw/xlib_libXaw.mk           |    2 +-
 .../x11r7/xlib_libXcomposite/xlib_libXcomposite.mk |    1 -
 package/x11r7/xlib_libXcursor/xlib_libXcursor.mk   |    1 -
 package/x11r7/xlib_libXdamage/xlib_libXdamage.mk   |    1 -
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk       |    2 -
 package/x11r7/xlib_libXext/xlib_libXext.mk         |    2 +-
 package/x11r7/xlib_libXfixes/xlib_libXfixes.mk     |    1 -
 package/x11r7/xlib_libXfont/xlib_libXfont.mk       |    2 +-
 .../x11r7/xlib_libXfontcache/xlib_libXfontcache.mk |    2 +-
 package/x11r7/xlib_libXft/xlib_libXft.mk           |    1 -
 package/x11r7/xlib_libXi/xlib_libXi.mk             |    2 +-
 package/x11r7/xlib_libXinerama/xlib_libXinerama.mk |    2 +-
 package/x11r7/xlib_libXmu/xlib_libXmu.mk           |    1 -
 package/x11r7/xlib_libXp/xlib_libXp.mk             |    2 +-
 package/x11r7/xlib_libXpm/xlib_libXpm.mk           |    1 -
 .../xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk |    1 -
 .../x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk |    1 -
 package/x11r7/xlib_libXrandr/xlib_libXrandr.mk     |    2 +-
 package/x11r7/xlib_libXrender/xlib_libXrender.mk   |    2 +-
 package/x11r7/xlib_libXres/xlib_libXres.mk         |    2 +-
 package/x11r7/xlib_libXt/xlib_libXt.mk             |    2 +-
 package/x11r7/xlib_libXtst/xlib_libXtst.mk         |    2 -
 package/x11r7/xlib_libXv/xlib_libXv.mk             |    2 +-
 package/x11r7/xlib_libXvMC/xlib_libXvMC.mk         |    2 +-
 package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk |    2 +-
 package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk   |    2 +-
 package/x11r7/xlib_libdmx/xlib_libdmx.mk           |    2 +-
 package/x11r7/xlib_libfontenc/xlib_libfontenc.mk   |    1 -
 package/x11r7/xlib_liboldX/xlib_liboldX.mk         |    2 +-
 .../x11r7/xlib_libpciaccess/xlib_libpciaccess.mk   |    1 -
 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk   |    2 -
 package/x11r7/xlib_libxkbui/xlib_libxkbui.mk       |    1 -
 package/xerces/xerces.mk                           |    3 +-
 toolchain/Config.in                                |    2 +
 toolchain/toolchain-common.in                      |    3 ++
 toolchain/toolchain-external/Config.in             |   21 +++++++++++
 toolchain/toolchain-external/ext-tool.mk           |   37 ++++++++++++++++++++
 84 files changed, 134 insertions(+), 118 deletions(-)

Thanks,
-- 
Thomas Petazzoni
