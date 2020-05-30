From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 30 May 2020 14:47:29 +0200
Subject: [Buildroot] [PATCH v2 1/7] configs/guest_*: some new defconfig
In-Reply-To: <20200530124735.1384078-1-francois.perrad@gadz.org>
References: <20200530124735.1384078-1-francois.perrad@gadz.org>
Message-ID: <20200530124735.1384078-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS                     |  1 +
 configs/guest_arm_a7_defconfig | 16 ++++++++++++++++
 configs/guest_arm_a9_defconfig | 18 ++++++++++++++++++
 configs/guest_x86_64_defconfig | 15 +++++++++++++++
 4 files changed, 50 insertions(+)
 create mode 100644 configs/guest_arm_a7_defconfig
 create mode 100644 configs/guest_arm_a9_defconfig
 create mode 100644 configs/guest_x86_64_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 99f47c3a3..e930c011b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -934,6 +934,7 @@ F:	package/ser2net/
 N:	Francois Perrad <francois.perrad@gadz.org>
 F:	board/olimex/a20_olinuxino
 F:	board/olimex/imx233_olinuxino/
+F:	configs/guest_*
 F:	configs/olimex_a20_olinuxino_*
 F:	configs/olimex_imx233_olinuxino_defconfig
 F:	package/4th/
diff --git a/configs/guest_arm_a7_defconfig b/configs/guest_arm_a7_defconfig
new file mode 100644
index 000000000..efe9a1369
--- /dev/null
+++ b/configs/guest_arm_a7_defconfig
@@ -0,0 +1,16 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a7=y
+
+# Toolchain
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="4.15"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
+
+# System
+BR2_INIT_SYSTEMD=y
+# BR2_TARGET_GENERIC_GETTY is not set
+
+# Filesystem
+BR2_TARGET_ROOTFS_TAR=y
diff --git a/configs/guest_arm_a9_defconfig b/configs/guest_arm_a9_defconfig
new file mode 100644
index 000000000..02c3d302d
--- /dev/null
+++ b/configs/guest_arm_a9_defconfig
@@ -0,0 +1,18 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+
+# Toolchain
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="4.15"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
+
+# System
+BR2_INIT_SYSTEMD=y
+# BR2_TARGET_GENERIC_GETTY is not set
+
+# Filesystem
+BR2_TARGET_ROOTFS_TAR=y
diff --git a/configs/guest_x86_64_defconfig b/configs/guest_x86_64_defconfig
new file mode 100644
index 000000000..42d1d659a
--- /dev/null
+++ b/configs/guest_x86_64_defconfig
@@ -0,0 +1,15 @@
+# Architecture
+BR2_x86_64=y
+
+# Toolchain
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="4.15"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
+
+# System
+BR2_INIT_SYSTEMD=y
+# BR2_TARGET_GENERIC_GETTY is not set
+
+# Filesystem
+BR2_TARGET_ROOTFS_TAR=y
-- 
2.25.1
