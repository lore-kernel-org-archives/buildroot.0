From: Lionel Orry <lionel.orry@gmail.com>
Date: Wed, 25 Mar 2015 09:55:30 +0100
Subject: [Buildroot] [PATCH 1/1] toolchain: enable musl for sh
Message-ID: <1427273730-1156-1-git-send-email-lionel.orry@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The SuperH architecture is supported by the musl libc since some time
now, so let's enable it.
Tested via qemu_sh4_r2d_defconfig.

Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
---
 toolchain/toolchain-buildroot/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index fcbce66..1b4bb9d 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -85,7 +85,7 @@ config BR2_TOOLCHAIN_BUILDROOT_MUSL
 	bool "musl (experimental)"
 	depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 || \
 		BR2_microblaze || BR2_mips || BR2_mipsel || BR2_powerpc || \
-		BR2_x86_64
+		BR2_sh || BR2_x86_64
 	depends on !BR2_powerpc_SPE # not supported, build breaks
 	select BR2_TOOLCHAIN_USES_MUSL
 	help
-- 
2.1.0
