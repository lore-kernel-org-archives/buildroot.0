From: Shyam Saini <shyam.saini@amarulasolutions.com>
Date: Tue,  9 Apr 2019 21:15:03 +0530
Subject: [Buildroot] [V2 7/7] board: friendlyarm: nanopi-m1-plus: patches:
 Remove linux patch
In-Reply-To: <20190409154503.7598-1-shyam.saini@amarulasolutions.com>
References: <20190409154503.7598-1-shyam.saini@amarulasolutions.com>
Message-ID: <20190409154503.7598-8-shyam.saini@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Prior to linux v4.13, there was no support for Nanopi M1 Plus so we used
a custom device tree patch file for this puspose. In the preceeding patch,
linux is bumped to newer version which has support for the board in question
and thus makes this patch file obselete. So lets drop it.

This also removes buildroot BR2_GLOBAL_PATCH_DIR option which is no
longer needed

Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
---
 ...ts-nanopi-m1-plus-add-dts-to-linux-4.11.5.patch | 103 ---------------------
 configs/nanopi_m1_plus_defconfig                   |   1 -
 2 files changed, 104 deletions(-)
 delete mode 100644 board/friendlyarm/nanopi-m1-plus/patches/linux/0001-ARM-dts-nanopi-m1-plus-add-dts-to-linux-4.11.5.patch

diff --git a/board/friendlyarm/nanopi-m1-plus/patches/linux/0001-ARM-dts-nanopi-m1-plus-add-dts-to-linux-4.11.5.patch b/board/friendlyarm/nanopi-m1-plus/patches/linux/0001-ARM-dts-nanopi-m1-plus-add-dts-to-linux-4.11.5.patch
deleted file mode 100644
index c05273261d..0000000000
--- a/board/friendlyarm/nanopi-m1-plus/patches/linux/0001-ARM-dts-nanopi-m1-plus-add-dts-to-linux-4.11.5.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From 4ec28d4e1040b94c66e97aa77071c9ef3478f022 Mon Sep 17 00:00:00 2001
-From: Chakra Divi <chakra@openedev.com>
-Date: Thu, 6 Jul 2017 18:22:35 +0530
-Subject: [PATCH] ARM: dts: nanopi-m1-plus : add dts to linux 4.11.5
-
-This patch is used to add nanopi-m1-plus dts
-file in linux source code helps to add nanopi-m1-plus
-board support in buildroot and is part of the linux
-main-line ; refer to the below link for info
-[https://patchwork.kernel.org/patch/9755033]
-
-Signed-off-by: Chakra Divi <chakra@openedev.com>
----
- arch/arm/boot/dts/Makefile                    |    1 +
- arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts |   64 +++++++++++++++++++++++++
- 2 files changed, 65 insertions(+)
- create mode 100644 arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts
-
-diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
-index 0118084..928e5d3 100644
---- a/arch/arm/boot/dts/Makefile
-+++ b/arch/arm/boot/dts/Makefile
-@@ -867,6 +867,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
- 	sun8i-h3-bananapi-m2-plus.dtb \
- 	sun8i-h3-beelink-x2.dtb \
- 	sun8i-h3-nanopi-m1.dtb	\
-+	sun8i-h3-nanopi-m1-plus.dtb \
- 	sun8i-h3-nanopi-neo.dtb \
- 	sun8i-h3-orangepi-2.dtb \
- 	sun8i-h3-orangepi-lite.dtb \
-diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts b/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts
-new file mode 100644
-index 0000000..8ddd1b2
---- /dev/null
-+++ b/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts
-@@ -0,0 +1,64 @@
-+/*
-+ * Copyright (C) 2017 Jagan Teki <jteki@openedev.com>
-+ *
-+ * This file is dual-licensed: you can use it either under the terms
-+ * of the GPL or the X11 license, at your option. Note that this dual
-+ * licensing only applies to this file, and not this project as a
-+ * whole.
-+ *
-+ *  a) This file is free software; you can redistribute it and/or
-+ *     modify it under the terms of the GNU General Public License as
-+ *     published by the Free Software Foundation; either version 2 of the
-+ *     License, or (at your option) any later version.
-+ *
-+ *     This file is distributed in the hope that it will be useful,
-+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ *     GNU General Public License for more details.
-+ *
-+ * Or, alternatively,
-+ *
-+ *  b) Permission is hereby granted, free of charge, to any person
-+ *     obtaining a copy of this software and associated documentation
-+ *     files (the "Software"), to deal in the Software without
-+ *     restriction, including without limitation the rights to use,
-+ *     copy, modify, merge, publish, distribute, sublicense, and/or
-+ *     sell copies of the Software, and to permit persons to whom the
-+ *     Software is furnished to do so, subject to the following
-+ *     conditions:
-+ *
-+ *     The above copyright notice and this permission notice shall be
-+ *     included in all copies or substantial portions of the Software.
-+ *
-+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
-+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
-+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
-+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
-+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
-+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
-+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
-+ *     OTHER DEALINGS IN THE SOFTWARE.
-+ */
-+
-+#include "sun8i-h3-nanopi.dtsi"
-+
-+/ {
-+	model = "FriendlyArm NanoPi M1 Plus";
-+	compatible = "friendlyarm,nanopi-m1-plus", "allwinner,sun8i-h3";
-+};
-+
-+&ehci1 {
-+	status = "okay";
-+};
-+
-+&ehci2 {
-+	status = "okay";
-+};
-+
-+&ohci1 {
-+	status = "okay";
-+};
-+
-+&ohci2 {
-+	status = "okay";
-+};
--- 
-1.7.9.5
-
diff --git a/configs/nanopi_m1_plus_defconfig b/configs/nanopi_m1_plus_defconfig
index 0176fc1c5b..2f9d14f104 100644
--- a/configs/nanopi_m1_plus_defconfig
+++ b/configs/nanopi_m1_plus_defconfig
@@ -25,7 +25,6 @@ BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
-BR2_GLOBAL_PATCH_DIR="board/friendlyarm/nanopi-m1-plus/patches/"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-nanopi-m1-plus"
-- 
2.11.0
