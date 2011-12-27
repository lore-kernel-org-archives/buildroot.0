From: Alexandre Belloni <abelloni@adeneo-embedded.com>
Date: Tue, 27 Dec 2011 18:32:50 +0100
Subject: [Buildroot] [PATCH] Add various LPC3250 development board defconfigs
In-Reply-To: <1325006629.2527.1.camel@emblysd024.adetel.com>
References: <1325006629.2527.1.camel@emblysd024.adetel.com>
Message-ID: <1325007170.2527.3.camel@emblysd024.adetel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ea3250: Embedded Artists
http://www.embeddedartists.com/products/kits/lpc3250_kit.php

fdi3250: Future Design Inc.
http://www.teamfdi.com/development-tools-kits/products/6/SOMDIMM-LPC3250

phy3250: Phytec
http://www.phytec.com/products/som/ARM-XScale/phyCORE-ARM9-LPC3250.html

Signed-off-by: Alexandre Belloni <abelloni@adeneo-embedded.com>
---
 configs/ea3250_defconfig  |   37 +++++++++++++++++++++++++++++++++++++
 configs/fdi3250_defconfig |   37 +++++++++++++++++++++++++++++++++++++
 configs/phy3250_defconfig |   37 +++++++++++++++++++++++++++++++++++++
 3 files changed, 111 insertions(+), 0 deletions(-)
 create mode 100644 configs/ea3250_defconfig
 create mode 100644 configs/fdi3250_defconfig
 create mode 100644 configs/phy3250_defconfig

diff --git a/configs/ea3250_defconfig b/configs/ea3250_defconfig
new file mode 100644
index 0000000..6072725
--- /dev/null
+++ b/configs/ea3250_defconfig
@@ -0,0 +1,37 @@
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
index 0000000..31e8f58
--- /dev/null
+++ b/configs/fdi3250_defconfig
@@ -0,0 +1,37 @@
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
index 0000000..ac65066
--- /dev/null
+++ b/configs/phy3250_defconfig
@@ -0,0 +1,37 @@
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
-- 
1.7.7.3
