From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 May 2018 17:48:46 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] glibc: security bump to
 latest 2.26 branch
Message-ID: <20180529154722.B95A182BC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8db468af4c8735299013b13fffb5eb9acb0f359c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixed issues are listed in the 2.26 branch NEWS file:

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
index 3dab1e1516..890f523fd9 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,4 +1,4 @@
 # Locally calculated (fetched from Github)
-sha256  00fbc845678a96f4acc574c4bda4be76506ecd8bafb2d08c58bfa3507625c81a     glibc-glibc-2.26-146-gd300041c533a3d837c9f37a099bcc95466860e98.tar.gz
+sha256  1e18aee61dc51a5aaf7bfcb65ed01894aa82c3d3f7b9a01f20d59cd9db2f082b     glibc-glibc-2.26-160-g4df8479e6b3baf365bd4eedbba922b73471e5d73.tar.gz
 # Locally calculated (fetched from Github)
 sha256  5aa9adeac09727db0b8a52794186563771e74d70410e9fd86431e339953fd4bb     glibc-arc-2017.09-release.tar.gz
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 0351433e6a..562f0258d5 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -10,7 +10,7 @@ GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VE
 else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master
-GLIBC_VERSION = glibc-2.26-146-gd300041c533a3d837c9f37a099bcc95466860e98
+GLIBC_VERSION = glibc-2.26-160-g4df8479e6b3baf365bd4eedbba922b73471e5d73
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
