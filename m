From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 14 Nov 2013 00:53:32 +0100
Subject: [Buildroot] [pull request for next] Pull request for branch
	yem/kconfig
Message-ID: <cover.1384386575.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

While I was at it to fix the kconfig space-can't-deselect issue, I
decided to go a bit further, and update and clean up our kconfig.

So here is this series for 'next'.

Note that we ditch two of our patches: one because it is useless
(C++-style comments), one because it's been upstreamed (probability).
Also, the README was updated to also include copying of .gitignore,
which was missing so far.

Regards,
Yann E. MORIN.


The following changes since commit c09f5aaa0f342d0fbfc12a6d8f4b704fab55f400:

  docs/download.html: Fix tarball typos (2013-11-13 21:41:04 +0100)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/kconfig

for you to fetch changes up to eabc0ac6fc62b091a78c1f78a987fbe3962e0c95:

  support/kconfig: bump to kconfig from linux-3.12 (2013-11-14 00:49:01 +0100)

----------------------------------------------------------------
Yann E. MORIN (4):
      support/kconfig: fix 'space' to (de)select options
      support/kconfig: update our README
      support/kconfig: remove useless patch
      support/kconfig: bump to kconfig from linux-3.12

 support/kconfig/Makefile                           |   4 +-
 support/kconfig/README.buildroot                   |   2 +-
 support/kconfig/conf.c                             |  16 +-
 support/kconfig/confdata.c                         | 111 +++-
 support/kconfig/expr.c                             |  42 +-
 support/kconfig/expr.h                             |   3 +
 support/kconfig/list.h                             |  40 ++
 support/kconfig/lkc.h                              |   3 +-
 support/kconfig/lkc_proto.h                        |   1 +
 support/kconfig/lxdialog/check-lxdialog.sh         |   6 +-
 support/kconfig/lxdialog/checklist.c               |   8 +-
 support/kconfig/lxdialog/dialog.h                  |  21 +
 support/kconfig/lxdialog/inputbox.c                |   8 +-
 support/kconfig/lxdialog/menubox.c                 |  17 +-
 support/kconfig/lxdialog/textbox.c                 |   6 +-
 support/kconfig/lxdialog/util.c                    |  85 +++-
 support/kconfig/lxdialog/yesno.c                   |   8 +-
 support/kconfig/mconf.c                            | 108 +++-
 support/kconfig/menu.c                             |  73 ++-
 support/kconfig/merge_config.sh                    |  10 +-
 support/kconfig/nconf.c                            |  41 +-
 support/kconfig/nconf.gui.c                        |  20 +-
 .../patches/01-kconfig-kernel-to-buildroot.patch   |  22 +-
 .../patches/02-cpp-comments-to-c-comments.patch    | 178 -------
 .../patches/09-implement-kconfig-probability.patch |  44 --
 .../patches/11-use-mktemp-for-lxdialog.patch       |   2 +-
 .../patches/14-support-out-of-tree-config.patch    |  14 +-
 .../kconfig/patches/15-fix-qconf-moc-rule.patch    |   2 +-
 .../16-fix-space-to-de-select-options.patch        |  41 ++
 support/kconfig/patches/series                     |   3 +-
 support/kconfig/streamline_config.pl               |  26 +-
 support/kconfig/symbol.c                           | 103 +++-
 support/kconfig/zconf.tab.c_shipped                | 562 +++++++++++----------
 support/kconfig/zconf.y                            |  11 +-
 34 files changed, 944 insertions(+), 697 deletions(-)
 delete mode 100644 support/kconfig/patches/02-cpp-comments-to-c-comments.patch
 delete mode 100644 support/kconfig/patches/09-implement-kconfig-probability.patch
 create mode 100644 support/kconfig/patches/16-fix-space-to-de-select-options.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
