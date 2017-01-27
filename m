From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Fri, 27 Jan 2017 16:31:30 +0300
Subject: [Buildroot] [PATCH] configs: introduce hs38 HAPS defconfig
Message-ID: <1485523890-22929-1-git-send-email-vzakhar@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds yet another development platform for ARC.

This time around it is HAPS or ZeBU based prototyping platform used
widely for both ARC hardware and software bring-up and verification.

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
---
 configs/snps_archs38_zebu_defconfig | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 configs/snps_archs38_zebu_defconfig

diff --git a/configs/snps_archs38_zebu_defconfig b/configs/snps_archs38_zebu_defconfig
new file mode 100644
index 0000000..96d941a
--- /dev/null
+++ b/configs/snps_archs38_zebu_defconfig
@@ -0,0 +1,18 @@
+# Architecture
+BR2_arcle=y
+BR2_archs38=y
+
+# System
+BR2_TARGET_GENERIC_HOSTNAME="zebu_hs"
+BR2_TARGET_GENERIC_ISSUE="Welcome to the HAPS Development Platform"
+BR2_TARGET_ROOTFS_INITRAMFS=y
+
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_DEFCONFIG="zebu_hs_smp"
+BR2_LINUX_KERNEL_VMLINUX=y
-- 
2.7.4
