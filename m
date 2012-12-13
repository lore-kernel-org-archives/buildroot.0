From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 13 Dec 2012 22:47:00 +0100
Subject: [Buildroot] [pull request] Pull request for branch yem-new-packages
Message-ID: <cover.1355435224.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This patch series is an extract from my qemu-related big-ish series,
that I did split up to ease regview / integration upstream.

This part of the series is unrelated to the previously-sent series
yem-host-qemu-fixes.

This series deals with adding the required packages to build QEMU on
the target.

The following changes since commit e043dd6c99a801dc7f863986c78c947e25c75b3f:

  barebox: bump to version 2012.12.1 (2012-12-13 09:37:10 +0100)

are available in the git repository at:
  git://gitorious.org/buildroot/buildroot.git yem-new-packages

Yann E. MORIN (20):
      package/vde2: new package
      package/libiscsi: new package
      package/usbredir: new package
      package/celt051: new package
      package/python-pyparsing: new package
      package/cegui06: new package
      package/slirp: new package
      package/spice-protocol: new package
      package/spice: new package
      package/spice: enable client
      package/spice: enable GUI
      package/spice: enable slirp support
      package/libseccomp: new package
      package/keyutils: new package
      package/pmake: add host pmake
      package/libbsd: new package
      package/libedit2: new package
      package/ceph: new package
      package/dtc: new package
      package/dtc: add option to install programs

 package/Config.in                                  |   14 +
 package/cegui06/Config.in                          |   15 +
 package/cegui06/cegui06-stddef.h.patch             |   26 +
 package/cegui06/cegui06.mk                         |   36 +
 package/ceph/Config.in                             |   18 +
 package/ceph/ceph-no-envz.patch                    |   63 +
 package/ceph/ceph-no-getloadavg.patch              |   61 +
 package/ceph/ceph-no-posix_fallocate.patch         |   50 +
 package/ceph/ceph.mk                               |   53 +
 package/dtc/Config.in                              |   29 +
 package/dtc/dtc-extra_cflags.patch                 |   27 +
 package/dtc/dtc-separate-lib-install.patch         |   28 +
 package/dtc/dtc.mk                                 |   51 +
 package/keyutils/Config.in                         |    7 +
 .../keyutils-01-memleak-from-realloc.patch         |   51 +
 package/keyutils/keyutils-02-another-memleak.patch |   32 +
 package/keyutils/keyutils-03-cifs.patch            |   15 +
 .../keyutils-04-Makefile-for-buildroot.patch       |   65 +
 .../keyutils/keyutils-05-fix-install-rule.patch    |   19 +
 package/keyutils/keyutils.mk                       |   32 +
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
 package/libiscsi/Config.in                         |   12 +
 package/libiscsi/libiscsi.mk                       |   15 +
 package/libseccomp/Config.in                       |   13 +
 ...ibseccomp-use-system-headers-from-sysroot.patch |   17 +
 package/libseccomp/libseccomp.mk                   |   22 +
 package/multimedia/Config.in                       |    1 +
 package/multimedia/celt051/Config.in               |   15 +
 package/multimedia/celt051/celt.mk                 |   30 +
 package/pmake/pmake-100_mk.patch                   | 2624 ++++++++++++++++++++
 package/pmake/pmake-110_mkdep.patch                |  230 ++
 package/pmake/pmake-120_fixes.patch                |  266 ++
 package/pmake/pmake-130_maxpathlen.patch           |   39 +
 package/pmake/pmake-140_multiarch.patch            |  354 +++
 package/pmake/pmake-150_mktemp.patch               |   31 +
 package/pmake/pmake.mk                             |   46 +
 package/python-pyparsing/Config.in                 |   11 +
 package/python-pyparsing/python-pyparsing.mk       |   38 +
 package/slirp/Config.in                            |   25 +
 package/slirp/slirp.mk                             |   21 +
 package/spice-protocol/Config.in                   |   12 +
 package/spice-protocol/spice-protocol.mk           |   14 +
 package/spice/Config.in                            |   51 +
 package/spice/spice.mk                             |   80 +
 package/usbredir/Config.in                         |   28 +
 package/usbredir/usbredir.mk                       |   31 +
 package/vde2/Config.in                             |   10 +
 package/vde2/vde2.mk                               |   36 +
 60 files changed, 5113 insertions(+), 0 deletions(-)
 create mode 100644 package/cegui06/Config.in
 create mode 100644 package/cegui06/cegui06-stddef.h.patch
 create mode 100644 package/cegui06/cegui06.mk
 create mode 100644 package/ceph/Config.in
 create mode 100644 package/ceph/ceph-no-envz.patch
 create mode 100644 package/ceph/ceph-no-getloadavg.patch
 create mode 100644 package/ceph/ceph-no-posix_fallocate.patch
 create mode 100644 package/ceph/ceph.mk
 create mode 100644 package/dtc/Config.in
 create mode 100644 package/dtc/dtc-extra_cflags.patch
 create mode 100644 package/dtc/dtc-separate-lib-install.patch
 create mode 100644 package/dtc/dtc.mk
 create mode 100644 package/keyutils/Config.in
 create mode 100644 package/keyutils/keyutils-01-memleak-from-realloc.patch
 create mode 100644 package/keyutils/keyutils-02-another-memleak.patch
 create mode 100644 package/keyutils/keyutils-03-cifs.patch
 create mode 100644 package/keyutils/keyutils-04-Makefile-for-buildroot.patch
 create mode 100644 package/keyutils/keyutils-05-fix-install-rule.patch
 create mode 100644 package/keyutils/keyutils.mk
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
 create mode 100644 package/libiscsi/Config.in
 create mode 100644 package/libiscsi/libiscsi.mk
 create mode 100644 package/libseccomp/Config.in
 create mode 100644 package/libseccomp/libseccomp-use-system-headers-from-sysroot.patch
 create mode 100644 package/libseccomp/libseccomp.mk
 create mode 100644 package/multimedia/celt051/Config.in
 create mode 100644 package/multimedia/celt051/celt.mk
 create mode 100644 package/pmake/pmake-100_mk.patch
 create mode 100644 package/pmake/pmake-110_mkdep.patch
 create mode 100644 package/pmake/pmake-120_fixes.patch
 create mode 100644 package/pmake/pmake-130_maxpathlen.patch
 create mode 100644 package/pmake/pmake-140_multiarch.patch
 create mode 100644 package/pmake/pmake-150_mktemp.patch
 create mode 100644 package/pmake/pmake.mk
 create mode 100644 package/python-pyparsing/Config.in
 create mode 100644 package/python-pyparsing/python-pyparsing.mk
 create mode 100644 package/slirp/Config.in
 create mode 100644 package/slirp/slirp.mk
 create mode 100644 package/spice-protocol/Config.in
 create mode 100644 package/spice-protocol/spice-protocol.mk
 create mode 100644 package/spice/Config.in
 create mode 100644 package/spice/spice.mk
 create mode 100644 package/usbredir/Config.in
 create mode 100644 package/usbredir/usbredir.mk
 create mode 100644 package/vde2/Config.in
 create mode 100644 package/vde2/vde2.mk

Regards,
Yann E. MORIN

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
