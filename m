From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jul 2016 22:14:59 +0200
Subject: [Buildroot] [git commit] toolchain-external: update ARMeb musl
	dependency
Message-ID: <20160728201546.A81EE82267@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0dc11272f59a0ea2ce660658bedd04bfc6e56fbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ARM big-endian is different from ARMv4/5/6 and ARMv7. Big-endian on
ARMv4/5/6 is BE-32 while big-endian on ARMv7 is BE-8, which are not
compatible.

Therefore, the musl big endian toolchain that is built for ARMv4
cannot work for ARMv7, it can only work for ARMv4/5/6.

This commit updates the musl toolchain dependency accordingly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-external/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 5edde24..ee07ddb 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -588,7 +588,7 @@ config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
 	bool "Musl 1.1.12 toolchain"
 	depends on (BR2_arm && BR2_ARM_EABI) || \
 		(BR2_arm && BR2_ARM_EABIHF && !BR2_ARM_CPU_ARMV4) || \
-		(BR2_armeb && BR2_ARM_EABI) || BR2_i386 || \
+		(BR2_armeb && BR2_ARM_EABI && !BR2_ARM_CPU_ARMV7A) || BR2_i386 || \
 		(BR2_mips && !BR2_SOFT_FLOAT) || \
 		BR2_mipsel || (BR2_powerpc && BR2_powerpc_CLASSIC) || \
 		BR2_sh4 || BR2_sh4eb || \
