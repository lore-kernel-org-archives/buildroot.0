From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 17 Mar 2020 16:56:28 +0100
Subject: [Buildroot] [RFC PATCH 1/5] configs/guest_*: some new defconfig
In-Reply-To: <20200317155632.17649-1-francois.perrad@gadz.org>
References: <20200317155632.17649-1-francois.perrad@gadz.org>
Message-ID: <20200317155632.17649-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 configs/guest_arm_a7_defconfig | 11 +++++++++++
 configs/guest_arm_a9_defconfig | 13 +++++++++++++
 configs/guest_x86_64_defconfig | 10 ++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 configs/guest_arm_a7_defconfig
 create mode 100644 configs/guest_arm_a9_defconfig
 create mode 100644 configs/guest_x86_64_defconfig

diff --git a/configs/guest_arm_a7_defconfig b/configs/guest_arm_a7_defconfig
new file mode 100644
index 000000000..c7471276f
--- /dev/null
+++ b/configs/guest_arm_a7_defconfig
@@ -0,0 +1,11 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a7=y
+
+# System
+BR2_INIT_NONE=y
+# BR2_TARGET_GENERIC_GETTY is not set
+# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
+
+# Filesystem
+BR2_TARGET_ROOTFS_TAR=y
diff --git a/configs/guest_arm_a9_defconfig b/configs/guest_arm_a9_defconfig
new file mode 100644
index 000000000..35404d273
--- /dev/null
+++ b/configs/guest_arm_a9_defconfig
@@ -0,0 +1,13 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+
+# System
+BR2_INIT_NONE=y
+# BR2_TARGET_GENERIC_GETTY is not set
+# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
+
+# Filesystem
+BR2_TARGET_ROOTFS_TAR=y
diff --git a/configs/guest_x86_64_defconfig b/configs/guest_x86_64_defconfig
new file mode 100644
index 000000000..2ae17bc3d
--- /dev/null
+++ b/configs/guest_x86_64_defconfig
@@ -0,0 +1,10 @@
+# Architecture
+BR2_x86_64=y
+
+# System
+BR2_INIT_NONE=y
+# BR2_TARGET_GENERIC_GETTY is not set
+# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
+
+# Filesystem
+BR2_TARGET_ROOTFS_TAR=y
-- 
2.17.1
