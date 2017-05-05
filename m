From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri,  5 May 2017 15:35:20 +0300
Subject: [Buildroot] [PATCH] gmp: Enable ASM for ARC again
Message-ID: <20170505123520.45502-1-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit reverts cdf63517de25 "gmp: disable assembly for arc"
as in GMP v6.1.2 there's already a proper fix for ASM constraints, see
https://gmplib.org/repo/gmp/rev/58879634af3ci

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 package/gmp/gmp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 5ea79ae754..7236e37bb4 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -15,7 +15,7 @@ HOST_GMP_DEPENDENCIES = host-m4
 
 # GMP doesn't support assembly for coldfire or mips r6 ISA yet
 # Disable for ARM v7m since it has different asm constraints
-ifeq ($(BR2_m68k_cf)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6)$(BR2_ARM_CPU_ARMV7M)$(BR2_arc),y)
+ifeq ($(BR2_m68k_cf)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6)$(BR2_ARM_CPU_ARMV7M),y)
 GMP_CONF_OPTS += --disable-assembly
 endif
 
-- 
2.11.0
