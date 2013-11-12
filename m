From: Spenser Gilliland <spenser@gillilanding.com>
Date: Tue, 12 Nov 2013 11:31:40 -0600
Subject: [Buildroot] [PATCH v2 0/5] Add Microblaze internal toolchain
Message-ID: <1384277505-11503-1-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series adds a Microblaze internal toolchain from the sources at
http://github.com/Xilinx .

Spenser Gilliland (5):
  binutils: add microblaze internal toolchain
  gcc: add microblaze internal toolchain
  glibc: add microblaze internal toolchain
  gdb: add microblaze internal toolchain
  toolchain: enable microblaze toolchain

 package/binutils/Config.in.host                    |    2 +
 package/binutils/binutils.mk                       |    5 +
 package/gcc/4.9-microblaze/100-uclibc-conf.patch   |   15 ++
 .../4.9-microblaze/301-missing-execinfo_h.patch    |   13 ++
 package/gcc/4.9-microblaze/302-c99-snprintf.patch  |   13 ++
 .../305-libmudflap-susv3-legacy.patch              |   49 +++++++
 .../gcc/4.9-microblaze/disable_gc_sections.patch   |  145 ++++++++++++++++++++
 package/gcc/Config.in.host                         |   36 ++++--
 package/gcc/gcc.mk                                 |   12 ++-
 package/gdb/Config.in.host                         |    4 +
 package/gdb/gdb.mk                                 |    9 +-
 package/glibc/glibc.mk                             |   12 ++
 toolchain/Config.in                                |    2 +-
 toolchain/toolchain-buildroot/Config.in            |    4 +-
 14 files changed, 305 insertions(+), 16 deletions(-)
 create mode 100644 package/gcc/4.9-microblaze/100-uclibc-conf.patch
 create mode 100644 package/gcc/4.9-microblaze/301-missing-execinfo_h.patch
 create mode 100644 package/gcc/4.9-microblaze/302-c99-snprintf.patch
 create mode 100644 package/gcc/4.9-microblaze/305-libmudflap-susv3-legacy.patch
 create mode 100644 package/gcc/4.9-microblaze/disable_gc_sections.patch
