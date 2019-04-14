From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 14 Apr 2019 15:39:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/systemd: update
 BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
Message-ID: <20190414133946.25595-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

systemd supports:
 - nios2 since version 230 and
 https://github.com/systemd/systemd/commit/b79660e6acb964f94ddba0ea4e1182215934dfc3
 - riscv sinc version 232 and
 https://github.com/systemd/systemd/commit/171b53380085b1288b03b19a2b978f36a5c003d0
 - aarch64_be (tested with qemu_aarch64_virt_defconfig reconfigured to
 aarch64_be)
 - sparc64 (tested with qemu_sparc64_sun4u_defconfig)
 - mips64 and mips64el (tested with qemu_mips64el_malta_defconfig)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/systemd/Config.in | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 63d9ea52e3..92ffc7cc5a 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -1,11 +1,17 @@
 config BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 	bool
-	# see src/shared/architecture.h
-	default y if BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || \
-		BR2_mipsel || BR2_powerpc || BR2_powerpc64 || \
-		BR2_powerpc64le || BR2_sh4 || BR2_sh4eb || \
-		BR2_sh4a || BR2_sh4aeb || BR2_sparc || BR2_x86_64 || \
-		BR2_aarch64 || BR2_m68k || BR2_arc
+	# see src/basic/architecture.h
+	default y if BR2_arc
+	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_arm || BR2_armeb
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_m68k
+	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_nios2
+	default y if BR2_riscv
+	default y if BR2_sh4 || BR2_sh4eb || BR2_sh4a || BR2_sh4aeb
+	default y if BR2_sparc || BR2_sparc64
 
 menuconfig BR2_PACKAGE_SYSTEMD
 	bool "systemd"
-- 
2.20.1
