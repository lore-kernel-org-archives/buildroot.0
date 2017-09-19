From: Joel Stanley <joel@jms.id.au>
Date: Tue, 19 Sep 2017 10:25:38 +0930
Subject: [Buildroot] [PATCH 2/2] configs: Add qemu_ppc64le_pseries
In-Reply-To: <20170919005538.1482-1-joel@jms.id.au>
References: <20170919005538.1482-1-joel@jms.id.au>
Message-ID: <20170919005538.1482-3-joel@jms.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is similar to the ppc64_pseries config, except we build for little
endian instead of big endian.

The default architecture is set to Power8 as this was the first fully
enabled LE machine.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 configs/qemu_ppc64le_pseries_defconfig | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 configs/qemu_ppc64le_pseries_defconfig

diff --git a/configs/qemu_ppc64le_pseries_defconfig b/configs/qemu_ppc64le_pseries_defconfig
new file mode 100644
index 000000000000..62e729d30260
--- /dev/null
+++ b/configs/qemu_ppc64le_pseries_defconfig
@@ -0,0 +1,21 @@
+# Architecture
+BR2_powerpc64le=y
+BR2_powerpc_power8=y
+
+# System
+BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
+BR2_SYSTEM_DHCP="eth0"
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Linux headers same as kernel, a 4.13 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.1"
+BR2_LINUX_KERNEL_DEFCONFIG="pseries_le"
+BR2_LINUX_KERNEL_VMLINUX=y
-- 
2.14.1
