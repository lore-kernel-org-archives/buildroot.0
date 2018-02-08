From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Feb 2018 22:18:27 +0100
Subject: [Buildroot] [git commit branch/next] qemu: add
 BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
Message-ID: <20180208211845.B7EBF88594@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=62099784d40333079a811503bc4f5cd138d9f6ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Match the style used with other packages such as valgrind.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qemu/Config.in.host | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 71f38ef41f..b001dd9514 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -1,11 +1,15 @@
-config BR2_PACKAGE_HOST_QEMU
-	bool "host qemu"
-	depends on BR2_arm       || BR2_armeb       || BR2_aarch64      || \
+config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
+	bool
+	default y if BR2_arm || BR2_armeb       || BR2_aarch64      || \
 		BR2_i386         || BR2_m68k        || BR2_microblazeel || \
 		BR2_microblazebe || BR2_mips        || BR2_mipsel       || \
 		BR2_mips64       || BR2_mips64el    || BR2_powerpc      || \
 		BR2_powerpc64    || BR2_powerpc64le || BR2_sh           || \
 		BR2_sparc        || BR2_x86_64
+
+config BR2_PACKAGE_HOST_QEMU
+	bool "host qemu"
+	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	select BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE \
 		if !BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE
 	help
