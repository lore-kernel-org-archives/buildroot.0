From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  7 Jul 2010 08:20:53 +0200
Subject: [Buildroot] [pull request] Pull request for branch misc-fixes
Message-ID: <cover.1278483657.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit ecb7642cce36bc68d93f0eee677adc7da538228d:
  Thomas Petazzoni (1):
        external-toolchain: hardcode the destination directory for a library

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot misc-fixes

Darius Augulis (1):
      GETPT support is needed by rxvt.

Thomas Petazzoni (19):
      webkit: fix misc build issues
      xcb-util: add dependency on host-gperf
      xlib_libXt: fix build issues
      ruby: convert to autotools and fix build
      cmake: pass LDFLAGS/CFLAGS when building for the host
      fontconfig: fix cross-compilation patch
      Solve the host tools relying on host libraries problem
      Remove unneeded variables in HOST_CONFIGURE_OPTS
      Separate flags from commands in HOST_CONFIGURE_OPTS
      Rework sysroot option handling
      Cleanup TARGET_CONFIGURE_OPTS
      Remove *_FOR_TARGET variables from TARGET_CONFIGURE_OPTS
      Remove $(TOOLCHAIN_DIR)/bin and $(STAGING_DIR)/{usr/bin,bin} from the PATH
      Introduce support for host config cache
      Merge TARGET_CONFIGURE_ENV into TARGET_CONFIGURE_OPTS
      openssl: don't override the CC passed at configure time
      external-toolchain: adjust tests on TARGET_CC and TARGET_CXX
      Update all packages to quote $(TARGET_CC)
      xvkbd: add missing dependency on xlib_libXtst

 Makefile                                           |    8 +-
 boot/grub/grub.mk                                  |    8 +-
 boot/grub2/grub2.mk                                |    4 +-
 package/Makefile.autotools.in                      |    2 +-
 package/Makefile.in                                |  120 +++++++-------------
 package/acpid/acpid.mk                             |    2 +-
 package/busybox/busybox.mk                         |    6 +-
 package/cmake/cmake.mk                             |    4 +-
 package/coreutils/coreutils.mk                     |    4 +-
 package/dillo/dillo.mk                             |    2 +-
 package/docker/docker.mk                           |    2 +-
 package/eeprog/eeprog.mk                           |    2 +-
 package/ezxml/ezxml.mk                             |    2 +-
 .../fontconfig-2.6.0-use_for_build.patch           |   93 +++++++++------
 package/gadgetfs-test/gadgetfs-test.mk             |    2 +-
 package/games/rubix/rubix.mk                       |    2 +-
 package/gettext/gettext.mk                         |    4 +-
 package/gtk2-engines/gtk2-engines.mk               |    2 +-
 package/iostat/iostat.mk                           |    2 +-
 package/iproute2/iproute2.mk                       |    2 +-
 package/libfloat/libfloat.mk                       |    4 +-
 package/libglib12/libglib12.mk                     |    2 +-
 package/libgtk12/libgtk12.mk                       |    2 +-
 package/lmbench/lmbench.mk                         |    4 +-
 package/lockfile-progs/lockfile-progs.mk           |    3 +-
 package/mdadm/mdadm.mk                             |    2 +-
 package/memstat/memstat.mk                         |    2 +-
 package/microperl/microperl.mk                     |    2 +-
 package/microwin/microwin.mk                       |    4 +-
 package/mii-diag/mii-diag.mk                       |    4 +-
 package/mrouted/mrouted.mk                         |    2 +-
 package/mtd/mtd.mk                                 |    3 +-
 package/multimedia/alsa-utils/alsa-utils.mk        |    2 +-
 package/multimedia/festival/festival/festival.mk   |    2 +-
 .../festival/speech-tools/speech-tools.mk          |    2 +-
 package/multimedia/ffmpeg/ffmpeg.mk                |    1 -
 package/multimedia/mplayer/mplayer.mk              |    2 +-
 package/netkitbase/netkitbase.mk                   |    8 +-
 package/netkittelnet/netkittelnet.mk               |   10 +-
 package/netplug/netplug.mk                         |    2 +-
 package/netsnmp/netsnmp.mk                         |    2 +-
 package/newt/newt.mk                               |    2 +-
 package/nfs-utils/nfs-utils.mk                     |    2 +-
 package/openssh/openssh.mk                         |    2 +-
 package/openssl/openssl.mk                         |    4 +-
 package/pcmcia/pcmcia.mk                           |    2 +-
 package/portmap/portmap.mk                         |    2 +-
 package/pppd/pppd.mk                               |    2 +-
 package/python/python.mk                           |    4 +-
 package/ruby/ruby.mk                               |   71 +-----------
 package/sed/sed.mk                                 |    4 +-
 package/slang/slang.mk                             |    2 +-
 package/stunnel/stunnel.mk                         |    2 +-
 package/sysvinit/sysvinit.mk                       |    2 +-
 package/tcpdump/dhcpdump.mk                        |    2 +-
 package/udev/udev.mk                               |    2 +-
 package/util-linux/util-linux.mk                   |    2 +-
 package/vsftpd/vsftpd.mk                           |    2 +-
 package/webkit/webkit.mk                           |    3 +-
 package/wipe/wipe.mk                               |    4 +-
 package/wireless-tools/wireless-tools.mk           |    6 +-
 package/x11r7/xcb-util/xcb-util.mk                 |    1 +
 .../xlib_libXt-1.0.7-fix-cross-compile.patch       |   96 ++++++++++++++++
 package/x11r7/xlib_libXt/xlib_libXt.mk             |    3 +-
 package/xvkbd/Config.in                            |    1 +
 package/xvkbd/xvkbd.mk                             |    4 +-
 toolchain/Makefile.in                              |    2 -
 toolchain/external-toolchain/ext-tool.mk           |   16 ++-
 toolchain/gdb/gdb.mk                               |    4 +-
 toolchain/uClibc/uClibc-0.9.30.config              |    2 +-
 toolchain/uClibc/uClibc-0.9.31.config              |    2 +-
 71 files changed, 308 insertions(+), 283 deletions(-)
 create mode 100644 package/x11r7/xlib_libXt/xlib_libXt-1.0.7-fix-cross-compile.patch

Thanks,
-- 
Thomas Petazzoni
