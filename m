From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Apr 2014 22:34:11 +0200
Subject: [Buildroot] [PATCH 2/2] ltp-testsuite: does not build on NIOS II
In-Reply-To: <1398458051-5251-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1398458051-5251-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1398458051-5251-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/1ae/1aef491ec016ddd601446164c5b97ce480e755e6/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ltp-testsuite/Config.in | 3 +++
 1 file changed, 3 insertions(+)

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
-- 
1.9.2
