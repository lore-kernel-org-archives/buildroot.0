From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 14 Nov 2013 12:34:49 +0100
Subject: [Buildroot] [git commit branch/next] support/kconfig: bump to
	kconfig from linux-3.12
Message-ID: <20131114124850.5FAB59BBB6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b48e35a28a6391ec16f09df66ad5b1065330f265
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

With this, we can trash our probability patch, it's now upstream.
Refresh a few other patches.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/kconfig/Makefile                           |    4 +-
 support/kconfig/conf.c                             |   16 +-
 support/kconfig/confdata.c                         |  111 +++-
 support/kconfig/expr.h                             |    3 +
 support/kconfig/list.h                             |   40 ++
 support/kconfig/lkc.h                              |    3 +-
 support/kconfig/lkc_proto.h                        |    1 +
 support/kconfig/lxdialog/check-lxdialog.sh         |    6 +-
 support/kconfig/lxdialog/checklist.c               |    8 +-
 support/kconfig/lxdialog/dialog.h                  |   21 +
 support/kconfig/lxdialog/inputbox.c                |    8 +-
 support/kconfig/lxdialog/menubox.c                 |   15 +-
 support/kconfig/lxdialog/textbox.c                 |    6 +-
 support/kconfig/lxdialog/util.c                    |   85 +++-
 support/kconfig/lxdialog/yesno.c                   |    8 +-
 support/kconfig/mconf.c                            |  108 ++++-
 support/kconfig/menu.c                             |   73 +++-
 support/kconfig/merge_config.sh                    |   10 +-
 support/kconfig/nconf.c                            |   41 +-
 support/kconfig/nconf.gui.c                        |   20 +-
 .../patches/01-kconfig-kernel-to-buildroot.patch   |   22 +-
 .../patches/09-implement-kconfig-probability.patch |   44 --
 .../patches/11-use-mktemp-for-lxdialog.patch       |    2 +-
 .../patches/14-support-out-of-tree-config.patch    |   14 +-
 .../kconfig/patches/15-fix-qconf-moc-rule.patch    |    2 +-
 support/kconfig/patches/series                     |    1 -
 support/kconfig/streamline_config.pl               |   26 +-
 support/kconfig/symbol.c                           |  103 +++-
 support/kconfig/zconf.tab.c_shipped                |  562 +++++++++++---------
 support/kconfig/zconf.y                            |   11 +-
 30 files changed, 879 insertions(+), 495 deletions(-)

Patch is too large, so refusing to show it
