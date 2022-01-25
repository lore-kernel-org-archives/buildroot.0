Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD6EC433EF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 05:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9DA94160E;
	Tue, 25 Jan 2022 05:50:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8BDR_eBU90Fw; Tue, 25 Jan 2022 05:50:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46B4F415A4;
	Tue, 25 Jan 2022 05:50:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 023D01BF307
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 05:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDB514016C
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 05:50:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uXE1X7HsNx2O for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 05:50:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from ATCSQR.andestech.com (exmail.andestech.com [60.248.187.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C8905400FB
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 05:50:36 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 20P5oJkG084842
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 13:50:19 +0800 (GMT-8)
 (envelope-from peterlin@andestech.com)
Received: from atcfdc88.andestech.com (10.0.15.120) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0;
 Tue, 25 Jan 2022 13:50:16 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: <buildroot@buildroot.org>
Date: Tue, 25 Jan 2022 13:49:55 +0800
Message-ID: <20220125054956.27492-2-peterlin@andestech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220125054956.27492-1-peterlin@andestech.com>
References: <20220125054956.27492-1-peterlin@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 20P5oJkG084842
Subject: [Buildroot] [PATCH v2 2/3] board/andes/ae350: add support for Andes
 AE350
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
Cc: Yu Chien Peter Lin <peterlin@andestech.com>, alankao@andestech.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch provides defconfig and basic support for the Andes
45 series RISC-V architecture.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Signed-off-by: Alan Kao <alankao@andestech.com>
---
 board/andes/ae350/ae350.dts                   | 274 ++++++++++++++++++
 board/andes/ae350/boot.cmd                    |   3 +
 board/andes/ae350/genimage_sdcard.cfg         |  29 ++
 ...isable-PIC-explicitly-for-assembling.patch |  29 ++
 ...2-Enable-cache-for-opensbi-jump-mode.patch |  25 ++
 ...001-Fix-mmc-no-partition-table-error.patch |  27 ++
 ...2-Prevent-fw_dynamic-from-relocation.patch |  27 ++
 ...0003-Fix-u-boot-proper-booting-issue.patch |  26 ++
 ...04-Enable-printing-OpenSBI-boot-logo.patch |  25 ++
 board/andes/ae350/readme.txt                  |  63 ++++
 board/andes/ae350/uboot.config.fragment       |   5 +
 configs/andes_ae350_45_defconfig              |  40 +++
 12 files changed, 573 insertions(+)
 create mode 100755 board/andes/ae350/ae350.dts
 create mode 100644 board/andes/ae350/boot.cmd
 create mode 100644 board/andes/ae350/genimage_sdcard.cfg
 create mode 100644 board/andes/ae350/patches/opensbi/0001-Disable-PIC-explicitly-for-assembling.patch
 create mode 100644 board/andes/ae350/patches/opensbi/0002-Enable-cache-for-opensbi-jump-mode.patch
 create mode 100644 board/andes/ae350/patches/uboot/0001-Fix-mmc-no-partition-table-error.patch
 create mode 100644 board/andes/ae350/patches/uboot/0002-Prevent-fw_dynamic-from-relocation.patch
 create mode 100644 board/andes/ae350/patches/uboot/0003-Fix-u-boot-proper-booting-issue.patch
 create mode 100644 board/andes/ae350/patches/uboot/0004-Enable-printing-OpenSBI-boot-logo.patch
 create mode 100644 board/andes/ae350/readme.txt
 create mode 100644 board/andes/ae350/uboot.config.fragment
 create mode 100644 configs/andes_ae350_45_defconfig

diff --git a/board/andes/ae350/ae350.dts b/board/andes/ae350/ae350.dts
new file mode 100755
index 0000000000..5e5d70ab25
--- /dev/null
+++ b/board/andes/ae350/ae350.dts
@@ -0,0 +1,274 @@
+/dts-v1/;
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	compatible = "andestech,ae350";
+	model = "andestech,ax45";
+	aliases {
+		uart0 = &serial0;
+		spi0 = &spi;
+	};
+
+	chosen {
+		bootargs = "console=ttyS0,38400n8 earlycon=sbi debug loglevel=7";
+		stdout-path = "uart0:38400n8";
+	};
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <60000000>;
+		CPU0: cpu@0 {
+			device_type = "cpu";
+			reg = <0>;
+			status = "okay";
+			compatible = "riscv";
+			riscv,isa = "rv64i2p0m2p0a2p0f2p0d2p0c2p0xv5-1p1xdsp0p0";
+			riscv,priv-major = <1>;
+			riscv,priv-minor = <10>;
+			mmu-type = "riscv,sv48";
+			clock-frequency = <60000000>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <256>;
+			i-cache-block-size = <64>;
+			i-cache-line-size = <64>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <128>;
+			d-cache-block-size = <64>;
+			d-cache-line-size = <64>;
+			next-level-cache = <&L2>;
+			CPU0_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				interrupt-controller;
+				compatible = "riscv,cpu-intc";
+			};
+		};
+		CPU1: cpu@1 {
+			device_type = "cpu";
+			reg = <1>;
+			status = "okay";
+			compatible = "riscv";
+			riscv,isa = "rv64i2p0m2p0a2p0f2p0d2p0c2p0xv5-1p1xdsp0p0";
+			riscv,priv-major = <1>;
+			riscv,priv-minor = <10>;
+			mmu-type = "riscv,sv48";
+			clock-frequency = <60000000>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <256>;
+			i-cache-block-size = <64>;
+			i-cache-line-size = <64>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <128>;
+			d-cache-block-size = <64>;
+			d-cache-line-size = <64>;
+			next-level-cache = <&L2>;
+			CPU1_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				interrupt-controller;
+				compatible = "riscv,cpu-intc";
+			};
+		};
+		CPU2: cpu@2 {
+			device_type = "cpu";
+			reg = <2>;
+			status = "okay";
+			compatible = "riscv";
+			riscv,isa = "rv64i2p0m2p0a2p0f2p0d2p0c2p0xv5-1p1xdsp0p0";
+			riscv,priv-major = <1>;
+			riscv,priv-minor = <10>;
+			mmu-type = "riscv,sv48";
+			clock-frequency = <60000000>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <256>;
+			i-cache-block-size = <64>;
+			i-cache-line-size = <64>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <128>;
+			d-cache-block-size = <64>;
+			d-cache-line-size = <64>;
+			next-level-cache = <&L2>;
+			CPU2_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				interrupt-controller;
+				compatible = "riscv,cpu-intc";
+			};
+		};
+		CPU3: cpu@3 {
+			device_type = "cpu";
+			reg = <3>;
+			status = "okay";
+			compatible = "riscv";
+			riscv,isa = "rv64i2p0m2p0a2p0f2p0d2p0c2p0xv5-1p1xdsp0p0";
+			riscv,priv-major = <1>;
+			riscv,priv-minor = <10>;
+			mmu-type = "riscv,sv48";
+			clock-frequency = <60000000>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <256>;
+			i-cache-block-size = <64>;
+			i-cache-line-size = <64>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <128>;
+			d-cache-block-size = <64>;
+			d-cache-line-size = <64>;
+			next-level-cache = <&L2>;
+			CPU3_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				interrupt-controller;
+				compatible = "riscv,cpu-intc";
+			};
+		};
+	};
+	L2: l2-cache@e0500000 {
+		compatible = "cache";
+		cache-level = <2>;
+		cache-size = <0x80000>;
+		reg = <0x00000000 0xe0500000 0x00000000 0x00001000>;
+		andes,inst-prefetch = <3>;
+		andes,data-prefetch = <3>;
+		// The value format is <XRAMOCTL XRAMICTL>
+		andes,tag-ram-ctl = <0 0>;
+		andes,data-ram-ctl = <0 0>;
+	};
+	memory@0 {
+		reg = <0x00000000 0x00000000 0x00000000 0x80000000>;
+		device_type = "memory";
+	};
+	soc {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		compatible = "andestech,riscv-ae350-soc", "simple-bus";
+		ranges;
+		plic0: interrupt-controller@e4000000 {
+			compatible = "riscv,plic0";
+			reg = <0x00000000 0xe4000000 0x00000000 0x02000000>;
+			interrupts-extended = < &CPU0_intc 11 &CPU0_intc 9 &CPU1_intc 11 &CPU1_intc 9 &CPU2_intc 11 &CPU2_intc 9 &CPU3_intc 11 &CPU3_intc 9>;
+			interrupt-controller;
+			#address-cells = <2>;
+			#interrupt-cells = <2>;
+			riscv,ndev = <71>;
+		};
+		plic1: interrupt-controller@e6400000 {
+			compatible = "riscv,plic1";
+			reg = <0x00000000 0xe6400000 0x00000000 0x00400000>;
+			interrupts-extended = < &CPU0_intc 3 &CPU1_intc 3 &CPU2_intc 3 &CPU3_intc 3>;
+			interrupt-controller;
+			#address-cells = <2>;
+			#interrupt-cells = <2>;
+			riscv,ndev = <4>;
+		};
+		plmt0: plmt0@e6000000 {
+			compatible = "riscv,plmt0";
+			reg = <0x00000000 0xe6000000 0x00000000 0x00100000>;
+			interrupts-extended = < &CPU0_intc 7 &CPU1_intc 7 &CPU2_intc 7 &CPU3_intc 7>;
+		};
+		spiclk: virt_100mhz {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <100000000>;
+		};
+		timer0: timer@f0400000 {
+			compatible = "andestech,atcpit100";
+			reg = <0x00000000 0xf0400000 0x00000000 0x00001000>;
+			interrupts = <3 4>;
+			interrupt-parent = <&plic0>;
+			clock-frequency = <60000000>;
+		};
+		pwm: pwm@f0400000 {
+			compatible = "andestech,atcpit100-pwm";
+			reg = <0x00000000 0xf0400000 0x00000000 0x00001000>;
+			interrupts = <3 4>;
+			interrupt-parent = <&plic0>;
+			clock-frequency = <60000000>;
+			pwm-cells = <2>;
+		};
+		wdt: wdt@f0500000 {
+			compatible = "andestech,atcwdt200";
+			reg = <0x00000000 0xf0500000 0x00000000 0x00001000>;
+			interrupts = <3 4>;
+			interrupt-parent = <&plic0>;
+			clock-frequency = <15000000>;
+		};
+		serial0: serial@f0300000 {
+			compatible = "andestech,uart16550", "ns16550a";
+			reg = <0x00000000 0xf0300000 0x00000000 0x00001000>;
+			interrupts = <9 4>;
+			interrupt-parent = <&plic0>;
+			clock-frequency = <19660800>;
+			reg-shift = <2>;
+			reg-offset = <32>;
+			no-loopback-test = <1>;
+		};
+		rtc0: rtc@f0600000 {
+			compatible = "andestech,atcrtc100";
+			reg = <0x00000000 0xf0600000 0x00000000 0x00001000>;
+			interrupts = <1 4 2 4>;
+			interrupt-parent = <&plic0>;
+			wakeup-source;
+		};
+		gpio: gpio@f0700000 {
+			compatible = "andestech,atcgpio100";
+			reg = <0x00000000 0xf0700000 0x00000000 0x00001000>;
+			interrupts = <7 4>;
+			interrupt-parent = <&plic0>;
+			wakeup-source;
+		};
+		mac0: mac@e0100000 {
+			compatible = "andestech,atmac100";
+			reg = <0x00000000 0xe0100000 0x00000000 0x00001000>;
+			interrupts = <19 4>;
+			interrupt-parent = <&plic0>;
+			dma-coherent;
+		};
+		smu: smu@f0100000 {
+			compatible = "andestech,atcsmu";
+			reg = <0x00000000 0xf0100000 0x00000000 0x00001000>;
+		};
+		mmc0: mmc@f0e00000 {
+			compatible = "andestech,atfsdc010";
+			reg = <0x00000000 0xf0e00000 0x00000000 0x00001000>;
+			interrupts = <18 4>;
+			interrupt-parent = <&plic0>;
+			clock-freq-min-max = <400000 100000000>;
+			max-frequency = <100000000>;
+			fifo-depth = <16>;
+			cap-sd-highspeed;
+			dma-coherent;
+		};
+		dma0: dma@f0c00000 {
+			compatible = "andestech,atcdmac300";
+			reg = <0x00000000 0xf0c00000 0x00000000 0x00001000>;
+			interrupts = <10 4 64 4 65 4 66 4 67 4 68 4 69 4 70 4 71 4>;
+			interrupt-parent = <&plic0>;
+			dma-channels = <8>;
+		};
+		lcd0: lcd@e0200000 {
+			compatible = "andestech,atflcdc100";
+			reg = <0x00000000 0xe0200000 0x00000000 0x00001000>;
+			interrupts = <20 4>;
+			interrupt-parent = <&plic0>;
+			dma-coherent;
+		};
+		pmu: pmu {
+			compatible = "riscv,andes-pmu";
+			device_type = "pmu";
+		};
+		spi: spi@f0b00000 {
+			compatible = "andestech,atcspi200";
+			reg = <0x00000000 0xf0b00000 0x00000000 0x00001000>;
+			interrupts = <4 4>;
+			interrupt-parent = <&plic0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			num-cs = <1>;
+			clocks = <&spiclk>;
+			flash@0 {
+				compatible = "jedec,spi-nor";
+				reg = <0x00000000>;
+				spi-max-frequency = <50000000>;
+				spi-cpol;
+				spi-cpha;
+			};
+		};
+	};
+};
diff --git a/board/andes/ae350/boot.cmd b/board/andes/ae350/boot.cmd
new file mode 100644
index 0000000000..2a046c6c7a
--- /dev/null
+++ b/board/andes/ae350/boot.cmd
@@ -0,0 +1,3 @@
+setenv bootargs earlycon=sbi root=/dev/mmcblk0p2 rootwait
+load mmc 0:1 0x600000 Image
+booti 0x600000 - $fdtcontroladdr
diff --git a/board/andes/ae350/genimage_sdcard.cfg b/board/andes/ae350/genimage_sdcard.cfg
new file mode 100644
index 0000000000..e8bb3d4903
--- /dev/null
+++ b/board/andes/ae350/genimage_sdcard.cfg
@@ -0,0 +1,29 @@
+image boot.vfat {
+  vfat {
+    files = {
+      "Image",
+      "boot.scr",
+      "u-boot-spl.bin",
+      "u-boot.itb",
+      "ae350.dtb",
+    }
+  }
+  size = 128M
+}
+
+image sdcard.img {
+  hdimage {
+    gpt = true
+  }
+
+  partition u-boot {
+    partition-type-uuid = ebd0a0a2-b9e5-4433-87c0-68b6b72699c7
+    bootable = "true"
+    image = "boot.vfat"
+  }
+
+  partition rootfs {
+    partition-type-uuid = 0fc63daf-8483-4772-8e79-3d69d8477de4
+    image = "rootfs.ext4"
+  }
+}
diff --git a/board/andes/ae350/patches/opensbi/0001-Disable-PIC-explicitly-for-assembling.patch b/board/andes/ae350/patches/opensbi/0001-Disable-PIC-explicitly-for-assembling.patch
new file mode 100644
index 0000000000..aeafed4c9f
--- /dev/null
+++ b/board/andes/ae350/patches/opensbi/0001-Disable-PIC-explicitly-for-assembling.patch
@@ -0,0 +1,29 @@
+From 3ccb71eeca42dbcd5e4d00ae1877a489ae82598d Mon Sep 17 00:00:00 2001
+From: Yu Chien Peter Lin <peterlin@andestech.com>
+Date: Wed, 29 Dec 2021 16:04:54 +0800
+Subject: [PATCH] Disable PIC explicitly for assembling
+
+This patch is necessary if the fw_dynamic load address
+is not equal to link address.
+However, they are equal currently, since we include an u-boot
+patch for preventing fw_dynamic relocation.
+
+Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
+---
+ Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile b/Makefile
+index d6f097d..441518d 100644
+--- a/Makefile
++++ b/Makefile
+@@ -225,6 +225,7 @@ ASFLAGS		+=	-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
+ ASFLAGS		+=	$(GENFLAGS)
+ ASFLAGS		+=	$(platform-asflags-y)
+ ASFLAGS		+=	$(firmware-asflags-y)
++ASFLAGS		+=	-fno-pic
+
+ ARFLAGS		=	rcs
+
+--
+2.25.1
diff --git a/board/andes/ae350/patches/opensbi/0002-Enable-cache-for-opensbi-jump-mode.patch b/board/andes/ae350/patches/opensbi/0002-Enable-cache-for-opensbi-jump-mode.patch
new file mode 100644
index 0000000000..ae48a760c8
--- /dev/null
+++ b/board/andes/ae350/patches/opensbi/0002-Enable-cache-for-opensbi-jump-mode.patch
@@ -0,0 +1,25 @@
+From 325328f4204b40b1fcc8db3b46c7c8805710d21c Mon Sep 17 00:00:00 2001
+From: Yu Chien Peter Lin <peterlin@andestech.com>
+Date: Thu, 30 Dec 2021 08:47:34 +0800
+Subject: [PATCH] Enable cache for opensbi jump mode
+
+Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
+---
+ firmware/fw_base.S | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/firmware/fw_base.S b/firmware/fw_base.S
+index ab33e11..155d230 100644
+--- a/firmware/fw_base.S
++++ b/firmware/fw_base.S
+@@ -46,6 +46,8 @@
+	.globl _start
+	.globl _start_warm
+ _start:
++	li t0, 0x80003
++	csrw  0x7ca, t0
+	/* Find preferred boot HART id */
+	MOV_3R	s0, a0, s1, a1, s2, a2
+	call	fw_boot_hart
+--
+2.25.1
diff --git a/board/andes/ae350/patches/uboot/0001-Fix-mmc-no-partition-table-error.patch b/board/andes/ae350/patches/uboot/0001-Fix-mmc-no-partition-table-error.patch
new file mode 100644
index 0000000000..7aff3cebf6
--- /dev/null
+++ b/board/andes/ae350/patches/uboot/0001-Fix-mmc-no-partition-table-error.patch
@@ -0,0 +1,27 @@
+From ea4675215b53d16a72d29b8a6fc6a86cccf59cf0 Mon Sep 17 00:00:00 2001
+From: Yu Chien Peter Lin <peterlin@andestech.com>
+Date: Wed, 5 Jan 2022 11:00:59 +0800
+Subject: [PATCH] Fix mmc no partition table error
+
+Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
+---
+ drivers/mmc/ftsdc010_mci.c | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/drivers/mmc/ftsdc010_mci.c b/drivers/mmc/ftsdc010_mci.c
+index 570d54cf..3b1e0aa0 100644
+--- a/drivers/mmc/ftsdc010_mci.c
++++ b/drivers/mmc/ftsdc010_mci.c
+@@ -438,10 +438,6 @@ static int ftsdc010_mmc_probe(struct udevice *dev)
+		return ret;
+ #endif
+
+-	if (dev_read_bool(dev, "cap-mmc-highspeed") || \
+-		  dev_read_bool(dev, "cap-sd-highspeed"))
+-		chip->caps |= MMC_MODE_HS | MMC_MODE_HS_52MHz;
+-
+	ftsdc_setup_cfg(&plat->cfg, dev->name, chip->buswidth, chip->caps,
+			priv->minmax[1] , priv->minmax[0]);
+	chip->mmc = &plat->mmc;
+--
+2.25.1
diff --git a/board/andes/ae350/patches/uboot/0002-Prevent-fw_dynamic-from-relocation.patch b/board/andes/ae350/patches/uboot/0002-Prevent-fw_dynamic-from-relocation.patch
new file mode 100644
index 0000000000..c6e1896f1c
--- /dev/null
+++ b/board/andes/ae350/patches/uboot/0002-Prevent-fw_dynamic-from-relocation.patch
@@ -0,0 +1,27 @@
+From 4c0c5378d032f2f95577585935624baf7b4decf3 Mon Sep 17 00:00:00 2001
+From: Yu Chien Peter Lin <peterlin@andestech.com>
+Date: Wed, 5 Jan 2022 11:02:26 +0800
+Subject: [PATCH] Prevent fw_dynamic from relocation
+
+This patch prevents OpenSBI relocation, load fw_dynamic to link address
+
+Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
+---
+ board/AndesTech/ax25-ae350/Kconfig | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/board/AndesTech/ax25-ae350/Kconfig b/board/AndesTech/ax25-ae350/Kconfig
+index e50f505a..385c4c11 100644
+--- a/board/AndesTech/ax25-ae350/Kconfig
++++ b/board/AndesTech/ax25-ae350/Kconfig
+@@ -25,7 +25,7 @@ config SPL_TEXT_BASE
+	default 0x800000
+
+ config SPL_OPENSBI_LOAD_ADDR
+-	default 0x01000000
++	default 0x0
+
+ config BOARD_SPECIFIC_OPTIONS # dummy
+	def_bool y
+--
+2.25.1
diff --git a/board/andes/ae350/patches/uboot/0003-Fix-u-boot-proper-booting-issue.patch b/board/andes/ae350/patches/uboot/0003-Fix-u-boot-proper-booting-issue.patch
new file mode 100644
index 0000000000..20598fdba4
--- /dev/null
+++ b/board/andes/ae350/patches/uboot/0003-Fix-u-boot-proper-booting-issue.patch
@@ -0,0 +1,26 @@
+From 3d09501175ae6f5e3f6520b48b1358226a99ff16 Mon Sep 17 00:00:00 2001
+From: Yu Chien Peter Lin <peterlin@andestech.com>
+Date: Wed, 5 Jan 2022 18:17:39 +0800
+Subject: [PATCH] Fix u-boot proper booting issue
+
+Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
+---
+ arch/riscv/cpu/start.S | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/arch/riscv/cpu/start.S b/arch/riscv/cpu/start.S
+index 76850ec9..2ccda4f5 100644
+--- a/arch/riscv/cpu/start.S
++++ b/arch/riscv/cpu/start.S
+@@ -139,7 +139,9 @@ call_harts_early_init:
+	 * accesses gd).
+	 */
+	mv	gp, s0
++#if !CONFIG_IS_ENABLED(RISCV_SMODE)
+	bnez	tp, secondary_hart_loop
++#endif
+ #endif
+
+	jal	board_init_f_init_reserve
+--
+2.25.1
diff --git a/board/andes/ae350/patches/uboot/0004-Enable-printing-OpenSBI-boot-logo.patch b/board/andes/ae350/patches/uboot/0004-Enable-printing-OpenSBI-boot-logo.patch
new file mode 100644
index 0000000000..efd78ab26d
--- /dev/null
+++ b/board/andes/ae350/patches/uboot/0004-Enable-printing-OpenSBI-boot-logo.patch
@@ -0,0 +1,25 @@
+From 3847a959ac4c07facbd80104ca5fa6a91fad5f35 Mon Sep 17 00:00:00 2001
+From: Yu Chien Peter Lin <peterlin@andestech.com>
+Date: Thu, 6 Jan 2022 13:50:07 +0800
+Subject: [PATCH] Enable printing OpenSBI boot logo
+
+Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
+---
+ include/opensbi.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/opensbi.h b/include/opensbi.h
+index d812cc8c..91fb8fd9 100644
+--- a/include/opensbi.h
++++ b/include/opensbi.h
+@@ -20,7 +20,7 @@
+
+ enum sbi_scratch_options {
+	/** Disable prints during boot */
+-	SBI_SCRATCH_NO_BOOT_PRINTS = (1 << 0),
++	SBI_SCRATCH_NO_BOOT_PRINTS = 0,
+ };
+
+ /** Representation dynamic info passed by previous booting stage */
+--
+2.25.1
diff --git a/board/andes/ae350/readme.txt b/board/andes/ae350/readme.txt
new file mode 100644
index 0000000000..a104bb108e
--- /dev/null
+++ b/board/andes/ae350/readme.txt
@@ -0,0 +1,63 @@
+Intro
+=====
+
+Andestech AE350 Platform
+
+The AE350 prototype demonstrates the AE350 platform on the FPGA.
+
+How to build it
+===============
+
+Configure Buildroot
+-------------------
+
+  $ make andes_ae350_45_defconfig
+
+If you want to customize your configuration:
+
+  $ make menuconfig
+
+Build everything
+----------------
+Note: you will need to access to the network, since Buildroot will
+download the packages' sources.
+
+  $ make
+
+Result of the build
+-------------------
+
+After building, you should obtain the following files:
+
+  output/images/
+  |-- Image
+  |-- ae350.dtb
+  |-- boot.scr
+  |-- boot.vfat
+  |-- fw_dynamic.bin
+  |-- fw_dynamic.elf
+  |-- fw_jump.bin
+  |-- fw_jump.elf
+  |-- rootfs.ext2
+  |-- rootfs.ext4 -> rootfs.ext2
+  |-- sdcard.img
+  |-- u-boot-spl.bin
+  `-- u-boot.itb
+
+Copy the sdcard.img to a SD card with "dd":
+
+  $ sudo dd if=sdcard.img of=/dev/sdX bs=4096
+
+Your SD card partition should be:
+
+  Disk /dev/mmcblk0: 31457280 sectors, 3072M
+  Logical sector size: 512
+  Disk identifier (GUID): 546663ee-d2f1-427f-93a5-5c7b69dd801c
+  Partition table holds up to 128 entries
+  First usable sector is 34, last usable sector is 385062
+
+  Number  Start (sector)    End (sector)  Size Name
+       1              34          262177  128M u-boot
+       2          262178          385057 60.0M rootfs
+
+Insert SD card and reset the board, should boot Linux from mmc.
diff --git a/board/andes/ae350/uboot.config.fragment b/board/andes/ae350/uboot.config.fragment
new file mode 100644
index 0000000000..4992d712a5
--- /dev/null
+++ b/board/andes/ae350/uboot.config.fragment
@@ -0,0 +1,5 @@
+CONFIG_SPL_FS_FAT=y
+CONFIG_SPL_MMC=y
+# CONFIG_SPL_RAM_SUPPORT is not set
+# CONFIG_OF_BOARD is not set
+CONFIG_OF_SEPARATE=y
diff --git a/configs/andes_ae350_45_defconfig b/configs/andes_ae350_45_defconfig
new file mode 100644
index 0000000000..b8f91e50b3
--- /dev/null
+++ b/configs/andes_ae350_45_defconfig
@@ -0,0 +1,40 @@
+BR2_riscv=y
+BR2_riscv_custom=y
+BR2_RISCV_ISA_CUSTOM_RVM=y
+BR2_RISCV_ISA_CUSTOM_RVF=y
+BR2_RISCV_ISA_CUSTOM_RVD=y
+BR2_RISCV_ISA_CUSTOM_RVC=y
+BR2_GLOBAL_PATCH_DIR="board/andes/ae350/patches"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/andes/ae350/genimage_sdcard.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,andestech,linux,591f3f73757ab80b46e7e1e10067ce3c82ff83a9)/linux-591f3f73757ab80b46e7e1e10067ce3c82ff83a9.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="ae350_rv64_smp"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/andes/ae350/ae350.dts"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_OPENSBI=y
+BR2_TARGET_OPENSBI_PLAT="andes/ae350"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ae350_rv64_spl_xip"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/andes/ae350/uboot.config.fragment"
+BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="ARCH_FLAGS=-march=rv64imafdc"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/andes/ae350/boot.cmd"
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
