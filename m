From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  7 Mar 2019 23:08:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/flashrom: add
 BR2_PACKAGE_FLASHROM_ARCH_SUPPORTS
Message-ID: <20190307220824.1476-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/22c72369cd5b7a8200bb03564bdc342ed026ccac
 - http://autobuild.buildroot.org/results/ef6869bc40382145fad1079b79107275c4973494
 - http://autobuild.buildroot.org/results/09d857102c469ede1db0bff8aa0dcd82a4001eaf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/flashrom/Config.in | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/flashrom/Config.in b/package/flashrom/Config.in
index cf1f53c1a3..9c20f2ed2c 100644
--- a/package/flashrom/Config.in
+++ b/package/flashrom/Config.in
@@ -1,6 +1,15 @@
+config BR2_PACKAGE_FLASHROM_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64 || BR2_aarch64_be || BR2_arm || \
+		BR2_armeb || BR2_i386 || BR2_m68k || BR2_mips || \
+		BR2_mipsel || BR2_mips64 || BR2_mips64el || \
+		BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
+		BR2_riscv || BR2_sh || BR2_sparc || BR2_sparc64 || \
+		BR2_x86_64
+
 config BR2_PACKAGE_FLASHROM
 	bool "flashrom"
-	depends on !BR2_microblaze && !BR2_xtensa # platform.h
+	depends on BR2_PACKAGE_FLASHROM_ARCH_SUPPORTS
 	help
 	  flashrom is a utility for identifying, reading, writing,
 	  verifying and erasing flash chips. It is designed to flash
-- 
2.14.1
