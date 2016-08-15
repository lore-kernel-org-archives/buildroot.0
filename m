From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Mon, 15 Aug 2016 17:41:47 +0300
Subject: [Buildroot] [PATCH] gmp: disable assembly for arc
Message-ID: <1471272107-17275-1-git-send-email-vzakhar@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It has different inline assembly constraints that
are not supported after update to gcc-6.

Fixes:
http://autobuild.buildroot.net/results/c91/c9143eec0834017d57d5352d6fc95b5fae38da00//
and a lot of other failures of gmp-6.1.1 for ARC.

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
---
 package/gmp/gmp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 485bf7c..420fd2f 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -15,7 +15,7 @@ HOST_GMP_DEPENDENCIES = host-m4
 
 # GMP doesn't support assembly for coldfire or mips r6 ISA yet
 # Disable for ARM v7m since it has different asm constraints
-ifeq ($(BR2_m68k_cf)$(BR2_mips_32r6)$(BR2_mips_64r6)$(BR2_ARM_CPU_ARMV7M),y)
+ifeq ($(BR2_m68k_cf)$(BR2_mips_32r6)$(BR2_mips_64r6)$(BR2_ARM_CPU_ARMV7M)$(BR2_arc),y)
 GMP_CONF_OPTS += --disable-assembly
 endif
 
-- 
2.5.5
