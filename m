From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed,  7 Dec 2016 10:25:21 +0100
Subject: [Buildroot] [PATCH 2/3] arch/Config.in.arm: only enable
	BR2_ARM_CPU_HAS_NEON for ARMv8 in 32bit mode
In-Reply-To: <20161207092522.16222-1-peter@korsgaard.com>
References: <20161207092522.16222-1-peter@korsgaard.com>
Message-ID: <20161207092522.16222-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A number of packages use BR2_ARM_CPU_HAS_NEON to know if the target handles
aarch32 neon instructions, which is only true for ARMv8 cores when they are
running in 32bit mode.

Notice: These cores do support neon-like instructions using a different
encoding in 64bit mode (it is a required part of ARMv8, similar to the FPU).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.arm | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 3c47bd7..6ec6029 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -194,21 +194,21 @@ config BR2_cortex_a17
 config BR2_cortex_a53
 	bool "cortex-A53"
 	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
-	select BR2_ARM_CPU_HAS_NEON
+	select BR2_ARM_CPU_HAS_NEON if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_cortex_a57
 	bool "cortex-A57"
 	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
-	select BR2_ARM_CPU_HAS_NEON
+	select BR2_ARM_CPU_HAS_NEON if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_cortex_a72
 	bool "cortex-A72"
 	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
-	select BR2_ARM_CPU_HAS_NEON
+	select BR2_ARM_CPU_HAS_NEON if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8
 	select BR2_ARCH_HAS_MMU_OPTIONAL
-- 
2.10.2
