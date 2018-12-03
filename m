From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Dec 2018 23:25:47 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] glibc: bump version for
 post-2.26 security fixes
Message-ID: <20181203222302.CDA09815E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c4c2d0bf550b5958da5fa52591eb6a75bf07a04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes the following security vulnerability:

  CVE-2018-19591: A file descriptor leak in if_nametoindex can lead to a
  denial of service due to resource exhaustion when processing getaddrinfo
  calls with crafted host names.  Reported by Guido Vranken.

Adhemerval Zanella (2):
      Fix misreported errno on preadv2/pwritev2 (BZ#23579)
      x86: Fix Haswell CPU string flags (BZ#23709)

Alexandra H??jkov?? (1):
      Add an additional test to resolv/tst-resolv-network.c

Andreas Schwab (1):
      libanl: properly cleanup if first helper thread creation failed (bug 22927)

Florian Weimer (3):
      preadv2/pwritev2: Handle offset == -1 [BZ #22753]
      conform: XFAIL siginfo_t si_band test on sparc64
      CVE-2018-19591: if_nametoindex: Fix descriptor for overlong name [BZ #23927]

Ilya Yu. Malakhov (1):
      signal: Use correct type for si_band in siginfo_t [BZ #23562]

Martin Kuchta (1):
      pthread_cond_broadcast: Fix waiters-after-spinning case [BZ #23538]

Stefan Liebler (2):
      Fix segfault in maybe_script_execute.
      Fix race in pthread_mutex_lock while promoting to PTHREAD_MUTEX_ELISION_NP [BZ #23275]

Szabolcs Nagy (1):
      i64: fix missing exp2f, log2f and powf symbols in libm.a [BZ #23822]

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.hash | 2 +-
 package/glibc/glibc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index bfe40f1f96..f07cbfa19d 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,4 +1,4 @@
 # Locally calculated (fetched from Github)
-sha256   acbec224e69f29c9c59c34f15f0fbb19eecf3fce347eba8bb928fac507ae86c6    glibc-glibc-2.26-175-gc5c90b480e4f21ed1d28e0e6d942b06b8d9e8bd7.tar.gz
+sha256  6c982204f990bef280359be29702143f22f41bd57491619970b70c315957812b     glibc-glibc-2.26-193-ga0bc5dd3bed4b04814047265b3bcead7ab973b87.tar.gz
 # Locally calculated (fetched from Github)
 sha256  5aa9adeac09727db0b8a52794186563771e74d70410e9fd86431e339953fd4bb     glibc-arc-2017.09-release.tar.gz
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 2e93593b0d..3c6ad67882 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -10,7 +10,7 @@ GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VE
 else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master
-GLIBC_VERSION = glibc-2.26-175-gc5c90b480e4f21ed1d28e0e6d942b06b8d9e8bd7
+GLIBC_VERSION = glibc-2.26-193-ga0bc5dd3bed4b04814047265b3bcead7ab973b87
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
