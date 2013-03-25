From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Mar 2013 00:27:55 +0100
Subject: [Buildroot] [pull request v2] Pull request for branch yem-patchwork
Message-ID: <cover.1364253936.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter, All!

This series is the collection of patches I've been working on during
the Patchwork Bashing Day. Details bellow.


Changes v1 -> v2:
  - foomatic-filters: inherit libusb deps  (Thomas)
  - gutenprint: licensing terms  (Thomas)
  - manual: tweak host-utilities list, misc fixes


The following changes since commit 1cd3f992fb3659aacbb0cdd3ed64347a37569891:

  Support .dotfiles in / being copied to the TARGET (2013-03-25 23:38:26 +0100)

are available in the git repository at:
  git://gitorious.org/buildroot/buildroot.git yem-patchwork

Jerzy Grzegorek (1):
      apply-patches.sh: applying xz-ed patches

Maxime Hadjinlian (1):
      configs: add RaspberryPi defconfig

Olivier Schonken (3):
      Added package enscript
      Added package foomatic-filters
      Added package Gutenprint

Samuel Martin (7):
      manual: add manual generation date/git revision in the manual text
      support: add kconfiglib python module
      support/scripts: add gen-manual-lists.py
      manual: cleanup appendix.txt
      manual: add a make target 'manual-update-lists'
      update gitignore
      manual: do not track generated files

Simon Dawson (3):
      czmq: new package
      cppzmq: new package
      zmqpp: new package

 .gitignore                                         |    1 +
 board/raspberrypi/README.txt                       |  127 +
 configs/rpi_defconfig                              |   23 +
 docs/manual/appendix.txt                           |   31 +-
 docs/manual/deprecated-list.txt                    |   46 -
 docs/manual/manual.mk                              |   19 +-
 docs/manual/manual.txt                             |    3 +
 docs/manual/pkg-list.txt                           |  870 -----
 package/Config.in                                  |    6 +
 package/cppzmq/Config.in                           |   15 +
 package/cppzmq/cppzmq.mk                           |   23 +
 package/czmq/Config.in                             |   14 +
 package/czmq/czmq.mk                               |   23 +
 package/enscript/Config.in                         |   11 +
 package/enscript/enscript.mk                       |   19 +
 package/foomatic-filters/Config.in                 |   18 +
 package/foomatic-filters/foomatic-filters.mk       |   20 +
 package/gutenprint/Config.in                       |   14 +
 .../gutenprint-000-use-pregen-xmli18n-header.patch |   48 +
 package/gutenprint/gutenprint.mk                   |   73 +
 package/zmqpp/Config.in                            |   32 +
 package/zmqpp/zmqpp-fix-typos-in-code.patch        |   46 +
 package/zmqpp/zmqpp.mk                             |   54 +
 support/scripts/apply-patches.sh                   |    6 +-
 support/scripts/gen-manual-lists.py                |  379 ++
 support/scripts/kconfiglib.py                      | 3772 ++++++++++++++++++++
 support/scripts/readme.kconfiglib                  |   30 +
 27 files changed, 4791 insertions(+), 932 deletions(-)
 create mode 100644 board/raspberrypi/README.txt
 create mode 100644 configs/rpi_defconfig
 delete mode 100644 docs/manual/deprecated-list.txt
 delete mode 100644 docs/manual/pkg-list.txt
 create mode 100644 package/cppzmq/Config.in
 create mode 100644 package/cppzmq/cppzmq.mk
 create mode 100644 package/czmq/Config.in
 create mode 100644 package/czmq/czmq.mk
 create mode 100644 package/enscript/Config.in
 create mode 100644 package/enscript/enscript.mk
 create mode 100644 package/foomatic-filters/Config.in
 create mode 100644 package/foomatic-filters/foomatic-filters.mk
 create mode 100644 package/gutenprint/Config.in
 create mode 100644 package/gutenprint/gutenprint-000-use-pregen-xmli18n-header.patch
 create mode 100644 package/gutenprint/gutenprint.mk
 create mode 100644 package/zmqpp/Config.in
 create mode 100644 package/zmqpp/zmqpp-fix-typos-in-code.patch
 create mode 100644 package/zmqpp/zmqpp.mk
 create mode 100755 support/scripts/gen-manual-lists.py
 create mode 100644 support/scripts/kconfiglib.py
 create mode 100644 support/scripts/readme.kconfiglib

Regards,
Yann E. MORIN

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
