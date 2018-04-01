From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  1 Apr 2018 18:36:34 +0200
Subject: [Buildroot] [PATCH v2 1/3] qemu: rewrite
 BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS to be more readable
In-Reply-To: <20180401163636.4098-1-thomas.petazzoni@bootlin.com>
References: <20180401163636.4098-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180401163636.4098-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qemu/Config.in.host | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 0ef4c700b0..160778c834 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -1,11 +1,22 @@
 config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	bool
-	default y if BR2_arm || BR2_armeb       || BR2_aarch64      || \
-		BR2_i386         || BR2_m68k        || BR2_microblazeel || \
-		BR2_microblazebe || BR2_mips        || BR2_mipsel       || \
-		BR2_mips64       || BR2_mips64el    || BR2_powerpc      || \
-		BR2_powerpc64    || BR2_powerpc64le || BR2_sh           || \
-		BR2_sparc        || BR2_x86_64
+	default y if BR2_arm
+	default y if BR2_armeb
+	default y if BR2_aarch64
+	default y if BR2_i386
+	default y if BR2_m68k
+	default y if BR2_microblazeel
+	default y if BR2_microblazebe
+	default y if BR2_mips
+	default y if BR2_mipsel
+	default y if BR2_mips64
+	default y if BR2_mips64el
+	default y if BR2_powerpc
+	default y if BR2_powerpc64
+	default y if BR2_powerpc64le
+	default y if BR2_sh
+	default y if BR2_sparc
+	default y if BR2_x86_64
 	depends on !BR2_powerpc_620 && !BR2_powerpc_630 && !BR2_powerpc_970
 
 config BR2_PACKAGE_HOST_QEMU
-- 
2.14.3
