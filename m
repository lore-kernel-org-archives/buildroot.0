From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 May 2021 15:02:37 +0200
Subject: [Buildroot] [git commit branch/next] package/libatomic_ops: enable
 for riscv32 and riscv64
Message-ID: <20210517123429.A92B686B1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=626a98a4492440a10e9374b9ce77b8b4ca02f310
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The riscv support has been added since v7.6.4 release.

https://github.com/ivmai/libatomic_ops/commit/137643f1417ded071c56e05401ca6a3c16492d96

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
[yann.morin.1998 at free.fr:
  - split the long line
  - reorder the archs alphabetically, and group related ones
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libatomic_ops/Config.in | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/libatomic_ops/Config.in b/package/libatomic_ops/Config.in
index e9206f3395..8287c6522d 100644
--- a/package/libatomic_ops/Config.in
+++ b/package/libatomic_ops/Config.in
@@ -1,6 +1,11 @@
 config BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
 	bool
-	default y if BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_sparc || BR2_sparc64 || BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || BR2_x86_64 || BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	default y if BR2_aarch64 || BR2_arm || BR2_armeb
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	default y if BR2_riscv
+	default y if BR2_sparc || BR2_sparc64
 	# Unsupported for MIPS R6
 	depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
 
