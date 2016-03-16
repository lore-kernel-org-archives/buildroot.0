From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Mar 2016 22:43:08 +0100
Subject: [Buildroot] [PATCH 02/16] arch/arm: Cortex-M3 provides only Thumb-2
In-Reply-To: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1458164602-16983-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Cortex-M cores only support Thumb-2, not Thumb. In fact, Thumb-2
is a superset of Thumb, and we could have a single option for both in
Buildroot, since -mthumb on ARMv4/v5 means original Thumb, while
-mthumb on ARMv7 means Thumb 2. However, for clarity, it makes sense
to have two separate options. But in this case, Cortex-M3 should not
advertise that it supports Thumb, as in fact selecting Thumb would
generate Thumb-2 code.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 33f763a..cd1ec33 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -172,7 +172,6 @@ config BR2_cortex_a17
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_cortex_m3
 	bool "cortex-M3"
-	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7M
 config BR2_fa526
-- 
2.6.4
