Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96044C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 15:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27557818BE;
	Wed, 27 Jul 2022 15:03:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27557818BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IqC-kguk93Yv; Wed, 27 Jul 2022 15:03:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0F4581304;
	Wed, 27 Jul 2022 15:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0F4581304
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9F2091C116E
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B1FF812CA
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:02:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B1FF812CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dX5-M2PYz18s for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 15:02:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DE6A80EE8
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 15:02:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DE6A80EE8
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1BDA28668F; Wed, 27 Jul 2022 14:48:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 16:59:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9e4da84a950d018ba84aa61efdc7a96f669871b8
X-Git-Newrev: 60fd21238508a513ab53bcb67d5e63053485bafb
X-Patchwork-Hint: ignore
Message-Id: <20220727144847.1BDA28668F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs: drop csky defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=60fd21238508a513ab53bcb67d5e63053485bafb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                     |   4 --
 board/csky/gx6605s/gdbinit     |  25 -------
 board/csky/gx6605s/gx6605s.dts | 155 -----------------------------------------
 board/csky/readme.txt          |  88 -----------------------
 configs/csky_gx6605s_defconfig |  19 -----
 5 files changed, 291 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 700533dbf7..769fc43069 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1185,10 +1185,6 @@ F:	support/testing/tests/package/br2-external/python-pybind
 F:	support/testing/tests/package/sample_python_pybind.py
 F:	support/testing/tests/package/test_python_pybind.py
 
-N:	Guo Ren <ren_guo@c-sky.com>
-F:	board/csky/
-F:	configs/csky_*
-
 N:	Gustavo Heinz <gustavo@gsthnz.com>
 F:	package/python-m2crypto/
 
