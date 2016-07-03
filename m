From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 00:34:01 +0200
Subject: [Buildroot] [git commit] gmp: dissable assembly for armv7m
Message-ID: <20160703223411.00D6A80455@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc99774b9f30459fd8be04daac5a743e6d890c4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It has different assembly constraints which can't be satisfied. Fixes:
http://autobuild.buildroot.net/results/ac6/ac65384a325912788790ceafa7db657cef9382fa/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gmp/gmp.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 4557190..cdde794 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -14,7 +14,8 @@ GMP_DEPENDENCIES = host-m4
 HOST_GMP_DEPENDENCIES = host-m4
 
 # GMP doesn't support assembly for coldfire or mips r6 ISA yet
-ifeq ($(BR2_m68k_cf)$(BR2_mips_32r6)$(BR2_mips_64r6),y)
+# Disable for ARM v7m since it has different asm constraints
+ifeq ($(BR2_m68k_cf)$(BR2_mips_32r6)$(BR2_mips_64r6)$(BR2_ARM_CPU_ARMV7M),y)
 GMP_CONF_OPTS += --disable-assembly
 endif
 
