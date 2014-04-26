From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 26 Apr 2014 11:33:49 +0200
Subject: [Buildroot] [git commit] ltp-testsuite: re-enable on AArch64
Message-ID: <20140426093441.442359CA0D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c06e1bf4e2629b1bbb7b62169444fd9e3a0d8588
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump of ltp-testsuite to a more recent version, the support
for AArch64 is now working correctly, so we can remove the exclusion
of this architecture from the ltp-testsuite package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ltp-testsuite/Config.in |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

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
