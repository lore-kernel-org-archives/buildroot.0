From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Apr 2014 22:34:10 +0200
Subject: [Buildroot] [PATCH 1/2] ltp-testsuite: re-enable on AArch64
Message-ID: <1398458051-5251-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the bump of ltp-testsuite to a more recent version, the support
for AArch64 is now working correctly, so we can remove the exclusion
of this architecture from the ltp-testsuite package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ltp-testsuite/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index 0883c8f..44592fc 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -8,9 +8,6 @@ config BR2_PACKAGE_LTP_TESTSUITE
 	depends on BR2_INET_IPV6
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	# aarch64 build currently broken, reported at
-	# https://bugs.launchpad.net/linaro-aarch64/+bug/1236027
-	depends on !BR2_aarch64
 	help
 	  The Linux Test Project provides a huge testsuite for Linux.
 
@@ -24,6 +21,5 @@ config BR2_PACKAGE_LTP_TESTSUITE
 	  http://ltp.sourceforge.net/
 
 comment "ltp-testsuite needs a toolchain w/ IPv6, RPC, largefile, threads"
-	depends on !BR2_aarch64
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6 || \
 		!BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_NATIVE_RPC
-- 
1.9.2
