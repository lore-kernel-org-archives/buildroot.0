From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Oct 2018 10:49:25 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] qemu: add
 BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
Message-ID: <20181021092408.F3AFB88178@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e538642aa1dbb38407e41d889230996b81e6bf80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Match the style used with other packages such as valgrind.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 62099784d40333079a811503bc4f5cd138d9f6ed)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/Config.in.host | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index f14bcec6d6..78fe54a85c 100644
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
