From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Fri, 16 Sep 2016 19:18:32 +0200
Subject: [Buildroot] [PATCH v2] configs: nitrogen*: enable VFP and NEON
	support
Message-ID: <20160916171832.4099-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Hi all,

Changes v1 -> v2:
- switched from NEON to VFPV3 for imx6 configs as suggested by Thomas

Regards,
Gary
---
 configs/nitrogen6sx_defconfig | 3 +++
 configs/nitrogen6x_defconfig  | 3 +++
 configs/nitrogen7_defconfig   | 1 +
 3 files changed, 7 insertions(+)

diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
index bd92f55..b317525 100644
--- a/configs/nitrogen6sx_defconfig
+++ b/configs/nitrogen6sx_defconfig
@@ -1,6 +1,9 @@
 # architecture
 BR2_arm=y
 BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_VFPV3=y
 
 # system
 BR2_TARGET_GENERIC_GETTY=y
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 85acabe..dc033dc 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -1,6 +1,9 @@
 # architecture
 BR2_arm=y
 BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_VFPV3=y
 
 # system
 BR2_TARGET_GENERIC_GETTY=y
diff --git a/configs/nitrogen7_defconfig b/configs/nitrogen7_defconfig
index a8f3b45..adce0fb 100644
--- a/configs/nitrogen7_defconfig
+++ b/configs/nitrogen7_defconfig
@@ -1,6 +1,7 @@
 # architecture
 BR2_arm=y
 BR2_cortex_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
 
 # system
 BR2_TARGET_GENERIC_GETTY=y
-- 
2.9.3
