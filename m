From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Aug 2016 22:09:05 +0200
Subject: [Buildroot] [git commit] package/xenomai: disable for cortex-M cpus
Message-ID: <20160801200926.9B71F8211B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c946f1a909b8b450a9b0f904d0cf62933b1f99a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following include/asm-arm/features.h, Xenomai doesn't support cortex-M
cpus.

error "Could not find current ARM architecture"

Fixes:
http://autobuild.buildroot.net/results/06a/06a52b2c2c23df595f58feb6b95437fc65a86d31

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xenomai/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index a4a2795..3de7bde 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_XENOMAI_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_i386 || BR2_x86_64 || BR2_arm || \
-		   BR2_bfin || BR2_powerpc || BR2_sh4
+	depends on BR2_i386 || BR2_x86_64 || (BR2_arm && !BR2_ARM_CPU_ARMV7M) || \
+		BR2_bfin || BR2_powerpc || BR2_sh4
 
 comment "xenomai needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
