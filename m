From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 May 2013 23:45:56 +0200
Subject: [Buildroot] [pull request v8 (for next)] Pull request for branch
	yem-new-packages
Message-ID: <cover.1368567696.git.yann.morin.1998@free.fr>
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


Changes v7 -> v8:
  - fix pmake wrapper, makes libedit2 actually build (noticed by Peter)
  - add snappy (latter needed by ceph, not yet in due to missing deps so far)

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


The following changes since commit 594f07e85221fcf7bf7228804e9c7499a69fd5f0:

  beaglebone: enable NFS root support (2013-05-14 22:51:18 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem-new-packages

for you to fetch changes up to 593d227bcb531b484e9a613baee53d3acaf9370b:

  package/snappy: new package (2013-05-14 23:37:33 +0200)

----------------------------------------------------------------
Tag base for branch "yem-target-qemu"

----------------------------------------------------------------
Yann E. MORIN (3):
      package/pmake: force argv[0]=${0} in the pmake wrapper
      package/libedit2: new package
      package/snappy: new package

 package/Config.in            |  2 ++
 package/libedit2/Config.in   |  9 ++++++
 package/libedit2/libedit2.mk | 76 ++++++++++++++++++++++++++++++++++++++++++++
 package/libedit2/libedit2.pc | 13 ++++++++
 package/pmake/pmake.mk       |  2 +-
 package/snappy/Config.in     |  9 ++++++
 package/snappy/snappy.mk     | 13 ++++++++
 7 files changed, 123 insertions(+), 1 deletion(-)
 create mode 100644 package/libedit2/Config.in
 create mode 100644 package/libedit2/libedit2.mk
 create mode 100644 package/libedit2/libedit2.pc
 create mode 100644 package/snappy/Config.in
 create mode 100644 package/snappy/snappy.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
