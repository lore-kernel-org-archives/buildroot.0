From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 24 Jun 2018 15:53:05 +0200
Subject: [Buildroot] [PATCH v3 0/5] Add support for gdb 8.1
Message-ID: <20180624135310.16514-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is finally a respin of the gdb 8.1 support.

Changes since v2:

 - Rework "package/gdb: rework dependency for C++11" to fix issues
   pointed out during the review. The BR2_PACKAGE_GDB_NEEDS_CXX11
   blind option is moved to package/gdb/Config.in.host, and calculated
   differently. A comment is added on top of it to explain the logic
   behind it.

 - Fix build of gdb 8.1 with uclibc/musl caused by gnulib not
   detecting the availability of strerror().

 - Re-add patches from gdb 8.0.1 that are still valid, i.e all
   patches, except one that has been merged upstream.

Arnout suggested that we should probably remove the version selection
for gdb. For now, I've kept it as it is, I believe it's a separate
discussion. gdb 8.1 has been released in January 2018, i.e 6 months
ago, it's time to merge support for it.

Thanks,

Thomas

Romain Naour (4):
  package/gdb: bump to version 8.1
  package/gdb: switch to 8.0 as the default version
  package/gdb: remove 7.10
  package/gdb: remove 7.11

Thomas Petazzoni (1):
  package/gdb: rework dependency for C++11

 Config.in.legacy                                   | 14 +++++
 ...Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch | 55 +++++++++++++++++++
 ...efine-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch | 43 +++++++++++++++
 package/gdb/8.1/0003-use-asm-sgidefs.h.patch       | 40 ++++++++++++++
 .../8.1/0004-gdbserver-fix-build-for-m68k.patch    | 62 ++++++++++++++++++++++
 package/gdb/Config.in                              |  8 +++
 package/gdb/Config.in.host                         | 37 ++++++++-----
 package/gdb/gdb.hash                               |  3 +-
 package/gdb/gdb.mk                                 | 14 ++++-
 9 files changed, 260 insertions(+), 16 deletions(-)
 create mode 100644 package/gdb/8.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
 create mode 100644 package/gdb/8.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
 create mode 100644 package/gdb/8.1/0003-use-asm-sgidefs.h.patch
 create mode 100644 package/gdb/8.1/0004-gdbserver-fix-build-for-m68k.patch

-- 
2.14.4
