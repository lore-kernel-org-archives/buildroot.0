From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Sep 2014 22:09:05 +0200
Subject: [Buildroot] [git commit] arch: remove BR2_arm10t
Message-ID: <20140918201342.5342E9D6C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d60489a6e5e733a20d18b128646088981da57867
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BR2_arm10t option is not correct as it references an ARM family,
while other options indicate a specific ARM core. The ARM cores in
ARM10 family are ARM1020E, ARM1022E and ARM1026EJ-S according to
Wikipedia. However, those are clearly very rare, and Wikipedia only
indicates two Conexant ADSL-related SoC as being part of this family
of ARM cores. Therefore, this commit removes this ARM family.

[Peter: remove nettle.mk reference as pointed out by Yann]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.arm       |    4 ----
 package/nettle/nettle.mk |    2 +-
 2 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 5ae2378..201ff1d 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -54,9 +54,6 @@ config BR2_arm926t
 	bool "arm926t"
 	select BR2_ARM_CPU_MAYBE_HAS_VFPV2
 	select BR2_ARM_CPU_HAS_THUMB
-config BR2_arm10t
-	bool "arm10t"
-	select BR2_ARM_CPU_HAS_THUMB
 config BR2_arm1136jf_s_r0
 	bool "arm1136jf_s rev0"
 	select BR2_ARM_CPU_HAS_VFPV2
@@ -367,7 +364,6 @@ config BR2_GCC_TARGET_ARCH
 	default "armv4t"	if BR2_arm920t
 	default "armv4t"	if BR2_arm922t
 	default "armv5te"	if BR2_arm926t
-	default "armv5t"	if BR2_arm10t
 	default "armv6j"	if BR2_arm1136jf_s_r0
 	default "armv6k"	if BR2_arm1136jf_s_r1
 	default "armv6zk"	if BR2_arm1176jz_s
diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index 647100a..519af69 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -15,7 +15,7 @@ NETTLE_LICENSE_FILES = COPYING.LIB
 NETTLE_CONF_OPT = --disable-openssl
 
 # ARM assembly requires v6+ ISA
-ifeq ($(BR2_arm920t)$(BR2_arm922t)$(BR2_arm926t)$(BR2_arm10t)$(BR2_fa526)$(BR2_strongarm)$(BR2_xscale)$(BR2_iwmmxt),y)
+ifeq ($(BR2_arm920t)$(BR2_arm922t)$(BR2_arm926t)$(BR2_fa526)$(BR2_strongarm)$(BR2_xscale)$(BR2_iwmmxt),y)
 NETTLE_CONF_OPT += --disable-assembler
 endif
 
