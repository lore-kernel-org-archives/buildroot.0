From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 14:17:54 +0200
Subject: [Buildroot] [git commit branch/next] rustc: enable on powerpc64le
 architecture
Message-ID: <20180519121703.643838A434@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=811ddf60f44e1f1511332de3cd902415364c5dba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Rust supports powerpc64le to the same level as powerpc64, so allow it.

Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
Tested-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Acked-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rustc/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index 1c79eededc..84a8e0f90b 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -7,7 +7,7 @@ config BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	default y if BR2_aarch64
 	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5 \
 	        && !(BR2_ARM_CPU_ARMV7A && BR2_ARM_EABI)
-	default y if BR2_powerpc || BR2_powerpc64
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 	default y if (BR2_mips || BR2_mipsel) && !BR2_MIPS_CPU_MIPS32R6
 	default y if (BR2_mips64 || BR2_mips64el) && !BR2_MIPS_CPU_MIPS64R6 \
 		&& BR2_MIPS_NABI64
