From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Nov 2018 11:20:22 +0100
Subject: [Buildroot] [git commit] glibc: bump version for post-2.28 security
 fixes
Message-ID: <20181130101751.F004B8913D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d717ac43206bf3ff1204737496e7340b435f131e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security vulnerability:

  CVE-2018-19591: A file descriptor leak in if_nametoindex can lead to a
  denial of service due to resource exhaustion when processing getaddrinfo
  calls with crafted host names.  Reported by Guido Vranken.

Adhemerval Zanella (2):
      Fix misreported errno on preadv2/pwritev2 (BZ#23579)
      x86: Fix Haswell CPU string flags (BZ#23709)

Alexandra H??jkov?? (1):
      Add an additional test to resolv/tst-resolv-network.c

Andreas Schwab (2):
      Fix stack overflow in tst-setcontext9 (bug 23717)
      libanl: properly cleanup if first helper thread creation failed (bug 22927)

DJ Delorie (2):
      malloc: tcache double free check
      malloc: tcache double free check

Florian Weimer (9):
      conform: XFAIL siginfo_t si_band test on sparc64
      stdlib/test-bz22786: Avoid spurious test failures using alias mappings
      stdlib/test-bz22786: Avoid memory leaks in the test itself
      support_blob_repeat: Call mkstemp directory for the backing file
      stdlib/tst-strtod-overflow: Switch to support_blob_repeat
      nscd: Fix use-after-free in addgetnetgrentX [BZ #23520]
      support: Print timestamps in timeout handler
      Revert "malloc: tcache double free check" [BZ #23907]
      CVE-2018-19591: if_nametoindex: Fix descriptor for overlong name [BZ #23927]

H.J. Lu (2):
      i386: Use _dl_runtime_[resolve|profile]_shstk for SHSTK [BZ #23716]
      Check multiple NT_GNU_PROPERTY_TYPE_0 notes [BZ #23509]

Ilya Yu. Malakhov (1):
      signal: Use correct type for si_band in siginfo_t [BZ #23562]

Istvan Kurucsai (1):
      malloc: Additional checks for unsorted bin integrity I.

Joseph Myers (2):
      Update syscall-names.list for Linux 4.18.
      Update kernel version in syscall-names.list to 4.19.

Moritz Eckert (1):
      malloc: Mitigate null-byte overflow attacks

Paul Eggert (1):
      Fix tzfile low-memory assertion failure

Paul Pluzhnikov (2):
      Fix BZ#23400 (creating temporary files in source tree), and undefined behavior in test.
      [BZ #20271] Add newlines in __libc_fatal calls.

Pochang Chen (1):
      malloc: Verify size of top chunk.

Rafal Luzynski (1):
      kl_GL: Fix spelling of Sunday, should be "sapaat" (bug 20209).

Stefan Liebler (2):
      Fix race in pthread_mutex_lock while promoting to PTHREAD_MUTEX_ELISION_NP [BZ #23275]
      Test stdlib/test-bz22786 exits now with unsupported if malloc fails.

Szabolcs Nagy (2):
      i64: fix missing exp2f, log2f and powf symbols in libm.a [BZ #23822]
      Increase timeout of libio/tst-readline

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-sysdeps-ieee754-soft-fp-ignore-maybe-uninitialized-w.patch     | 0
 .../glibc.hash                                                          | 2 +-
 package/glibc/glibc.mk                                                  | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glibc/glibc-2.28-18-g2339d6a55eb7a7e040ae888e906adc49eeb59eab/0001-sysdeps-ieee754-soft-fp-ignore-maybe-uninitialized-w.patch b/package/glibc/glibc-2.28-50-gb8dd0f42780a3133c02f064a2c0c5c4e7ab61aaa/0001-sysdeps-ieee754-soft-fp-ignore-maybe-uninitialized-w.patch
similarity index 100%
rename from package/glibc/glibc-2.28-18-g2339d6a55eb7a7e040ae888e906adc49eeb59eab/0001-sysdeps-ieee754-soft-fp-ignore-maybe-uninitialized-w.patch
rename to package/glibc/glibc-2.28-50-gb8dd0f42780a3133c02f064a2c0c5c4e7ab61aaa/0001-sysdeps-ieee754-soft-fp-ignore-maybe-uninitialized-w.patch
diff --git a/package/glibc/glibc-2.28-18-g2339d6a55eb7a7e040ae888e906adc49eeb59eab/glibc.hash b/package/glibc/glibc-2.28-50-gb8dd0f42780a3133c02f064a2c0c5c4e7ab61aaa/glibc.hash
similarity index 69%
rename from package/glibc/glibc-2.28-18-g2339d6a55eb7a7e040ae888e906adc49eeb59eab/glibc.hash
rename to package/glibc/glibc-2.28-50-gb8dd0f42780a3133c02f064a2c0c5c4e7ab61aaa/glibc.hash
index a95c990c99..7429ab3809 100644
--- a/package/glibc/glibc-2.28-18-g2339d6a55eb7a7e040ae888e906adc49eeb59eab/glibc.hash
+++ b/package/glibc/glibc-2.28-50-gb8dd0f42780a3133c02f064a2c0c5c4e7ab61aaa/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  6e88cea4002efa7f78d86ea5e98eb92ed423d5a35068751517c4f00f56b8666c  glibc-glibc-2.28-18-g2339d6a55eb7a7e040ae888e906adc49eeb59eab.tar.gz
+sha256  b070f746f932cfce107bb9be2d59ded5b44b25ddafb480c9110c52b88cc2dec1  glibc-glibc-2.28-50-gb8dd0f42780a3133c02f064a2c0c5c4e7ab61aaa.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 762c040688..88178d7eb9 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -10,7 +10,7 @@ GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VE
 else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master
-GLIBC_VERSION = glibc-2.28-18-g2339d6a55eb7a7e040ae888e906adc49eeb59eab
+GLIBC_VERSION = glibc-2.28-50-gb8dd0f42780a3133c02f064a2c0c5c4e7ab61aaa
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
