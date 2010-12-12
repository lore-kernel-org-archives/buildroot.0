From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Dec 2010 22:53:46 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.02/martin-packages
Message-ID: <cover.1292190675.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a set of patches that merges most of Martin Banky's pending
patches. I've taken Martin patches for input-tools, mii-diag, mrouted,
sysklogd, sysinit, lsof, lvm2, memtester, alsa-utils, netplug and
l2tp. I tested all of them, and fixed various issues.

I also include some other patches to :
 * remove deprecated packages
 * bump mplayer and add many more options to mplayer
 * bump libtheora
 * fix libaio on AVR32

Regards,

Thomas

The following changes since commit cc37a07f289f56a81195933810af705d77e95ee4:
  Peter Korsgaard (1):
        zlib: really fix install for static only builds

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot for-2011.02/martin-packages

Martin Banky (11):
      input-tools: convert to gentargets
      mii-diag: convert to gentargets and bump to 2.11.3
      mrouted: convet to gentargets and bump to version 3.9.4
      sysklogd: convert to gentargets and bump to 1.5
      sysvint: convert to gentargets and bump to 2.88
      lsof: convert to gentargets and bump to 4.84
      lvm2: convert to autotargets and bump to 2.02.78
      memtester: convert to gentargets and bump to 4.2.1
      alsa-utils: convert to autotargets and bump to 1.0.23
      netplug: convert to gentargets and bump to 1.2.9.2
      l2tp: convert to gentargets and change to xl2tp

