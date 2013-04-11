From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Apr 2013 09:30:39 +0200
Subject: [Buildroot] [git commit] support/kconfig: upgrade to 3.9-rc2
Message-ID: <20130411081133.8DEF99AE56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6997e461fdb39985957d24d81e612113cf39e35c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Our kconfig code is updated to the version of kernel 3.9-rc2. No major
issues during the migration, except:

 * Some conflicts when applying 03-change-config-option-prefix.patch
   due to upstream kernel changes.

 * The need of adding a new patch, 15-fix-qconf-moc-rule.patch, to fix
   the make rule that generates the moc file for the Qt-based
   interface.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/kconfig/Makefile                           |  145 +++-----
 support/kconfig/README.buildroot2                  |    2 +-
 support/kconfig/check.sh                           |    2 +-
 support/kconfig/conf.c                             |   98 ++++--
 support/kconfig/confdata.c                         |  369 ++++++++++++------
 support/kconfig/expr.c                             |   15 +-
 support/kconfig/expr.h                             |   12 +-
 support/kconfig/gconf.c                            |   51 +---
 support/kconfig/kconfig_load.c                     |   35 --
 support/kconfig/kxgettext.c                        |    1 -
 support/kconfig/list.h                             |   91 +++++
 support/kconfig/lkc.h                              |   32 +-
 support/kconfig/lkc_proto.h                        |    7 +-
 support/kconfig/lxdialog/check-lxdialog.sh         |   11 +-
 support/kconfig/lxdialog/dialog.h                  |   10 +-
 support/kconfig/lxdialog/inputbox.c                |  121 +++++--
 support/kconfig/lxdialog/menubox.c                 |   20 +-
 support/kconfig/lxdialog/textbox.c                 |  177 +++++----
 support/kconfig/lxdialog/util.c                    |    7 +
 support/kconfig/mconf.c                            |  269 +++++++++----
 support/kconfig/menu.c                             |   75 +++-
 support/kconfig/merge_config.sh                    |  142 +++++++
 support/kconfig/nconf.c                            |  401 ++++++++++----------
 support/kconfig/nconf.gui.c                        |   69 +++-
 support/kconfig/nconf.h                            |    2 +-
 .../patches/01-kconfig-kernel-to-buildroot.patch   |   32 +-
 .../patches/02-cpp-comments-to-c-comments.patch    |   30 +-
 .../patches/03-change-config-option-prefix.patch   |  174 ++++-----
 .../patches/06-br-build-system-integration.patch   |   10 +-
 .../patches/09-implement-kconfig-probability.patch |   10 +-
 support/kconfig/patches/10-br-build-system.patch   |    8 +-
 .../patches/11-use-mktemp-for-lxdialog.patch       |    8 +-
 .../kconfig/patches/12-fix-glade-file-path.patch   |    8 +-
 .../patches/14-support-out-of-tree-config.patch    |   38 +-
 .../kconfig/patches/15-fix-qconf-moc-rule.patch    |   24 ++
 support/kconfig/patches/series                     |    1 +
 support/kconfig/qconf.cc                           |   18 +-
 support/kconfig/qconf.h                            |    2 +-
 support/kconfig/streamline_config.pl               |  291 ++++++++++++---
 support/kconfig/symbol.c                           |   66 +++-
 support/kconfig/util.c                             |   25 ++-
 support/kconfig/zconf.gperf                        |    2 +-
 support/kconfig/zconf.hash.c_shipped               |  273 ++++++++------
 support/kconfig/zconf.l                            |   17 +-
 .../{lex.zconf.c_shipped => zconf.lex.c_shipped}   |   35 +--
 support/kconfig/zconf.tab.c_shipped                |   69 ++--
 support/kconfig/zconf.y                            |   19 +-
 47 files changed, 2076 insertions(+), 1248 deletions(-)

Patch is too large, so refusing to show it
