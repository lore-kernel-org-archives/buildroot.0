From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 24 Jul 2016 21:15:59 -0300
Subject: [Buildroot] [PATCH] nettle: disable assembly optimizations for
	ARMv7M
Message-ID: <1469405759-3224-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's thumb2-only and it requires ARM instructions.
Since V4 and V5 aren't enough either use the V7M knob to avoid
over-complicating the conditional. Fixes:
http://autobuild.buildroot.net/results/354/35418d33efa902d3a1a82b2cd58d8db1b1172e49/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nettle/nettle.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index c133839..a94a7fc 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -15,7 +15,7 @@ NETTLE_LICENSE_FILES = COPYING.LESSERv3 COPYINGv2
 NETTLE_CONF_OPTS = --disable-openssl
 
 # ARM assembly requires v6+ ISA
-ifeq ($(BR2_ARM_CPU_ARMV4)$(BR2_ARM_CPU_ARMV5),y)
+ifeq ($(BR2_ARM_CPU_ARMV4)$(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV7M),y)
 NETTLE_CONF_OPTS += --disable-assembler
 endif
 
-- 
2.7.3