Thomas Petazzoni (8):
      target: support generic getty with sysvinit inittabs
      microcom: remove package
      ng-spice-rework: remove package
      libfloat: remove package
      hotplug: remove package
      libaio: add patch to support AVR32
      mplayer: convert to gentargets, bump to a recent SVN version
      libtheora: bump version to 1.1.1

 package/Config.in                                  |    8 +-
 package/hotplug/Config.in                          |    7 -
 package/hotplug/diethotplug-0.5.tar                |  Bin 40960 -> 0 bytes
 package/hotplug/hotplug.mk                         |   45 -
 ...-rint.patch => input-tools-20051019-rint.patch} |    0
 package/input-tools/input-tools.mk                 |  102 +-
 package/l2tp/Config.in                             |    7 -
 package/l2tp/l2tp-no-gnu-extensions.patch          |   33 -
 package/l2tp/l2tp-sanity.patch                     |   49 -
 package/l2tp/l2tp.mk                               |   60 -
 package/libaio/libaio-0.3.109-avr32-support.patch  |  122 +
 package/libfloat/Config.in                         |    8 -
 package/libfloat/libfloat.mk                       |   65 -
 package/libfloat/libfloat.patch                    |   45 -
 ...sof-makefile.patch => lsof-4.84-makefile.patch} |    4 +-
 ...f-noportmap.patch => lsof-4.84-noportmap.patch} |    4 +-
 ...flags.patch => lsof-4.84-override-cflags.patch} |    4 +-
 ...tch => lsof-4.84-remove-susvlegacy-funcs.patch} |    4 +-
 package/lsof/lsof-uclibc.patch                     |   12 -
 package/lsof/lsof.mk                               |   96 +-
 package/lvm2/lvm2.mk                               |  137 +-
 package/memtester/Config.in                        |    4 +
 .../memtester/memtester-4.2.1-makefile-fix.patch   |   23 +
 package/memtester/memtester.mk                     |   54 +-
 package/microcom/Config.in                         |    7 -
 .../microcom/microcom-102-001-speed-defines.patch  |   34 -
 .../microcom-102-002-rename-variable-log.patch     |   78 -
 package/microcom/microcom.mk                       |   71 -
 package/mii-diag/Config.in                         |    2 +-
 package/mii-diag/mii-diag-strchr.patch             |    3 +
 package/mii-diag/mii-diag.mk                       |   72 +-
 package/mrouted/Config.in                          |    5 +-
 .../mrouted-3.9-beta3-bcopy_bcmp_bzero.patch       |  164 -
 package/mrouted/mrouted-3.9.4-bcopy.patch          |   26 +
 package/mrouted/mrouted-3.9.4-makefile-flags.patch |   64 +
 package/mrouted/mrouted-sys_errlist.patch          |   44 -
 package/mrouted/mrouted.mk                         |   60 +-
 ...tils-1.0.18-check-if-__use_bsd-is-defined.patch |   13 -
 .../alsa-utils-1.0.18-fix-intl-support.patch       |   11 -
 .../alsa-utils-1.0.18-fix_sysv_legacy.patch        |   20 -
 .../alsa-utils/alsa-utils-1.0.18-remove_man.patch  |   11 -
 package/multimedia/alsa-utils/alsa-utils.mk        |   99 +-
 package/multimedia/libtheora/libtheora.mk          |    5 +-
 package/multimedia/mplayer/Config.in               |   17 +-
 .../mplayer/mplayer-1.0rc2-100-atmel.1.patch       | 6262 --------------------
 .../mplayer/mplayer-1.0rc2-largefile.patch         |   18 -
 .../mplayer/mplayer-1.0rc2-remove-sys-timeb.patch  |   12 -
 .../mplayer-1.0rc3-disable-install-strip.patch     |   24 +
 ...g.patch => mplayer-1.0rc3-fix-cc-parsing.patch} |   16 +-
 package/multimedia/mplayer/mplayer.mk              |  150 +-
 package/netplug/netplug-1.2.9-disable-werror.patch |   22 -
 .../netplug/netplug-1.2.9.2-makefile-flags.patch   |   21 +
 package/netplug/netplug-socklen-type.patch         |   12 -
 package/netplug/netplug.mk                         |   53 +-
 package/ng-spice-rework/Config.in                  |    9 -
 .../ng-spice-rework-17-makeidx.patch               |   12 -
 package/ng-spice-rework/ng-spice-rework.mk         |   18 -
 package/sysklogd/S25syslog                         |   48 -
 package/sysklogd/sysklogd-susv3-legacy.patch       |   20 -
 package/sysklogd/sysklogd.mk                       |   95 +-
 package/sysklogd/sysklogd.patch                    |   91 -
 package/sysvinit/inittab                           |   32 +
 package/sysvinit/sysvinit-2.86-gentoo.patch        |    9 -
 package/sysvinit/sysvinit.mk                       |   71 +-
 package/xl2tp/Config.in                            |   11 +
 .../xl2tp-1.2.7-legacy.patch}                      |    3 +
 package/xl2tp/xl2tp-1.2.7-makefile-flags.patch     |   33 +
 package/xl2tp/xl2tp.mk                             |   33 +
 package/{l2tp/l2tpd => xl2tp/xl2tpd}               |    6 +-
 target/generic/Makefile.in                         |   14 +-
 70 files changed, 830 insertions(+), 7964 deletions(-)
 delete mode 100644 package/hotplug/Config.in
 delete mode 100644 package/hotplug/diethotplug-0.5.tar
 delete mode 100644 package/hotplug/hotplug.mk
 rename package/input-tools/{joystick-20051019-rint.patch => input-tools-20051019-rint.patch} (100%)
 delete mode 100644 package/l2tp/Config.in
 delete mode 100644 package/l2tp/l2tp-no-gnu-extensions.patch
 delete mode 100644 package/l2tp/l2tp-sanity.patch
 delete mode 100644 package/l2tp/l2tp.mk
 create mode 100644 package/libaio/libaio-0.3.109-avr32-support.patch
 delete mode 100644 package/libfloat/Config.in
 delete mode 100644 package/libfloat/libfloat.mk
 delete mode 100644 package/libfloat/libfloat.patch
 rename package/lsof/{lsof-makefile.patch => lsof-4.84-makefile.patch} (62%)
 rename package/lsof/{lsof-noportmap.patch => lsof-4.84-noportmap.patch} (64%)
 rename package/lsof/{lsof-override-cflags.patch => lsof-4.84-override-cflags.patch} (66%)
 rename package/lsof/{lsof-remove-susvlegacy-funcs.patch => lsof-4.84-remove-susvlegacy-funcs.patch} (62%)
 delete mode 100644 package/lsof/lsof-uclibc.patch
 create mode 100644 package/memtester/memtester-4.2.1-makefile-fix.patch
 delete mode 100644 package/microcom/Config.in
 delete mode 100644 package/microcom/microcom-102-001-speed-defines.patch
 delete mode 100644 package/microcom/microcom-102-002-rename-variable-log.patch
 delete mode 100644 package/microcom/microcom.mk
 delete mode 100644 package/mrouted/mrouted-3.9-beta3-bcopy_bcmp_bzero.patch
 create mode 100644 package/mrouted/mrouted-3.9.4-bcopy.patch
 create mode 100644 package/mrouted/mrouted-3.9.4-makefile-flags.patch
 delete mode 100644 package/mrouted/mrouted-sys_errlist.patch
 delete mode 100644 package/multimedia/alsa-utils/alsa-utils-1.0.18-check-if-__use_bsd-is-defined.patch
 delete mode 100644 package/multimedia/alsa-utils/alsa-utils-1.0.18-fix-intl-support.patch
 delete mode 100644 package/multimedia/alsa-utils/alsa-utils-1.0.18-fix_sysv_legacy.patch
 delete mode 100644 package/multimedia/alsa-utils/alsa-utils-1.0.18-remove_man.patch
 delete mode 100644 package/multimedia/mplayer/mplayer-1.0rc2-100-atmel.1.patch
 delete mode 100644 package/multimedia/mplayer/mplayer-1.0rc2-largefile.patch
 delete mode 100644 package/multimedia/mplayer/mplayer-1.0rc2-remove-sys-timeb.patch
 create mode 100644 package/multimedia/mplayer/mplayer-1.0rc3-disable-install-strip.patch
 rename package/multimedia/mplayer/{mplayer-1.0rc2-fix-cc-parsing.patch => mplayer-1.0rc3-fix-cc-parsing.patch} (53%)
 delete mode 100644 package/netplug/netplug-1.2.9-disable-werror.patch
 create mode 100644 package/netplug/netplug-1.2.9.2-makefile-flags.patch
 delete mode 100644 package/netplug/netplug-socklen-type.patch
 delete mode 100644 package/ng-spice-rework/Config.in
 delete mode 100644 package/ng-spice-rework/ng-spice-rework-17-makeidx.patch
 delete mode 100644 package/ng-spice-rework/ng-spice-rework.mk
 delete mode 100755 package/sysklogd/S25syslog
 delete mode 100644 package/sysklogd/sysklogd-susv3-legacy.patch
 delete mode 100644 package/sysklogd/sysklogd.patch
 create mode 100644 package/sysvinit/inittab
 delete mode 100644 package/sysvinit/sysvinit-2.86-gentoo.patch
 create mode 100644 package/xl2tp/Config.in
 rename package/{l2tp/l2tp-legacy.patch => xl2tp/xl2tp-1.2.7-legacy.patch} (86%)
 create mode 100644 package/xl2tp/xl2tp-1.2.7-makefile-flags.patch
 create mode 100644 package/xl2tp/xl2tp.mk
 rename package/{l2tp/l2tpd => xl2tp/xl2tpd} (76%)

Thanks,
-- 
Thomas Petazzoni
