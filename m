From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Mar 2013 09:35:11 +0100
Subject: [Buildroot] [git commit] ltp-testsuite: needs IPv6 and RPC support
Message-ID: <20130304093035.853FF9AE31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8c05fb21fccefb08c0af652952fa1722eaba68dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ltp-testsuite/Config.in |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index 4146274..46e7380 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -5,6 +5,8 @@ comment "ltp-testsuite needs specific uClibc options, see help"
 config BR2_PACKAGE_LTP_TESTSUITE
 	bool "ltp-testsuite"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
 	  The Linux Test Project provides a huge testsuite for Linux.
 
@@ -17,5 +19,6 @@ config BR2_PACKAGE_LTP_TESTSUITE
 
 	  http://ltp.sourceforge.net/
 
-comment "ltp-testsuite requires a toolchain with thread support"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "ltp-testsuite requires a toolchain with IPV6, RPC and thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6 || \
+		!BR2_TOOLCHAIN_HAS_NATIVE_RPC
