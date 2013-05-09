From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 10 May 2013 00:22:53 +0200
Subject: [Buildroot] [pull request v7] Pull request for branch
	yem-new-packages
Message-ID: <cover.1368137904.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

This series deals with adding some packages required to build QEMU on
the target.

Regards,
Yann E. MORIN


Changes v6 -> v7:
  - simple resend as requested by Peter on IRC, for -next (2013.08)

Changes v5 -> v6:
  - removed libedit2 patches, grab them at download time (Arnout)

Changes v4 -> v5:
  - fixed the ceph build after the boost changes
  - rebased ontop current master

Changes v3 -> v4:
  - removed pmake patches, grab them at download time (Arnout, Thomas)

Changes v2 -> v3:
  - rebased on-top latest tree, drop already applied packages
  - bumped usbredir version (needed later for qemu 1.3.x)

Changes v1 -> v2:
  - vde2: do not require C++ (Peter)
  - usbredir: select libusb (Peter)
  - ceph: use 'select' instead of 'depends on'
  - cegui06: add comment


The following changes since commit 92651931e72afad0f829d651ad3d0286b5a14e06:

  Update for 2013.05-rc1 (2013-05-08 15:51:45 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem-new-packages

for you to fetch changes up to 073a879f6e3aeb6c0fab9d4cae4de39f566fb70a:

  package/dtc: add option to install programs (2013-05-08 16:12:05 +0200)

----------------------------------------------------------------
Tag base for branch "yem-target-qemu"

----------------------------------------------------------------
Yann E. MORIN (6):
      package/pmake: add host pmake
      package/libbsd: new package
      package/libedit2: new package
      package/ceph: new package
      package/dtc: new package
      package/dtc: add option to install programs

 package/Config.in                          |  4 ++
 package/ceph/Config.in                     | 25 ++++++++++
 package/ceph/ceph-no-envz.patch            | 63 +++++++++++++++++++++++++
 package/ceph/ceph-no-getloadavg.patch      | 61 ++++++++++++++++++++++++
 package/ceph/ceph-no-posix_fallocate.patch | 50 ++++++++++++++++++++
 package/ceph/ceph.mk                       | 57 ++++++++++++++++++++++
 package/dtc/Config.in                      | 33 +++++++++++++
 package/dtc/dtc-extra_cflags.patch         | 28 +++++++++++
 package/dtc/dtc-separate-lib-install.patch | 28 +++++++++++
 package/dtc/dtc.mk                         | 56 ++++++++++++++++++++++
 package/libbsd/Config.in                   | 10 ++++
 package/libbsd/libbsd.mk                   | 21 +++++++++
 package/libedit2/Config.in                 |  9 ++++
 package/libedit2/libedit2.mk               | 76 ++++++++++++++++++++++++++++++
 package/libedit2/libedit2.pc               | 13 +++++
 package/pmake/pmake.mk                     | 47 ++++++++++++++++++
 16 files changed, 581 insertions(+)
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
 create mode 100644 package/libedit2/libedit2.mk
 create mode 100644 package/libedit2/libedit2.pc
 create mode 100644 package/pmake/pmake.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
