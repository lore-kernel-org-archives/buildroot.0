From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 1 Feb 2012 23:34:12 +0100
Subject: [Buildroot] [git commit] Add defconfigs for LPC3250 boards
Message-ID: <20120201224701.9E56C90979@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=390ed5d2014a54ce7968d150156d8f8569aec8d0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ea3250: Embedded Artists
http://www.embeddedartists.com/products/kits/lpc3250_kit.php

fdi3250: Future Designs Inc.
http://www.teamfdi.com/development-tools-kits/products/6/SOMDIMM-LPC3250

phy3250: Phytec
http://www.phytec.com/products/som/ARM-XScale/phyCORE-ARM9-LPC3250.html

Signed-off-by: Alexandre Belloni <abelloni@adeneo-embedded.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/ea3250_defconfig  |   39 +++++++++++++++++++++++++++++++++++++++
 configs/fdi3250_defconfig |   39 +++++++++++++++++++++++++++++++++++++++
 configs/phy3250_defconfig |   39 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 117 insertions(+), 0 deletions(-)

diff --git a/configs/ea3250_defconfig b/configs/ea3250_defconfig
new file mode 100644
index 0000000..da84c7e
--- /dev/null
+++ b/configs/ea3250_defconfig
@@ -0,0 +1,39 @@
+# Architecture
+BR2_arm=y
+BR2_arm926t=y
+
+BR2_ARM_TYPE="ARM926T"
+BR2_ARM_EABI=y
+
+#
+# GCC Options
+# We need to force GCC 4.3.x because it is the last version
+# that will compile a kernel with ethernet working correctly
+BR2_GCC_VERSION_4_3_X=y
+
+
+# Bootloaders
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="ea3250"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_VERSION="master"
+BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="git://git.lpclinux.com/uboot-2009.03-lpc32xx"
+BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="master"
+BR2_TARGET_UBOOT_FORMAT_BIN=y
+BR2_TARGET_LPC32XXCDL=y
+BR2_TARGET_LPC32XXCDL_BOARDNAME="ea3250"
+
+
+#
+# Kernel
+#
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://git.lpclinux.com/linux-2.6.34-lpc32xx"
+BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="master"
+BR2_LINUX_KERNEL_VERSION="master"
+BR2_LINUX_KERNEL_PATCH=""
+BR2_LINUX_KERNEL_USE_DEFCONFIG=y
+BR2_LINUX_KERNEL_DEFCONFIG="ea3250"
+BR2_LINUX_KERNEL_UIMAGE=y
+
diff --git a/configs/fdi3250_defconfig b/configs/fdi3250_defconfig
new file mode 100644
index 0000000..505dc8b
--- /dev/null
+++ b/configs/fdi3250_defconfig
@@ -0,0 +1,39 @@
+# Architecture
+BR2_arm=y
+BR2_arm926t=y
+
+BR2_ARM_TYPE="ARM926T"
+BR2_ARM_EABI=y
+
+#
+# GCC Options
+# We need to force GCC 4.3.x because it is the last version
+# that will compile a kernel with ethernet working correctly
+BR2_GCC_VERSION_4_3_X=y
+
+
+# Bootloaders
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="fdi3250"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_VERSION="master"
+BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="git://git.lpclinux.com/uboot-2009.03-lpc32xx"
+BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="master"
+BR2_TARGET_UBOOT_FORMAT_BIN=y
+BR2_TARGET_LPC32XXCDL=y
+BR2_TARGET_LPC32XXCDL_BOARDNAME="fdi3250"
+
+
+#
+# Kernel
+#
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://git.lpclinux.com/linux-2.6.34-lpc32xx"
+BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="master"
+BR2_LINUX_KERNEL_VERSION="master"
+BR2_LINUX_KERNEL_PATCH=""
+BR2_LINUX_KERNEL_USE_DEFCONFIG=y
+BR2_LINUX_KERNEL_DEFCONFIG="fdi3250"
+BR2_LINUX_KERNEL_UIMAGE=y
+
diff --git a/configs/phy3250_defconfig b/configs/phy3250_defconfig
new file mode 100644
index 0000000..d46d719
--- /dev/null
+++ b/configs/phy3250_defconfig
@@ -0,0 +1,39 @@
+# Architecture
+BR2_arm=y
+BR2_arm926t=y
+
+BR2_ARM_TYPE="ARM926T"
+BR2_ARM_EABI=y
+
+#
+# GCC Options
+# We need to force GCC 4.3.x because it is the last version
+# that will compile a kernel with ethernet working correctly
+BR2_GCC_VERSION_4_3_X=y
+
+
+# Bootloaders
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="phy3250"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_VERSION="master"
+BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="git://git.lpclinux.com/uboot-2009.03-lpc32xx"
+BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="master"
+BR2_TARGET_UBOOT_FORMAT_BIN=y
+BR2_TARGET_LPC32XXCDL=y
+BR2_TARGET_LPC32XXCDL_BOARDNAME="phy3250"
+
+
+#
+# Kernel
+#
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://git.lpclinux.com/linux-2.6.34-lpc32xx"
+BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="master"
+BR2_LINUX_KERNEL_VERSION="master"
+BR2_LINUX_KERNEL_PATCH=""
+BR2_LINUX_KERNEL_USE_DEFCONFIG=y
+BR2_LINUX_KERNEL_DEFCONFIG="phy3250"
+BR2_LINUX_KERNEL_UIMAGE=y
+
