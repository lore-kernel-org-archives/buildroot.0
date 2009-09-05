From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  5 Sep 2009 15:14:42 +0200
Subject: [Buildroot] [pull request] Pull request for branch qstrip
Message-ID: <cover.1252156486.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 4d0c00588f80c0424b2819ce2f3fb8fc7046ff53:
  Austin Foxley (1):
        uClibc as of 20090825 requires the ARCH to be specified when we call it's make

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot qstrip

Thomas Petazzoni (7):
      makefile: new qstrip make function
      makefile: use qstrip
      packages: use qstrip
      project: use qstrip
      target: use qstrip
      toolchain: use qstrip
      script: use qstrip

 Makefile                                           |    7 ++-
 package/Makefile.autotools.in                      |    2 +-
 package/Makefile.in                                |   26 +++-----
 package/busybox/busybox.mk                         |    6 +-
 package/haserl/haserl.mk                           |    3 +-
 package/microperl/microperl.mk                     |    3 +-
 package/qt/qt.mk                                   |   18 ++---
 package/quagga/quagga.mk                           |    3 +-
 package/socat/socat.mk                             |    9 +--
 project/Makefile.in                                |   71 +++++++-------------
 scripts/test/Makefile                              |    4 +-
 target/Makefile.in                                 |   22 ++----
 target/cpio/cpioroot.mk                            |    3 +-
 target/cramfs/cramfs.mk                            |    3 +-
 target/device/ARMLTD/Makefile.in                   |    6 +-
 target/device/Atmel/DataFlashBoot/DataflashBoot.mk |    3 +-
 target/device/Atmel/Makefile.in                    |   22 ++----
 target/device/Atmel/arch-arm/u-boot/Makefile.in    |    3 +-
 target/device/Atmel/at91bootstrap/at91bootstrap.mk |   18 ++---
 target/device/KwikByte/Makefile.in                 |   10 +--
 target/device/x86/i686/Makefile.in                 |    6 +-
 target/ext2/ext2root.mk                            |    6 +-
 target/generic/Makefile.in                         |    6 +-
 target/iso9660/iso9660.mk                          |    6 +-
 target/jffs2/jffs2root.mk                          |    6 +-
 target/linux/Makefile.in                           |   19 ++----
 target/linux/Makefile.in.advanced                  |   53 +++++----------
 target/squashfs/squashfsroot.mk                    |    3 +-
 target/tar/tarroot.mk                              |    3 +-
 target/u-boot/Makefile.in                          |   30 +++------
 target/ubifs/ubifsroot.mk                          |    6 +-
 target/xtensa/patch.in                             |    2 +-
 toolchain/binutils/binutils.mk                     |    6 +-
 toolchain/gcc/Makefile.in                          |   25 +++-----
 toolchain/gdb/gdb.mk                               |    3 +-
 toolchain/kernel-headers/kernel-headers.mk         |    3 +-
 toolchain/uClibc/uclibc.mk                         |   12 +--
 37 files changed, 153 insertions(+), 284 deletions(-)

Thanks,
-- 
Thomas Petazzoni
