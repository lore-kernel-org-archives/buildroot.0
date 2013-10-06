From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 Oct 2013 20:32:32 +0200
Subject: [Buildroot] [git commit] ltp-testsuite: needs largefile support
Message-ID: <20131006184759.B376396CB6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ef5f9b9b9a6353eafae15f7e5e148a1a1cf607a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ltp-testsuite/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index 3681eaf..a984d7b 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LTP_TESTSUITE
 	bool "ltp-testsuite"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INET_IPV6
+	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	# aarch64 build currently broken, reported at
 	# https://bugs.launchpad.net/linaro-aarch64/+bug/1236027
@@ -22,6 +23,6 @@ config BR2_PACKAGE_LTP_TESTSUITE
 
 	  http://ltp.sourceforge.net/
 
-comment "ltp-testsuite requires a toolchain with IPV6, RPC and thread support"
+comment "ltp-testsuite requires a toolchain with IPV6, RPC, LARGEFILE and thread support"
 	depends on (!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6 || \
-		!BR2_TOOLCHAIN_HAS_NATIVE_RPC) && !BR2_aarch64
+		!BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_NATIVE_RPC) && !BR2_aarch64
