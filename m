From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Sep 2018 20:42:24 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] glibc: bump to latest on
 2.26.x branch for additional fixes
Message-ID: <20180930184147.381768A481@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61547602fa34c542fb89479050f6da48984fd5c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Daniel Alvarez (1):
      getifaddrs: Don't return ifa entries with NULL names [BZ #21812]

Florian Weimer (8):
      libio: Avoid _allocate_buffer, _free_buffer function pointers [BZ #23236]
      Use _STRUCT_TIMESPEC as guard in <bits/types/struct_timespec.h> [BZ #23349]
      libio: Disable vtable validation in case of interposition [BZ #23313]
      NEWS: Reorder out-of-order bugs
      Synchronize support/ infrastructure with master
      libio: Add tst-vtables, tst-vtables-interposed
      stdio-common/tst-printf.c: Remove part under a non-free license [BZ #23363]
      conform/conformtest.pl: Escape literal braces in regular expressions

Gabriel F. T. Gomes (1):
      Fix parameter type in C++ version of iseqsig (bug 23171)

H.J. Lu (2):
      x86: Correct index_cpu_LZCNT [BZ #23456]
      x86: Populate COMMON_CPUID_INDEX_80000001 for Intel CPUs [BZ #23459]

Martin Kuchta (1):
      pthread_cond_broadcast: Fix waiters-after-spinning case [BZ #23538]

Stefan Liebler (1):
      Fix segfault in maybe_script_execute.

Steve Ellcey (1):
      Check length of ifname before copying it into to ifreq structure.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.hash | 2 +-
 package/glibc/glibc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 890f523fd9..bfe40f1f96 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,4 +1,4 @@
 # Locally calculated (fetched from Github)
-sha256  1e18aee61dc51a5aaf7bfcb65ed01894aa82c3d3f7b9a01f20d59cd9db2f082b     glibc-glibc-2.26-160-g4df8479e6b3baf365bd4eedbba922b73471e5d73.tar.gz
+sha256   acbec224e69f29c9c59c34f15f0fbb19eecf3fce347eba8bb928fac507ae86c6    glibc-glibc-2.26-175-gc5c90b480e4f21ed1d28e0e6d942b06b8d9e8bd7.tar.gz
 # Locally calculated (fetched from Github)
 sha256  5aa9adeac09727db0b8a52794186563771e74d70410e9fd86431e339953fd4bb     glibc-arc-2017.09-release.tar.gz
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 562f0258d5..2e93593b0d 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -10,7 +10,7 @@ GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VE
 else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master
-GLIBC_VERSION = glibc-2.26-160-g4df8479e6b3baf365bd4eedbba922b73471e5d73
+GLIBC_VERSION = glibc-2.26-175-gc5c90b480e4f21ed1d28e0e6d942b06b8d9e8bd7
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
