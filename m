From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jul 2016 22:47:47 +0200
Subject: [Buildroot] [git commit] nettle: disable assembly optimizations for
	ARMv7M
Message-ID: <20160725204754.081A3820DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb640120d8a3e6816cf57b479f93064e84df8640
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's thumb2-only and it requires ARM instructions.
Since V4 and V5 aren't enough either use the V7M knob to avoid
over-complicating the conditional. Fixes:
http://autobuild.buildroot.net/results/354/35418d33efa902d3a1a82b2cd58d8db1b1172e49/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
