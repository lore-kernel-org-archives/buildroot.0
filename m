From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 20 Jun 2016 11:00:03 -0300
Subject: [Buildroot] [PATCH] gmp: dissable assembly for armv7m
Message-ID: <1466431203-11803-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It has different assembly constraints which can't be satisfied. Fixes:
http://autobuild.buildroot.net/results/ac6/ac65384a325912788790ceafa7db657cef9382fa/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gmp/gmp.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index e1d75dc..6a91a27 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -13,7 +13,8 @@ GMP_LICENSE_FILES = COPYING.LESSERv3
 GMP_DEPENDENCIES = host-m4
 
 # GMP doesn't support assembly for coldfire or mips r6 ISA yet
-ifeq ($(BR2_m68k_cf)$(BR2_mips_32r6)$(BR2_mips_64r6),y)
+# Disable for ARM v7m since it has different asm constraints
+ifeq ($(BR2_m68k_cf)$(BR2_mips_32r6)$(BR2_mips_64r6)$(BR2_ARM_CPU_ARMV7M),y)
 GMP_CONF_OPTS += --disable-assembly
 endif
 
-- 
2.7.3
