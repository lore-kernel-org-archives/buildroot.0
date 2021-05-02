From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  2 May 2021 23:49:16 +0200
Subject: [Buildroot] [PATCH 2/5] package/libatomic_ops: enable for riscv32
 and riscv64
In-Reply-To: <20210502214919.1826571-1-romain.naour@gmail.com>
References: <20210502214919.1826571-1-romain.naour@gmail.com>
Message-ID: <20210502214919.1826571-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The riscv support has been added since v7.6.4 release.

https://github.com/ivmai/libatomic_ops/commit/137643f1417ded071c56e05401ca6a3c16492d96

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/libatomic_ops/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libatomic_ops/Config.in b/package/libatomic_ops/Config.in
index e9206f3395..6de5979aeb 100644
--- a/package/libatomic_ops/Config.in
+++ b/package/libatomic_ops/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
 	bool
-	default y if BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_sparc || BR2_sparc64 || BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || BR2_x86_64 || BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	default y if BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_sparc || BR2_sparc64 || BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || BR2_x86_64 || BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || BR2_riscv
 	# Unsupported for MIPS R6
 	depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
 
-- 
2.30.2
