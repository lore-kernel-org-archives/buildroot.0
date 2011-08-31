From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Aug 2011 23:34:59 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.11/misc-cleanups
Message-ID: <cover.1314826483.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This set of patches basically creates a new support/ directory, which
is used to group various files needed for the operation of Buildroot
which didn't fit properly in other directories :

 * The various scripts in the scripts/ directory (after removing the
   unused, unmaintained ones)

 * The libtool related patches

 * The patch-kernel.sh script, after renaming it to a more sensible
   name.

 * The kconfig stuff

 * The gnuconfig stuff (config.guess and config.sub)

Best regards,

Thomas

The following changes since commit d1dd9588ae76d8c9b79a39af182a45e54ac356dd:

  news.html: fix 2011.08 release date (2011-08-31 14:23:26 +0200)

are available in the git repository at:
  http://free-electrons.com/~thomas/buildroot.git for-2011.11/misc-cleanups

Thomas Petazzoni (7):
      scripts: remove old, unmaintained, unused scripts
      scripts/mkmakefile: fix typo
      support: move scripts/ to a new support/ directory
      support: move libtool patches in support/libtool
      support: move patch-kernel.sh and rename it
      support: move kconfig stuff from package/config to support/kconfig
      support: move package/gnuconfig to support/gnuconfig

 Makefile                                           |   10 +-
 boot/uboot/uboot.mk                                |    2 +-
 linux/linux.mk                                     |    6 +-
 package/Makefile.autotools.in                      |   36 ++++--
 package/Makefile.package.in                        |    8 +-
 package/argus/argus.mk                             |    2 +-
 package/cups/cups.mk                               |    4 +-
 package/cvs/cvs.mk                                 |    2 +-
 package/fis/fis.mk                                 |    2 +-
 package/gettext/gettext.mk                         |    5 +-
 package/gnuconfig/README.buildroot                 |   20 ----
 package/gnuconfig/gnuconfig.mk                     |    3 -
 package/input-tools/input-tools.mk                 |    2 +-
 package/libeXosip2/libeXosip2.mk                   |    2 +-
 package/libgtk2/libgtk2.mk                         |    2 +-
 package/libosip2/libosip2.mk                       |    2 +-
 package/lmbench/lmbench.mk                         |    2 +-
 package/mii-diag/mii-diag.mk                       |    2 +-
 package/mutt/mutt.mk                               |    2 +-
 package/netkitbase/netkitbase.mk                   |    2 +-
 package/netkittelnet/netkittelnet.mk               |    2 +-
 package/setserial/setserial.mk                     |    2 +-
 package/sfdisk/sfdisk.mk                           |    2 +-
 package/sysklogd/sysklogd.mk                       |    2 +-
 package/sysvinit/sysvinit.mk                       |    2 +-
 package/thttpd/thttpd.mk                           |    2 +-
 package/tinyhttpd/tinyhttpd.mk                     |    2 +-
 package/ttcp/ttcp.mk                               |    2 +-
 package/uemacs/uemacs.mk                           |    2 +-
 package/vpnc/vpnc.mk                               |    2 +-
 package/xfsprogs/xfsprogs.mk                       |    2 +-
 scripts/add_new_package.wizard                     |  120 --------------------
 scripts/create_ipkgs                               |   82 -------------
 scripts/get_linux_config.sh                        |   77 -------------
 {package => support}/gnuconfig/.cvsignore          |    0
 support/gnuconfig/README.buildroot                 |   25 ++++
 {package => support}/gnuconfig/config.guess        |    0
 {package => support}/gnuconfig/config.sub          |    0
 .../gnuconfig/patches/config.guess.uclibc.patch    |    0
 .../gnuconfig/patches/config.sub.ps2.patch         |    0
 {package/config => support/kconfig}/.gitignore     |    0
 {package/config => support/kconfig}/Makefile       |    0
 {package/config => support/kconfig}/Makefile.br    |    0
 {package/config => support/kconfig}/POTFILES.in    |    0
 .../config => support/kconfig}/README.buildroot2   |   10 +-
 {package/config => support/kconfig}/check.sh       |    0
 {package/config => support/kconfig}/conf.c         |    0
 {package/config => support/kconfig}/confdata.c     |    0
 {package/config => support/kconfig}/expr.c         |    0
 {package/config => support/kconfig}/expr.h         |    0
 {package/config => support/kconfig}/foo.h          |    0
 {package/config => support/kconfig}/gconf.c        |    2 +-
 {package/config => support/kconfig}/gconf.glade    |    0
 {package/config => support/kconfig}/images.c       |    0
 {package/config => support/kconfig}/kconfig_load.c |    0
 {package/config => support/kconfig}/kxgettext.c    |    0
 .../config => support/kconfig}/lex.zconf.c_shipped |    0
 {package/config => support/kconfig}/lkc.h          |    0
 {package/config => support/kconfig}/lkc_proto.h    |    0
 .../config => support/kconfig}/lxdialog/.gitignore |    0
 .../kconfig}/lxdialog/BIG.FAT.WARNING              |    0
 .../kconfig}/lxdialog/check-lxdialog.sh            |    0
 .../kconfig}/lxdialog/checklist.c                  |    0
 .../config => support/kconfig}/lxdialog/dialog.h   |    0
 .../config => support/kconfig}/lxdialog/inputbox.c |    0
 .../config => support/kconfig}/lxdialog/menubox.c  |    0
 .../config => support/kconfig}/lxdialog/textbox.c  |    0
 .../config => support/kconfig}/lxdialog/util.c     |    0
 .../config => support/kconfig}/lxdialog/yesno.c    |    0
 {package/config => support/kconfig}/mconf.c        |    0
 {package/config => support/kconfig}/menu.c         |    0
 {package/config => support/kconfig}/nconf.c        |    0
 {package/config => support/kconfig}/nconf.gui.c    |    0
 {package/config => support/kconfig}/nconf.h        |    0
 .../patches/01-kconfig-kernel-to-buildroot.patch   |    0
 .../patches/02-cpp-comments-to-c-comments.patch    |    0
 .../patches/03-change-config-option-prefix.patch   |    0
 .../patches/05-really-clean-everything.patch       |    0
 .../patches/06-br-build-system-integration.patch   |    0
 .../kconfig}/patches/08-make-write-deps.patch      |    8 +-
 .../patches/09-implement-kconfig-probability.patch |    0
 .../kconfig}/patches/10-br-build-system.patch      |    0
 .../patches/11-use-mktemp-for-lxdialog.patch       |    0
 .../kconfig}/patches/12-fix-glade-file-path.patch  |    8 +-
 .../patches/14-support-out-of-tree-config.patch    |    0
 {package/config => support/kconfig}/patches/series |    0
 {package/config => support/kconfig}/qconf.cc       |    0
 {package/config => support/kconfig}/qconf.h        |    0
 .../kconfig}/streamline_config.pl                  |    0
 {package/config => support/kconfig}/symbol.c       |    0
 {package/config => support/kconfig}/util.c         |    2 +-
 {package/config => support/kconfig}/zconf.gperf    |    0
 .../kconfig}/zconf.hash.c_shipped                  |    0
 {package/config => support/kconfig}/zconf.l        |    0
 .../config => support/kconfig}/zconf.tab.c_shipped |    0
 {package/config => support/kconfig}/zconf.y        |    0
 .../libtool}/buildroot-libtool-v1.5.patch          |    0
 .../libtool}/buildroot-libtool-v2.2.patch          |    0
 .../libtool}/buildroot-libtool-v2.4.patch          |    0
 .../scripts/apply-patches.sh                       |    0
 {scripts => support/scripts}/build-ext3-img        |    0
 {scripts => support/scripts}/copy.sh               |    0
 {scripts => support/scripts}/graph-depends         |    0
 {scripts => support/scripts}/mkmakefile            |    2 +-
 {scripts => support/scripts}/pkg-stats             |    1 -
 {scripts => support/scripts}/setlocalversion       |    0
 toolchain/elf2flt/elf2flt.mk                       |    2 +-
 toolchain/gcc/gcc-uclibc-4.x.mk                    |    6 +-
 toolchain/gdb/gdb.mk                               |    4 +-
 toolchain/kernel-headers/kernel-headers.mk         |    4 +-
 toolchain/uClibc/uclibc.mk                         |    4 +-
 111 files changed, 115 insertions(+), 380 deletions(-)
 delete mode 100644 package/gnuconfig/README.buildroot
 delete mode 100644 package/gnuconfig/gnuconfig.mk
 delete mode 100755 scripts/add_new_package.wizard
 delete mode 100755 scripts/create_ipkgs
 delete mode 100755 scripts/get_linux_config.sh
 rename {package => support}/gnuconfig/.cvsignore (100%)
 create mode 100644 support/gnuconfig/README.buildroot
 rename {package => support}/gnuconfig/config.guess (100%)
 rename {package => support}/gnuconfig/config.sub (100%)
 rename {package => support}/gnuconfig/patches/config.guess.uclibc.patch (100%)
 rename {package => support}/gnuconfig/patches/config.sub.ps2.patch (100%)
 rename {package/config => support/kconfig}/.gitignore (100%)
 rename {package/config => support/kconfig}/Makefile (100%)
 rename {package/config => support/kconfig}/Makefile.br (100%)
 rename {package/config => support/kconfig}/POTFILES.in (100%)
 rename {package/config => support/kconfig}/README.buildroot2 (58%)
 rename {package/config => support/kconfig}/check.sh (100%)
 rename {package/config => support/kconfig}/conf.c (100%)
 rename {package/config => support/kconfig}/confdata.c (100%)
 rename {package/config => support/kconfig}/expr.c (100%)
 rename {package/config => support/kconfig}/expr.h (100%)
 rename {package/config => support/kconfig}/foo.h (100%)
 rename {package/config => support/kconfig}/gconf.c (99%)
 rename {package/config => support/kconfig}/gconf.glade (100%)
 rename {package/config => support/kconfig}/images.c (100%)
 rename {package/config => support/kconfig}/kconfig_load.c (100%)
 rename {package/config => support/kconfig}/kxgettext.c (100%)
 rename {package/config => support/kconfig}/lex.zconf.c_shipped (100%)
 rename {package/config => support/kconfig}/lkc.h (100%)
 rename {package/config => support/kconfig}/lkc_proto.h (100%)
 rename {package/config => support/kconfig}/lxdialog/.gitignore (100%)
 rename {package/config => support/kconfig}/lxdialog/BIG.FAT.WARNING (100%)
 rename {package/config => support/kconfig}/lxdialog/check-lxdialog.sh (100%)
 rename {package/config => support/kconfig}/lxdialog/checklist.c (100%)
 rename {package/config => support/kconfig}/lxdialog/dialog.h (100%)
 rename {package/config => support/kconfig}/lxdialog/inputbox.c (100%)
 rename {package/config => support/kconfig}/lxdialog/menubox.c (100%)
 rename {package/config => support/kconfig}/lxdialog/textbox.c (100%)
 rename {package/config => support/kconfig}/lxdialog/util.c (100%)
 rename {package/config => support/kconfig}/lxdialog/yesno.c (100%)
 rename {package/config => support/kconfig}/mconf.c (100%)
 rename {package/config => support/kconfig}/menu.c (100%)
 rename {package/config => support/kconfig}/nconf.c (100%)
 rename {package/config => support/kconfig}/nconf.gui.c (100%)
 rename {package/config => support/kconfig}/nconf.h (100%)
 rename {package/config => support/kconfig}/patches/01-kconfig-kernel-to-buildroot.patch (100%)
 rename {package/config => support/kconfig}/patches/02-cpp-comments-to-c-comments.patch (100%)
 rename {package/config => support/kconfig}/patches/03-change-config-option-prefix.patch (100%)
 rename {package/config => support/kconfig}/patches/05-really-clean-everything.patch (100%)
 rename {package/config => support/kconfig}/patches/06-br-build-system-integration.patch (100%)
 rename {package/config => support/kconfig}/patches/08-make-write-deps.patch (96%)
 rename {package/config => support/kconfig}/patches/09-implement-kconfig-probability.patch (100%)
 rename {package/config => support/kconfig}/patches/10-br-build-system.patch (100%)
 rename {package/config => support/kconfig}/patches/11-use-mktemp-for-lxdialog.patch (100%)
 rename {package/config => support/kconfig}/patches/12-fix-glade-file-path.patch (73%)
 rename {package/config => support/kconfig}/patches/14-support-out-of-tree-config.patch (100%)
 rename {package/config => support/kconfig}/patches/series (100%)
 rename {package/config => support/kconfig}/qconf.cc (100%)
 rename {package/config => support/kconfig}/qconf.h (100%)
 rename {package/config => support/kconfig}/streamline_config.pl (100%)
 rename {package/config => support/kconfig}/symbol.c (100%)
 rename {package/config => support/kconfig}/util.c (99%)
 rename {package/config => support/kconfig}/zconf.gperf (100%)
 rename {package/config => support/kconfig}/zconf.hash.c_shipped (100%)
 rename {package/config => support/kconfig}/zconf.l (100%)
 rename {package/config => support/kconfig}/zconf.tab.c_shipped (100%)
 rename {package/config => support/kconfig}/zconf.y (100%)
 rename {package => support/libtool}/buildroot-libtool-v1.5.patch (100%)
 rename {package => support/libtool}/buildroot-libtool-v2.2.patch (100%)
 rename {package => support/libtool}/buildroot-libtool-v2.4.patch (100%)
 rename toolchain/patch-kernel.sh => support/scripts/apply-patches.sh (100%)
 rename {scripts => support/scripts}/build-ext3-img (100%)
 rename {scripts => support/scripts}/copy.sh (100%)
 rename {scripts => support/scripts}/graph-depends (100%)
 rename {scripts => support/scripts}/mkmakefile (93%)
 rename {scripts => support/scripts}/pkg-stats (99%)
 rename {scripts => support/scripts}/setlocalversion (100%)

Thanks,
-- 
Thomas Petazzoni
