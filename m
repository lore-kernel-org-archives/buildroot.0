From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 13 Dec 2015 17:19:37 +0100
Subject: [Buildroot] [PATCH] package/netsniff: fix missing depend on
	statements
Message-ID: <1450023577-5019-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add missing architecture dependencies inherited from liburcu.

Fixes:
  http://autobuild.buildroot.org/results/0a9/0a90d7c8f523b90b8a4ca6312ab4835547590fb2/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/netsniff-ng/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/netsniff-ng/Config.in b/package/netsniff-ng/Config.in
index 8c48f39..65b2a0f 100644
--- a/package/netsniff-ng/Config.in
+++ b/package/netsniff-ng/Config.in
@@ -11,14 +11,17 @@ config BR2_PACKAGE_NETSNIFF_NG
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu
+	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_powerpc || BR2_x86_64 # liburcu
 	help
 	  netsniff-ng is a free, performant Linux network analyzer and
 	  networking toolkit. If you will, the Swiss army knife for
 	  network packets.
 
 comment "netsniff-ng needs an (e)glibc toolchain w/ threads"
+	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_powerpc || BR2_x86_64
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854
 
 comment "netsniff-ng needs a toolchain not affected by GCC bug 58854"
+	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_powerpc || BR2_x86_64
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_58854
-- 
2.6.4
