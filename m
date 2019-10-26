From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 26 Oct 2019 16:53:21 +0200
Subject: [Buildroot] [PATCH 0/5] core: update our requirements (branch
 yem/update-prereqs)
Message-ID: <cover.1572101547.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series addresses parts of our requiremetns, to update them:

  - drop check-uniq-files, as it is unused,
  - drop python as a mandatory dependencies,
  - update gcc/g++ minimum version
  - update packages to drop the host-gcc-4.8(-) dependencies


Regards,
Yann E. MORIN.


The following changes since commit 76b4fcb5dc0eb9f19060a8d7ca9dde087138d62c

  support/testing: add luvi test (2019-10-26 16:33:12 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 10622e30b5a65ef672f2de039d424046e0089bdb

  packages: host gcc >= 4.8 is now guaranteed (2019-10-26 16:51:34 +0200)


----------------------------------------------------------------
Yann E. MORIN (5):
      core: drop check-uniq-files
      support/dependencies: don't check for python on the host
      docs/manual: python is no longer a mandatory dependency
      docs/manual: bump our gcc/g++ requirements to 4.8
      packages: host gcc >= 4.8 is now guaranteed

 Config.in                              | 21 ---------------
 Makefile                               |  3 ---
 docs/manual/prerequisite.txt           | 13 ++++++---
 package/clang/Config.in                |  5 ++--
 package/collectd/Config.in             |  6 ++---
 package/cppcms/Config.in               |  5 ++--
 package/efibootmgr/Config.in           |  6 ++---
 package/efivar/Config.in               |  7 ++---
 package/efl/Config.in                  |  8 +++---
 package/gdb/Config.in.host             | 12 ---------
 package/google-breakpad/Config.in      |  3 +--
 package/grpc/Config.in                 |  6 ++---
 package/gtkmm3/Config.in               |  4 +--
 package/icu/Config.in                  |  6 ++---
 package/imagemagick/Config.in.host     |  4 ---
 package/kodi/Config.in                 |  4 +--
 package/kvm-unit-tests/Config.in       |  5 ----
 package/libclc/Config.in               |  1 -
 package/libgtk3/Config.in              |  5 +---
 package/lld/Config.in.host             |  5 ----
 package/llvm/Config.in                 |  5 ++--
 package/mesa3d/Config.in               |  5 ++--
 package/mfgtools/Config.in.host        |  4 ---
 package/midori/Config.in               |  5 ++--
 package/mosh/Config.in                 |  5 ++--
 package/php/Config.ext                 |  6 ++---
 package/protobuf-c/Config.in           |  6 ++---
 package/protobuf/Config.in             |  6 ++---
 package/python-mwscrape2slob/Config.in |  4 +--
 package/python-protobuf/Config.in      |  1 -
 package/python-pyicu/Config.in         |  6 ++---
 package/python-slob/Config.in          |  4 +--
 package/qt-webkit-kiosk/Config.in      |  6 ++---
 package/qt5/Config.in                  |  5 ++--
 package/qt5/qt5base/Config.in          |  6 ++---
 package/qt5/qt5tools/Config.in         |  5 ----
 package/qt5/qt5webengine/Config.in     |  5 ++--
 package/qt5/qt5webkit/Config.in        |  6 ++---
 package/riemann-c-client/Config.in     |  6 ++---
 package/rustc/Config.in.host           |  4 ---
 package/vte/Config.in                  |  4 +--
 package/webkitgtk/Config.in            |  4 +--
 package/wpewebkit/Config.in            |  5 ++--
 support/dependencies/dependencies.sh   | 23 ++++------------
 support/scripts/check-uniq-files       | 48 ----------------------------------
 45 files changed, 70 insertions(+), 243 deletions(-)
 delete mode 100755 support/scripts/check-uniq-files

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
