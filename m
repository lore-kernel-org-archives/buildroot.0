From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 May 2017 21:26:34 +0200
Subject: [Buildroot] [git commit] gmp: Enable ASM for ARC again
Message-ID: <20170505192709.6E753801E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec4c7b140cf59928d82a3e462a9924bdc8743d96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit reverts cdf63517de25 "gmp: disable assembly for arc"
as in GMP v6.1.2 there's already a proper fix for ASM constraints, see
https://gmplib.org/repo/gmp/rev/58879634af3ci

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gmp/gmp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 5ea79ae..7236e37 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -15,7 +15,7 @@ HOST_GMP_DEPENDENCIES = host-m4
 
 # GMP doesn't support assembly for coldfire or mips r6 ISA yet
 # Disable for ARM v7m since it has different asm constraints
-ifeq ($(BR2_m68k_cf)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6)$(BR2_ARM_CPU_ARMV7M)$(BR2_arc),y)
+ifeq ($(BR2_m68k_cf)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6)$(BR2_ARM_CPU_ARMV7M),y)
 GMP_CONF_OPTS += --disable-assembly
 endif
 
