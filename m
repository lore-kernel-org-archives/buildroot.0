From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 22:37:02 +0100
Subject: [Buildroot] [git commit] package/netsniff: fix missing depend on
	statements
Message-ID: <20151213213707.323A381815@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=37af71170a377480d8c4a18b7806a32dce99a652
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add missing architecture dependencies inherited from liburcu.

Fixes:
  http://autobuild.buildroot.org/results/0a9/0a90d7c8f523b90b8a4ca6312ab4835547590fb2/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netsniff-ng/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/netsniff-ng/Config.in b/package/netsniff-ng/Config.in
index 8c48f39..b39ec96 100644
--- a/package/netsniff-ng/Config.in
+++ b/package/netsniff-ng/Config.in
@@ -11,14 +11,17 @@ config BR2_PACKAGE_NETSNIFF_NG
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu
+	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	help
 	  netsniff-ng is a free, performant Linux network analyzer and
 	  networking toolkit. If you will, the Swiss army knife for
 	  network packets.
 
 comment "netsniff-ng needs an (e)glibc toolchain w/ threads"
+	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854
 
 comment "netsniff-ng needs a toolchain not affected by GCC bug 58854"
+	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_58854
