From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 May 2018 16:59:47 +0200
Subject: [Buildroot] [git commit] glibc: security bump to latest 2.27 branch
Message-ID: <20180529145930.F231182BC0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=488052edffeb20f86b6d3d4bdd1f4f58511c8abf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixed issues are listed in the 2.27 branch NEWS file:

  CVE-2017-18269: An SSE2-based memmove implementation for the i386
  architecture could corrupt memory.  Reported by Max Horn.

  CVE-2018-11236: Very long pathname arguments to realpath function could
  result in an integer overflow and buffer overflow.  Reported by Alexey
  Izbyshev.

  CVE-2018-11237: The mempcpy implementation for the Intel Xeon Phi
  architecture could write beyond the target buffer, resulting in a buffer
  overflow.  Reported by Andreas Schwab.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.hash | 2 +-
 package/glibc/glibc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index f19fa92af4..1fab3a245c 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  a74489d14f4017bee6a6c6fe76f1de0dbf7d66c8695116de5aadd141c4757892     glibc-glibc-2.27.tar.gz
+sha256  33189b3f10c88730a1f686fac794bc01f31765f12ffd75bc5e8a0f2a690d217a     glibc-glibc-2.27-57-g6c99e37f6fb640a50a3113b2dbee5d5389843c1e.tar.gz
 # Locally calculated (fetched from Github)
 sha256  ddc63360393ab88ab6a4a0c81d33481f34c5a9ebd758eec2e6bb35385058b4cb     glibc-arc-2018.03-rc2.tar.gz
 
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 717182b052..8e82eaa1ee 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -10,7 +10,7 @@ GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VE
 else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master
-GLIBC_VERSION = glibc-2.27
+GLIBC_VERSION = glibc-2.27-57-g6c99e37f6fb640a50a3113b2dbee5d5389843c1e
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
