From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue,  8 Sep 2015 17:54:22 +0300
Subject: [Buildroot] [PATCH] arc: add HS38 VDK virtual boards
Message-ID: <1441724062-27521-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Virtualizer Development Kits (VDKs) are software development kits
containing design-specific virtual prototypes as well as debug and
analysis tools and sample software.

With this change we add support for VDK based on ARC HS38 core.

Note that FS-overlay is required to allow instantiation of console on
both serial port and LCD screen simultaneously.

Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 configs/snps_hs38_smp_vdk_defconfig | 21 +++++++++++++++++++++
 configs/snps_hs38_vdk_defconfig     | 21 +++++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 configs/snps_hs38_smp_vdk_defconfig
 create mode 100644 configs/snps_hs38_vdk_defconfig

diff --git a/configs/snps_hs38_smp_vdk_defconfig b/configs/snps_hs38_smp_vdk_defconfig
new file mode 100644
index 0000000..b38cb1e
--- /dev/null
+++ b/configs/snps_hs38_smp_vdk_defconfig
@@ -0,0 +1,21 @@
+# Architecture
+BR2_arcle=y
+BR2_archs38=y
+
+# System
+BR2_TARGET_GENERIC_HOSTNAME="hs38_vdk"
+BR2_TARGET_GENERIC_ISSUE="Welcome to the HS38 VDK Software Development Platform"
+BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
+BR2_TARGET_ROOTFS_EXT2=y
+
+# Headers
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="4.2"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
+BR2_LINUX_KERNEL_DEFCONFIG="vdk_hs38_smp"
+BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/snps_hs38_vdk_defconfig b/configs/snps_hs38_vdk_defconfig
new file mode 100644
index 0000000..49ad496
--- /dev/null
+++ b/configs/snps_hs38_vdk_defconfig
@@ -0,0 +1,21 @@
+# Architecture
+BR2_arcle=y
+BR2_archs38=y
+
+# System
+BR2_TARGET_GENERIC_HOSTNAME="hs38_vdk"
+BR2_TARGET_GENERIC_ISSUE="Welcome to the HS38 VDK Software Development Platform"
+BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
+BR2_TARGET_ROOTFS_EXT2=y
+
+# Headers
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="4.2"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
+BR2_LINUX_KERNEL_DEFCONFIG="vdk_hs38"
+BR2_LINUX_KERNEL_VMLINUX=y
-- 
2.4.3
