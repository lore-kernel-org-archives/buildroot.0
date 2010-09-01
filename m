From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  1 Sep 2010 14:04:52 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2010.11/kconfig-upgrade
Message-ID: <cover.1283342666.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 4973632207fd496199298191ada01c8c8ec2bee7:
  Yann E. MORIN (1):
        packages/atk: fix Makefile

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot for-2010.11/kconfig-upgrade

Thomas Petazzoni (11):
      Remove CONFIG_DEFCONFIG
      Implement %_defconfig similarly to the kernel
      Clean up our patches against kconfig
      Bump package/config to 2.6.36-rc1
      Add support for the new nconf configuration tool
      Remove unnecessary ugly hacks in package/config
      Makefile: use long options names for the 'conf' utility
      Factorize environment variables for config utilities
      Add support for savedefconfig
      Ensure that all config-related files are generated before the build
      Tell git to ignore the Quilt internal directory in package/config

 Makefile                                           |  104 +-
 package/config/.gitignore                          |   37 +-
 package/config/Makefile                            |  418 +++++-
 package/config/Makefile.br                         |   53 +
 package/config/Makefile.kconfig                    |  303 ----
 package/config/README.buildroot2                   |   14 +-
 package/config/conf.c                              |  226 ++--
 package/config/confdata.c                          |  349 +++--
 package/config/expr.c                              |   33 +-
 package/config/expr.h                              |    8 +-
 package/config/gconf.c                             |  137 +--
 package/config/gconf.glade                         |   30 +-
 package/config/kconfig-language.txt                |  379 -----
 package/config/kconfig-to-buildroot2.patch         |  917 ------------
 package/config/kxgettext.c                         |    4 +-
 package/config/lex.zconf.c_shipped                 |   25 +-
 package/config/lkc.h                               |   19 +-
 package/config/lkc_proto.h                         |    7 +-
 package/config/lxdialog/.gitignore                 |    4 +
 package/config/lxdialog/checklist.c                |   10 +-
 package/config/lxdialog/inputbox.c                 |    4 +-
 package/config/lxdialog/menubox.c                  |   22 +-
 package/config/lxdialog/util.c                     |    2 +
 package/config/mconf.c                             |  120 +--
 package/config/menu.c                              |  137 ++-
 package/config/nconf.c                             | 1570 ++++++++++++++++++++
 package/config/nconf.gui.c                         |  617 ++++++++
 package/config/nconf.h                             |   95 ++
 .../patches/01-kconfig-kernel-to-buildroot.patch   |  298 ++++
 .../patches/02-cpp-comments-to-c-comments.patch    |  178 +++
 .../patches/03-change-config-option-prefix.patch   |  164 ++
 .../patches/05-really-clean-everything.patch       |   29 +
 .../patches/06-br-build-system-integration.patch   |   40 +
 package/config/patches/08-make-write-deps.patch    |  139 ++
 .../patches/09-implement-kconfig-probability.patch |   44 +
 package/config/patches/10-br-build-system.patch    |   80 +
 .../patches/11-use-mktemp-for-lxdialog.patch       |   17 +
 .../config/patches/12-fix-glade-file-path.patch    |   17 +
 .../patches/14-support-out-of-tree-config.patch    |  209 +++
 package/config/patches/series                      |   11 +
 package/config/qconf.cc                            |  121 +-
 package/config/qconf.h                             |   17 +-
 package/config/streamline_config.pl                |  422 ++++++
 package/config/symbol.c                            |  328 ++++-
 package/config/util.c                              |    4 +-
 package/config/zconf.gperf                         |    2 +
 package/config/zconf.hash.c_shipped                |    2 +
 package/config/zconf.l                             |    6 +-
 package/config/zconf.tab.c_shipped                 |  404 +++---
 package/config/zconf.y                             |   38 +-
 50 files changed, 5712 insertions(+), 2502 deletions(-)
 create mode 100644 package/config/Makefile.br
 delete mode 100644 package/config/Makefile.kconfig
 delete mode 100644 package/config/kconfig-language.txt
 delete mode 100644 package/config/kconfig-to-buildroot2.patch
 create mode 100644 package/config/lxdialog/.gitignore
 create mode 100644 package/config/nconf.c
 create mode 100644 package/config/nconf.gui.c
 create mode 100644 package/config/nconf.h
 create mode 100644 package/config/patches/01-kconfig-kernel-to-buildroot.patch
 create mode 100644 package/config/patches/02-cpp-comments-to-c-comments.patch
 create mode 100644 package/config/patches/03-change-config-option-prefix.patch
 create mode 100644 package/config/patches/05-really-clean-everything.patch
 create mode 100644 package/config/patches/06-br-build-system-integration.patch
 create mode 100644 package/config/patches/08-make-write-deps.patch
 create mode 100644 package/config/patches/09-implement-kconfig-probability.patch
 create mode 100644 package/config/patches/10-br-build-system.patch
 create mode 100644 package/config/patches/11-use-mktemp-for-lxdialog.patch
 create mode 100644 package/config/patches/12-fix-glade-file-path.patch
 create mode 100644 package/config/patches/14-support-out-of-tree-config.patch
 create mode 100644 package/config/patches/series
 create mode 100644 package/config/streamline_config.pl

Thanks,
-- 
Thomas Petazzoni
