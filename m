From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Feb 2018 21:18:18 +0100
Subject: [Buildroot] [PATCH 6/6] arch/arm: cortex-m7 may have a FPv5 FPU
In-Reply-To: <cover.1519589817.git.yann.morin.1998@free.fr>
References: <cover.1519589817.git.yann.morin.1998@free.fr>
Message-ID: <e3cc02b38674ecfdb83d9adc32cf504c3b85cd1f.1519589817.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 arch/Config.in.arm | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 7c0fcacc36..640ad93f8b 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -272,6 +272,7 @@ config BR2_cortex_m4
 config BR2_cortex_m7
 	bool "cortex-M7"
 	select BR2_ARM_CPU_HAS_THUMB2
+	select BR2_ARM_CPU_MAYBE_HAS_FPV5
 	select BR2_ARM_CPU_ARMV7M
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 endif # !BR2_ARCH_IS_64
-- 
2.14.1
