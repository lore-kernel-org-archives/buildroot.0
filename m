From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Jan 2013 23:33:11 +0100
Subject: [Buildroot] [pull request v3] Pull request for branch
	yem-new-packages
Message-ID: <cover.1359498504.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series deals with adding the required packages to build QEMU on
the target.

Hopefully, we'll have time to review and definitely ack/nack that
during the DevDay in Brussels. ;-)


Changes v2 -> v3:
  - rebased on-top latest tree, drop already applied packages
  - bumped usbredir version (needed later for qemu 1.3.x)

Changes v1 -> v2:
  - vde2: do not require C++ (Peter)
  - usbredir: select libusb (Peter)
  - ceph: use 'select' instead of 'depends on'
  - cegui06: add comment


The following changes since commit 9b48690efb592ae17c9dd5a7db7b5ecebed09100:

  olsr: bump to version 0.6.4 (2013-01-29 22:46:43 +0100)

are available in the git repository at:
  git://gitorious.org/buildroot/buildroot.git yem-new-packages

Yann E. MORIN (7):
      package/usbredir: update to version 0.6
      package/pmake: add host pmake
      package/libbsd: new package
      package/libedit2: new package
      package/ceph: new package
      package/dtc: new package
      package/dtc: add option to install programs

 package/Config.in                                  |    4 +
 package/ceph/Config.in                             |   23 +
 package/ceph/ceph-no-envz.patch                    |   63 +
 package/ceph/ceph-no-getloadavg.patch              |   61 +
 package/ceph/ceph-no-posix_fallocate.patch         |   50 +
 package/ceph/ceph.mk                               |   53 +
 package/dtc/Config.in                              |   29 +
 package/dtc/dtc-extra_cflags.patch                 |   27 +
 package/dtc/dtc-separate-lib-install.patch         |   28 +
 package/dtc/dtc.mk                                 |   51 +
 package/libbsd/Config.in                           |   10 +
 package/libbsd/libbsd.mk                           |   21 +
 package/libedit2/Config.in                         |    9 +
 package/libedit2/libedit2-01-Makefile.patch        |   25 +
 package/libedit2/libedit2-02-el.c-issetugid.patch  |   24 +
 package/libedit2/libedit2-03-el.c-MAXPATHLEN.patch |   40 +
 .../libedit2/libedit2-04-readline.h-stdio.patch    |   17 +
 .../libedit2/libedit2-08-readline-history.h.patch  |   20 +
 .../libedit2/libedit2-10-define_SIZE_T_MAX.patch   |   18 +
 .../libedit2/libedit2-12-libedit-Makefile.patch    |   54 +
 package/libedit2/libedit2-20-fortify.patch         |   23 +
 package/libedit2/libedit2.mk                       |   75 +
 package/libedit2/libedit2.pc                       |   13 +
 package/pmake/pmake-100_mk.patch                   | 2624 ++++++++++++++++++++
 package/pmake/pmake-110_mkdep.patch                |  230 ++
 package/pmake/pmake-120_fixes.patch                |  266 ++
 package/pmake/pmake-130_maxpathlen.patch           |   39 +
 package/pmake/pmake-140_multiarch.patch            |  354 +++
 package/pmake/pmake-150_mktemp.patch               |   31 +
 package/pmake/pmake.mk                             |   46 +
 package/usbredir/usbredir.mk                       |    2 +-
 31 files changed, 4329 insertions(+), 1 deletions(-)
 create mode 100644 package/ceph/Config.in
 create mode 100644 package/ceph/ceph-no-envz.patch
 create mode 100644 package/ceph/ceph-no-getloadavg.patch
 create mode 100644 package/ceph/ceph-no-posix_fallocate.patch
 create mode 100644 package/ceph/ceph.mk
 create mode 100644 package/dtc/Config.in
 create mode 100644 package/dtc/dtc-extra_cflags.patch
 create mode 100644 package/dtc/dtc-separate-lib-install.patch
 create mode 100644 package/dtc/dtc.mk
 create mode 100644 package/libbsd/Config.in
 create mode 100644 package/libbsd/libbsd.mk
 create mode 100644 package/libedit2/Config.in
 create mode 100644 package/libedit2/libedit2-01-Makefile.patch
 create mode 100644 package/libedit2/libedit2-02-el.c-issetugid.patch
 create mode 100644 package/libedit2/libedit2-03-el.c-MAXPATHLEN.patch
 create mode 100644 package/libedit2/libedit2-04-readline.h-stdio.patch
 create mode 100644 package/libedit2/libedit2-08-readline-history.h.patch
 create mode 100644 package/libedit2/libedit2-10-define_SIZE_T_MAX.patch
 create mode 100644 package/libedit2/libedit2-12-libedit-Makefile.patch
 create mode 100644 package/libedit2/libedit2-20-fortify.patch
 create mode 100644 package/libedit2/libedit2.mk
 create mode 100644 package/libedit2/libedit2.pc
 create mode 100644 package/pmake/pmake-100_mk.patch
 create mode 100644 package/pmake/pmake-110_mkdep.patch
 create mode 100644 package/pmake/pmake-120_fixes.patch
 create mode 100644 package/pmake/pmake-130_maxpathlen.patch
 create mode 100644 package/pmake/pmake-140_multiarch.patch
 create mode 100644 package/pmake/pmake-150_mktemp.patch
 create mode 100644 package/pmake/pmake.mk

Regards,
Yann E. MORIN

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
