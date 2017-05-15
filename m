From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 11:46:43 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/ltp-testsuite:
	needs threads NPTL
Message-ID: <20170515125326.C33218286F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=21724ff539da1be1788171fe7df216d300b6d228
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes:
http://autobuild.buildroot.net/results/3e0/3e0bbf41e339e62422463773bf07945f048a9501

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 362d185b309a1634901d4cb35bc1778d58e2015a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ltp-testsuite/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index 274b03e..60e1922 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -5,7 +5,7 @@ comment "ltp-testsuite needs specific uClibc options, see help"
 config BR2_PACKAGE_LTP_TESTSUITE
 	bool "ltp-testsuite"
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	# does not build, cachectl.h issue
@@ -22,7 +22,7 @@ config BR2_PACKAGE_LTP_TESTSUITE
 
 	  http://linux-test-project.github.io
 
-comment "ltp-testsuite needs a glibc or uClibc toolchain w/ threads"
+comment "ltp-testsuite needs a glibc or uClibc toolchain w/ NPTL"
 	depends on !BR2_nios2
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_TOOLCHAIN_USES_MUSL