diff --git a/board/csky/gx6605s/gdbinit b/board/csky/gx6605s/gdbinit
deleted file mode 100644
index d602aad46d..0000000000
--- a/board/csky/gx6605s/gdbinit
+++ /dev/null
@@ -1,25 +0,0 @@
-tar jtag jtag://127.0.0.1:1025
-reset
-
-# setup CCR (Cache Config Reg)
-# 0-1:MP,2:IE,3:DE,4:WB,5:RS,6:Z,7:BE
-set $cr18 = 0x7d
-
-# vendor custom setup, double cache line & preload
-set $cr30 = 0xc
-
-# pin mux for serial8250
-set *(unsigned int *) 0xa030a14c |= (1 << 22) | (1 << 23)
-
-# pass devicetree blob
-# r2 is magic
-# r3 is address
-set $r2 = 0x20150401
-set $r3 = 0x92000000
-restore gx6605s.dtb binary 0x92000000
-
-# flush cache
-set $cr17 = 0x33
-
-load
-
diff --git a/board/csky/gx6605s/gx6605s.dts b/board/csky/gx6605s/gx6605s.dts
deleted file mode 100644
index e4d46f59a0..0000000000
--- a/board/csky/gx6605s/gx6605s.dts
+++ /dev/null
@@ -1,155 +0,0 @@
-/dts-v1/;
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/input/input.h>
-
-/ {
-	model = "C-SKY gx6605s";
-	compatible = "csky,gx6605s";
-	#address-cells = <1>;
-	#size-cells = <1>;
-
-	memory {
-		device_type = "memory";
-		reg = <0x10000000 0x04000000>;
-	};
-
-	soc {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "simple-bus";
-		ranges;
-
-		dummy_apb: apb-clock {
-			compatible = "fixed-clock";
-			clock-frequency = <27000000>;
-			clock-output-names = "dummy_apb";
-			#clock-cells = <0>;
-		};
-
-		intc: interrupt-controller@500000 {
-			compatible = "csky,gx6605s-intc";
-			reg = <0x00500000 0x400>;
-			interrupt-controller;
-			#interrupt-cells = <1>;
-		};
-
-		timer@20a000 {
-			compatible = "csky,gx6605s-timer";
-			reg = <0x0020a000 0x400>;
-			clocks = <&dummy_apb>;
-			interrupts = <10>;
-			interrupt-parent = <&intc>;
-		};
-
-		ehci-hcd@900000 {
-			compatible = "generic-ehci";
-			reg = <0x00900000 0x400>;
-			interrupt-parent = <&intc>;
-			interrupts = <59>;
-		};
-
-		ohci-hcd0@a00000 {
-			compatible = "generic-ohci";
-			reg = <0x00a00000 0x400>;
-			interrupt-parent = <&intc>;
-			interrupts = <58>;
-		};
-
-		ohci-hcd1@b00000 {
-			compatible = "generic-ohci";
-			reg = <0x00b00000 0x400>;
-			interrupt-parent = <&intc>;
-			interrupts = <57>;
-		};
-
-		serial@403000 {
-			compatible = "ns16550a";
-			reg = <0x00403000 0x400>;
-			interrupt-parent = <&intc>;
-			interrupts = <15>;
-			clock-frequency = <29491200>;
-			baud = <115200>;
-			reg-shift = <2>;
-			reg-io-width = <1>;
-		};
-
-		gpio0: gpio@305000 {
-			compatible = "wd,mbl-gpio";
-			reg-names = "dirout", "dat", "set", "clr";
-			reg = <0x305000 4>, <0x305004 4>, <0x305008 4>, <0x30500c 4>;
-			bgpio-base = <0>;
-			#gpio-cells = <2>;
-			gpio-controller;
-		};
-
-		gpio_buttons {
-			compatible = "gpio-keys-polled";
-			#address-cells = <1>;
-			#size-cells = <0>;
-			poll-interval = <100>;
-			autorepeat;
-
-			button0 {
-				label = "button8";
-				linux,code = <KEY_LEFT>;
-				gpios = <&gpio0 8 GPIO_ACTIVE_LOW>;
-			};
-
-			button1 {
-				label = "button6";
-				linux,code = <KEY_RIGHT>;
-				gpios = <&gpio0 6 GPIO_ACTIVE_LOW>;
-			};
-
-			button2 {
-				label = "button5";
-				linux,code = <KEY_UP>;
-				gpios = <&gpio0 5 GPIO_ACTIVE_LOW>;
-			};
-
-			button3 {
-				label = "button9";
-				linux,code = <KEY_DOWN>;
-				gpios = <&gpio0 9 GPIO_ACTIVE_LOW>;
-			};
-
-			button4 {
-				label = "button7";
-				linux,code = <KEY_ENTER>;
-				gpios = <&gpio0 7 GPIO_ACTIVE_LOW>;
-			};
-		};
-
-		gpio_leds {
-			compatible = "gpio-leds";
-
-			led0 {
-				label = "led10";
-				gpios = <&gpio0 10 GPIO_ACTIVE_LOW>;
-				linux,default-trigger = "heartbeat";
-			};
-
-			led1 {
-				label = "led11";
-				gpios = <&gpio0 11 GPIO_ACTIVE_LOW>;
-				linux,default-trigger = "timer";
-			};
-
-			led2 {
-				label = "led12";
-				gpios = <&gpio0 12 GPIO_ACTIVE_LOW>;
-				linux,default-trigger = "default-on";
-			};
-
-			led3 {
-				label = "led13";
-				gpios = <&gpio0 13 GPIO_ACTIVE_LOW>;
-				linux,default-trigger = "default-on";
-			};
-		};
-	};
-
-	chosen {
-		bootargs = "console=ttyS0,115200 init=/sbin/init root=/dev/sda2 rw rootwait";
-	};
-};
diff --git a/board/csky/readme.txt b/board/csky/readme.txt
deleted file mode 100644
index dc82dcc1d7..0000000000
--- a/board/csky/readme.txt
+++ /dev/null
@@ -1,88 +0,0 @@
-C-SKY Development Kit
-
-Intro
-=====
-
-C-SKY is a CPU Architecture from www.c-sky.com and has it own instruction set.
-Just like arm and mips in linux/arch, it named as 'csky'.
-
-gx6605s develop board is made by Hangzhou Nationalchip and C-SKY.
-
-Hardware Spec:
-  * CPU: ck610 up to 594Mhz
-  * Integrate with 64MB ddr2 in SOC.
-  * Integrate with hardware Jtag.
-  * Integrate with usb-to-serial chip.
-  * USB ehci controller in SOC.
-  * Power Supply: DC 5V from two micro-usb.
-
-How to build it
-===============
-
-Configure Buildroot
--------------------
-
-The csky_gx6605s_defconfig configuration is a sample configuration with
-all that is required to bring the gx6605s Development Board:
-
-  $ make csky_gx6605s_defconfig
-
-Build everything
-----------------
-
-Note: you will need to have access to the network, since Buildroot will
-download the packages' sources.
-
-  $ make
-
-Result of the build
--------------------
-
-After building, you should obtain this tree:
-
-    output/images/
-    +-- vmlinux
-    +-- rootfs.ext2
-    +-- <board name>.dtb
-
-How to run it
-=============
-
-Prepare Jtag-Server
--------------------
-
-  Download the Jtag-Server here:
-
-  https://github.com/c-sky/tools/raw/master/DebugServerConsole-linux-x86_64-V4.2.00-20161213.tar.gz
-
-  Go to the unpacked directory:
-
-  $./DebugServerConsole -ddc -rstwait 1000 -prereset -port 1025
-
-  Perhaps you need to use "sudo", which need libusb to detect c510:b210
-
-  $ sudo ./DebugServerConsole -ddc -rstwait 1000 -prereset -port 1025
-
-Prepare USB drive
------------------
-
-  You sould determine which device associated to the usb drive
-  carefully. eg:
-
-  $ cat /proc/partitions
-   8       48    1971712 sdd
-   8       49     976720 sdd1
-
-  $ sudo dd if=rootfs.ext2 of=/dev/sdd1
-  $ sudo sync
-
-Run
----
-
-  Plug the usb drive on gx6605s dev board.
-
-  Setup the Console with the rate 115200/8-N-1.
-
-  $ cd output/images
-  $ ../host/bin/csky-linux-gdb -x ../../board/csky/gx6605s/gdbinit vmlinux
-
diff --git a/configs/csky_gx6605s_defconfig b/configs/csky_gx6605s_defconfig
deleted file mode 100644
index f1f9579dca..0000000000
--- a/configs/csky_gx6605s_defconfig
+++ /dev/null
@@ -1,19 +0,0 @@
-# Architecture
-BR2_csky=y
-BR2_ck610=y
-
-# System
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-
-# Linux headers same as kernel, a 5.0 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
-BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck610.config.fragment"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/csky/gx6605s/gx6605s.dts"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
