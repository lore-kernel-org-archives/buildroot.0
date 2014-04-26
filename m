From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 26 Apr 2014 11:33:51 +0200
Subject: [Buildroot] [git commit] ltp-testsuite: does not build on NIOS II
Message-ID: <20140426093441.4D7C19CA0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2d0903dd227abacca8bdc5ad961d8c920b8d8e1c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/1ae/1aef491ec016ddd601446164c5b97ce480e755e6/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ltp-testsuite/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index 44592fc..0e71677 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -8,6 +8,8 @@ config BR2_PACKAGE_LTP_TESTSUITE
 	depends on BR2_INET_IPV6
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	# does not build, cachectl.h issue
+	depends on !BR2_nios2
 	help
 	  The Linux Test Project provides a huge testsuite for Linux.
 
@@ -21,5 +23,6 @@ config BR2_PACKAGE_LTP_TESTSUITE
 	  http://ltp.sourceforge.net/
 
 comment "ltp-testsuite needs a toolchain w/ IPv6, RPC, largefile, threads"
+	depends on !BR2_nios2
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6 || \
 		!BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_NATIVE_RPC
