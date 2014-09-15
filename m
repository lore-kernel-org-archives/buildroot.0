From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Sep 2014 23:01:57 +0200
Subject: [Buildroot] [PATCH 2/4] arch: remove BR2_arm10t
In-Reply-To: <1410814919-11523-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1410814919-11523-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1410814919-11523-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The BR2_arm10t option is not correct as it references an ARM family,
while other options indicate a specific ARM core. The ARM cores in
ARM10 family are ARM1020E, ARM1022E and ARM1026EJ-S according to
Wikipedia. However, those are clearly very rare, and Wikipedia also
indicates two Conexant ADSL-related SoC as being part of this family
of ARM cores. Therefore, this commit removes this ARM family.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm | 4 ----
 1 file changed, 4 deletions(-)

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
-- 
2.0.0
