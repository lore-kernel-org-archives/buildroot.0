From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Feb 2018 21:18:13 +0100
Subject: [Buildroot] [PATCH 1/6] arch/arm: add cortex-m7 core
In-Reply-To: <cover.1519589817.git.yann.morin.1998@free.fr>
References: <cover.1519589817.git.yann.morin.1998@free.fr>
Message-ID: <87dbe541bbacbe1cbdcacec6d1fa4cbf67585a0d.1519589817.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nothing fancy, just a plain Cortex-M, armv7-M core...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 arch/Config.in.arm | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index b05e83e33c..67f8a16737 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -241,6 +241,11 @@ config BR2_cortex_m4
 	bool "cortex-M4"
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7M
+config BR2_cortex_m7
+	bool "cortex-M7"
+	select BR2_ARM_CPU_HAS_THUMB2
+	select BR2_ARM_CPU_ARMV7M
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 endif # !BR2_ARCH_IS_64
 
 comment "armv8 cores"
@@ -716,6 +721,7 @@ config BR2_GCC_TARGET_CPU
 	# armv7m
 	default "cortex-m3"	if BR2_cortex_m3
 	default "cortex-m4"	if BR2_cortex_m4
+	default "cortex-m7"	if BR2_cortex_m7
 	# armv8a
 	default "cortex-a32"	if BR2_cortex_a32
 	default "cortex-a35"	if BR2_cortex_a35
-- 
2.14.1
