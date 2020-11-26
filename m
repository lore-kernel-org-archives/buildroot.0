From: Vivek Kumar Gautam <vivek.gautam@arm.com>
Date: Thu, 26 Nov 2020 15:35:07 +0530
Subject: [Buildroot] [PATCH] configs/aarch64_rdinfra: add new config for
 infra rd plaforms
Message-ID: <20201126100507.27484-1-vivek.gautam@arm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This defconfig enables Arm aarch64 Infra RD platforms to use
buildroot backed ramdisks to perform simple unit/sanity testing.
These infra platforms are currently enabled with a scripts based
build system as can be seen in linaro public repos[1]. A busybox
based boot is also enabled[2].
We plan to use buildroot for a richer experience while testing and
therefore this config.
This config will also be first step towards enabling buildroot
based build system for infra rd platforms in near future.
It comes with following minimal stuff -
 -neoverse_n1 cpu
 -bash shell
 -vim
 -pciutils
 -libdtc
 -screen

[1] https://git.linaro.org/landing-teams/working/arm/arm-reference-platforms.git/about/
[2] https://git.linaro.org/landing-teams/working/arm/arm-reference-platforms.git/about/docs/rdn1edge/how-to/busybox-boot.rst

Signed-off-by: Vivek Kumar Gautam <vivek.gautam@arm.com>
---
 configs/aarch64_rdinfra_defconfig | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 configs/aarch64_rdinfra_defconfig

diff --git a/configs/aarch64_rdinfra_defconfig b/configs/aarch64_rdinfra_defconfig
new file mode 100644
index 0000000000..71e44e537c
--- /dev/null
+++ b/configs/aarch64_rdinfra_defconfig
@@ -0,0 +1,21 @@
+# Architecture
+BR2_aarch64=y
+
+# Processor
+BR2_neoverse_n1=y
+
+# Toolchain
+BR2_TOOLCHAIN_EXTERNAL=y
+
+# Additional system packages
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+BR2_PACKAGE_PCIUTILS=y
+BR2_PACKAGE_DTC=y
+BR2_PACKAGE_DTC_PROGRAMS=y
+BR2_PACKAGE_LIBEVENT=y
+BR2_PACKAGE_BASH=y
+BR2_PACKAGE_SCREEN=y
+BR2_PACKAGE_VIM=y
+
+# Target filesystem
+BR2_TARGET_ROOTFS_CPIO=y
-- 
2.17.1
