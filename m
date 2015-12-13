From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 22:36:53 +0100
Subject: [Buildroot] [git commit] package/liburcu: introduce
	BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS symbol
Message-ID: <20151213213707.072268184F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f50bd3c0b80374fdbab37285e1d7670f4ea43f83
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new hidden symbol will allow simplifying the architecture dependencies
on package that depends on liburcu. These packages will be updated in follow-up
patches.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/liburcu/Config.in | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/liburcu/Config.in b/package/liburcu/Config.in
index a4e8dc8..36d5353 100644
--- a/package/liburcu/Config.in
+++ b/package/liburcu/Config.in
@@ -1,6 +1,11 @@
+config BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
+	bool
+	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_powerpc || BR2_x86_64
+	default y
+
 config BR2_PACKAGE_LIBURCU
 	bool "liburcu"
-	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_powerpc || BR2_x86_64
+	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
@@ -18,7 +23,7 @@ config BR2_PACKAGE_LIBURCU
 	  http://lttng.org/urcu
 
 comment "liburcu needs a toolchain w/ threads"
-	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_powerpc || BR2_x86_64
+	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
