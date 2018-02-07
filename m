From: Adam Duskett <aduskett@gmail.com>
Date: Wed,  7 Feb 2018 16:23:53 -0500
Subject: [Buildroot] [RFCv2 1/3] qemu: add
 BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
In-Reply-To: <20180207212355.7464-1-aduskett@gmail.com>
References: <20180207212355.7464-1-aduskett@gmail.com>
Message-ID: <20180207212355.7464-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Match the style used with other packages such as valgrind.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/qemu/Config.in.host | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 71f38ef41f..78fe54a85c 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -1,15 +1,20 @@
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
-	  QEMU is a generic and open source machine emulator and virtualizer.
+	  QEMU is a generic and open source machine emulator and
+	  virtualizer.
 
 	  This option builds an emulator for your selected architecture.
 
-- 
2.14.3
