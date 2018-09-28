From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Sep 2018 15:07:30 +0200
Subject: [Buildroot] [git commit] glibc: bump version for post-2.28 fixes
Message-ID: <20180928130935.4D08B8A3DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2936442098293fe29232e2e20110f27dfba51809
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Carlos O'Donell (1):
      Fix tst-setcontext9 for optimized small stacks.

DJ Delorie (3):
      RISC-V: Fix rounding save/restore bug.
      Regen RISC-V rvd ULPs
      Improve ChangeLog message.

Florian Weimer (6):
      Linux: Rewrite __old_getdents64 [BZ #23497]
      error, error_at_line: Add missing va_end calls
      nscd: Deallocate existing user names in file parser
      nss_files: Fix file stream leak in aliases lookup [BZ #23521]
      regex: Add test tst-regcomp-truncated [BZ #23578]
      misc: New test misc/tst-gethostid

H.J. Lu (1):
      i386: Use ENTRY and END in start.S [BZ #23606]

Martin Kuchta (1):
      pthread_cond_broadcast: Fix waiters-after-spinning case [BZ #23538]

Mingli Yu (1):
      Linux gethostid: Check for NULL value from gethostbyname_r [BZ #23679]

Paul Eggert (1):
      regex: fix uninitialized memory access

Samuel Thibault (2):
      hurd: Add missing symbols for proper libc_get/setspecific
      hurd: Avoid PLTs for __pthread_get/setspecific

Stefan Liebler (1):
      Fix segfault in maybe_script_execute.

Wilco Dijkstra (1):
      Fix strstr bug with huge needles (bug 23637)

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.hash | 2 +-
 package/glibc/glibc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 096393ff9b..9fff30e1ef 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  877c7b4741501d1762af8ef1a2518bdf2d722947d2e8d48b203e2d83cc600bca     glibc-glibc-2.28.tar.gz
+sha256  6e88cea4002efa7f78d86ea5e98eb92ed423d5a35068751517c4f00f56b8666c     glibc-glibc-2.28-18-g2339d6a55eb7a7e040ae888e906adc49eeb59eab.tar.gz
 # Locally calculated (fetched from Github)
 sha256  e08ab67b2db2d0f0e8f3311d23c54fb8f6d4c1ef6fa0b4047fd5da400e3ce9de     glibc-arc-2018.03-release.tar.gz
 
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index c8ade7c28b..708c22f723 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -10,7 +10,7 @@ GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VE
 else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master
-GLIBC_VERSION = glibc-2.28
+GLIBC_VERSION = glibc-2.28-18-g2339d6a55eb7a7e040ae888e906adc49eeb59eab
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
