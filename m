From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Mar 2019 20:11:08 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/flashrom: add
 BR2_PACKAGE_FLASHROM_ARCH_SUPPORTS
Message-ID: <20190319191327.E4C8F81935@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2020d58ce35b61446eb4261fde10bb4e8ac417ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
 - http://autobuild.buildroot.org/results/22c72369cd5b7a8200bb03564bdc342ed026ccac
 - http://autobuild.buildroot.org/results/ef6869bc40382145fad1079b79107275c4973494
 - http://autobuild.buildroot.org/results/09d857102c469ede1db0bff8aa0dcd82a4001eaf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Thomas: change formatting of new option.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

(cherry picked from commit 10a95d545a9fb6cc00f076bd323cbc9ee352590f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flashrom/Config.in | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/flashrom/Config.in b/package/flashrom/Config.in
index cf1f53c1a3..c333c29730 100644
--- a/package/flashrom/Config.in
+++ b/package/flashrom/Config.in
@@ -1,6 +1,18 @@
+config BR2_PACKAGE_FLASHROM_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_arm || BR2_armeb
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_m68k
+	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_riscv
+	default y if BR2_sh
+	default y if BR2_sparc || BR2_sparc64
+
 config BR2_PACKAGE_FLASHROM
 	bool "flashrom"
-	depends on !BR2_microblaze && !BR2_xtensa # platform.h
+	depends on BR2_PACKAGE_FLASHROM_ARCH_SUPPORTS
 	help
 	  flashrom is a utility for identifying, reading, writing,
 	  verifying and erasing flash chips. It is designed to flash
