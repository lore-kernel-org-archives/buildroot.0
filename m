From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 12:56:21 +0200
Subject: [Buildroot] [git commit] docs: known issues no longer valid
Message-ID: <20170701105328.77C87816D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=85b36daa94530dcb89e54092bf760d750a24f2d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/known-issues.txt | 20 --------------------
 package/mrouted/Config.in    |  3 ---
 2 files changed, 23 deletions(-)

diff --git a/docs/manual/known-issues.txt b/docs/manual/known-issues.txt
index acfe4ff..ae29a48 100644
--- a/docs/manual/known-issues.txt
+++ b/docs/manual/known-issues.txt
@@ -7,26 +7,6 @@
   if such options contain a +$+ sign. For example, the following is known
   to break: +BR2_TARGET_LDFLAGS="-Wl,-rpath=\'$ORIGIN/../lib'"+
 
-* The +ltp-testsuite+ package does not build with the default uClibc
-  configuration used by the Buildroot toolchain backend. The LTP
-  testsuite uses several functions that are considered obsolete, such
-  as sigset() and others. uClibc configuration options such as
-  DO_XSI_MATH, UCLIBC_HAS_OBSOLETE_BSD_SIGNAL and
-  UCLIBC_SV4_DEPRECATED are needed if one wants to build the
-  +ltp-testsuite+ package with uClibc. You need to either use a glibc
-  based toolchain, or enable the appropriate options in the uClibc
-  configuration.
-
-* The +xfsprogs+ package does not build with the default uClibc
-  configuration used by the Buildroot toolchain backend. You need to
-  either use a glibc based toolchain, or enable the appropriate
-  options in the uClibc configuration.
-
-* The +mrouted+ package does not build with the default uClibc
-  configuration used by the Buildroot toolchain backend. You need to
-  either use a glibc based toolchain, or enable the appropriate
-  options in the uClibc configuration.
-
 * The +libffi+ package is not supported on the SuperH 2 and ARC
   architectures.
 
diff --git a/package/mrouted/Config.in b/package/mrouted/Config.in
index bf4614d..e5d9348 100644
--- a/package/mrouted/Config.in
+++ b/package/mrouted/Config.in
@@ -4,7 +4,4 @@ config BR2_PACKAGE_MROUTED
 	help
 	  An implementation of the DVMRP multicast routing protocol.
 
-	  If built with uClibc, then UCLIBC_SUPPORT_AI_ADDRCONFIG is
-	  needed in uClibc configuration.
-
 	  http://github.com/troglobit/mrouted
