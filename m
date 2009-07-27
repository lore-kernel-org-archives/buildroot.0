From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2009 16:11:09 +0200
Subject: [Buildroot] [pull request] Pull request for branch kconfig-update
Message-ID: <cover.1248703870.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 660952565ed0c76b4a2e345bb79fd553a4f53d77:
  Thomas Petazzoni (1):
        Update CHANGES with recent improvements

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot kconfig-update

Alper Yildirim (2):
      config: Update package/config to Kconfig 2.6.30
      config: Add support for xconfig

Thomas Petazzoni (2):
      xconfig: Change titlebar to Buildroot Configuration
      xconfig: Save the configuration properly in qconf

 Makefile                                   |   22 +-
 package/config/Makefile                    |    9 +
 package/config/Makefile.kconfig            |   57 ++-
 package/config/POTFILES.in                 |    7 +
 package/config/conf.c                      |  259 ++++----
 package/config/confdata.c                  |  139 ++++-
 package/config/expr.c                      |   32 +-
 package/config/expr.h                      |   94 ++-
 package/config/gconf.c                     |   16 +-
 package/config/kconfig-language.txt        |  102 +++-
 package/config/kconfig-to-buildroot2.patch |  945 +++++++---------------------
 package/config/kxgettext.c                 |    4 +
 package/config/lex.zconf.c_shipped         |   87 ++-
 package/config/lkc.h                       |   21 +-
 package/config/lkc_proto.h                 |    2 +-
 package/config/lxdialog/check-lxdialog.sh  |   20 +-
 package/config/lxdialog/checklist.c        |    7 +-
 package/config/lxdialog/dialog.h           |   11 +-
 package/config/lxdialog/inputbox.c         |    6 +-
 package/config/lxdialog/menubox.c          |    6 +-
 package/config/lxdialog/textbox.c          |    2 +-
 package/config/lxdialog/util.c             |   32 +-
 package/config/lxdialog/yesno.c            |    4 +-
 package/config/mconf.c                     |  126 ++---
 package/config/menu.c                      |   74 ++-
 package/config/qconf.cc                    |  154 +++---
 package/config/symbol.c                    |  219 +++++--
 package/config/util.c                      |   28 +-
 package/config/zconf.gperf                 |    2 +-
 package/config/zconf.hash.c_shipped        |   19 +-
 package/config/zconf.l                     |   18 +-
 package/config/zconf.tab.c_shipped         |  301 +++++-----
 package/config/zconf.y                     |   13 +-
 33 files changed, 1384 insertions(+), 1454 deletions(-)

Thanks,
-- 
Thomas Petazzoni
