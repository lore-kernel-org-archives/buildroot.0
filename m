From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Nov 2012 14:53:47 +0100
Subject: [Buildroot] [pull request] Pull request for branch xtensa
Message-ID: <cover.1352987586.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This version includes an additional patch that quotes the string
configuration options, as suggested by Yann E. Morin.

Thomas

The following changes since commit 53adfc5f4976704d426681a0404c1643db009552:

  lua: refactor without useless define's (2012-11-15 12:39:19 +0100)

are available in the git repository at:

  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git xtensa

for you to fetch changes up to 4376ef19f7a7e37034dc1ce844b6a13548e43653:

  arch: Config.in string configuration options must be quoted (2012-11-15 14:52:30 +0100)

----------------------------------------------------------------
Chris Zankel (2):
      xtensa: add support for the Xtensa architecture
      xtensa: support configurable processor configurations

Thomas Petazzoni (4):
      arch: improve definition of gcc mtune, mcpu, etc.
      uClibc: remove useless linuxthreads-errno-fix patch
      uClibc: update uClibc-snapshot.config to recent uClibcs
      arch: Config.in string configuration options must be quoted

 arch/Config.in                                     |   70 +++++-
 arch/Config.in.aarch64                             |    5 +
 arch/Config.in.arm                                 |   52 +++++
 arch/Config.in.avr32                               |    5 +
 arch/Config.in.bfin                                |    6 +
 arch/Config.in.common                              |  245 --------------------
 arch/Config.in.m68k                                |   21 ++
 arch/Config.in.microblaze                          |   10 +
 arch/Config.in.mips                                |   25 ++
 arch/Config.in.powerpc                             |   45 ++++
 arch/Config.in.sh                                  |   17 ++
 arch/Config.in.sparc                               |   31 +++
 arch/Config.in.x86                                 |   89 +++++++
 arch/Config.in.xtensa                              |   33 +++
 linux/Config.in                                    |    3 +-
 package/binutils/binutils.mk                       |    9 +
 package/ltrace/Config.in                           |    1 +
 toolchain/Config.in                                |    2 +-
 toolchain/gcc/gcc-uclibc-4.x.mk                    |    4 +
 toolchain/gdb/gdb.mk                               |    4 +
 toolchain/toolchain-buildroot/Config.in.2          |    4 +-
 toolchain/toolchain-common.in                      |    2 +-
 toolchain/uClibc/Config.in                         |    5 +-
 toolchain/uClibc/uClibc-snapshot.config            |    1 +
 .../uClibc.snapshot.linuxthreads-errno-fix.patch   |   68 ------
 toolchain/uClibc/uclibc.mk                         |    1 +
 26 files changed, 435 insertions(+), 323 deletions(-)
 create mode 100644 arch/Config.in.aarch64
 create mode 100644 arch/Config.in.avr32
 delete mode 100644 arch/Config.in.common
 create mode 100644 arch/Config.in.m68k
 create mode 100644 arch/Config.in.microblaze
 create mode 100644 arch/Config.in.xtensa
 delete mode 100644 toolchain/uClibc/uClibc.snapshot.linuxthreads-errno-fix.patch

Thanks,
-- 
Thomas Petazzoni
