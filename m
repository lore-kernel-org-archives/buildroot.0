Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEAEC433EF
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 04:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0681405CE;
	Tue, 11 Jan 2022 04:17:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hWWF5kZYnDs5; Tue, 11 Jan 2022 04:17:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC7074064B;
	Tue, 11 Jan 2022 04:17:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2E2351BF3A1
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 04:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12F37405D0
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 04:17:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nRDZfEHWqvmO for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 04:17:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from ATCSQR.andestech.com (exmail.andestech.com [60.248.187.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EDFD640577
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 04:17:39 +0000 (UTC)
Received: from ATCSQR.andestech.com (localhost [127.0.0.2] (may be forged))
 by ATCSQR.andestech.com with ESMTP id 20B3xrlt080114
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 11:59:53 +0800 (GMT-8)
 (envelope-from peterlin@andestech.com)
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 20B3xDge080044
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 11:59:13 +0800 (GMT-8)
 (envelope-from peterlin@andestech.com)
Received: from atcfdc88.andestech.com (10.0.15.120) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0;
 Tue, 11 Jan 2022 11:59:12 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: <buildroot@buildroot.org>
Date: Tue, 11 Jan 2022 11:58:59 +0800
Message-ID: <20220111035859.12895-2-peterlin@andestech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220111035859.12895-1-peterlin@andestech.com>
References: <20220111035859.12895-1-peterlin@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 20B3xrlt080114
Subject: [Buildroot] [PATCH 2/2] board/andes/ae350: add support for Andes
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
Cc: Yu Chien Peter Lin <peterlin@andestech.com>,
 Alan Kao <alankao@andestech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch provides defconfig and basic support for the Andes
45 series RISC-V architecture.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Signed-off-by: Alan Kao <alankao@andestech.com>
---
 DEVELOPERS                                    |    3 +-
 board/andes/ae350/ae350.dts                   |  274 ++
 board/andes/ae350/boot.cmd                    |    3 +
 board/andes/ae350/genimage_sdcard.cfg         |   29 +
 board/andes/ae350/linux.config.fragment       |    2 +
 .../0001-Add-AE350-platform-defconfig.patch   |  158 +
 ...002-Andes-support-for-Faraday-ATCMAC.patch |  510 +++
 .../0003-Andes-support-for-ATCDMAC.patch      | 3301 +++++++++++++++++
 .../linux/0004-Andes-support-for-FTSDC.patch  | 1884 ++++++++++
 ...5-Non-cacheability-and-Cache-support.patch | 1132 ++++++
 ...-Add-andes-sbi-call-vendor-extension.patch |  231 ++
 ...e-update-function-local_flush_tlb_al.patch |  101 +
 ...rt-time32-stat64-sys_clone3-syscalls.patch |   47 +
 .../0009-dma-Support-smp-up-with-dma.patch    |  120 +
 ...ix-atcdmac300-chained-irq-mapping-is.patch |  300 ++
 .../linux/0011-DMA-Add-msb-bit-patch.patch    |  387 ++
 .../0012-Remove-unused-Andes-SBI-call.patch   |  147 +
 ...isable-PIC-explicitly-for-assembling.patch |   29 +
 ...2-Enable-cache-for-opensbi-jump-mode.patch |   25 +
 ...001-Fix-mmc-no-partition-table-error.patch |   27 +
 ...2-Prevent-fw_dynamic-from-relocation.patch |   27 +
 ...0003-Fix-u-boot-proper-booting-issue.patch |   26 +
 ...04-Enable-printing-OpenSBI-boot-logo.patch |   25 +
 board/andes/ae350/readme.txt                  |   66 +
 board/andes/ae350/uboot.config.fragment       |    5 +
 configs/ae350_andestar45_defconfig            |   46 +
 26 files changed, 8904 insertions(+), 1 deletion(-)
 create mode 100755 board/andes/ae350/ae350.dts
 create mode 100644 board/andes/ae350/boot.cmd
 create mode 100644 board/andes/ae350/genimage_sdcard.cfg
 create mode 100644 board/andes/ae350/linux.config.fragment
 create mode 100644 board/andes/ae350/patches/linux/0001-Add-AE350-platform-defconfig.patch
 create mode 100644 board/andes/ae350/patches/linux/0002-Andes-support-for-Faraday-ATCMAC.patch
 create mode 100644 board/andes/ae350/patches/linux/0003-Andes-support-for-ATCDMAC.patch
 create mode 100644 board/andes/ae350/patches/linux/0004-Andes-support-for-FTSDC.patch
 create mode 100644 board/andes/ae350/patches/linux/0005-Non-cacheability-and-Cache-support.patch
 create mode 100644 board/andes/ae350/patches/linux/0006-Add-andes-sbi-call-vendor-extension.patch
 create mode 100644 board/andes/ae350/patches/linux/0007-riscv-Porting-pte-update-function-local_flush_tlb_al.patch
 create mode 100644 board/andes/ae350/patches/linux/0008-Support-time32-stat64-sys_clone3-syscalls.patch
 create mode 100644 board/andes/ae350/patches/linux/0009-dma-Support-smp-up-with-dma.patch
 create mode 100644 board/andes/ae350/patches/linux/0010-riscv-platform-Fix-atcdmac300-chained-irq-mapping-is.patch
 create mode 100644 board/andes/ae350/patches/linux/0011-DMA-Add-msb-bit-patch.patch
 create mode 100644 board/andes/ae350/patches/linux/0012-Remove-unused-Andes-SBI-call.patch
 create mode 100644 board/andes/ae350/patches/opensbi/0001-Disable-PIC-explicitly-for-assembling.patch
 create mode 100644 board/andes/ae350/patches/opensbi/0002-Enable-cache-for-opensbi-jump-mode.patch
 create mode 100644 board/andes/ae350/patches/uboot/0001-Fix-mmc-no-partition-table-error.patch
 create mode 100644 board/andes/ae350/patches/uboot/0002-Prevent-fw_dynamic-from-relocation.patch
 create mode 100644 board/andes/ae350/patches/uboot/0003-Fix-u-boot-proper-booting-issue.patch
 create mode 100644 board/andes/ae350/patches/uboot/0004-Enable-printing-OpenSBI-boot-logo.patch
 create mode 100644 board/andes/ae350/readme.txt
 create mode 100644 board/andes/ae350/uboot.config.fragment
 create mode 100644 configs/ae350_andestar45_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 12777e8d61..18b0444c72 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2122,10 +2122,11 @@ N:	Norbert Lange <nolange79@gmail.com>
 F:	package/systemd/
 F:	package/tcf-agent/
 
-N:	Nylon Chen <nylon7@andestech.com>
+N:	Yu Chien Peter Lin <peterlin@andestech.com>
 F:	arch/Config.in.nds32
 F:	board/andes
 F:	configs/andes_ae3xx_defconfig
+F:	configs/ae350_andestar45_defconfig
 F:	toolchain/toolchain-external/toolchain-external-andes-nds32/
 
 N:	Olaf Rempel <razzor@kopf-tisch.de>
diff --git a/board/andes/ae350/ae350.dts b/board/andes/ae350/ae350.dts
new file mode 100755
index 0000000000..fe64234eef
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
+		dma-coherent;
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
+		dma-coherent;
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
+		dma-coherent;
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
diff --git a/board/andes/ae350/linux.config.fragment b/board/andes/ae350/linux.config.fragment
new file mode 100644
index 0000000000..299b75d2f4
--- /dev/null
+++ b/board/andes/ae350/linux.config.fragment
@@ -0,0 +1,2 @@
+CONFIG_INITRAMFS_SOURCE=""
+CONFIG_EFI_PARTITION=y
diff --git a/board/andes/ae350/patches/linux/0001-Add-AE350-platform-defconfig.patch b/board/andes/ae350/patches/linux/0001-Add-AE350-platform-defconfig.patch
new file mode 100644
index 0000000000..1384369972
--- /dev/null
+++ b/board/andes/ae350/patches/linux/0001-Add-AE350-platform-defconfig.patch
@@ -0,0 +1,158 @@
+From 8a9097c1be79fdab3d907a8bbc66a222807cb81a Mon Sep 17 00:00:00 2001
+From: Yu Chien Peter Lin <peterlin@andestech.com>
+Date: Tue, 28 Dec 2021 09:05:34 +0800
+Subject: [PATCH 01/12] Add AE350 platform defconfig
+
+Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
+---
+ arch/riscv/configs/ae350_rv64_smp_defconfig | 138 ++++++++++++++++++++
+ 1 file changed, 138 insertions(+)
+ create mode 100755 arch/riscv/configs/ae350_rv64_smp_defconfig
+
+diff --git a/arch/riscv/configs/ae350_rv64_smp_defconfig b/arch/riscv/configs/ae350_rv64_smp_defconfig
+new file mode 100755
+index 000000000000..8c6b84b2b9fe
+--- /dev/null
++++ b/arch/riscv/configs/ae350_rv64_smp_defconfig
+@@ -0,0 +1,138 @@
++CONFIG_SMP=y
++CONFIG_NR_CPUS=4
++CONFIG_ANDES_PMU=y
++CONFIG_PREEMPT=y
++CONFIG_HZ_100=y
++CONFIG_CROSS_COMPILE="riscv64-linux-"
++CONFIG_DEFAULT_HOSTNAME="andes-test"
++# CONFIG_SWAP is not set
++CONFIG_SYSVIPC=y
++CONFIG_POSIX_MQUEUE=y
++CONFIG_HIGH_RES_TIMERS=y
++CONFIG_BSD_PROCESS_ACCT=y
++CONFIG_BSD_PROCESS_ACCT_V3=y
++CONFIG_IKCONFIG=y
++CONFIG_IKCONFIG_PROC=y
++CONFIG_LOG_BUF_SHIFT=14
++CONFIG_CGROUPS=y
++CONFIG_CGROUP_SCHED=y
++CONFIG_CFS_BANDWIDTH=y
++CONFIG_CGROUP_CPUACCT=y
++CONFIG_NAMESPACES=y
++CONFIG_USER_NS=y
++CONFIG_BLK_DEV_INITRD=y
++CONFIG_INITRAMFS_SOURCE="rootfs-lite initramfs.txt.lite"
++# CONFIG_RD_BZIP2 is not set
++# CONFIG_RD_LZMA is not set
++# CONFIG_RD_XZ is not set
++# CONFIG_RD_LZO is not set
++# CONFIG_RD_LZ4 is not set
++CONFIG_INITRAMFS_COMPRESSION_GZIP=y
++CONFIG_SYSCTL_SYSCALL=y
++CONFIG_CHECKPOINT_RESTORE=y
++CONFIG_KALLSYMS_ALL=y
++CONFIG_EMBEDDED=y
++CONFIG_PROFILING=y
++CONFIG_MODULES=y
++CONFIG_MODULE_UNLOAD=y
++# CONFIG_BLK_DEV_BSG is not set
++CONFIG_PARTITION_ADVANCED=y
++# CONFIG_EFI_PARTITION is not set
++# CONFIG_IOSCHED_DEADLINE is not set
++CONFIG_NET=y
++CONFIG_PACKET=y
++CONFIG_UNIX=y
++CONFIG_NET_KEY=y
++CONFIG_INET=y
++# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
++# CONFIG_INET_XFRM_MODE_TUNNEL is not set
++# CONFIG_INET_XFRM_MODE_BEET is not set
++# CONFIG_INET_DIAG is not set
++# CONFIG_WIRELESS is not set
++CONFIG_DEVTMPFS=y
++CONFIG_DEVTMPFS_MOUNT=y
++CONFIG_BLK_DEV_LOOP=y
++CONFIG_NETDEVICES=y
++CONFIG_TUN=y
++CONFIG_FTMAC100=y
++# CONFIG_WLAN is not set
++CONFIG_INPUT_EVDEV=y
++# CONFIG_INPUT_KEYBOARD is not set
++# CONFIG_INPUT_MOUSE is not set
++CONFIG_INPUT_TOUCHSCREEN=y
++CONFIG_DEVKMEM=y
++CONFIG_SERIAL_8250=y
++# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
++CONFIG_SERIAL_8250_CONSOLE=y
++CONFIG_SERIAL_OF_PLATFORM=y
++# CONFIG_HW_RANDOM is not set
++CONFIG_GPIOLIB=y
++CONFIG_DEBUG_GPIO=y
++CONFIG_GPIO_SYSFS=y
++CONFIG_GPIO_ATCGPIO100=y
++# CONFIG_HWMON is not set
++CONFIG_I2C=y
++CONFIG_I2C_CHARDEV=y
++CONFIG_I2C_ATCIIC100=y
++CONFIG_FB=y
++CONFIG_FB_FTLCDC100=y
++CONFIG_DUMMY_CONSOLE_COLUMNS=40
++CONFIG_DUMMY_CONSOLE_ROWS=30
++CONFIG_FRAMEBUFFER_CONSOLE=y
++CONFIG_LOGO=y
++CONFIG_SOUND=y
++CONFIG_SND=y
++CONFIG_SND_OSSEMUL=y
++CONFIG_SND_PCM_OSS=y
++CONFIG_SND_FTSSP010=y
++# CONFIG_USB_SUPPORT is not set
++CONFIG_MMC=y
++CONFIG_MMC_FTSDC=y
++# CONFIG_IOMMU_SUPPORT is not set
++CONFIG_GENERIC_PHY=y
++CONFIG_EXT2_FS=y
++CONFIG_EXT4_FS=y
++CONFIG_EXT4_FS_POSIX_ACL=y
++CONFIG_EXT4_FS_SECURITY=y
++CONFIG_EXT4_ENCRYPTION=y
++CONFIG_FANOTIFY=y
++CONFIG_MSDOS_FS=y
++CONFIG_VFAT_FS=y
++CONFIG_TMPFS=y
++CONFIG_TMPFS_POSIX_ACL=y
++CONFIG_CONFIGFS_FS=y
++# CONFIG_MISC_FILESYSTEMS is not set
++CONFIG_NFS_FS=y
++CONFIG_NFS_V3_ACL=y
++CONFIG_NFS_V4=y
++CONFIG_NFS_V4_1=y
++CONFIG_NFS_V4_2=y
++CONFIG_NFS_USE_LEGACY_DNS=y
++CONFIG_NLS_CODEPAGE_437=y
++CONFIG_NLS_ISO8859_1=y
++CONFIG_DEBUG_INFO=y
++CONFIG_DEBUG_INFO_DWARF4=y
++CONFIG_GDB_SCRIPTS=y
++CONFIG_READABLE_ASM=y
++CONFIG_DEBUG_FS=y
++CONFIG_HEADERS_CHECK=y
++CONFIG_DEBUG_SECTION_MISMATCH=y
++CONFIG_PANIC_ON_OOPS=y
++# CONFIG_DEBUG_PREEMPT is not set
++CONFIG_STACKTRACE=y
++CONFIG_RCU_CPU_STALL_TIMEOUT=300
++# CONFIG_FTRACE is not set
++CONFIG_CRYPTO_ECHAINIV=y
++# CONFIG_CRYPTO_HW is not set
++CONFIG_SOC_SIFIVE=y
++CONFIG_SERIAL_SIFIVE=y
++CONFIG_SERIAL_SIFIVE_CONSOLE=y
++CONFIG_CLK_SIFIVE=y
++CONFIG_CLK_ANALOGBITS_WRPLL_CLN28HPC=y
++CONFIG_CLK_SIFIVE_FU540_PRCI=y
++CONFIG_SIFIVE_PLIC=y
++CONFIG_PRINTK_TIME=y
++CONFIG_RISCV_BASE_PMU=n
++CONFIG_PERF_EVENTS=n
++CONFIG_MODULES_TREE_LOOKUP=n
++CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
+\ No newline at end of file
+--
+2.25.1
diff --git a/board/andes/ae350/patches/linux/0002-Andes-support-for-Faraday-ATCMAC.patch b/board/andes/ae350/patches/linux/0002-Andes-support-for-Faraday-ATCMAC.patch
new file mode 100644
index 0000000000..772700ba55
--- /dev/null
+++ b/board/andes/ae350/patches/linux/0002-Andes-support-for-Faraday-ATCMAC.patch
@@ -0,0 +1,510 @@
+From 1966040a640c5629cd8a437111072e092caad205 Mon Sep 17 00:00:00 2001
+From: Yu Chien Peter Lin <peterlin@andestech.com>
+Date: Tue, 28 Dec 2021 09:06:19 +0800
+Subject: [PATCH 02/12] Andes support for Faraday ATCMAC
+
+Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
+---
+ drivers/net/ethernet/faraday/Kconfig    |  13 +-
+ drivers/net/ethernet/faraday/ftmac100.c | 154 ++++++++++++++----------
+ drivers/net/ethernet/faraday/ftmac100.h |  28 ++++-
+ 3 files changed, 121 insertions(+), 74 deletions(-)
+
+diff --git a/drivers/net/ethernet/faraday/Kconfig b/drivers/net/ethernet/faraday/Kconfig
+index 3d1e9a302148..d3ed03cc984d 100644
+--- a/drivers/net/ethernet/faraday/Kconfig
++++ b/drivers/net/ethernet/faraday/Kconfig
+@@ -6,7 +6,7 @@
+ config NET_VENDOR_FARADAY
+	bool "Faraday devices"
+	default y
+-	depends on ARM || NDS32 || COMPILE_TEST
++	depends on ARM || RISCV || COMPILE_TEST
+	help
+	  If you have a network (Ethernet) card belonging to this class, say Y.
+
+@@ -19,24 +19,21 @@ if NET_VENDOR_FARADAY
+
+ config FTMAC100
+	tristate "Faraday FTMAC100 10/100 Ethernet support"
+-	depends on ARM || NDS32 || COMPILE_TEST
+-	depends on !64BIT || BROKEN
++	depends on ARM || RISCV || COMPILE_TEST
+	select MII
+	help
+	  This driver supports the FTMAC100 10/100 Ethernet controller
+	  from Faraday. It is used on Faraday A320, Andes AG101 and some
+-	  other ARM/NDS32 SoC's.
++	  other ARM/RISCV SoC's.
+
+ config FTGMAC100
+	tristate "Faraday FTGMAC100 Gigabit Ethernet support"
+-	depends on ARM || NDS32 || COMPILE_TEST
+-	depends on !64BIT || BROKEN
++	depends on ARM || RISCV || COMPILE_TEST
+	select PHYLIB
+	select MDIO_ASPEED if MACH_ASPEED_G6
+-	select CRC32
+	help
+	  This driver supports the FTGMAC100 Gigabit Ethernet controller
+	  from Faraday. It is used on Faraday A369, Andes AG102 and some
+-	  other ARM/NDS32 SoC's.
++	  other ARM/RISCV SoC's.
+
+ endif # NET_VENDOR_FARADAY
+diff --git a/drivers/net/ethernet/faraday/ftmac100.c b/drivers/net/ethernet/faraday/ftmac100.c
+index 473b337b2e3b..49a9d4ea5826 100644
+--- a/drivers/net/ethernet/faraday/ftmac100.c
++++ b/drivers/net/ethernet/faraday/ftmac100.c
+@@ -4,6 +4,20 @@
+  *
+  * (C) Copyright 2009-2011 Faraday Technology
+  * Po-Yu Chuang <ratbert@faraday-tech.com>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or
++ * (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+  */
+
+ #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+@@ -38,12 +52,25 @@
+ #error invalid RX_BUF_SIZE
+ #endif
+
++#define xprintk(...)
++
++#define FTMAC100_RX_DESC(priv, index)     (&priv->descs->rxdes[index])
++#define FTMAC100_RX_DESC_EXT(priv, index) (&priv->descs->rxdes_ext[index])
++#define FTMAC100_TX_DESC(priv, index)     (&priv->descs->txdes[index])
++#define FTMAC100_TX_DESC_EXT(priv, index) (&priv->descs->txdes_ext[index])
++
++#define FTMAC100_CURRENT_RX_DESC_INDEX(priv) (priv->rx_pointer)
++#define FTMAC100_CURRENT_TX_DESC_INDEX(priv) (priv->tx_pointer);
++#define FTMAC100_CURRENT_CLEAN_TX_DESC_INDEX(priv) (priv->tx_clean_pointer);
++
+ /******************************************************************************
+  * private data
+  *****************************************************************************/
+ struct ftmac100_descs {
+	struct ftmac100_rxdes rxdes[RX_QUEUE_ENTRIES];
+	struct ftmac100_txdes txdes[TX_QUEUE_ENTRIES];
++	struct ftmac100_rxdes_ext rxdes_ext[RX_QUEUE_ENTRIES];
++	struct ftmac100_txdes_ext txdes_ext[TX_QUEUE_ENTRIES];
+ };
+
+ struct ftmac100 {
+@@ -69,7 +96,7 @@ struct ftmac100 {
+ };
+
+ static int ftmac100_alloc_rx_page(struct ftmac100 *priv,
+-				  struct ftmac100_rxdes *rxdes, gfp_t gfp);
++				  int index, gfp_t gfp);
+
+ /******************************************************************************
+  * internal functions (hardware register access)
+@@ -96,11 +123,13 @@ static void ftmac100_disable_all_int(struct ftmac100 *priv)
+
+ static void ftmac100_set_rx_ring_base(struct ftmac100 *priv, dma_addr_t addr)
+ {
++	xprintk("%s: addr %p\n", __func__, (void*)addr);
+	iowrite32(addr, priv->base + FTMAC100_OFFSET_RXR_BADR);
+ }
+
+ static void ftmac100_set_tx_ring_base(struct ftmac100 *priv, dma_addr_t addr)
+ {
++	xprintk("%s: addr %p\n", __func__, (void*)addr);
+	iowrite32(addr, priv->base + FTMAC100_OFFSET_TXR_BADR);
+ }
+
+@@ -259,25 +288,22 @@ static void ftmac100_rxdes_set_dma_addr(struct ftmac100_rxdes *rxdes,
+					dma_addr_t addr)
+ {
+	rxdes->rxdes2 = cpu_to_le32(addr);
++	rxdes->rxdes3 = cpu_to_le32(addr >> 32);
+ }
+
+ static dma_addr_t ftmac100_rxdes_get_dma_addr(struct ftmac100_rxdes *rxdes)
+ {
+-	return le32_to_cpu(rxdes->rxdes2);
++	return le32_to_cpu(rxdes->rxdes2) | (dma_addr_t)le32_to_cpu(rxdes->rxdes3) << 32;
+ }
+
+-/*
+- * rxdes3 is not used by hardware. We use it to keep track of page.
+- * Since hardware does not touch it, we can skip cpu_to_le32()/le32_to_cpu().
+- */
+-static void ftmac100_rxdes_set_page(struct ftmac100_rxdes *rxdes, struct page *page)
++static void ftmac100_rxdes_set_page(struct ftmac100 *priv, int index, struct page *page)
+ {
+-	rxdes->rxdes3 = (unsigned int)page;
++	FTMAC100_RX_DESC_EXT(priv, index)->page = page;
+ }
+
+-static struct page *ftmac100_rxdes_get_page(struct ftmac100_rxdes *rxdes)
++static struct page *ftmac100_rxdes_get_page(struct ftmac100 *priv, int index)
+ {
+-	return (struct page *)rxdes->rxdes3;
++	return (struct page *)FTMAC100_RX_DESC_EXT(priv, index)->page;
+ }
+
+ /******************************************************************************
+@@ -293,26 +319,23 @@ static void ftmac100_rx_pointer_advance(struct ftmac100 *priv)
+	priv->rx_pointer = ftmac100_next_rx_pointer(priv->rx_pointer);
+ }
+
+-static struct ftmac100_rxdes *ftmac100_current_rxdes(struct ftmac100 *priv)
+-{
+-	return &priv->descs->rxdes[priv->rx_pointer];
+-}
+-
+-static struct ftmac100_rxdes *
++static int
+ ftmac100_rx_locate_first_segment(struct ftmac100 *priv)
+ {
+-	struct ftmac100_rxdes *rxdes = ftmac100_current_rxdes(priv);
++	int index = FTMAC100_CURRENT_RX_DESC_INDEX(priv);
++	struct ftmac100_rxdes *rxdes = FTMAC100_RX_DESC(priv, index);
+
+	while (!ftmac100_rxdes_owned_by_dma(rxdes)) {
+		if (ftmac100_rxdes_first_segment(rxdes))
+-			return rxdes;
++			return index;
+
+		ftmac100_rxdes_set_dma_own(rxdes);
+		ftmac100_rx_pointer_advance(priv);
+-		rxdes = ftmac100_current_rxdes(priv);
++		index = FTMAC100_CURRENT_RX_DESC_INDEX(priv);
++		rxdes = FTMAC100_RX_DESC(priv, index);
+	}
+
+-	return NULL;
++	return -1;
+ }
+
+ static bool ftmac100_rx_packet_error(struct ftmac100 *priv,
+@@ -363,9 +386,13 @@ static bool ftmac100_rx_packet_error(struct ftmac100 *priv,
+ static void ftmac100_rx_drop_packet(struct ftmac100 *priv)
+ {
+	struct net_device *netdev = priv->netdev;
+-	struct ftmac100_rxdes *rxdes = ftmac100_current_rxdes(priv);
++	struct ftmac100_rxdes *rxdes;
++	int index;
+	bool done = false;
+
++	index = FTMAC100_CURRENT_RX_DESC_INDEX(priv);
++	rxdes = FTMAC100_RX_DESC(priv, index);
++
+	if (net_ratelimit())
+		netdev_dbg(netdev, "drop packet %p\n", rxdes);
+
+@@ -375,7 +402,8 @@ static void ftmac100_rx_drop_packet(struct ftmac100 *priv)
+
+		ftmac100_rxdes_set_dma_own(rxdes);
+		ftmac100_rx_pointer_advance(priv);
+-		rxdes = ftmac100_current_rxdes(priv);
++		index = FTMAC100_CURRENT_RX_DESC_INDEX(priv);
++		rxdes = FTMAC100_RX_DESC(priv, index);
+	} while (!done && !ftmac100_rxdes_owned_by_dma(rxdes));
+
+	netdev->stats.rx_dropped++;
+@@ -389,11 +417,12 @@ static bool ftmac100_rx_packet(struct ftmac100 *priv, int *processed)
+	struct page *page;
+	dma_addr_t map;
+	int length;
+-	bool ret;
++	int index;
+
+-	rxdes = ftmac100_rx_locate_first_segment(priv);
+-	if (!rxdes)
++	index = ftmac100_rx_locate_first_segment(priv);
++	if (index < 0)
+		return false;
++	rxdes = FTMAC100_RX_DESC(priv, index);
+
+	if (unlikely(ftmac100_rx_packet_error(priv, rxdes))) {
+		ftmac100_rx_drop_packet(priv);
+@@ -404,8 +433,8 @@ static bool ftmac100_rx_packet(struct ftmac100 *priv, int *processed)
+	 * It is impossible to get multi-segment packets
+	 * because we always provide big enough receive buffers.
+	 */
+-	ret = ftmac100_rxdes_last_segment(rxdes);
+-	BUG_ON(!ret);
++	if (unlikely(!ftmac100_rxdes_last_segment(rxdes)))
++		BUG();
+
+	/* start processing */
+	skb = netdev_alloc_skb_ip_align(netdev, 128);
+@@ -424,7 +453,7 @@ static bool ftmac100_rx_packet(struct ftmac100 *priv, int *processed)
+	dma_unmap_page(priv->dev, map, RX_BUF_SIZE, DMA_FROM_DEVICE);
+
+	length = ftmac100_rxdes_frame_length(rxdes);
+-	page = ftmac100_rxdes_get_page(rxdes);
++	page = ftmac100_rxdes_get_page(priv, index);
+	skb_fill_page_desc(skb, 0, page, 0, length);
+	skb->len += length;
+	skb->data_len += length;
+@@ -437,7 +466,7 @@ static bool ftmac100_rx_packet(struct ftmac100 *priv, int *processed)
+		/* Small frames are copied into linear part to free one page */
+		__pskb_pull_tail(skb, length);
+	}
+-	ftmac100_alloc_rx_page(priv, rxdes, GFP_ATOMIC);
++	ftmac100_alloc_rx_page(priv, index, GFP_ATOMIC);
+
+	ftmac100_rx_pointer_advance(priv);
+
+@@ -520,25 +549,27 @@ static void ftmac100_txdes_set_dma_addr(struct ftmac100_txdes *txdes,
+					dma_addr_t addr)
+ {
+	txdes->txdes2 = cpu_to_le32(addr);
++	txdes->txdes3 = cpu_to_le32(addr >> 32);
+ }
+
+ static dma_addr_t ftmac100_txdes_get_dma_addr(struct ftmac100_txdes *txdes)
+ {
+-	return le32_to_cpu(txdes->txdes2);
++	return le32_to_cpu(txdes->txdes2) | (dma_addr_t)le32_to_cpu(txdes->txdes3) << 32;
+ }
+
+-/*
+- * txdes3 is not used by hardware. We use it to keep track of socket buffer.
+- * Since hardware does not touch it, we can skip cpu_to_le32()/le32_to_cpu().
+- */
+-static void ftmac100_txdes_set_skb(struct ftmac100_txdes *txdes, struct sk_buff *skb)
++static void ftmac100_txdes_skb_reset(struct ftmac100_txdes *txdes)
+ {
+-	txdes->txdes3 = (unsigned int)skb;
++	txdes->txdes3 = 0;
+ }
+
+-static struct sk_buff *ftmac100_txdes_get_skb(struct ftmac100_txdes *txdes)
++static void ftmac100_txdes_set_skb(struct ftmac100 *priv, int index, struct sk_buff *skb)
+ {
+-	return (struct sk_buff *)txdes->txdes3;
++	FTMAC100_TX_DESC_EXT(priv, index)->skb = skb;
++}
++
++static struct sk_buff *ftmac100_txdes_get_skb(struct ftmac100 *priv, int index)
++{
++	return (struct sk_buff *)FTMAC100_TX_DESC_EXT(priv, index)->skb;
+ }
+
+ /******************************************************************************
+@@ -559,32 +590,24 @@ static void ftmac100_tx_clean_pointer_advance(struct ftmac100 *priv)
+	priv->tx_clean_pointer = ftmac100_next_tx_pointer(priv->tx_clean_pointer);
+ }
+
+-static struct ftmac100_txdes *ftmac100_current_txdes(struct ftmac100 *priv)
+-{
+-	return &priv->descs->txdes[priv->tx_pointer];
+-}
+-
+-static struct ftmac100_txdes *ftmac100_current_clean_txdes(struct ftmac100 *priv)
+-{
+-	return &priv->descs->txdes[priv->tx_clean_pointer];
+-}
+-
+ static bool ftmac100_tx_complete_packet(struct ftmac100 *priv)
+ {
+	struct net_device *netdev = priv->netdev;
+	struct ftmac100_txdes *txdes;
+	struct sk_buff *skb;
+	dma_addr_t map;
++	int index;
+
+	if (priv->tx_pending == 0)
+		return false;
+
+-	txdes = ftmac100_current_clean_txdes(priv);
++	index = FTMAC100_CURRENT_CLEAN_TX_DESC_INDEX(priv);
++	txdes = FTMAC100_TX_DESC(priv, index);
+
+	if (ftmac100_txdes_owned_by_dma(txdes))
+		return false;
+
+-	skb = ftmac100_txdes_get_skb(txdes);
++	skb = ftmac100_txdes_get_skb(priv, index);
+	map = ftmac100_txdes_get_dma_addr(txdes);
+
+	if (unlikely(ftmac100_txdes_excessive_collision(txdes) ||
+@@ -603,6 +626,7 @@ static bool ftmac100_tx_complete_packet(struct ftmac100 *priv)
+	dev_kfree_skb(skb);
+
+	ftmac100_txdes_reset(txdes);
++	ftmac100_txdes_skb_reset(txdes);
+
+	ftmac100_tx_clean_pointer_advance(priv);
+
+@@ -620,18 +644,20 @@ static void ftmac100_tx_complete(struct ftmac100 *priv)
+		;
+ }
+
+-static netdev_tx_t ftmac100_xmit(struct ftmac100 *priv, struct sk_buff *skb,
++static int ftmac100_xmit(struct ftmac100 *priv, struct sk_buff *skb,
+				 dma_addr_t map)
+ {
+	struct net_device *netdev = priv->netdev;
+	struct ftmac100_txdes *txdes;
+	unsigned int len = (skb->len < ETH_ZLEN) ? ETH_ZLEN : skb->len;
++	int index;
+
+-	txdes = ftmac100_current_txdes(priv);
++	index = FTMAC100_CURRENT_TX_DESC_INDEX(priv);
++	txdes = FTMAC100_TX_DESC(priv, index);
+	ftmac100_tx_pointer_advance(priv);
+
+	/* setup TX descriptor */
+-	ftmac100_txdes_set_skb(txdes, skb);
++	ftmac100_txdes_set_skb(priv, index, skb);
+	ftmac100_txdes_set_dma_addr(txdes, map);
+
+	ftmac100_txdes_set_first_segment(txdes);
+@@ -656,9 +682,10 @@ static netdev_tx_t ftmac100_xmit(struct ftmac100 *priv, struct sk_buff *skb,
+  * internal functions (buffer)
+  *****************************************************************************/
+ static int ftmac100_alloc_rx_page(struct ftmac100 *priv,
+-				  struct ftmac100_rxdes *rxdes, gfp_t gfp)
++				  int index, gfp_t gfp)
+ {
+	struct net_device *netdev = priv->netdev;
++	struct ftmac100_rxdes *rxdes = FTMAC100_RX_DESC(priv, index);
+	struct page *page;
+	dma_addr_t map;
+
+@@ -677,7 +704,7 @@ static int ftmac100_alloc_rx_page(struct ftmac100 *priv,
+		return -ENOMEM;
+	}
+
+-	ftmac100_rxdes_set_page(rxdes, page);
++	ftmac100_rxdes_set_page(priv, index, page);
+	ftmac100_rxdes_set_dma_addr(rxdes, map);
+	ftmac100_rxdes_set_buffer_size(rxdes, RX_BUF_SIZE);
+	ftmac100_rxdes_set_dma_own(rxdes);
+@@ -689,8 +716,8 @@ static void ftmac100_free_buffers(struct ftmac100 *priv)
+	int i;
+
+	for (i = 0; i < RX_QUEUE_ENTRIES; i++) {
+-		struct ftmac100_rxdes *rxdes = &priv->descs->rxdes[i];
+-		struct page *page = ftmac100_rxdes_get_page(rxdes);
++		struct ftmac100_rxdes *rxdes = FTMAC100_RX_DESC(priv, i);
++		struct page *page = ftmac100_rxdes_get_page(priv, i);
+		dma_addr_t map = ftmac100_rxdes_get_dma_addr(rxdes);
+
+		if (!page)
+@@ -701,8 +728,8 @@ static void ftmac100_free_buffers(struct ftmac100 *priv)
+	}
+
+	for (i = 0; i < TX_QUEUE_ENTRIES; i++) {
+-		struct ftmac100_txdes *txdes = &priv->descs->txdes[i];
+-		struct sk_buff *skb = ftmac100_txdes_get_skb(txdes);
++		struct ftmac100_txdes *txdes = FTMAC100_TX_DESC(priv, i);
++		struct sk_buff *skb = ftmac100_txdes_get_skb(priv, i);
+		dma_addr_t map = ftmac100_txdes_get_dma_addr(txdes);
+
+		if (!skb)
+@@ -722,7 +749,8 @@ static int ftmac100_alloc_buffers(struct ftmac100 *priv)
+
+	priv->descs = dma_alloc_coherent(priv->dev,
+					 sizeof(struct ftmac100_descs),
+-					 &priv->descs_dma_addr, GFP_KERNEL);
++					 &priv->descs_dma_addr,
++					 GFP_KERNEL);
+	if (!priv->descs)
+		return -ENOMEM;
+
+@@ -730,9 +758,7 @@ static int ftmac100_alloc_buffers(struct ftmac100 *priv)
+	ftmac100_rxdes_set_end_of_ring(&priv->descs->rxdes[RX_QUEUE_ENTRIES - 1]);
+
+	for (i = 0; i < RX_QUEUE_ENTRIES; i++) {
+-		struct ftmac100_rxdes *rxdes = &priv->descs->rxdes[i];
+-
+-		if (ftmac100_alloc_rx_page(priv, rxdes, GFP_KERNEL))
++		if (ftmac100_alloc_rx_page(priv, i, GFP_KERNEL))
+			goto err;
+	}
+
+@@ -999,7 +1025,7 @@ static int ftmac100_stop(struct net_device *netdev)
+	return 0;
+ }
+
+-static netdev_tx_t
++static int
+ ftmac100_hard_start_xmit(struct sk_buff *skb, struct net_device *netdev)
+ {
+	struct ftmac100 *priv = netdev_priv(netdev);
+diff --git a/drivers/net/ethernet/faraday/ftmac100.h b/drivers/net/ethernet/faraday/ftmac100.h
+index fe986f1673fc..1e65a7ef27ba 100644
+--- a/drivers/net/ethernet/faraday/ftmac100.h
++++ b/drivers/net/ethernet/faraday/ftmac100.h
+@@ -4,6 +4,20 @@
+  *
+  * (C) Copyright 2009-2011 Faraday Technology
+  * Po-Yu Chuang <ratbert@faraday-tech.com>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or
++ * (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+  */
+
+ #ifndef __FTMAC100_H
+@@ -22,6 +36,8 @@
+ #define	FTMAC100_OFFSET_ITC		0x28
+ #define	FTMAC100_OFFSET_APTC		0x2c
+ #define	FTMAC100_OFFSET_DBLAC		0x30
++#define	FTMAC100_OFFSET_TXR_BADR_H	0x40
++#define	FTMAC100_OFFSET_RXR_BADR_H	0x44
+ #define	FTMAC100_OFFSET_MACCR		0x88
+ #define	FTMAC100_OFFSET_MACSR		0x8c
+ #define	FTMAC100_OFFSET_PHYCR		0x90
+@@ -125,7 +141,7 @@ struct ftmac100_txdes {
+	unsigned int	txdes0;
+	unsigned int	txdes1;
+	unsigned int	txdes2;	/* TXBUF_BADR */
+-	unsigned int	txdes3;	/* not used by HW */
++	unsigned int	txdes3;	/* TXBUF_BADR_H */
+ } __attribute__ ((aligned(16)));
+
+ #define	FTMAC100_TXDES0_TXPKT_LATECOL	(1 << 0)
+@@ -146,7 +162,7 @@ struct ftmac100_rxdes {
+	unsigned int	rxdes0;
+	unsigned int	rxdes1;
+	unsigned int	rxdes2;	/* RXBUF_BADR */
+-	unsigned int	rxdes3;	/* not used by HW */
++	unsigned int	rxdes3;	/* RXBUF_BADR_H */
+ } __attribute__ ((aligned(16)));
+
+ #define	FTMAC100_RXDES0_RFL		0x7ff
+@@ -164,4 +180,12 @@ struct ftmac100_rxdes {
+ #define	FTMAC100_RXDES1_RXBUF_SIZE(x)	((x) & 0x7ff)
+ #define	FTMAC100_RXDES1_EDORR		(1 << 31)
+
++struct ftmac100_txdes_ext {
++	void *skb;
++};
++
++struct ftmac100_rxdes_ext {
++	void *page;
++};
++
+ #endif /* __FTMAC100_H */
+--
+2.25.1
diff --git a/board/andes/ae350/patches/linux/0003-Andes-support-for-ATCDMAC.patch b/board/andes/ae350/patches/linux/0003-Andes-support-for-ATCDMAC.patch
new file mode 100644
index 0000000000..eb50c1f02d
--- /dev/null
+++ b/board/andes/ae350/patches/linux/0003-Andes-support-for-ATCDMAC.patch
@@ -0,0 +1,3301 @@
+From ddc5b4035397fcdc91afc3a008b6632fa82e3715 Mon Sep 17 00:00:00 2001
+From: Yu Chien Peter Lin <peterlin@andestech.com>
+Date: Tue, 28 Dec 2021 10:55:06 +0800
+Subject: [PATCH 03/12] Andes support for ATCDMAC
+
+Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
+---
+ arch/riscv/include/asm/atcdmac300.h     |  543 +++++
+ arch/riscv/include/asm/dmad.h           |   71 +
+ arch/riscv/platforms/Kconfig            |   21 +
+ arch/riscv/platforms/Makefile           |    2 +
+ arch/riscv/platforms/ae350/Kconfig      |    7 +
+ arch/riscv/platforms/ae350/Makefile     |    1 +
+ arch/riscv/platforms/ae350/atcdmac300.c | 2531 +++++++++++++++++++++++
+ arch/riscv/platforms/dmad_intc.c        |   49 +
+ 8 files changed, 3225 insertions(+)
+ create mode 100644 arch/riscv/include/asm/atcdmac300.h
+ create mode 100644 arch/riscv/include/asm/dmad.h
+ create mode 100644 arch/riscv/platforms/Kconfig
+ create mode 100644 arch/riscv/platforms/Makefile
+ create mode 100644 arch/riscv/platforms/ae350/Kconfig
+ create mode 100644 arch/riscv/platforms/ae350/Makefile
+ create mode 100644 arch/riscv/platforms/ae350/atcdmac300.c
+ create mode 100644 arch/riscv/platforms/dmad_intc.c
+
+diff --git a/arch/riscv/include/asm/atcdmac300.h b/arch/riscv/include/asm/atcdmac300.h
+new file mode 100644
+index 000000000000..20fe88212dfc
+--- /dev/null
++++ b/arch/riscv/include/asm/atcdmac300.h
+@@ -0,0 +1,543 @@
++/* SPDX-License-Identifier: GPL-2.0 */
++/*
++ * Copyright (C) 2018 Andes Technology Corporation
++ *
++ */
++
++#ifndef __NDS_DMAD_ATF_INC__
++#define __NDS_DMAD_ATF_INC__
++
++/*****************************************************************************
++ * Configuration section
++*****************************************************************************/
++/* Debug trace enable switch */
++#define DMAD_ERROR_TRACE            1       /* message for fatal errors */
++#define DMAD_DEBUG_TRACE            0       /* message for debug trace */
++typedef u32 addr_t;
++
++/* Device base address */
++
++extern resource_size_t	dmac_base;
++#define DMAC_BASE			(dmac_base)
++
++/* ID and Revision Register */
++#define ID_REV				(DMAC_BASE + 0x00)
++/* DMAC Configuration Register*/
++#define CFG				(DMAC_BASE + 0x10)
++#define REQSYNC				30
++#define CTL				(DMAC_BASE + 0x20)
++#define CH_ABT				(DMAC_BASE + 0x24)
++/* Interrupt Status Register */
++#define INT_STA				(DMAC_BASE + 0x30)
++#define TC_OFFSET			16
++#define ABT_OFFSET			8
++#define ERR_OFFSET			0
++
++
++#define CH_EN				(DMAC_BASE + 0x34)
++
++
++
++#define DMAC_CH_OFFSET			0x40
++#define CH_CTL_OFF			0x0
++#define CH_SIZE_OFF			0x4
++#define CH_SRC_LOW_OFF			0x8
++#define CH_SRC_HIGH_OFF			0xc
++#define CH_DST_LOW_OFF			0x10
++#define CH_DST_HIGH_OFF			0x14
++#define CH_LLP_LOW_OFF			0x18
++#define CH_LLP_HIGH_OFF			0x1c
++
++
++#define DMAC_C0_BASE			(DMAC_BASE + DMAC_CH_OFFSET)
++#define DMAC_MAX_CHANNELS		8
++#define DMAC_BASE_CH(n)			(DMAC_C0_BASE + n*0x20)
++
++/***** Channel n Control Register ******/
++#define CH_CTL(n)			DMAC_BASE_CH(n)+CH_CTL_OFF
++#define PRIORITY_SHIFT			29
++#define PRIORITY_LOW			0
++#define PRIORITY_HIGH			1
++#define DMAC_CSR_CHPRI_0		PRIORITY_LOW
++#define DMAC_CSR_CHPRI_1		PRIORITY_LOW
++#define DMAC_CSR_CHPRI_2		PRIORITY_HIGH
++#define DMAC_CSR_CHPRI_3		PRIORITY_HIGH
++
++
++#define SBURST_SIZE_SHIFT		24
++#define SBURST_SIZE_MASK		(0xf<<24)
++#define DMAC_CSR_SIZE_1			0x0
++#define DMAC_CSR_SIZE_2			0x1
++#define DMAC_CSR_SIZE_4			0x2
++#define DMAC_CSR_SIZE_8			0x3
++#define DMAC_CSR_SIZE_16		0x4
++#define DMAC_CSR_SIZE_32		0x5
++#define DMAC_CSR_SIZE_64		0x6
++#define DMAC_CSR_SIZE_128		0x7
++#define DMAC_CSR_SIZE_256		0x8
++#define DMAC_CSR_SIZE_512		0x9
++#define DMAC_CSR_SIZE_1024		0xa
++/* Source transfer width */
++#define SRCWIDTH			21
++#define SRCWIDTH_MASK			(0x7<<SRCWIDTH)
++#define WIDTH_1				0x0
++#define WIDTH_2				0x1
++#define WIDTH_4				0x2
++#define WIDTH_8				0x3
++#define WIDTH_16			0x4
++#define WIDTH_32			0x5
++#define DMAC_CSR_WIDTH_8	      WIDTH_1
++#define DMAC_CSR_WIDTH_16	      WIDTH_2
++#define DMAC_CSR_WIDTH_32	      WIDTH_4
++
++
++/* Destination transfer width */
++#define DSTWIDTH			18
++#define DSTWIDTH_MASK			(0x7<<DSTWIDTH)
++/* Source DMA handshake mode */
++#define SRCMODE				17
++#define HANDSHAKE			1
++#define SRC_HS				(HANDSHAKE<<SRCMODE)
++/* Destination DMA handshake mode */
++#define DSTMODE				16
++#define DST_HS				(HANDSHAKE<<DSTMODE)
++
++/* Source address control */
++#define SRCADDRCTRL			14
++#define SRCADDRCTRL_MASK		(0x3<<SRCADDRCTRL)
++#define ADDR_INC			0x0
++#define ADDR_DEC			0x1
++#define ADDR_FIX			0x2
++#define DMAC_CSR_AD_INC			ADDR_INC
++#define DMAC_CSR_AD_DEC			ADDR_DEC
++#define DMAC_CSR_AD_FIX			ADDR_FIX
++
++/* Destination address control */
++#define DSTADDRCTRL			12
++#define DSTADDRCTRL_MASK		(0x3<<DSTADDRCTRL)
++/* Source DMA request select */
++#define SRCREQSEL			8
++#define SRCREQSEL_MASK			(0xf<<SRCREQSEL)
++/* Destination DMA request select */
++#define DSTREQSEL			4
++#define DSTREQSEL_MASK			(0xf<<DSTREQSEL)
++
++
++/* Channel abort interrupt mask */
++#define INTABTMASK			(3)
++/* Channel error interrupt mask */
++#define INTERRMASK			(2)
++/* Channel terminal count interrupt mask */
++#define INTTCMASK			(1)
++/* Channel Enable */
++#define CHEN				(0)
++
++/***** Channel n Transfer Size Register ******/
++#define CH_SIZE(n)			DMAC_BASE_CH(n)+CH_SIZE_OFF
++/* total transfer size from source */
++#define DMAC_TOT_SIZE_MASK          0xffffffff
++
++
++
++
++#define CH_SRC_L(n)			DMAC_BASE_CH(n)+CH_SRC_LOW_OFF
++#define CH_SRC_H(n)			DMAC_BASE_CH(n)+CH_SRC_HIGH_OFF
++#define CH_DST_L(n)			DMAC_BASE_CH(n)+CH_DST_LOW_OFF
++#define CH_DST_H(n)			DMAC_BASE_CH(n)+CH_DST_HIGH_OFF
++#define CH_LLP_L(n)			DMAC_BASE_CH(n)+CH_LLP_LOW_OFF
++#define CH_LLP_H(n)			DMAC_BASE_CH(n)+CH_LLP_HIGH_OFF
++
++
++typedef struct channel_control
++{
++	u32	sWidth;
++	u32	sCtrl;
++	u32	sReqn;
++	u32	dWidth;
++	u32	dCtrl;
++	u32	dReqn;
++}channel_control;
++
++
++
++
++
++
++/* DMA channel 0 registers (32-bit width) */
++#define DMAC_C0_CSR                 (DMAC_C0_BASE + DMAC_CSR_OFFSET)
++#define DMAC_C0_CFG                 (DMAC_C0_BASE + DMAC_CFG_OFFSET)
++#define DMAC_C0_SRC_ADDR            (DMAC_C0_BASE + DMAC_SRC_ADDR_OFFSET)
++#define DMAC_C0_DST_ADDR            (DMAC_C0_BASE + DMAC_DST_ADDR_OFFSET)
++#define DMAC_C0_LLP                 (DMAC_C0_BASE + DMAC_LLP_OFFSET)
++#define DMAC_C0_SIZE                (DMAC_C0_BASE + DMAC_SIZE_OFFSET)
++
++
++#ifdef CONFIG_PLATFORM_AHBDMA
++#define DMAC_CYCLE_TO_BYTES(cycle, width) ((cycle) << (width))
++#define DMAC_BYTES_TO_CYCLE(bytes, width) ((bytes) >> (width))
++#else
++#define DMAC_CYCLE_TO_BYTES(cycle, width) 0
++#define DMAC_BYTES_TO_CYCLE(bytes, width) 0
++#endif  /* CONFIG_PLATFORM_AHBDMA */
++
++
++/* Assignment of DMA hardware handshake ID */
++#define DMAC_REQN_SPITX			0
++#define DMAC_REQN_SPIRX			1
++#ifdef CONFIG_PLAT_AE350
++#define DMAC_REQN_I2SAC97TX		14
++#define DMAC_REQN_I2SAC97RX		15
++#else
++
++#define DMAC_REQN_I2SAC97TX		2
++#define DMAC_REQN_I2SAC97RX		3
++#endif
++#define DMAC_REQN_UART1TX		4
++#define DMAC_REQN_UART1RX		5
++#define DMAC_REQN_UART2TX		6
++#define DMAC_REQN_UART2RX		7
++#define DMAC_REQN_I2C			8
++#define DMAC_REQN_SDC			9
++#define DMAC_REQN_NONE			15
++
++
++enum DMAD_DMAC_CORE {
++	DMAD_DMAC_AHB_CORE,
++	DMAD_DMAC_APB_CORE
++};
++
++enum DMAD_CHREG_FLAGS {
++	DMAD_FLAGS_NON_BLOCK    = 0x00000000,
++	DMAD_FLAGS_SLEEP_BLOCK  = 0x00000001,
++	DMAD_FLAGS_SPIN_BLOCK   = 0x00000002,
++	DMAD_FLAGS_RING_MODE    = 0x00000008,   /* ring submission mode */
++	DMAD_FLAGS_BIDIRECTION  = 0x00000010,   /* indicates both tx and rx */
++};
++
++enum DMAD_CHDIR
++{
++	DMAD_DIR_A0_TO_A1       = 0,
++	DMAD_DIR_A1_TO_A0       = 1,
++};
++
++/* AHB Channel Request
++ *
++ * Notes for developers:
++ *   These should be channel-only properties. Controller-specific properties
++ *   should be separated as other driver structure or driver buildin-hardcode.
++ *   If controller properties are embeded in this union, request for a channel
++ *   may unexpectedly override the controller setting of the request of other
++ *   channels.
++ */
++typedef struct dmad_ahb_chreq
++{
++	/* channel property */
++	u32 sync;                       /* (in)  different clock domain */
++	u32 priority;                   /* (in)  DMAC_CSR_CHPRI_xxx */
++	u32 hw_handshake;               /* (in)  hardware handshaking on/off */
++	u32 burst_size;                 /* (in)  DMAC_CSR_SIZE_xxx */
++
++	/* source property */
++	union {
++		u32 src_width;          /* (in)  DMAC_CSR_WIDTH_xxx */
++		u32 addr0_width;        /* (in)  bi-direction mode alias */
++		u32 ring_width;         /* (in)  ring-mode alias */
++	};
++	union {
++		u32 src_ctrl;           /* (in)  DMAC_CSR_AD_xxx */
++		u32 addr0_ctrl;         /* (in)  bi-direction mode alias */
++		u32 ring_ctrl;          /* (in)  ring-mode alias */
++	};
++	union {
++		u32 src_reqn;           /* (in)  DMAC_REQN_xxx */
++		u32 addr0_reqn;         /* (in)  bi-direction mode alias */
++		u32 ring_reqn;          /* (in)  ring-mode alias */
++	};
++
++	/* destination property */
++	union {
++		u32 dst_width;          /* (in)  DMAC_CSR_WIDTH_xxx */
++		u32 addr1_width;        /* (in)  bi-direction mode alias */
++		u32 dev_width;          /* (in)  ring-mode alias */
++	};
++	union {
++		u32 dst_ctrl;           /* (in)  DMAC_CSR_AD_xxx */
++		u32 addr1_ctrl;         /* (in)  bi-direction mode alias */
++		u32 dev_ctrl;           /* (in)  ring-mode alias */
++	};
++	union {
++		u32 dst_reqn;           /* (in)  DMAC_REQN_xxx */
++		u32 addr1_reqn;         /* (in)  bi-direction mode alias */
++		u32 dev_reqn;           /* (in)  ring-mode alias */
++	};
++
++	/* (in)  transfer direction, valid only if following flags were set ...
++	 *         DMAD_FLAGS_BIDIRECTION or
++	 *         DMAD_FLAGS_RING_MODE
++	 *       value:
++	 *         0 (addr0 -> addr1, or ring-buff to device)
++	 *         1 (addr0 <- addr1, or device to ring-buff)
++	 */
++	u32 tx_dir;
++
++} dmad_ahb_chreq;
++
++/* APB Channel Request
++ *
++ * Notes for developers:
++ *   These should be channel-only properties. Controller-specific properties
++ *   should be separated as other driver structure or driver buildin-hardcode.
++ *   If controller properties are embeded in this union, request for a channel
++ *   may unexpectedly override the controller setting of the request of other
++ *   channels.
++ */
++typedef struct dmad_apb_chreq
++{
++	/* controller property (removed! should not exist in this struct) */
++
++	/* channel property */
++	u32 burst_mode;                 /* (in)  Burst mode (0/1) */
++	u32 data_width;                 /* (in)  APBBR_DATAWIDTH_xxx */
++
++	/* source property */
++	union {
++		u32 src_ctrl;           /* (in)  APBBR_ADDRINC_xxx */
++		u32 addr0_ctrl;         /* (in)  bi-direction mode alias */
++		u32 ring_ctrl;          /* (in)  ring-mode alias */
++	};
++	union {
++		u32 src_reqn;           /* (in)  APBBR_REQN_xxx */
++		u32 addr0_reqn;         /* (in)  bi-direction mode alias */
++		u32 ring_reqn;          /* (in)  ring-mode alias */
++	};
++
++	/* destination property */
++	union {
++		u32 dst_ctrl;           /* (in)  APBBR_ADDRINC_xxx */
++		u32 addr1_ctrl;         /* (in)  bi-direction mode alias */
++		u32 dev_ctrl;           /* (in)  ring-mode alias */
++	};
++	union {
++		u32 dst_reqn;           /* (in)  APBBR_REQN_xxx */
++		u32 addr1_reqn;         /* (in)  bi-direction mode alias */
++		u32 dev_reqn;           /* (in)  ring-mode alias */
++	};
++
++	/* (in)  transfer direction, valid only if following flags were set ...
++	 *         DMAD_FLAGS_BIDIRECTION or
++	 *         DMAD_FLAGS_RING_MODE
++	 *       value:
++	 *         0 (addr0 -> addr1, or ring-buff to device)
++	 *         1 (addr0 <- addr1, or device to ring-buff)
++	 */
++	u32 tx_dir;
++
++} dmad_apb_chreq;
++
++/* Channel Request Descriptor */
++typedef struct dmad_chreq
++{
++	/* common fields */
++	u32     controller;                 /* (in)  enum DMAD_DMAC_CORE */
++	u32	flags;                      /* (in)  enum DMAD_CHREQ_FLAGS */
++
++	/**********************************************************************
++	 * ring mode specific fields (valid only for DMAD_FLAGS_RING_MODE)
++	 * note:
++	 *  - size fields are in unit of data width
++	 *    * for AHB, ring size is limited to 4K * data_width of data if
++	 *      hw-LLP is not used
++	 *    * for AHB, ring size is limited to 4K * data_width * LLP-count
++	 *      hw-if LLP is used
++	 *    * for APB, ring size is limited to 16M * data_width of data
++	 *  - currently sw ring mode dma supports only fixed or incremental
++	 *    src/dst addressing
++	 *  - ring_size shoule >= periods * period_size
++	 */
++	dma_addr_t ring_base;               /* (in)  ring buffer base (pa) */
++	dma_addr_t ring_size;               /* (in)  unit of data width */
++	dma_addr_t     dev_addr;                /* (in)  device data port address */
++	dma_addr_t periods;                 /* (in)  number of ints per ring */
++	dma_addr_t period_size;             /* (in)  size per int, data-width */
++
++
++	/* channel-wise completion callback - called when hw-ptr catches sw-ptr
++	 * (i.e., channel stops)
++	 *
++	 * completion_cb:   (in) client supplied callback function, executed in
++	 *                       interrupt context.
++	 * completion_data: (in) client private data to be passed to data
++	 *                       argument of completion_cb().
++	 */
++	void (*completion_cb)(int channel, u16 status, void *data);
++	void *completion_data;
++	/*********************************************************************/
++
++	/* channel allocation output */
++	u32     channel;                    /* (out) allocated channel */
++	void    *drq;                       /* (out) internal use (DMAD_DRQ *)*/
++
++	/* channel-alloc parameters (channel-wise properties) */
++	union {
++#ifdef CONFIG_PLATFORM_AHBDMA
++		dmad_ahb_chreq ahb_req;     /* (in)  for AHB DMA parameters */
++#endif
++#ifdef CONFIG_PLATFORM_APBDMA
++		dmad_apb_chreq apb_req;     /* (in)  APB Bridge DMA params */
++#endif
++	};
++
++} dmad_chreq;
++
++/* drb states are mutual exclusive */
++enum DMAD_DRB_STATE
++{
++	DMAD_DRB_STATE_FREE             = 0,
++	DMAD_DRB_STATE_READY            = 0x00000001,
++	DMAD_DRB_STATE_SUBMITTED        = 0x00000002,
++	DMAD_DRB_STATE_EXECUTED         = 0x00000004,
++	DMAD_DRB_STATE_COMPLETED        = 0x00000008,
++	//DMAD_DRB_STATE_ERROR          = 0x00000010,
++	DMAD_DRB_STATE_ABORT            = 0x00000020,
++};
++
++/* DMA request block
++ * todo: replaced link with kernel struct list_head ??
++ */
++typedef struct dmad_drb
++{
++	u32  prev;                       /* (internal) previous node */
++	u32  next;                       /* (internal) next node */
++	u32  node;                       /* (internal) this node */
++
++	u32  state;                      /* (out) DRB's current state */
++
++	union {
++		dma_addr_t src_addr;     /* (in)  source pa */
++		dma_addr_t addr0;        /* (in)  bi-direction mode alias */
++	};
++
++	union {
++		dma_addr_t dst_addr;     /* (in)  destination pa */
++		dma_addr_t addr1;        /* (in)  bi-direction mode alias */
++	};
++
++	/* (in) AHB DMA (22 bits): 0 ~ 4M-1, unit is "data width"
++	 *      APB DMA (24 bits): 0 ~ 16M-1, unit is "data width * burst size"
++	 *      => for safe without mistakes, use dmad_make_req_cycles() to
++	 *         compose this value if the addressing mode is incremental
++	 *         mode (not working yet for decremental mode).
++	 */
++	dma_addr_t req_cycle;
++
++	/* (in)  if non-null, this sync object will be signaled upon dma
++	 * completion (for blocked-waiting dma completion)
++	 */
++	struct completion *sync;
++
++} dmad_drb;
++
++
++/******************************************************************************
++ * Debug Trace Mechanism
++ */
++#if (DMAD_ERROR_TRACE)
++#define dmad_err(format, arg...)  printk(KERN_ERR format , ## arg)
++#else
++#define dmad_err(format, arg...)  (void)(0)
++#endif
++
++#if (DMAD_DEBUG_TRACE)
++#define dmad_dbg(format, arg...)  printk(KERN_INFO format , ## arg)
++#else
++#define dmad_dbg(format, arg...)  (void)(0)
++#endif
++
++#if (defined(CONFIG_PLATFORM_AHBDMA) || defined(CONFIG_PLATFORM_APBDMA))
++
++/******************************************************************************
++ * DMAD Driver Interface
++******************************************************************************/
++
++extern int dmad_channel_alloc(dmad_chreq *ch_req);
++extern int dmad_channel_free(dmad_chreq *ch_req);
++extern int dmad_channel_enable(const dmad_chreq *ch_req, u8 enable);
++extern u32 dmad_max_size_per_drb(dmad_chreq *ch_req);
++extern u32 dmad_bytes_to_cycles(dmad_chreq *ch_req, u32 byte_size);
++
++extern int dmad_kickoff_requests(dmad_chreq *ch_req);
++extern int dmad_drain_requests(dmad_chreq *ch_req, u8 shutdown);
++
++/* for performance reason, these two functions are platform-specific */
++#ifdef CONFIG_PLATFORM_AHBDMA
++extern int dmad_probe_irq_source_ahb(void);
++#endif
++#ifdef CONFIG_PLATFORM_APBDMA
++extern int dmad_probe_irq_source_apb(void);
++#endif
++
++/* note: hw_ptr here is phyical address of dma source or destination */
++extern dma_addr_t dmad_probe_hw_ptr_src(dmad_chreq *ch_req);
++extern dma_addr_t dmad_probe_hw_ptr_dst(dmad_chreq *ch_req);
++
++/*****************************************************************************
++ * routines only valid in discrete (non-ring) mode
++ */
++extern int dmad_config_channel_dir(dmad_chreq *ch_req, u8 dir);
++extern int dmad_alloc_drb(dmad_chreq *ch_req, dmad_drb **drb);
++extern int dmad_free_drb(dmad_chreq *ch_req, dmad_drb *drb);
++extern int dmad_submit_request(dmad_chreq *ch_req,
++			       dmad_drb *drb, u8 keep_fired);
++extern int dmad_withdraw_request(dmad_chreq *ch_req, dmad_drb *drb);
++/****************************************************************************/
++
++/*****************************************************************************
++ * routines only valid in ring mode
++ * note: sw_ptr and hw_ptr are values offset from the ring buffer base
++ *       unit of sw_ptr is data-width
++ *       unit of hw_ptr returned is byte
++ */
++extern int dmad_update_ring(dmad_chreq *ch_req);
++extern int dmad_update_ring_sw_ptr(dmad_chreq *ch_req,
++				   dma_addr_t sw_ptr, u8 keep_fired);
++extern dma_addr_t dmad_probe_ring_hw_ptr(dmad_chreq *ch_req);
++/****************************************************************************/
++
++#else  /* CONFIG_PLATFORM_AHBDMA || CONFIG_PLATFORM_APBDMA */
++
++static inline int dmad_channel_alloc(dmad_chreq *ch_req) { return -EFAULT; }
++static inline int dmad_channel_free(dmad_chreq *ch_req) { return -EFAULT; }
++static inline int dmad_channel_enable(const dmad_chreq *ch_req, u8 enable)
++	{ return -EFAULT; }
++static inline u32 dmad_max_size_per_drb(dmad_chreq *ch_req) { return 0; }
++static inline u32 dmad_bytes_to_cycles(dmad_chreq *ch_req, u32 byte_size)
++	{ return 0; }
++static inline int dmad_kickoff_requests(dmad_chreq *ch_req) { return -EFAULT; }
++static inline int dmad_drain_requests(dmad_chreq *ch_req, u8 shutdown)
++	{ return -EFAULT; }
++static inline int dmad_probe_irq_source_ahb(void) { return -EFAULT; }
++static inline int dmad_probe_irq_source_apb(void) { return -EFAULT; }
++static inline dma_addr_t dmad_probe_hw_ptr_src(dmad_chreq *ch_req)
++	{ return (dma_addr_t)NULL; }
++static inline dma_addr_t dmad_probe_hw_ptr_dst(dmad_chreq *ch_req)
++	{ return (dma_addr_t)NULL; }
++static inline int dmad_config_channel_dir(dmad_chreq *ch_req, u8 dir)
++	{ return -EFAULT; }
++static inline int dmad_alloc_drb(dmad_chreq *ch_req, dmad_drb **drb)
++	{ return -EFAULT; }
++static inline int dmad_free_drb(dmad_chreq *ch_req, dmad_drb *drb)
++	{ return -EFAULT; }
++static inline int dmad_submit_request(dmad_chreq *ch_req,
++       dmad_drb *drb, u8 keep_fired) { return -EFAULT; }
++static inline int dmad_withdraw_request(dmad_chreq *ch_req, dmad_drb *drb)
++	{ return -EFAULT; }
++static inline int dmad_update_ring(dmad_chreq *ch_req)
++	{ return -EFAULT; }
++static inline int dmad_update_ring_sw_ptr(dmad_chreq *ch_req,
++	dma_addr_t sw_ptr, u8 keep_fired) { return -EFAULT; }
++static inline dma_addr_t dmad_probe_ring_hw_ptr(dmad_chreq *ch_req)
++	{ return (dma_addr_t)NULL; }
++
++#endif  /* CONFIG_PLATFORM_AHBDMA || CONFIG_PLATFORM_APBDMA */
++
++#endif  /* __NDS_DMAD_ATF_INC__ */
+diff --git a/arch/riscv/include/asm/dmad.h b/arch/riscv/include/asm/dmad.h
+new file mode 100644
+index 000000000000..44c87b49e606
+--- /dev/null
++++ b/arch/riscv/include/asm/dmad.h
+@@ -0,0 +1,71 @@
++/* SPDX-License-Identifier: GPL-2.0 */
++/*
++ * Copyright (C) 2018 Andes Technology Corporation
++ *
++ */
++
++#ifndef __NDS_DMAD_INC__
++#define __NDS_DMAD_INC__
++
++#include <asm/atcdmac300.h>
++
++#ifdef CONFIG_PLATFORM_AHBDMA
++int intc_ftdmac020_init_irq(int irq);
++#endif
++
++extern resource_size_t		ahb_base;
++extern resource_size_t		pmu_base;
++
++#define AMERALD_PRODUCT_ID	0x41471000
++#define AMERALD_MASK		0xFFFFF000
++
++/* DMAC */
++#define DMAC_FTDMAC020_IRQ_COUNT	8
++#define DMAC_FTDMAC020_IRQ0		64
++#define DMAC_FTDMAC020_IRQ1		65
++#define DMAC_FTDMAC020_IRQ2		66
++#define DMAC_FTDMAC020_IRQ3		67
++#define DMAC_FTDMAC020_IRQ4		68
++#define DMAC_FTDMAC020_IRQ5		69
++#define DMAC_FTDMAC020_IRQ6		70
++#define DMAC_FTDMAC020_IRQ7		71
++
++/* APBBRG */
++#define APBBRG_FTAPBBRG020S_IRQ_COUNT	4
++#define APBBRG_FTAPBBRG020S_IRQ0	72
++#define APBBRG_FTAPBBRG020S_IRQ1	73
++#define APBBRG_FTAPBBRG020S_IRQ2	74
++#define APBBRG_FTAPBBRG020S_IRQ3	75
++
++
++/* Dma irq */
++#define DMA_IRQ_COUNT	DMAC_FTDMAC020_IRQ_COUNT
++#define DMA_IRQ0	DMAC_FTDMAC020_IRQ0
++#define DMA_IRQ1	DMAC_FTDMAC020_IRQ1
++#define DMA_IRQ2	DMAC_FTDMAC020_IRQ2
++#define DMA_IRQ3	DMAC_FTDMAC020_IRQ3
++#define DMA_IRQ4	DMAC_FTDMAC020_IRQ4
++#define DMA_IRQ5	DMAC_FTDMAC020_IRQ5
++#define DMA_IRQ6	DMAC_FTDMAC020_IRQ6
++#define DMA_IRQ7	DMAC_FTDMAC020_IRQ7
++
++
++struct at_dma_platform_data {
++	unsigned int	nr_channels;
++	bool		is_private;
++#define CHAN_ALLOCATION_ASCENDING	0	/* zero to seven */
++#define CHAN_ALLOCATION_DESCENDING	1	/* seven to zero */
++	unsigned char	chan_allocation_order;
++#define CHAN_PRIORITY_ASCENDING		0	/* chan0 highest */
++#define CHAN_PRIORITY_DESCENDING	1	/* chan7 highest */
++	unsigned char	chan_priority;
++	unsigned short	block_size;
++	unsigned char	nr_masters;
++	unsigned char	data_width[4];
++	struct resource	*io;
++	void __iomem	*dmac_regs;
++	void __iomem	*pmu_regs;
++	void __iomem	*apb_regs;
++};
++
++#endif  /* __NDS_DMAD_INC__ */
+diff --git a/arch/riscv/platforms/Kconfig b/arch/riscv/platforms/Kconfig
+new file mode 100644
+index 000000000000..96462808c5ef
+--- /dev/null
++++ b/arch/riscv/platforms/Kconfig
+@@ -0,0 +1,21 @@
++choice
++	prompt "platform type"
++	default PLAT_AE350
++
++config PLAT_AE350
++	bool "ae350 platform"
++
++endchoice
++
++if PLAT_AE350
++source "arch/riscv/platforms/ae350/Kconfig"
++endif
++
++menu "Common Platform Options"
++
++config PLATFORM_AHBDMA
++	prompt "platform AHB DMA support"
++	bool
++	default y
++
++endmenu
+diff --git a/arch/riscv/platforms/Makefile b/arch/riscv/platforms/Makefile
+new file mode 100644
+index 000000000000..a95c2e44a903
+--- /dev/null
++++ b/arch/riscv/platforms/Makefile
+@@ -0,0 +1,2 @@
++obj-$(CONFIG_PLATFORM_AHBDMA) += dmad_intc.o
++obj-$(CONFIG_PLAT_AE350)	+= ae350/
+\ No newline at end of file
+diff --git a/arch/riscv/platforms/ae350/Kconfig b/arch/riscv/platforms/ae350/Kconfig
+new file mode 100644
+index 000000000000..57d3a9aa5508
+--- /dev/null
++++ b/arch/riscv/platforms/ae350/Kconfig
+@@ -0,0 +1,7 @@
++menu "AE3XX Platform Options"
++
++config ATCDMAC300
++	def_bool y
++	depends on PLATFORM_AHBDMA
++
++endmenu
+diff --git a/arch/riscv/platforms/ae350/Makefile b/arch/riscv/platforms/ae350/Makefile
+new file mode 100644
+index 000000000000..36c86ca38e3b
+--- /dev/null
++++ b/arch/riscv/platforms/ae350/Makefile
+@@ -0,0 +1 @@
++obj-y	= atcdmac300.o
+diff --git a/arch/riscv/platforms/ae350/atcdmac300.c b/arch/riscv/platforms/ae350/atcdmac300.c
+new file mode 100644
+index 000000000000..e635328f9362
+--- /dev/null
++++ b/arch/riscv/platforms/ae350/atcdmac300.c
+@@ -0,0 +1,2531 @@
++/* SPDX-License-Identifier: GPL-2.0 */
++/*
++ * Copyright (C) 2018 Andes Technology Corporation
++ *
++ */
++
++#include <linux/module.h>
++#include <linux/init.h>
++#include <linux/mm.h>
++#include <linux/slab.h>
++#include <linux/spinlock.h>
++#include <linux/completion.h>
++#include <linux/errno.h>
++#include <linux/interrupt.h>
++#include <linux/ioport.h>
++#include <linux/sizes.h>
++#include <asm/types.h>
++#include <asm/io.h>
++#include <asm/dmad.h>
++#include <linux/irq.h>
++#include <linux/platform_device.h>
++#include <linux/of.h>
++#include <linux/of_dma.h>
++#include <linux/math64.h>
++#include <asm/div64.h>
++
++resource_size_t	dmac_base;
++
++static inline addr_t REG_READ(unsigned long r)
++{
++	return readl((volatile void __iomem *) (unsigned long) r);
++}
++
++static inline void REG_WRITE(addr_t d, unsigned long r)
++{
++	writel(d, (volatile void __iomem *) (unsigned long) r);
++}
++
++#if (defined(CONFIG_PLATFORM_AHBDMA))
++#define DMAD_AHB_MAX_CHANNELS           DMAC_MAX_CHANNELS
++
++#define DMAD_DRB_POOL_SIZE              32	/* 128 */
++
++
++static inline addr_t din(unsigned long r)
++{
++	return REG_READ(r);
++}
++
++static inline void dout(addr_t d, unsigned long r)
++{
++	REG_WRITE(d,r);
++}
++
++/* reg/io supplementals */
++
++static void setbl(addr_t bit, unsigned long reg)
++{
++	REG_WRITE(REG_READ(reg) | (addr_t) ((addr_t) 1 << bit), reg);
++}
++
++static inline void clrbl(addr_t bit, unsigned long reg)
++{
++	REG_WRITE(REG_READ(reg) & (~((addr_t) ((addr_t) 1 << bit))), reg);
++}
++
++static inline addr_t getbl(addr_t bit, unsigned long reg)
++{
++ return REG_READ(reg) & (addr_t) ((addr_t) 1 << bit);
++}
++/******************************************************************************/
++
++enum DMAD_DRQ_FLAGS {
++	DMAD_DRQ_STATE_READY = 0x00000001,	/* channel allocation status */
++	DMAD_DRQ_STATE_ABORT = 0x00000002,	/* abort drb alloc block-wait */
++	DMAD_DRQ_DIR_A1_TO_A0 = 0x00000004,	/* Transfer direction */
++};
++
++#define DMAD_DRQ_DIR_MASK  DMAD_DRQ_DIR_A1_TO_A0
++
++/* DMA request queue, one instance per channel */
++typedef struct dmad_drq {
++	u32 state;		/* enum DMAD_DRQ_STATE */
++
++	unsigned long channel_base;	/* register base address */
++	unsigned long enable_port;	/* enable register */
++	unsigned long src_port;	/* source address register */
++	unsigned long dst_port;	/* dest address register */
++	unsigned long cyc_port;	/* size(cycle) register */
++
++	u32 flags;		/* enum DMAD_CHREQ_FLAGS */
++
++	spinlock_t drb_pool_lock;
++	dmad_drb *drb_pool;	/* drb pool */
++
++	unsigned long fre_head;		/* free list head */
++	unsigned long fre_tail;		/* free list tail */
++
++	unsigned long rdy_head;		/* ready list head */
++	unsigned long rdy_tail;		/* ready list tail */
++
++	unsigned long sbt_head;		/* submitted list head */
++	unsigned long sbt_tail;		/* submitted list tail */
++
++	u32 data_width;		/* dma transfer data width */
++
++	struct completion drb_alloc_sync;
++
++	/* client supplied callback function, executed in interrupt context
++	 * client private data to be passed to data argument of completion_cb().
++	 */
++	void (*completion_cb) (int channel, u16 status, void *data);
++	void *completion_data;
++
++	/* ring-mode fields are valid for DMAD_FLAGS_RING_MODE */
++	dma_addr_t ring_base;	/* ring buffer base address */
++	int ring_size;	/* size (of data width) */
++	unsigned long ring_port;	/* for setup/fetch hw_ptr */
++	dmad_drb *ring_drb;
++
++	addr_t dev_addr;	/* device data port */
++
++	int periods;		/* interrupts periods */
++	int period_size;	/* of dma data with */
++	dma_addr_t period_bytes;	/* Period size, in bytes */
++
++	/* ring_size - period_size * periods */
++	dma_addr_t remnant_size;
++
++	dma_addr_t sw_ptr;	/* sw pointer */
++	int sw_p_idx;		/* current ring_ptr */
++	dma_addr_t sw_p_off;	/* offset to period base */
++
++} dmad_drq;
++
++static inline void dmad_enable_channel(dmad_drq * drq)
++{
++	setbl(CHEN, drq->enable_port);
++}
++
++static inline void dmad_disable_channel(dmad_drq * drq)
++{
++	clrbl(CHEN, drq->enable_port);
++}
++
++static inline addr_t dmad_is_channel_enabled(dmad_drq * drq)
++{
++	return (addr_t) getbl(CHEN, drq->enable_port);
++}
++
++/* system irq number (per channel, ahb) */
++static const unsigned int ahb_irqs[DMAD_AHB_MAX_CHANNELS] = {
++	DMA_IRQ0,
++	DMA_IRQ1,
++	DMA_IRQ2,
++	DMA_IRQ3,
++	DMA_IRQ4,
++	DMA_IRQ5,
++	DMA_IRQ6,
++	DMA_IRQ7,
++};
++
++/* Driver data structure, one instance per system */
++typedef struct DMAD_DATA_STRUCT {
++	/* Driver data initialization flag */
++
++	/* DMA queue pool access control object */
++	spinlock_t drq_pool_lock;
++
++	/* DMA queue base address, to ease alloc/free flow */
++	dmad_drq *drq_pool;
++	/* DMA queue for AHB DMA channels */
++	dmad_drq *ahb_drq_pool;
++	void *plat;
++} DMAD_DATA;
++
++/* Driver data structure instance, one instance per system */
++
++static DMAD_DATA dmad __attribute__ ((aligned(8))) = {
++
++	.drq_pool_lock = __SPIN_LOCK_UNLOCKED(dmad.drq_pool_lock),
++	.drq_pool = 0,
++	.ahb_drq_pool = 0,
++	.plat = 0,
++};
++
++/**
++ * dmad_next_drb - static function
++ * @drb_pool : [in] The raw DRB pool of a DMA channel
++ * @node     : [in] The node number to lookup its next node
++ * @drb      : [out] The drb next to the "node" node number
++ *
++ * Lookup next DRB of the specified node number. "drb" is null if reaches end
++ * of the list.
++ */
++static inline void dmad_next_drb(dmad_drb * drb_pool, u32 node, dmad_drb ** drb)
++{
++	if (likely(drb_pool[node].next != 0))
++		*drb = &drb_pool[drb_pool[node].next];
++	else
++		*drb = 0;
++}
++
++/**
++ * dmad_prev_drb - static function
++ * @drb_pool : [in] The raw DRB pool of a DMA channel
++ * @node     : [in] The node number to lookup its previous node
++ * @drb      : [out] The drb previous to the "node" node number
++ *
++ * Lookup previous DRB of the specified node number. "drb" is null if reaches
++ * head-end of the list.
++ */
++static inline void dmad_prev_drb(dmad_drb * drb_pool, u32 node, dmad_drb ** drb)
++{
++	if (unlikely(drb_pool[node].prev != 0))
++		*drb = &drb_pool[drb_pool[node].prev];
++	else
++		*drb = 0;
++}
++
++/**
++ * dmad_detach_node - static function
++ * @drb_pool : [in] The raw DRB pool of a DMA channel
++ * @head     : [in/out] Reference to the head node number
++ * @tail     : [in/out] Reference to the tail node number
++ * @node     : [in] The node to be dettached from the queue
++ *
++ * Detached a DRB specified by the node number from the queue.  The head and
++ * tail records will be updated accordingly.
++ */
++static inline void dmad_detach_node(dmad_drb * drb_pool,
++				    unsigned long * head, unsigned long * tail, u32 node)
++{
++	if (likely(drb_pool[node].prev != 0)) {
++		/* prev->next = this->next (= 0, if this is a tail) */
++		drb_pool[drb_pool[node].prev].next = drb_pool[node].next;
++	} else {
++		/* this node is head, move head to next node
++		 * (= 0, if this is the only one node) */
++		*head = drb_pool[node].next;
++	}
++
++	if (unlikely(drb_pool[node].next != 0)) {
++		/* next->prev = this->prev (= 0, if this is a head) */
++		drb_pool[drb_pool[node].next].prev = drb_pool[node].prev;
++	} else {
++		/* this node is tail, move tail to previous node
++		 * (= 0, if this is the only one node) */
++		*tail = drb_pool[node].prev;
++	}
++
++	drb_pool[node].prev = drb_pool[node].next = 0;
++}
++
++/**
++ * dmad_detach_head - static function
++ * @drb_pool : [in] The raw DRB pool of a DMA channel
++ * @head     : [in/out] Reference to the head node number
++ * @tail     : [in/out] Reference to the tail node number
++ * @drb      : [out] The detached head node; null if the queue is empty
++ *
++ * Detached a DRB from the head of the queue.  The head and tail records will
++ * be updated accordingly.
++ */
++static inline void dmad_detach_head(dmad_drb * drb_pool,
++				    unsigned long * head, unsigned long * tail, dmad_drb ** drb)
++{
++	if (unlikely(*head == 0)) {
++		*drb = NULL;
++		return;
++	}
++
++	*drb = &drb_pool[*head];
++
++	if (likely((*drb)->next != 0)) {
++		/* next->prev = this->prev (= 0, if this is a head) */
++		drb_pool[(*drb)->next].prev = 0;
++
++		/* prev->next = this->next (do nothing, if this is a head) */
++
++		/* head = this->next */
++		*head = (*drb)->next;
++	} else {
++		/* head = tail = 0 */
++		*head = 0;
++		*tail = 0;
++	}
++
++	/* this->prev = this->next = 0 (do nothing, if save code size) */
++	(*drb)->prev = (*drb)->next = 0;
++}
++
++/**
++ * dmad_get_head - static function
++ * @drb_pool : [in] The raw DRB pool of a DMA channel
++ * @head     : [in/out] Reference to the head node number
++ * @tail     : [in/out] Reference to the tail node number
++ * @drb      : [out] The head node; null if the queue is empty
++ *
++ * Get a DRB from the head of the queue.  The head and tail records remain
++ * unchanged.
++ */
++static inline void dmad_get_head(dmad_drb * drb_pool, const unsigned long * head,
++				 const unsigned long * tail, dmad_drb ** drb)
++{
++	if (unlikely(*head == 0)) {
++		*drb = NULL;
++		return;
++	}
++
++	*drb = &drb_pool[*head];
++}
++
++/**
++ * dmad_detach_tail - static function
++ * @drb_pool : [in] The raw DRB pool of a DMA channel
++ * @head     : [in/out] Reference to the head node number
++ * @tail     : [in/out] Reference to the tail node number
++ * @drb      : [out] The tail node; null if the queue is empty
++ *
++ * Detached a DRB from the head of the queue.  The head and tail records will
++ * be updated accordingly.
++ */
++static inline void dmad_detach_tail(dmad_drb * drb_pool,
++				    unsigned long * head, unsigned long * tail, dmad_drb ** drb)
++{
++	if (unlikely(*tail == 0)) {
++		*drb = NULL;
++		return;
++	}
++
++	*drb = &drb_pool[*tail];
++
++	if (likely((*drb)->prev != 0)) {
++		/* prev->next = this->next (= 0, if this is a tail) */
++		drb_pool[(*drb)->prev].next = 0;
++
++		/* next->prev = this->prev (do nothing, if this is a tail) */
++
++		/* tail = this->prev */
++		*tail = (*drb)->prev;
++	} else {
++		/* head = tail = 0 */
++		*head = 0;
++		*tail = 0;
++	}
++
++	/* this->next = this->prev = 0 (do nothing, if save code size) */
++	(*drb)->prev = (*drb)->next = 0;
++}
++
++/**
++ * dmad_get_tail - static function
++ * @drb_pool : [in] The raw DRB pool of a DMA channel
++ * @head     : [in/out] Reference to the head node number
++ * @tail     : [in/out] Reference to the tail node number
++ * @drb      : [out] The tail node; null if the queue is empty
++ *
++ * Get a DRB from the tail of the queue.  The head and tail records remain
++ * unchanged.
++ */
++static inline void dmad_get_tail(dmad_drb * drb_pool,
++				 unsigned long * head, unsigned long * tail, dmad_drb ** drb)
++{
++	if (unlikely(*tail == 0)) {
++		*drb = NULL;
++		return;
++	}
++
++	*drb = &drb_pool[*tail];
++}
++
++/**
++ * dmad_attach_head - static function
++ * @drb_pool : [in] The raw DRB pool of a DMA channel
++ * @head     : [in/out] Reference to the head node number
++ * @tail     : [in/out] Reference to the tail node number
++ * @node     : [in] The node to be attached
++ *
++ * Attach a DRB node to the head of the queue.  The head and tail records will
++ * be updated accordingly.
++ */
++static inline void dmad_attach_head(dmad_drb * drb_pool,
++				    unsigned long * head, unsigned long * tail, u32 node)
++{
++	if (likely(*head != 0)) {
++		/* head->prev = this */
++		drb_pool[*head].prev = node;
++
++		/* this->next = head */
++		drb_pool[node].next = *head;
++		/* this->prev = 0 */
++		drb_pool[node].prev = 0;
++
++		/* head = node */
++		*head = node;
++	} else {
++		/* head = tail = node */
++		*head = *tail = node;
++		drb_pool[node].prev = drb_pool[node].next = 0;
++	}
++}
++
++/**
++ * dmad_attach_head - static function
++ * @drb_pool : [in] The raw DRB pool of a DMA channel
++ * @head     : [in/out] Reference to the head node number
++ * @tail     : [in/out] Reference to the tail node number
++ * @node     : [in] The node to be attached
++ *
++ * Attach a DRB node to the tail of the queue.  The head and tail records will
++ * be updated accordingly.
++ */
++static inline void dmad_attach_tail(dmad_drb * drb_pool,
++				    unsigned long * head, unsigned long * tail, u32 node)
++{
++	if (likely(*tail != 0)) {
++		/* tail->next = this */
++		drb_pool[*tail].next = node;
++
++		/* this->prev = tail */
++		drb_pool[node].prev = *tail;
++		/* this->next = 0 */
++		drb_pool[node].next = 0;
++
++		/* tail = node */
++		*tail = node;
++	} else {
++		/* head = tail = node */
++		*head = *tail = node;
++		drb_pool[node].prev = drb_pool[node].next = 0;
++	}
++}
++
++#ifdef CONFIG_PLATFORM_AHBDMA
++
++/**
++ * dmad_ahb_isr - AHB DMA interrupt service routine
++ *
++ * @irq    : [in] The irq number
++ * @dev_id : [in] The identifier to identify the asserted channel
++ *
++ * This is the ISR that services all AHB DMA channels.
++ */
++static irqreturn_t dmad_ahb_isr(int irq, void *dev_id)
++{
++	dmad_drq *drq;
++	dmad_drb *drb, *drb_iter;
++	u32 channel = ((unsigned long) dev_id) - 1;
++	u8 tc_int = 0;
++	u8 err_int = 0;
++	u8 abt_int = 0;
++	u8 cpl_events = 1;
++
++	dmad_dbg("%s() >> channel(%d)\n", __func__, channel);
++
++	if (channel >= DMAD_AHB_MAX_CHANNELS) {
++		dmad_err("%s() invlaid channel number: %d!\n",
++			 __func__, channel);
++		return IRQ_HANDLED;
++	}
++
++	/* Fetch channel's DRQ struct (DMA Request Queue) */
++	drq = (dmad_drq *) & dmad.ahb_drq_pool[channel];
++
++	/* Check DMA status register to get channel number */
++	if (likely(getbl(channel+TC_OFFSET, (unsigned long)INT_STA))) {
++
++		/* Mark as TC int */
++		tc_int = 1;
++
++		/* DMAC INT TC status clear */
++		setbl(channel+TC_OFFSET, (unsigned long)INT_STA);
++
++	} else if (getbl(channel+ERR_OFFSET, (unsigned long)INT_STA)) {
++
++		/* Mark as ERR int */
++		err_int = 1;
++
++		/* DMAC INT ERR status clear */
++		setbl(channel+ERR_OFFSET, (unsigned long)INT_STA);
++
++	} else if (getbl(channel+ABT_OFFSET, (unsigned long)INT_STA)) {
++
++		/* Mark as ABT int */
++		abt_int = 1;
++
++		/* DMAC INT ABT status clear */
++		setbl(channel+INT_STA, (unsigned long)INT_STA);
++
++	} else {
++
++		dmad_err("%s() possible false-fired ahb dma int,"
++			 "channel %d status-reg: status(0x%08x)\n",
++			 __func__, channel,din((unsigned long)INT_STA));
++
++		/* Stop DMA channel (make sure the channel will be stopped) */
++		clrbl(CH_EN, drq->enable_port);
++		return IRQ_HANDLED;
++	}
++
++	/* DMAC
++	 * Stop DMA channel temporarily */
++	dmad_disable_channel(drq);
++
++	spin_lock(&drq->drb_pool_lock);
++
++	/* Lookup/detach latest submitted DRB (DMA Request Block) from
++	 * the DRQ (DMA Request Queue), so ISR could kick off next DRB */
++	dmad_detach_head(drq->drb_pool, &drq->sbt_head, &drq->sbt_tail, &drb);
++	if (drb == NULL) {
++		spin_unlock(&drq->drb_pool_lock);
++		/* submitted list could be empty if client cancel all requests
++		 * of the channel. */
++		return IRQ_HANDLED;
++	}
++
++	/* release blocking of drb-allocation, if any ... */
++	if (unlikely((drq->fre_head == 0) &&
++		     (drq->flags & DMAD_FLAGS_SLEEP_BLOCK))) {
++		complete_all(&drq->drb_alloc_sync);
++	}
++
++	/* Process DRBs according to interrupt reason */
++	if (tc_int) {
++
++		dmad_dbg("dma finish\n");
++
++		dmad_dbg("finish drb(%d 0x%08x) addr0(0x%08x) "
++			 "addr1(0x%08x) size(0x%08x)\n",
++			 drb->node, (u32) drb, drb->src_addr,
++			 drb->dst_addr, drb->req_cycle);
++
++		if (drb->req_cycle == 0)
++			cpl_events = 0;
++
++		// Mark DRB state as completed
++		drb->state = DMAD_DRB_STATE_COMPLETED;
++		if (cpl_events && drb->sync)
++			complete_all(drb->sync);
++
++		dmad_attach_tail(drq->drb_pool, &drq->fre_head,
++				 &drq->fre_tail, drb->node);
++
++		// Check whether there are pending requests in the DRQ
++		if (drq->sbt_head != 0) {
++
++			// Lookup next DRB (DMA Request Block)
++			drb_iter = &drq->drb_pool[drq->sbt_head];
++
++			dmad_dbg("exec drb(%d 0x%08x) addr0(0x%08x) "
++				 "addr1(0x%08x) size(0x%08x)\n",
++				 drb_iter->node, (u32) drb_iter,
++				 drb_iter->src_addr, drb_iter->dst_addr,
++				 drb_iter->req_cycle);
++
++			// Kick-off DMA for next DRB
++			// - Source and destination address
++			if (drq->flags & DMAD_DRQ_DIR_A1_TO_A0) {
++				dout(drb_iter->addr1, (unsigned long)drq->src_port);
++				dout(drb_iter->addr0, (unsigned long)drq->dst_port);
++			} else {
++				dout(drb_iter->addr0, (unsigned long)drq->src_port);
++				dout(drb_iter->addr1, (unsigned long)drq->dst_port);
++			}
++
++			/* - Transfer size (in units of source width) */
++			dout(drb_iter->req_cycle, (unsigned long)drq->cyc_port);
++
++			/* Kick off next request */
++			dmad_enable_channel(drq);
++
++			drb_iter->state = DMAD_DRB_STATE_EXECUTED;
++
++		} else {
++			/* No pending requests, keep the DMA channel stopped */
++		}
++
++	} else {
++
++		dmad_err("%s() ahb dma channel %d error!\n", __func__, channel);
++
++		/* Zero out src, dst, and size */
++		dout(0, (unsigned long)drq->src_port);
++		dout(0, (unsigned long)drq->dst_port);
++		dout(0, (unsigned long)drq->cyc_port);
++
++		/* Remove all pending requests in the queue */
++		drb_iter = drb;
++		while (drb_iter) {
++
++			dmad_err("abort drb ");
++
++			if (drb_iter->req_cycle == 0)
++				cpl_events = 0;
++
++			/* Mark DRB state as abort */
++			drb_iter->state = DMAD_DRB_STATE_ABORT;
++
++			if (cpl_events && drb_iter->sync)
++				complete_all(drb_iter->sync);
++
++			dmad_attach_tail(drq->drb_pool, &drq->fre_head,
++					 &drq->fre_tail, drb_iter->node);
++
++			/* Detach next submitted DRB (DMA Request Block)
++			 * from the DRQ (DMA Request Queue) */
++			dmad_detach_head(drq->drb_pool, &drq->sbt_head,
++					 &drq->sbt_tail, &drb_iter);
++		}
++	}
++
++	spin_unlock(&drq->drb_pool_lock);
++
++	/* dispatch interrupt-context level callbacks */
++	if (cpl_events && drq->completion_cb) {
++		/* signal DMA driver that new node is available */
++		drq->completion_cb(channel, tc_int, drq->completion_data);
++	}
++
++	dmad_dbg("%s() <<\n", __func__);
++
++	return IRQ_HANDLED;
++}
++
++/**
++ * dmad_ahb_config_dir - prepare command reg according to tx direction
++ * @ch_req       : [in] Reference to the DMA request descriptor structure
++ * @channel_cmds : [out] Reference to array of command words to be prepared with
++ * @return       : none
++ *
++ * Prepare command registers according to transfer direction ...
++ *   channel_cmd[0]  DMAC_CSR
++ *   channel_cmd[1]  DMAC_CFG
++ *
++ * This function only serves as local helper.  No protection wrappers.
++ */
++static void dmad_ahb_config_dir(dmad_chreq * ch_req, unsigned long * channel_cmds)
++{
++	dmad_drq *drq = (dmad_drq *) ch_req->drq;
++	dmad_ahb_chreq *ahb_req = (dmad_ahb_chreq *) (&ch_req->ahb_req);
++	channel_control ch_ctl;
++	dmad_dbg("%s() channel_cmds(0x%08x)\n",__func__, channel_cmds[0]);
++	channel_cmds[0] &= ~(u32)(SRCWIDTH_MASK|SRCADDRCTRL_MASK|
++		DSTWIDTH_MASK|DSTADDRCTRL_MASK|
++		SRC_HS|DST_HS|SRCREQSEL_MASK|DSTREQSEL_MASK);
++
++	if (ahb_req->tx_dir == 0) {
++		dmad_dbg("%s() addr0 --> addr1\n", __func__);
++		memcpy((u8 *)&ch_ctl.sWidth,(u8 *)&ahb_req->addr0_width,12);
++		memcpy((u8 *)&ch_ctl.dWidth,(u8 *)&ahb_req->addr1_width,12);
++		drq->flags &= ~(addr_t) DMAD_DRQ_DIR_A1_TO_A0;
++	}else{
++		dmad_dbg("%s() addr0 <-- addr1\n", __func__);
++		memcpy((u8 *)&ch_ctl.sWidth,(u8 *)&ahb_req->addr1_width,12);
++		memcpy((u8 *)&ch_ctl.dWidth,(u8 *)&ahb_req->addr0_width,12);
++		drq->flags |= (addr_t) DMAD_DRQ_DIR_A1_TO_A0;
++	}
++	channel_cmds[0] |=(((ch_ctl.sWidth << SRCWIDTH) &SRCWIDTH_MASK) |
++		((ch_ctl.sCtrl << SRCADDRCTRL) &SRCADDRCTRL_MASK) |
++		((ch_ctl.dWidth << DSTWIDTH) &DSTWIDTH_MASK) |
++		((ch_ctl.dCtrl << DSTADDRCTRL) &DSTADDRCTRL_MASK));
++	drq->data_width = ch_ctl.sWidth;
++	if (likely(ahb_req->hw_handshake != 0)) {
++		if (ch_ctl.sReqn != DMAC_REQN_NONE)
++		{
++			channel_cmds[0] |= (SRC_HS |
++				((ch_ctl.sReqn <<SRCREQSEL)&SRCREQSEL_MASK));
++		}
++		if (ch_ctl.dReqn != DMAC_REQN_NONE)
++		{
++			channel_cmds[0] |= (DST_HS |
++				((ch_ctl.dReqn <<DSTREQSEL)&DSTREQSEL_MASK));
++		}
++	}
++	dmad_dbg("%s() channel_cmds(0x%08x)\n",
++		 __func__, channel_cmds[0]);
++}
++
++/**
++ * dmad_ahb_init - initialize a ahb dma channel
++ * @ch_req : [in] Reference to the DMA request descriptor structure
++ * @return : 0 if success, non-zero if any error
++ *
++ * Register AHB DMA ISR and performs hw initialization for the given DMA
++ * channel.
++ */
++static int dmad_ahb_init(dmad_chreq * ch_req)
++{
++	int err = 0;
++	dmad_drq *drq = (dmad_drq *) ch_req->drq;
++	dmad_ahb_chreq *ahb_req = (dmad_ahb_chreq *) (&ch_req->ahb_req);
++	u32 channel = (u32) ch_req->channel;
++
++	unsigned long channel_base = drq->channel_base;
++	addr_t channel_cmds[1];
++	unsigned long lock_flags;
++	dmad_dbg("%s()\n", __func__);
++	/* register interrupt handler */
++	err = request_irq(ahb_irqs[channel], dmad_ahb_isr, 0,
++			  "AHB_DMA", (void *)(unsigned long)(channel + 1));
++	if (unlikely(err != 0)) {
++		dmad_err("unable to request IRQ %d for AHB DMA "
++			 "(error %d)\n", ahb_irqs[channel], err);
++		free_irq(ahb_irqs[channel], (void *)(unsigned long)(channel + 1));
++		return err;
++	}
++	spin_lock_irqsave(&dmad.drq_pool_lock, lock_flags);
++
++	/* - INT TC/ERR/ABT status clear */
++	setbl(channel+TC_OFFSET, (unsigned long)INT_STA);
++	setbl(channel+ABT_OFFSET, (unsigned long)INT_STA);
++	setbl(channel+ERR_OFFSET, (unsigned long)INT_STA);
++
++	/* - SYNC */
++	if (ahb_req->sync != (getbl(REQSYNC, CFG)>>REQSYNC))
++	{
++		printk("sync configuration error !\n");
++		return EINVAL;
++	}
++	if(ahb_req->priority > PRIORITY_HIGH)
++		ahb_req->priority = PRIORITY_HIGH;
++
++	channel_cmds[0] = (ahb_req->priority << PRIORITY_SHIFT);
++	channel_cmds[0] |= (ahb_req->burst_size << SBURST_SIZE_SHIFT) &
++	    SBURST_SIZE_MASK;
++
++	if (0 ==
++	    (ch_req->flags & (DMAD_FLAGS_RING_MODE | DMAD_FLAGS_BIDIRECTION)))
++		ahb_req->tx_dir = 0;
++
++	dmad_ahb_config_dir(ch_req, (unsigned long *)channel_cmds);
++	dout(channel_cmds[0], (unsigned long)drq->enable_port);
++
++	/* SRCADR and DESADR */
++	dout(0, (unsigned long) drq->src_port);
++	dout(0, (unsigned long) drq->dst_port);
++	/* CYC (transfer size) */
++	dout(0, (unsigned long) drq->cyc_port);
++	/* LLP */
++	dout(0, (unsigned long)channel_base + CH_LLP_LOW_OFF);
++
++	/* TOT_SIZE - not now */
++	spin_unlock_irqrestore(&dmad.drq_pool_lock, lock_flags);
++
++	return err;
++}
++
++#endif /* CONFIG_PLATFORM_AHBDMA */
++/**
++ * dmad_channel_init - initialize given dma channel
++ * @ch_req : [in] Reference to the DMA request descriptor structure
++ * @return : 0 if success, non-zero if any error
++ *
++ * This function serves as the abstraction layer of dmad_ahb_init()
++ * and dmad_apb_init() functions.
++ */
++static int dmad_channel_init(dmad_chreq * ch_req)
++{
++	int err = 0;
++
++	dmad_dbg("%s()\n", __func__);
++
++	if (unlikely(ch_req == NULL))
++		return -EFAULT;
++
++	if (unlikely(ch_req->drq == NULL))
++		return -EBADR;
++
++	/* Initialize DMA controller */
++	if (ch_req->controller == DMAD_DMAC_AHB_CORE)
++		err = dmad_ahb_init(ch_req);
++	return err;
++}
++
++static inline void dmad_reset_channel(dmad_drq * drq)
++{
++	/* disable dma controller */
++	dmad_disable_channel(drq);
++
++	/* Source and destination address */
++	dout(0, (unsigned long)drq->src_port);
++	dout(0, (unsigned long)drq->dst_port);
++
++	/* Transfer size (in units of source width) */
++	dout(0, (unsigned long)drq->cyc_port);
++}
++
++/**
++ * dmad_channel_reset - reset given dma channel
++ * @ch_req : [in] Reference to the DMA request descriptor structure
++ * @return : 0 if success, non-zero if any error
++ *
++ * This function serves as the abstraction layer of dmad_ahb_reset()
++ * and dmad_apb_reset() functions.
++ */
++static int dmad_channel_reset(dmad_chreq * ch_req)
++{
++	u32 channel = (u32) ch_req->channel;
++	unsigned long lock_flags;
++	int err = 0;
++
++	dmad_dbg("%s()\n", __func__);
++
++	if (unlikely(ch_req == NULL))
++		return -EFAULT;
++
++	if (unlikely(ch_req->drq == NULL))
++		return -EBADR;
++
++	spin_lock_irqsave(&((dmad_drq *) ch_req->drq)->drb_pool_lock,
++			  lock_flags);
++
++	/* stop DMA channel */
++	dmad_reset_channel((dmad_drq *) ch_req->drq);
++
++	spin_unlock_irqrestore(&((dmad_drq *) ch_req->drq)->drb_pool_lock,
++			       lock_flags);
++
++	/* unregister interrupt handler */
++	if (ch_req->controller == DMAD_DMAC_AHB_CORE)
++		free_irq(ahb_irqs[channel], (void *)(unsigned long)(channel + 1));
++
++	return err;
++}
++
++/**
++ * dmad_channel_alloc - allocates and initialize a dma channel
++ * @ch_req : [in/out] Reference to the DMA request descriptor structure
++ * @return : 0 if success, non-zero if any error
++ *
++ * This function allocates a DMA channel according to client's request
++ * parameters.  ISR and HW state will also be initialized accordingly.
++ */
++int dmad_channel_alloc(dmad_chreq * ch_req)
++{
++	dmad_drq *drq_iter = NULL;
++	dmad_drb *drb_iter;
++	int err = 0;
++	u32 i = 0;
++	dmad_dbg("%s()\n", __func__);
++
++	if (ch_req == NULL) {
++		printk(KERN_ERR "%s() invalid argument!\n", __func__);
++		return -EFAULT;
++	}
++
++	spin_lock(&dmad.drq_pool_lock);
++
++	/* locate an available DMA channel */
++	if (ch_req->controller == DMAD_DMAC_AHB_CORE) {
++
++		drq_iter = dmad.ahb_drq_pool;
++
++		if ((ch_req->ahb_req.src_reqn != DMAC_REQN_NONE) ||
++		    (ch_req->ahb_req.dst_reqn != DMAC_REQN_NONE)) {
++			/* [2007-12-03] It looks current board have problem to
++			 * do dma traffic for APB devices on DMAC channel 0/1.
++			 * Redirect all APB devices to start from channel 2.
++			 */
++
++			/* [todo] include USB controller ? */
++			drq_iter = &dmad.ahb_drq_pool[2];
++			for (i = 2; i < DMAD_AHB_MAX_CHANNELS; ++i, ++drq_iter) {
++				if (!(drq_iter->state & DMAD_DRQ_STATE_READY))
++					break;
++			}
++		} else {
++			/* channel for other devices is free to allocate */
++			for (i = 0; i < DMAD_AHB_MAX_CHANNELS; ++i, ++drq_iter) {
++				if (!(drq_iter->state & DMAD_DRQ_STATE_READY))
++					break;
++			}
++		}
++		if (unlikely(i == DMAD_AHB_MAX_CHANNELS)) {
++			spin_unlock(&dmad.drq_pool_lock);
++			dmad_err("out of available channels (AHB DMAC)!\n");
++			return -ENOSPC;
++		}
++
++		dmad_dbg("allocated channel: %d (AHB DMAC)\n", i);
++	}
++
++	if (drq_iter == NULL) {
++		spin_unlock(&dmad.drq_pool_lock);
++		printk(KERN_ERR "%s() invalid argument!\n", __func__);
++		return -EFAULT;
++	}
++
++	spin_unlock(&dmad.drq_pool_lock);
++	memset(drq_iter, 0, sizeof(dmad_drq));
++
++	/* Initialize DMA channel's DRB pool as list of free DRBs */
++	drq_iter->drb_pool =
++	    kmalloc(DMAD_DRB_POOL_SIZE * sizeof(dmad_drb), GFP_ATOMIC);
++
++	if (drq_iter->drb_pool == NULL) {
++		printk(KERN_ERR "%s() failed to allocate drb pool!\n",
++		       __func__);
++		return -ENOMEM;
++	}
++
++	/* Allocate the DMA channel */
++	drq_iter->state = DMAD_DRQ_STATE_READY;
++	drq_iter->flags = ch_req->flags;
++
++	/* Initialize synchronization object for DMA queue access control */
++	spin_lock_init(&drq_iter->drb_pool_lock);
++
++	/* Initialize synchronization object for free drb notification */
++	init_completion(&drq_iter->drb_alloc_sync);
++
++	/* Record the channel number in client's struct */
++	ch_req->channel = i;
++	/* Record the channel's queue handle in client's struct */
++	ch_req->drq = drq_iter;
++
++	if (ch_req->controller == DMAD_DMAC_AHB_CORE) {
++		drq_iter->channel_base = (unsigned long) DMAC_BASE_CH(i);
++		drq_iter->enable_port = (unsigned long) CH_CTL(i);
++		drq_iter->src_port = (unsigned long) CH_SRC_L(i);
++		drq_iter->dst_port = (unsigned long) CH_DST_L(i);
++		drq_iter->cyc_port = (unsigned long) CH_SIZE(i);
++	}
++	/* drb-0 is an invalid node - for node validation */
++	drb_iter = &drq_iter->drb_pool[0];
++	drb_iter->prev = 0;
++	drb_iter->next = 0;
++	drb_iter->node = 0;
++	++drb_iter;
++
++	/* init other drbs - link in order */
++	for (i = 1; i < DMAD_DRB_POOL_SIZE; ++i, ++drb_iter) {
++		drb_iter->prev = i - 1;
++		drb_iter->next = i + 1;
++		drb_iter->node = i;
++	}
++	drq_iter->drb_pool[DMAD_DRB_POOL_SIZE - 1].next = 0;
++
++	/* Initialize channel's DRB free-list, ready-list, and submitted-list */
++	drq_iter->fre_head = 1;
++	drq_iter->fre_tail = DMAD_DRB_POOL_SIZE - 1;
++	drq_iter->rdy_head = drq_iter->rdy_tail = 0;
++	drq_iter->sbt_head = drq_iter->sbt_tail = 0;
++
++	/* initialize ring buffer mode resources */
++	if (ch_req->flags & DMAD_FLAGS_RING_MODE) {
++
++		int remnant = (int)ch_req->ring_size -
++		    (int)ch_req->periods * (int)ch_req->period_size;
++		if (remnant == 0) {
++			drq_iter->periods = ch_req->periods;
++		} else if (remnant > 0) {
++			drq_iter->periods = ch_req->periods;	// + 1;
++		} else {
++			dmad_err("%s() Error - buffer_size < "
++				 "periods * period_size!\n", __func__);
++			err = -EFAULT;
++			goto _err_exit;
++		}
++
++		drq_iter->ring_size = ch_req->ring_size;
++		drq_iter->period_size = ch_req->period_size;
++		drq_iter->remnant_size = (dma_addr_t) remnant;
++
++		drq_iter->ring_base = (dma_addr_t) ch_req->ring_base;
++		drq_iter->dev_addr = (dma_addr_t) ch_req->dev_addr;
++
++		if (ch_req->controller == DMAD_DMAC_AHB_CORE) {
++			if ((ch_req->ahb_req.ring_ctrl == DMAC_CSR_AD_DEC) ||
++			    (ch_req->ahb_req.dev_ctrl == DMAC_CSR_AD_DEC)) {
++				dmad_err("%s() Error - decremental"
++					 " addressing DMA is not supported in"
++					 " ring mode currently!\n", __func__);
++				err = -EFAULT;
++				goto _err_exit;
++			}
++
++			if (ch_req->ahb_req.ring_ctrl == DMAC_CSR_AD_FIX) {
++				dmad_err("%s() Error - ring address control is "
++					 "fixed in ring DMA mode!\n", __func__);
++				err = -EFAULT;
++				goto _err_exit;
++			}
++
++			drq_iter->period_bytes =
++			    DMAC_CYCLE_TO_BYTES(ch_req->period_size,
++						ch_req->ahb_req.ring_width);
++
++			/* 0 - addr0 to addr1; 1 - addr1 to addr0 */
++			if (ch_req->ahb_req.tx_dir == 0)
++				drq_iter->ring_port =(unsigned long) drq_iter->src_port;
++			else
++				drq_iter->ring_port =(unsigned long) drq_iter->dst_port;
++
++		}
++
++		dmad_dbg("%s() ring: base(0x%08x) port(0x%08x) periods(0x%08x)"
++			 " period_size(0x%08x) period_bytes(0x%08x)"
++			 " remnant_size(0x%08x)\n",
++			 __func__, drq_iter->ring_base, drq_iter->ring_port,
++			 drq_iter->periods, drq_iter->period_size,
++			 drq_iter->period_bytes, drq_iter->remnant_size);
++	}
++
++	drq_iter->completion_cb = ch_req->completion_cb;
++	drq_iter->completion_data = ch_req->completion_data;
++
++	/* Initialize the channel && register isr */
++	err = dmad_channel_init(ch_req);
++
++_err_exit:
++
++	if (err != 0) {
++		spin_lock(&dmad.drq_pool_lock);
++
++		kfree(drq_iter->drb_pool);
++		memset(drq_iter, 0, sizeof(dmad_drq));
++
++		ch_req->channel = -1;
++		ch_req->drq = (void *)0;
++
++		spin_unlock(&dmad.drq_pool_lock);
++
++		dmad_err("Failed to initialize APB DMA! "
++			 "Channel allocation aborted!\n");
++	}
++
++	return err;
++}
++
++EXPORT_SYMBOL_GPL(dmad_channel_alloc);
++
++/**
++ * dmad_channel_free - release a dma channel
++ * @ch_req : [in] Reference to the DMA request descriptor structure
++ * @return : 0 if success, non-zero if any error
++ *
++ * This function releases a DMA channel.  The channel is available for future
++ * allocation after the invokation.
++ */
++int dmad_channel_free(dmad_chreq * ch_req)
++{
++	dmad_drq *drq;
++
++	dmad_dbg("%s()\n", __func__);
++
++	if (unlikely(ch_req == NULL)) {
++		dmad_err("null ch_req!\n");
++		return -EFAULT;
++	}
++
++	drq = (dmad_drq *) ch_req->drq;
++
++	if (unlikely(drq == NULL)) {
++		dmad_err("null ch_req->drq!\n");
++		return -EBADR;
++	}
++	if (unlikely((ch_req->channel < 0) ||
++		     ((drq->state & DMAD_DRQ_STATE_READY) == 0))) {
++		dmad_err("try to free a free channel!\n");
++		return -EBADR;
++	}
++
++	/* Stop/abort channel I/O
++	 * (forced to shutdown and should be protected against isr)
++	 */
++	dmad_drain_requests(ch_req, 1);
++	dmad_channel_reset(ch_req);
++
++	dmad_dbg("freed channel: %d\n", ch_req->channel);
++
++	spin_lock(&dmad.drq_pool_lock);
++
++	kfree(drq->drb_pool);
++	memset(drq, 0, sizeof(dmad_drq));
++
++	ch_req->drq = 0;
++	ch_req->channel = (u32) - 1;
++
++	spin_unlock(&dmad.drq_pool_lock);
++
++	return 0;
++}
++
++EXPORT_SYMBOL_GPL(dmad_channel_free);
++
++/**
++ * dmad_channel_enable - enable/disable a dma channel
++ * @ch_req : [in] Reference to the DMA request descriptor structure
++ * @enable : [in] 1 to enable the channel, 0 to disable
++ * @return : 0 if success, non-zero if any error
++ *
++ * Enable or disable the given DMA channel.
++ */
++int dmad_channel_enable(const dmad_chreq * ch_req, u8 enable)
++{
++	dmad_drq *drq;
++	unsigned long lock_flags;
++
++	dmad_dbg("%s()\n", __func__);
++
++	if (unlikely(ch_req == NULL))
++		return -EFAULT;
++
++	drq = (dmad_drq *) ch_req->drq;
++
++	if (unlikely(drq == NULL))
++		return -EBADR;
++
++	spin_lock_irqsave(&drq->drb_pool_lock, lock_flags);
++
++	/* Enable/disable DMA channel */
++	if (enable)
++		dmad_enable_channel(drq);
++	else
++		dmad_disable_channel(drq);
++
++	spin_unlock_irqrestore(&drq->drb_pool_lock, lock_flags);
++
++	return 0;
++}
++
++EXPORT_SYMBOL_GPL(dmad_channel_enable);
++
++/**
++ * dmad_config_channel_dir - config dma channel transfer direction
++ * @ch_req : [in] Reference to the DMA request descriptor structure
++ * @dir    : [in] DMAD_DRQ_DIR_A0_TO_A1 or DMAD_DRQ_DIR_A1_TO_A0
++ * @return : 0 if success, non-zero if any error
++ *
++ * Reconfigure the channel transfer direction.  This function works only if
++ * the channel was allocated with the DMAD_FLAGS_BIDIRECTION flags.  Note
++ * that bi-direction mode and ring mode are mutual-exclusive from user's
++ * perspective.
++ */
++int dmad_config_channel_dir(dmad_chreq * ch_req, u8 dir)
++{
++	dmad_drq *drq;
++	addr_t channel_cmds[1];
++	unsigned long lock_flags;
++	u8 cur_dir;
++
++	if (unlikely(ch_req == NULL))
++		return -EFAULT;
++
++	drq = (dmad_drq *) ch_req->drq;
++
++	if (unlikely(drq == NULL))
++		return -EBADR;
++
++	if (unlikely(!(ch_req->flags & DMAD_FLAGS_BIDIRECTION))) {
++		dmad_err("%s() Channel is not configured as"
++			 " bidirectional!\n", __func__);
++		return -EFAULT;
++	}
++
++	cur_dir = drq->flags & DMAD_DRQ_DIR_MASK;
++	if (dir == cur_dir) {
++		dmad_dbg("%s() cur_dir(%d) == dir(%d) skip reprogramming hw.\n",
++			 __func__, cur_dir, dir);
++		return 0;
++	}
++
++	spin_lock_irqsave(&drq->drb_pool_lock, lock_flags);
++
++	if (unlikely((drq->sbt_head != 0) /*||dmad_is_channel_enabled(drq) */ )) {
++		spin_unlock_irqrestore(&drq->drb_pool_lock, lock_flags);
++		dmad_err("%s() Cannot change direction while the "
++			 "channel has pending requests!\n", __func__);
++		return -EFAULT;
++	}
++
++	if (ch_req->controller == DMAD_DMAC_AHB_CORE) {
++		channel_cmds[0] = din((unsigned long)drq->enable_port);
++		ch_req->ahb_req.tx_dir = dir;
++		dmad_ahb_config_dir(ch_req, (unsigned long *)channel_cmds);
++		dout(channel_cmds[0], (unsigned long)drq->enable_port);
++	}
++
++	spin_unlock_irqrestore(&drq->drb_pool_lock, lock_flags);
++
++	return 0;
++}
++
++EXPORT_SYMBOL_GPL(dmad_config_channel_dir);
++
++/**
++ * dmad_max_size_per_drb - return maximum transfer size per drb
++ * @ch_req : [in] Reference to the DMA request descriptor structure
++ * @return : The maximum transfer size per drb, in bytes.
++ *
++ * Calculate the maximum transfer size per drb according to the setting of
++ * data width during channel initialization.
++ *
++ * Return size is aligned to 4-byte boundary; this ensures the alignment
++ * requirement of dma starting address if the function was used in a loop to
++ * separate a large size dma transfer.
++ */
++u32 dmad_max_size_per_drb(dmad_chreq * ch_req)
++{
++	addr_t size = 0;
++	addr_t data_width = (addr_t) ((dmad_drq *) ch_req->drq)->data_width;
++
++	if (ch_req->controller == DMAD_DMAC_AHB_CORE) {
++		size = DMAC_CYCLE_TO_BYTES(DMAC_TOT_SIZE_MASK & ((addr_t) ~ 3),
++					   data_width);
++	}
++
++	dmad_dbg("%s() - 0x%08x bytes\n", __func__, size);
++
++	return size;
++}
++
++EXPORT_SYMBOL_GPL(dmad_max_size_per_drb);
++
++/**
++ * dmad_bytes_to_cycles - calculate drb transfer size, in cycles
++ * @ch_req    : [in] Reference to the DMA request descriptor structure
++ * @byte_size : [in] The DMA transfer size to be converted, in bytes
++ * @return    : The drb transfer size, in cycles.
++ *
++ * Calculate the drb transfer cycle according to the setting of channel data
++ * width and burst setting.
++ *
++ * AHB DMA : unit is number of "data width".
++ * APB DMA : unit is number of "data width * burst size"
++ *
++ * APB Note: According to specification, decrement addressing seems to regard
++ *           the burst size setting.  For code efficiency,
++ *           dmad_make_req_cycles() does not take care of this case and might
++ *           produce wrong result.
++ */
++u32 dmad_bytes_to_cycles(dmad_chreq * ch_req, u32 byte_size)
++{
++	addr_t cycle = 0;
++	addr_t data_width = (addr_t) ((dmad_drq *) ch_req->drq)->data_width;
++
++	if (ch_req->controller == DMAD_DMAC_AHB_CORE) {
++		cycle = DMAC_BYTES_TO_CYCLE(byte_size, data_width);
++	}
++
++	dmad_dbg("%s() - 0x%08x bytes --> 0x%08x cycles\n",
++		 __func__, byte_size, cycle);
++	return cycle;
++}
++
++EXPORT_SYMBOL_GPL(dmad_bytes_to_cycles);
++
++/**
++ * dmad_alloc_drb_internal - allocate a dma-request-block of a dma channel
++ * @ch_req : [in] Reference to the DMA request descriptor structure
++ * @drb    : [out] Reference to a drb pointer to receive the allocated drb
++ * @return : 0 if success, non-zero if any error
++ *
++ * Allocates a DRB (DMA request block) of the given DMA channel.  DRB is a
++ * single dma request which will be pushed into the submission queue of the
++ * given DMA channel.  This is a lightweight internal version of
++ * dmad_alloc_drb() majorly for use in ring mode.  Critical access to the
++ * drb pool should be protected before entering this function.
++ */
++static inline int dmad_alloc_drb_internal(dmad_drq * drq, dmad_drb ** drb)
++{
++	/* Initialize drb ptr in case of fail allocation */
++	*drb = NULL;
++
++	if (unlikely(drq->fre_head == 0)) {
++		return -EAGAIN;
++	}
++
++	dmad_detach_head(drq->drb_pool, &drq->fre_head, &drq->fre_tail, drb);
++
++	dmad_attach_tail(drq->drb_pool,
++			 &drq->rdy_head, &drq->rdy_tail, (*drb)->node);
++
++	(*drb)->state = DMAD_DRB_STATE_READY;
++	(*drb)->sync = 0;
++
++	dmad_dbg("%s() drb(%d 0x%08x)\n", __func__, (*drb)->node, (u32) (*drb));
++
++	return 0;
++}
++
++/**
++ * dmad_alloc_drb - allocate a dma-request-block of a dma channel
++ * @ch_req : [in] Reference to the DMA request descriptor structure
++ * @drb    : [out] Reference to a drb pointer to receive the allocated drb
++ * @return : 0 if success, non-zero if any error
++ *
++ * Allocates a DRB (DMA request block) of the given DMA channel.  DRB is a
++ * single dma request which will be pushed into the submission queue of the
++ * given DMA channel.
++ */
++int dmad_alloc_drb(dmad_chreq * ch_req, dmad_drb ** drb)
++{
++	dmad_drq *drq;
++	unsigned long lock_flags;
++
++	dmad_dbg("%s()\n", __func__);
++
++	if (unlikely(ch_req == NULL)) {
++		dmad_err("null ch_req!\n");
++		return -EFAULT;
++	}
++
++	drq = (dmad_drq *) ch_req->drq;
++
++	if (likely(drq == NULL)) {
++		dmad_err("null ch_req->drq!\n");
++		return -EBADR;
++	}
++
++	spin_lock_irqsave(&drq->drb_pool_lock, lock_flags);
++
++	/* Initialize drb ptr in case of fail allocation */
++	*drb = NULL;
++
++	if (unlikely(drq->fre_head == 0)) {
++
++		drq->state &= (u32) ~ DMAD_DRQ_STATE_ABORT;
++
++		spin_unlock_irqrestore(&drq->drb_pool_lock, lock_flags);
++
++_wait_for_free_drbs:
++
++		/* Wait for free urbs */
++		if (drq->flags & DMAD_FLAGS_SLEEP_BLOCK) {
++
++			int timeout =
++			    wait_for_completion_interruptible_timeout(&drq->
++								      drb_alloc_sync,
++								      msecs_to_jiffies
++								      (6000));
++
++			/* reset sync object */
++			reinit_completion(&drq->drb_alloc_sync);
++
++			if (timeout < 0) {
++				dmad_err("%s() wait for"
++					 " completion error! (%d)\n",
++					 __func__, timeout);
++				return timeout;
++			}
++
++		} else if (drq->flags & DMAD_FLAGS_SPIN_BLOCK) {
++
++			u32 timeout = 0x00ffffff;
++
++			while ((drq->fre_head == 0) && (--timeout != 0)) {
++			}
++			if (timeout == 0) {
++				dmad_err("%s() polling wait for "
++					 "completion timeout!\n", __func__);
++				return -EAGAIN;
++			}
++
++		} else {
++			return -EAGAIN;
++		}
++
++		spin_lock_irqsave(&drq->drb_pool_lock, lock_flags);
++
++		/* check whether all the requests of the channel has been
++		 * abandoned or not */
++		if (unlikely(drq->state & DMAD_DRQ_STATE_ABORT)) {
++			dmad_dbg("%s() drb-allocation aborted due"
++				 " to cancel-request ...\n", __func__);
++			drq->state &= (u32) ~ DMAD_DRQ_STATE_ABORT;
++			spin_unlock_irqrestore(&drq->drb_pool_lock, lock_flags);
++			return -ECANCELED;
++		}
++
++		/* check again to avoid non-atomic operation between above
++		 * two calls */
++		if (unlikely(drq->fre_head == 0)) {
++			dmad_dbg("%s() lost free drbs ... "
++				 "continue waiting ...\n", __func__);
++			spin_unlock_irqrestore(&drq->drb_pool_lock, lock_flags);
++			goto _wait_for_free_drbs;
++		}
++	}
++
++	dmad_detach_head(drq->drb_pool, &drq->fre_head, &drq->fre_tail, drb);
++
++	dmad_attach_tail(drq->drb_pool,
++			 &drq->rdy_head, &drq->rdy_tail, (*drb)->node);
++
++	(*drb)->state = DMAD_DRB_STATE_READY;
++	(*drb)->sync = 0;
++
++	dmad_dbg("%s() drb(%d 0x%08x)\n", __func__, (*drb)->node, (u32) (*drb));
++
++	drq->state &= (u32) ~ DMAD_DRQ_STATE_ABORT;
++
++	spin_unlock_irqrestore(&drq->drb_pool_lock, lock_flags);
++
++	return 0;
++}
++
++EXPORT_SYMBOL_GPL(dmad_alloc_drb);
++
++/**
++ * dmad_free_drb - free a dma-request-block of a dma channel
++ * @ch_req : [in] Reference to the DMA request descriptor structure
++ * @drb    : [in] Reference to a drb to be freed
++ * @return : 0 if success, non-zero if any error
++ *
++ * Frees a DRB (DMA request block) of the given DMA channel.  DRB is a
++ * single dma request which will be pushed into the submission queue of the
++ * given DMA channel.
++ */
++int dmad_free_drb(dmad_chreq * ch_req, dmad_drb * drb)
++{
++	dmad_drq *drq;
++	unsigned long lock_flags;
++
++	dmad_dbg("%s()\n", __func__);
++
++	if (unlikely(ch_req == NULL)) {
++		dmad_err("null ch_req!\n");
++		return -EFAULT;
++	}
++
++	drq = (dmad_drq *) ch_req->drq;
++
++	if (unlikely(drq == NULL)) {
++		dmad_err("null ch_req->drq!\n");
++		return -EBADR;
++	}
++
++	spin_lock_irqsave(&drq->drb_pool_lock, lock_flags);
++
++	/****************************************************
++	 * Following code requires _safe_exit return path
++	 */
++
++	if (unlikely((drq->rdy_head == 0) || (drb->node == 0) ||
++		     (drb->state != DMAD_DRB_STATE_READY) ||
++		     (drb->node >= DMAD_DRB_POOL_SIZE))) {
++		dmad_err("Ready-queue is empty or invalid node!\n");
++
++		spin_unlock_irqrestore(&drq->drb_pool_lock, lock_flags);
++		return -EBADR;
++	}
++
++	dmad_detach_node(drq->drb_pool,
++			 &drq->rdy_head, &drq->rdy_tail, drb->node);
++	dmad_attach_tail(drq->drb_pool,
++			 &drq->fre_head, &drq->fre_tail, drb->node);
++
++	drb->state = DMAD_DRB_STATE_FREE;
++	drb->sync = 0;
++
++	spin_unlock_irqrestore(&drq->drb_pool_lock, lock_flags);
++
++	return 0;
++}
++
++EXPORT_SYMBOL_GPL(dmad_free_drb);
++
++/**
++ * dmad_submit_request_internal - submit a dma-request-block to the dma channel
++ * @ch_req     : [in] Reference to the DMA request descriptor structure
++ * @drb        : [in] Reference to a drb to be submitted
++ * @keep_fired : [in] non-zero to kickoff dma even the channel has stopped due
++ *                    to finishing its previous request
++ * @return     : 0 if success, non-zero if any error
++ *
++ * Submit a DRB (DMA request block) of the given DMA channel to submission
++ * queue.  DRB is a single dma request which will be pushed into the
++ * submission queue of the given DMA channel.  This is a lightweight internal
++ * version of dmad_alloc_drb() majorly for use in ring mode.  Critical access to
++ * the drb pool should be protected before entering this function.
++ */
++static inline int dmad_submit_request_internal(dmad_drq * drq, dmad_drb * drb)
++{
++	if (drb->state == DMAD_DRB_STATE_READY) {
++		/* Detach user node from ready list */
++		dmad_detach_node(drq->drb_pool,
++				 &drq->rdy_head, &drq->rdy_tail, drb->node);
++
++		dmad_attach_tail(drq->drb_pool,
++				 &drq->sbt_head, &drq->sbt_tail, drb->node);
++
++		drb->state = DMAD_DRB_STATE_SUBMITTED;
++
++		dmad_dbg("%s() submit drb(%d 0x%08x) addr0(0x%08x) "
++			 "addr1(0x%08x) size(0x%08x) state(%d)\n", __func__,
++			 drb->node, (u32) drb, drb->src_addr, drb->dst_addr,
++			 drb->req_cycle, drb->state);
++	} else {
++		dmad_dbg("%s() skip drb(%d 0x%08x) addr0(0x%08x) addr1(0x%08x)"
++			 " size(0x%08x) state(%d)\n", __func__,
++			 drb->node, (u32) drb, drb->src_addr, drb->dst_addr,
++			 drb->req_cycle, drb->state);
++	}
++
++	return 0;
++}
++
++/**
++ * dmad_submit_request - submit a dma-request-block to the dma channel
++ * @ch_req     : [in] Reference to the DMA request descriptor structure
++ * @drb        : [in] Reference to a drb to be submitted
++ * @keep_fired : [in] non-zero to kickoff dma even the channel has stopped due
++ *                    to finishing its previous request
++ * @return     : 0 if success, non-zero if any error
++ *
++ * Submit a DRB (DMA request block) of the given DMA channel to submission
++ * queue.  DRB is a single dma request which will be pushed into the
++ * submission queue of the given DMA channel.
++ */
++int dmad_submit_request(dmad_chreq * ch_req, dmad_drb * drb, u8 keep_fired)
++{
++	dmad_drq *drq;
++	unsigned long lock_flags;
++	dmad_dbg("%s()\n", __func__);
++
++	if (unlikely(ch_req == NULL)) {
++		dmad_err("null ch_req!\n");
++		return -EFAULT;
++	}
++
++	drq = (dmad_drq *) ch_req->drq;
++
++	if (unlikely(drq == NULL)) {
++		dmad_err("null ch_req->drq!\n");
++		return -EBADR;
++	}
++	spin_lock_irqsave(&drq->drb_pool_lock, lock_flags);
++
++	/******************************************************
++	 * Following code require _safe_exit return path
++	 */
++
++	if (unlikely((drq->rdy_head == 0) || (drb->node == 0) ||
++		     (drb->node >= DMAD_DRB_POOL_SIZE))) {
++					printk("node error\n");
++		spin_unlock_irqrestore(&drq->drb_pool_lock, lock_flags);
++		return -EBADR;
++	}
++
++	/* Detach user node from ready list */
++	dmad_detach_node(drq->drb_pool, &drq->rdy_head, &drq->rdy_tail,
++			 drb->node);
++
++	/* Queue DRB to the end of the submitted list */
++	dmad_dbg("submit drb(%d 0x%08x) addr0(0x%08x) addr1(0x%08x) "
++		 "size(0x%08x) sync(0x%08x) fire(%d)\n",
++		 drb->node, (u32) drb, drb->src_addr, drb->dst_addr,
++		 drb->req_cycle, (u32) drb->sync, keep_fired);
++
++	/* Check if submission is performed to an empty queue */
++	if (unlikely(keep_fired && (drq->sbt_head == 0))) {
++		/* DMA is not running, so kick off transmission */
++		dmad_dbg("kickoff dma engine.\n");
++
++		dmad_attach_tail(drq->drb_pool,
++				 &drq->sbt_head, &drq->sbt_tail, drb->node);
++		/* Source and destination address */
++		if (drq->flags & DMAD_DRQ_DIR_A1_TO_A0) {
++			dout(drb->addr1, (unsigned long) drq->src_port);
++			dout(drb->addr0, (unsigned long) drq->dst_port);
++		} else {
++			dout(drb->addr0, (unsigned long) drq->src_port);
++			dout(drb->addr1, (unsigned long) drq->dst_port);
++		}
++
++		/* Transfer size (in units of source width) */
++		dout(drb->req_cycle, (unsigned long) drq->cyc_port);
++
++		/* Enable DMA channel (Kick off transmission when client
++		 * enable it's transfer state) */
++		dmad_enable_channel(drq);
++		drb->state = DMAD_DRB_STATE_EXECUTED;
++	} else {
++		/* DMA is already running, so only queue DRB to the end of the
++		 * list */
++		dmad_attach_tail(drq->drb_pool,
++				 &drq->sbt_head, &drq->sbt_tail, drb->node);
++		drb->state = DMAD_DRB_STATE_SUBMITTED;
++	}
++	spin_unlock_irqrestore(&drq->drb_pool_lock, lock_flags);
++
++	return 0;
++}
++
++EXPORT_SYMBOL_GPL(dmad_submit_request);
++
++/**
++ * dmad_withdraw_request - cancel a submitted dma-request-block
++ * @ch_req     : [in] Reference to the DMA request descriptor structure
++ * @drb        : [in] Reference to a drb to be submitted
++ * @keep_fired : [in] non-zero to kickoff dma even the channel has stopped due
++ *                    to finishing its previous request
++ * @return     : 0 if success, non-zero if any error
++ *
++ * Cancel a submitted DRB (DMA request block) of the given DMA channel in its
++ * submission queue.  DRB is a single dma request which will be pushed into the
++ * submission queue of the given DMA channel. Cancellation fails if the DRB has
++ * already been kicked off.
++ */
++int dmad_withdraw_request(dmad_chreq * ch_req, dmad_drb * drb)
++{
++	dmad_drq *drq = 0;
++	unsigned long lock_flags;
++
++	dmad_dbg("%s()\n", __func__);
++
++	if (unlikely(ch_req == NULL)) {
++		dmad_err("null ch_req!\n");
++		return -EFAULT;
++	}
++
++	drq = (dmad_drq *) ch_req->drq;
++
++	if (unlikely(drq == NULL)) {
++		dmad_err("null ch_req->drq!\n");
++		return -EBADR;
++	}
++
++	if (unlikely(drq->sbt_head == 0))
++		return -EBADR;
++
++	if (unlikely((drb->node == 0) || (drb->node >= DMAD_DRB_POOL_SIZE)))
++		return -EBADR;
++
++	spin_lock_irqsave(&drq->drb_pool_lock, lock_flags);
++
++	if (unlikely((drq->sbt_head == 0) || (drb->node == 0) ||
++		     (drb->state != DMAD_DRB_STATE_SUBMITTED) ||
++		     (drb->node >= DMAD_DRB_POOL_SIZE))) {
++		dmad_err("Submitted-queue is empty or invalid node!\n");
++
++		spin_unlock_irqrestore(&drq->drb_pool_lock, lock_flags);
++		return -EBADR;
++	}
++
++	dmad_dbg("cancel drb(%d 0x%08x) addr0(0x%08x) addr1(0x%08x) "
++		 "size(0x%08x) state(%d)\n",
++		 drb->node, (u32) drb, drb->src_addr, drb->dst_addr,
++		 drb->req_cycle, drb->state);
++
++	if (unlikely(drb->state == DMAD_DRB_STATE_EXECUTED)) {
++		dmad_dbg("Already running drb cannot be stopped currently!\n");
++
++		spin_unlock_irqrestore(&drq->drb_pool_lock, lock_flags);
++		return 0;/*-EBADR; */
++	}
++
++	dmad_detach_node(drq->drb_pool,
++			 &drq->rdy_head, &drq->rdy_tail, drb->node);
++	dmad_attach_tail(drq->drb_pool,
++			 &drq->fre_head, &drq->fre_tail, drb->node);
++
++	drb->state = DMAD_DRB_STATE_FREE;
++
++	if (drb->sync)
++		complete_all(drb->sync);
++	drb->sync = 0;
++
++	spin_unlock_irqrestore(&drq->drb_pool_lock, lock_flags);
++
++	return 0;
++}
++
++EXPORT_SYMBOL_GPL(dmad_withdraw_request);
++
++/**
++ * dmad_kickoff_requests_internal - kickoff hw DMA transmission
++ * @ch_req : [in] Reference to the DMA request descriptor structure
++ * @return : 0 if success, non-zero if any error
++ *
++ * Kickoff hw DMA transmission of the given DMA channel.  This function is
++ * valid for both ring & non-ring mode.  This is a lightweight internal version
++ * of dmad_kickoff_requests() majorly for use in ring mode.  Critical access to
++ * the drb pool should be protected before entering this function.
++ */
++static inline int dmad_kickoff_requests_internal(dmad_drq * drq)
++{
++	dmad_drb *drb;
++
++	dmad_get_head(drq->drb_pool, &drq->sbt_head, &drq->sbt_tail, &drb);
++
++	if (!drb) {
++		dmad_err("%s() null drb!\n", __func__);
++		return -EBADR;
++	}
++
++	dmad_dbg("%s() drb(%d 0x%08x) addr0(0x%08x) addr1(0x%08x) "
++		 "size(0x%08x) state(%d)\n", __func__,
++		 drb->node, (u32) drb, drb->src_addr, drb->dst_addr,
++		 drb->req_cycle, drb->state);
++
++	if (drb->state == DMAD_DRB_STATE_SUBMITTED) {
++		/* Transfer size (in units of source width) */
++		dout(drb->req_cycle, (unsigned long) drq->cyc_port);
++
++		/* Source and destination address */
++		if (drq->flags & DMAD_DRQ_DIR_A1_TO_A0) {
++			dout(drb->addr1, (unsigned long) drq->src_port);
++			dout(drb->addr0, (unsigned long) drq->dst_port);
++		} else {
++			dout(drb->addr0, (unsigned long) drq->src_port);
++			dout(drb->addr1, (unsigned long) drq->dst_port);
++		}
++
++		drb->state = DMAD_DRB_STATE_EXECUTED;
++	}
++
++	/* Enable DMA channel */
++	if (!dmad_is_channel_enabled(drq)) {
++		dmad_enable_channel(drq);
++	}
++
++	return 0;
++}
++
++/**
++ * dmad_kickoff_requests - kickoff hw DMA transmission of the given DMA channel
++ * @ch_req : [in] Reference to the DMA request descriptor structure
++ * @return : 0 if success, non-zero if any error
++ *
++ * Kickoff hw DMA transmission of the given DMA channel.  This function is
++ * valid for both ring & non-ring mode.
++ */
++int dmad_kickoff_requests(dmad_chreq * ch_req)
++{
++	dmad_drq *drq = 0;
++	dmad_drb *drb = 0;
++	unsigned long lock_flags;
++	dma_addr_t req_cycle;
++
++	dmad_dbg("%s()\n", __func__);
++
++	if (unlikely(ch_req == NULL)) {
++		dmad_err("null ch_req!\n");
++		return -EFAULT;
++	}
++
++	drq = (dmad_drq *) ch_req->drq;
++
++	if (unlikely(drq == NULL)) {
++		dmad_err("null ch_req->drq!\n");
++		return -EBADR;
++	}
++
++	spin_lock_irqsave(&drq->drb_pool_lock, lock_flags);
++
++	dmad_get_head(drq->drb_pool, &drq->sbt_head, &drq->sbt_tail, &drb);
++
++	dmad_dbg("drq(0x%08x) channel_base(0x%08x)\n",
++		 (u32) drq, drq->channel_base);
++	dmad_dbg("kick off drb(%d 0x%08x) addr0(0x%08x) addr1(0x%08x) "
++		 "size(0x%08x) state(%d) a1_to_a0(%d)\n",
++		 (u32) drb->node, (u32) drb, drb->addr0, drb->addr1,
++		 drb->req_cycle, drb->state,
++		 drq->flags & DMAD_DRQ_DIR_A1_TO_A0);
++
++	/* do nothing if no drbs are in the submission queue */
++	if (unlikely((drb == 0) || (drb->state != DMAD_DRB_STATE_SUBMITTED))) {
++		dmad_dbg("%s() invalid drb(%d 0x%08x) or drb-state(%d)!\n",
++			 __func__,
++			 drb->node, (u32) drb, drb ? drb->state : 0xffffffff);
++		spin_unlock_irqrestore(&drq->drb_pool_lock, lock_flags);
++		return 0;
++	}
++
++	req_cycle = drb->req_cycle;
++
++	if (unlikely(req_cycle == 0)) {
++		dmad_dbg("%s() zero transfer size!\n", __func__);
++		goto _safe_exit;
++	}
++
++	/* Transfer size (in units of source width) */
++	dout(req_cycle, (unsigned long) drq->cyc_port);
++
++	/* Source and destination address */
++	if (drq->flags & DMAD_DRQ_DIR_A1_TO_A0) {
++		dout(drb->addr1, (unsigned long) drq->src_port);
++		dout(drb->addr0, (unsigned long) drq->dst_port);
++	} else {
++		dout(drb->addr0, (unsigned long) drq->src_port);
++		dout(drb->addr1, (unsigned long) drq->dst_port);
++	}
++
++	drb->state = DMAD_DRB_STATE_EXECUTED;
++
++	/* Enable DMA channel */
++	dmad_enable_channel(drq);
++
++_safe_exit:
++	spin_unlock_irqrestore(&drq->drb_pool_lock, lock_flags);
++
++	return 0;
++}
++
++EXPORT_SYMBOL_GPL(dmad_kickoff_requests);
++
++/**
++ * dmad_probe_hw_ptr_src - probe DMA source hw-address of the given channel
++ * @ch_req : [in] Reference to the DMA request descriptor structure
++ * @return : physical address of current HW source pointer
++ *
++ * Probe DMA source hw-address of the given channel.
++ */
++dma_addr_t dmad_probe_hw_ptr_src(dmad_chreq * ch_req)
++{
++	return (dma_addr_t) din(((dmad_drq *) ch_req->drq)->src_port);
++}
++
++EXPORT_SYMBOL_GPL(dmad_probe_hw_ptr_src);
++
++/**
++ * dmad_probe_hw_ptr_dst - probe DMA destination hw-address of the given channel
++ * @ch_req : [in] Reference to the DMA request descriptor structure
++ * @return : physical address of current HW destination pointer
++ *
++ * Probe DMA destination hw-address of the given channel.
++ */
++dma_addr_t dmad_probe_hw_ptr_dst(dmad_chreq * ch_req)
++{
++	return (dma_addr_t) din(((dmad_drq *) ch_req->drq)->dst_port);
++}
++
++EXPORT_SYMBOL_GPL(dmad_probe_hw_ptr_dst);
++
++/**
++ * dmad_update_ring - update DMA ring buffer base && size of the given channel
++ * @ch_req : [in] Reference to the DMA request descriptor structure
++ * @size   : [in] The new ring buffer size, in unit of data width (cycles)
++ * @return : 0 if success, non-zero if any error
++ *
++ * Update DMA ring buffer size of the given channel.  This function is valid
++ * only if the channel is initialized as ring buffer mode.
++ */
++int dmad_update_ring(dmad_chreq * ch_req)
++{
++	unsigned long lock_flags;
++	dmad_drq *drq = (dmad_drq *) ch_req->drq;
++	int remnant;
++
++	if (unlikely(dmad_is_channel_enabled(drq))) {
++		dmad_err("%s() Error - dma channel should be "
++			 "disabled before updating ring size!\n", __func__);
++		return -EFAULT;
++	}
++
++	spin_lock_irqsave(&drq->drb_pool_lock, lock_flags);
++
++	/* todo: range checking */
++
++	remnant = (int)ch_req->ring_size -
++	    (int)ch_req->periods * (int)ch_req->period_size;
++	if (remnant == 0) {
++		drq->periods = ch_req->periods;
++	} else if (remnant > 0) {
++		drq->periods = ch_req->periods;	// + 1;
++	} else {
++		dmad_err("%s() Error - buffer_size < "
++			 "periods * period_size!\n", __func__);
++		spin_unlock_irqrestore(&drq->drb_pool_lock, lock_flags);
++		return -EFAULT;
++	}
++
++	drq->ring_base = ch_req->ring_base;
++	drq->ring_size = ch_req->ring_size;
++	drq->period_size = ch_req->period_size;
++	drq->remnant_size = (dma_addr_t) remnant;
++
++	if (ch_req->controller == DMAD_DMAC_AHB_CORE) {
++		drq->period_bytes =
++		    DMAC_CYCLE_TO_BYTES(drq->period_size, drq->data_width);
++	}
++
++	spin_unlock_irqrestore(&drq->drb_pool_lock, lock_flags);
++
++	dmad_dbg("%s() ring: base(0x%08x) port(0x%08x) periods(0x%08x) "
++		 "period_size(0x%08x) period_bytes(0x%08x) "
++		 "remnant_size(0x%08x)\n",
++		 __func__, drq->ring_base, drq->ring_port,
++		 drq->periods, drq->period_size, drq->period_bytes,
++		 drq->remnant_size);
++
++	return 0;
++}
++
++EXPORT_SYMBOL_GPL(dmad_update_ring);
++
++/**
++ * dmad_update_ring_sw_ptr - update DMA ring buffer sw-pointer
++ * @ch_req     : [in] Reference to the DMA request descriptor structure
++ * @sw_ptr     : [in] The new sw-pointer for the hw-pointer to chase of
++ * @keep_fired : [in] non-zero to kickoff dma even the channel has stopped due
++ *                    to finishing its previous request
++ * @return     : 0 if success, non-zero if any error
++ *
++ * Update DMA ring buffer sw-pointer of the given channel on the fly.  This
++ * function is valid only if the channel is initialized as ring buffer mode.
++ * Uint of sw_ptr is in number of dma data width.
++ */
++int dmad_update_ring_sw_ptr(dmad_chreq * ch_req,
++			    dma_addr_t sw_ptr, u8 keep_fired)
++{
++	dmad_drq *drq;
++	unsigned long lock_flags;
++	dma_addr_t hw_off = 0, ring_ptr;
++	dma_addr_t sw_p_off, ring_p_off, period_bytes;
++	dma_addr_t remnant_size;
++	int period_size;
++	int sw_p_idx, ring_p_idx, period, periods;
++	dmad_drb *drb = NULL;
++
++	/*if (ch_req == NULL) { */
++	/*    dmad_dbg("%s() null ch_req!\n", __func__); */
++	/*    return -EFAULT; */
++	/*} */
++
++	drq = (dmad_drq *) ch_req->drq;
++
++	/*if (drq == NULL) { */
++	/*    dmad_dbg("%s() null ch_req->drq!\n", __func__); */
++	/*    return -EBADR; */
++	/*} */
++
++	if (unlikely(sw_ptr > drq->ring_size)) {
++//		dmad_err("%s() Invalid ring buffer sw-pointer ");
++		return -EBADR;
++	}
++
++	spin_lock_irqsave(&drq->drb_pool_lock, lock_flags);
++
++	periods = drq->periods;
++	period_size = drq->period_size;
++	period_bytes = drq->period_bytes;
++	remnant_size = drq->remnant_size;
++
++	ring_ptr = drq->sw_ptr;
++	ring_p_idx = drq->sw_p_idx;
++	ring_p_off = drq->sw_p_off;
++
++	sw_p_idx = div_u64(sw_ptr, period_size);
++	__iter_div_u64_rem(sw_ptr, period_size, &sw_p_off);
++
++	if (remnant_size && (sw_p_idx == periods)) {
++		--sw_p_idx;
++		sw_p_off += period_size;
++	}
++
++	dmad_dbg("%s() ring_ptr(0x%08x) ring_p_idx(0x%08x) "
++		 "ring_p_off(0x%08x)\n",
++		 __func__, ring_ptr, ring_p_idx, ring_p_off);
++	dmad_dbg("%s() sw_ptr(0x%08x) sw_p_idx(0x%08x) sw_p_off(0x%08x)\n",
++		 __func__, sw_ptr, sw_p_idx, sw_p_off);
++
++	if (drq->ring_drb &&
++	    (drq->ring_drb->state & (DMAD_DRB_STATE_READY |
++				     DMAD_DRB_STATE_SUBMITTED |
++				     DMAD_DRB_STATE_EXECUTED))) {
++		drb = drq->ring_drb;
++	} else {
++		/* alloc new drb if there is none yet at ring_ptr */
++		if (0 != dmad_alloc_drb_internal(drq, &drb)) {
++			dmad_err("%s() drb allocation failed!\n", __func__);
++			spin_unlock_irqrestore(&drq->drb_pool_lock, lock_flags);
++			return -ENOSPC;
++		}
++		drb->addr0 = ((dma_addr_t) ring_p_idx * period_bytes) +
++		    drq->ring_base;
++		drb->addr1 = drq->dev_addr;
++		drb->req_cycle = 0;	// redundent, though, no harm to performance
++
++		dmad_dbg("init_drb(%d 0x%08x) addr0(0x%08x) addr1(0x%08x) "
++			 "size(0x%08x) state(%d)\n",
++			 (u32) drb->node, (u32) drb, drb->src_addr,
++			 drb->dst_addr, drb->req_cycle, drb->state);
++
++		drq->ring_drb = drb;
++	}
++
++	/* Following code-path has been optimized.  The design flow is expanded
++	 * below for reference.
++	 *
++	 *   if (sw_ptr >= ring_ptr)
++	 *       if (sw_p_idx == ring_p_idx)
++	 *           ring_drb::req_cycle <- sw_p_off
++	 *           if (ring_drb::state == executed)
++	 *               hw_cycle <- sw_p_idx
++	 *           fi
++	 *       else
++	 *           ring_drb::req_cycle <- period_size
++	 *           if (ring_drb::state == executed)
++	 *               hw_cycle <- period_size
++	 *           fi
++	 *           for (i = ring_p_idx+1 ~ sw_p_idx-1)
++	 *               new_drb::ring_addr <- i * period_bytes + ring_base
++	 *               new_drb::req_cycle <- period_size
++	 *           rof
++	 *           sw_drb::ring_addr <- sw_p_idx * period_bytes + ring_base
++	 *           sw_drb::req_cycle <- sw_p_off
++	 *   else
++	 *       // sw_ptr < ring_ptr
++	 *       ring_drb::req_cycle <- period_size
++	 *       if (ring_drb::state == executed)
++	 *           hw_cycle <- period_size
++	 *       fi
++	 *       for (i = ring_p_idx+1 ~ idx_max)
++	 *           new_drb::ring_addr <- i * period_bytes + ring_base
++	 *           new_drb::req_cycle <- period_size
++	 *       rof
++	 *       for (i = 0 ~ sw_p_idx-1)
++	 *           new_drb::ring_addr <- i * period_bytes + ring_base
++	 *           new_drb::req_cycle <- period_size
++	 *       rof
++	 *       sw_drb::ring_addr <- sw_p_idx * period_bytes + ring_base
++	 *       sw_drb::req_cycle <- sw_p_off
++	 *   fi
++	 */
++	if ((sw_ptr >= ring_ptr) && (sw_p_idx == ring_p_idx) && (sw_p_off != 0)) {
++
++		dmad_dbg("update ring drb\n");
++
++		/* update drb size at ring_ptr */
++		drb->req_cycle = sw_p_off;
++
++		dmad_dbg("ring_drb(%d 0x%08x) addr0(0x%08x) addr1(0x%08x) "
++			 "size(0x%08x) state(%d)\n",
++			 (u32) drb->node, (u32) drb, drb->addr0, drb->addr1,
++			 drb->req_cycle, drb->state);
++
++		/* update hw dma size of this drb if it has been sent to the
++		 * controller */
++		if (drb->state == DMAD_DRB_STATE_EXECUTED) {
++			dmad_disable_channel(drq);
++
++			if (ch_req->controller == DMAD_DMAC_AHB_CORE)
++				hw_off = DMAC_BYTES_TO_CYCLE((addr_t)
++							     din((addr_t) drq->
++								 ring_port) -
++							     (addr_t) drb->
++							     addr0,
++							     drq->data_width);
++
++			dmad_dbg("hw_off(0x%08x) sw_p_off(0x%08x)\n",
++				 (u32) hw_off, (u32) sw_p_off);
++
++			if (sw_p_off < hw_off)
++				dmad_err("%s() underrun! sw_p_off(0x%08x) <"
++					 " hw_off(0x%08x)\n", __func__,
++					 (u32) sw_p_off, (u32) hw_off);
++			else
++				dout(sw_p_off - hw_off, (unsigned long)drq->cyc_port);
++
++			dmad_enable_channel(drq);
++
++		} else {
++			dmad_submit_request_internal(drq, drb);
++		}
++
++	} else {
++
++		dmad_dbg("fulfill ring drb - sw_ptr(0x%08x) ring_ptr(0x%08x)\n",
++			 (u32) sw_ptr, (u32) ring_ptr);
++
++		/* fulfill last drb at ring_ptr */
++		if (ring_p_idx == (periods - 1))
++			drb->req_cycle = period_size + remnant_size;
++		else
++			drb->req_cycle = period_size;
++
++		dmad_dbg("ring_drb(%d 0x%08x) addr0(0x%08x) addr1(0x%08x) "
++			 "size(0x%08x) state(%d)\n",
++			 (u32) drb->node, (u32) drb, drb->addr0, drb->addr1,
++			 drb->req_cycle, drb->state);
++
++		if (drb->state == DMAD_DRB_STATE_EXECUTED) {
++			dmad_disable_channel(drq);
++
++			if (ch_req->controller == DMAD_DMAC_AHB_CORE)
++				hw_off = DMAC_BYTES_TO_CYCLE((addr_t)
++							     din((addr_t) drq->
++								 ring_port) -
++							     (addr_t) drb->
++							     addr0,
++							     drq->data_width);
++
++			dmad_dbg("hw_off(0x%08x) period_size(0x%08x)\n",
++				 (u32) hw_off, (u32) period_size);
++
++			if (ring_p_idx == (periods - 1)) {
++				if (period_size < hw_off)
++					dmad_err("%s() illegal! "
++						 "period_size(0x%08x) + "
++						 "remnant_size(0x%08x) < "
++						 "hw_off(0x%08x)\n", __func__,
++						 (u32) period_size,
++						 (u32) remnant_size,
++						 (u32) hw_off);
++				else
++					dout(period_size + remnant_size -
++					     hw_off, (unsigned long)drq->cyc_port);
++			} else {
++				if (period_size < hw_off)
++					dmad_err("%s() illegal! "
++						 "period_size(0x%08x) < "
++						 "hw_off(0x%08x)\n", __func__,
++						 (u32) period_size,
++						 (u32) hw_off);
++				else
++					dout(period_size - hw_off,
++					     (unsigned long)drq->cyc_port);
++			}
++
++			dmad_enable_channel(drq);
++
++		} else {
++			dmad_submit_request_internal(drq, drb);
++		}
++
++		++ring_p_idx;
++
++		/* adjust sw_ptr period index ahead by one ring cycle */
++		//if (sw_ptr < ring_ptr) {
++		if (sw_p_idx < ring_p_idx) {
++			sw_p_idx += periods;
++		}
++
++		/* allocate in-between (ring_ptr+1 to sw_ptr-1)
++		 * full-cycle drbs */
++		for (period = ring_p_idx; period < sw_p_idx; ++period) {
++			if (0 != dmad_alloc_drb_internal(drq, &drb)) {
++				dmad_err("%s() drb allocation failed!\n",
++					 __func__);
++				spin_unlock_irqrestore(&drq->drb_pool_lock,
++						       lock_flags);
++				return -ENOSPC;
++			}
++
++			drb->addr0 = (dma_addr_t) (period % periods) *
++			    period_bytes + drq->ring_base;
++			drb->addr1 = drq->dev_addr;
++
++			if (period == (periods - 1)) {
++				drb->req_cycle = period_size + remnant_size;
++			} else {
++				drb->req_cycle = period_size;
++			}
++
++			dmad_dbg("inbtw_drb(%d 0x%08x) addr0(0x%08x) "
++				 "addr1(0x%08x) size(0x%08x) state(%d)\n",
++				 (u32) drb->node, (u32) drb, drb->addr0,
++				 drb->addr1, drb->req_cycle, drb->state);
++
++			dmad_submit_request_internal(drq, drb);
++		}
++
++		/* allocate drb right at sw_ptr */
++		if (0 != dmad_alloc_drb_internal(drq, &drb)) {
++			dmad_err("%s() drb allocation failed!\n", __func__);
++			spin_unlock_irqrestore(&drq->drb_pool_lock, lock_flags);
++			return -ENOSPC;
++		}
++		drb->addr0 = (dma_addr_t) (sw_p_idx % periods) *
++		    period_bytes + drq->ring_base;
++		drb->addr1 = drq->dev_addr;
++		drb->req_cycle = sw_p_off;
++
++		dmad_dbg("swptr_drb(%d 0x%08x) addr0(0x%08x) addr1(0x%08x) "
++			 "size(0x%08x) state(%d)\n",
++			 (u32) drb->node, (u32) drb, drb->addr0, drb->addr1,
++			 drb->req_cycle, drb->state);
++
++		drq->ring_drb = drb;
++
++		if (sw_p_off > 0)
++			dmad_submit_request_internal(drq, drb);
++	}
++
++	__iter_div_u64_rem(sw_ptr, drq->ring_size, &drq->sw_ptr);
++	drq->sw_p_idx = sw_p_idx % periods;
++	drq->sw_p_off = sw_p_off;
++
++	if (likely(keep_fired)) {
++		dmad_kickoff_requests_internal(drq);
++	}
++
++	spin_unlock_irqrestore(&drq->drb_pool_lock, lock_flags);
++
++	return 0;
++}
++
++EXPORT_SYMBOL_GPL(dmad_update_ring_sw_ptr);
++
++/**
++ * dmad_probe_ring_hw_ptr - probe DMA ring buffer position of the given channel
++ * @ch_req     : [in] Reference to the DMA request descriptor structure
++ * @return     : Ring buffer position of current HW ring buffer pointer
++ *
++ * Probe DMA ring buffer position of the given channel.  The position is
++ * relative to the ring buffer base.  This function is valid only if the
++ * channel is initialized as ring buffer mode.
++ */
++dma_addr_t dmad_probe_ring_hw_ptr(dmad_chreq * ch_req)
++{
++	dmad_drq *drq = (dmad_drq *) ch_req->drq;
++	dma_addr_t cycles =
++	    (dma_addr_t) din(drq->ring_port) - (dma_addr_t) drq->ring_base;
++
++	if (ch_req->controller == DMAD_DMAC_AHB_CORE)
++		cycles = DMAC_BYTES_TO_CYCLE(cycles, drq->data_width);
++
++	return cycles;
++}
++
++EXPORT_SYMBOL_GPL(dmad_probe_ring_hw_ptr);
++
++/**
++ * dmad_channel_drain - cancel DMA transmission of the given DMA channel
++ * @controller : [in] One of the enum value of DMAD_DMAC_CORE
++ * @drq        : [in] Reference to the DMA queue structure (dmad_drq)
++ * @shutdown   : [in] Non-zero to force a immediate channel shutdown
++ * @return     : 0 if success, non-zero if any error
++ *
++ * Stop the DMA transmission and cancel all submitted requests of the given
++ * DMA channel.  This function drains a single channel and is the internal
++ * implementation of the interface routine dmad_drain_requests() and the
++ * module_exit function.
++ */
++static int dmad_channel_drain(u32 controller, dmad_drq * drq, u8 shutdown)
++{
++	dmad_drb *drb = 0;
++	unsigned long lock_flags;
++
++	if (unlikely(drq == NULL)) {
++		dmad_err("null ch_req->drq!\n");
++		return -EBADR;
++	}
++
++	spin_lock_irqsave(&drq->drb_pool_lock, lock_flags);
++
++	/* Stop DMA channel if forced to shutdown immediately */
++	if (shutdown) {
++		/* disable dma controller */
++		dmad_reset_channel(drq);
++
++		/* todo: more settings to stop DMA controller ?? */
++
++		/*if (drb->state == DMAD_DRB_STATE_EXECUTED) { */
++		/*} */
++	}
++
++	/* Detach DRBs in submit queue */
++	dmad_detach_head(drq->drb_pool, &drq->sbt_head, &drq->sbt_tail, &drb);
++
++	while (drb) {
++		dmad_dbg("cancel sbt drb(%d 0x%08x) addr0(0x%08x) "
++			 "addr1(0x%08x) size(0x%08x) state(%d)\n",
++			 drb->node, (u32) drb, drb->src_addr, drb->dst_addr,
++			 drb->req_cycle, (u32) drb->state);
++
++		/* Mark DRB state as abort */
++		drb->state = DMAD_DRB_STATE_ABORT;
++
++		if (drb->sync)
++			complete_all(drb->sync);
++
++		dmad_attach_tail(drq->drb_pool, &drq->fre_head, &drq->fre_tail,
++				 drb->node);
++
++		dmad_detach_head(drq->drb_pool, &drq->sbt_head, &drq->sbt_tail,
++				 &drb);
++	}
++
++	/* Detach DRBs in ready queue */
++	dmad_detach_head(drq->drb_pool, &drq->rdy_head, &drq->rdy_tail, &drb);
++
++	while (drb) {
++		dmad_dbg("cancel rdy drb(%d 0x%08x) addr0(0x%08x) "
++			 "addr1(0x%08x) size(0x%08x) state(%d)\n",
++			 drb->node, (u32) drb, drb->src_addr, drb->dst_addr,
++			 drb->req_cycle, (u32) drb->state);
++
++		/* Mark DRB state as abort */
++		drb->state = DMAD_DRB_STATE_ABORT;
++
++		dmad_attach_tail(drq->drb_pool, &drq->fre_head, &drq->fre_tail,
++				 drb->node);
++
++		/* Detach next submitted DRB (DMA Request Block) from the
++		 * DRQ (DMA Request Queue) */
++		dmad_detach_head(drq->drb_pool, &drq->rdy_head, &drq->rdy_tail,
++				 &drb);
++	}
++
++	drq->state |= DMAD_DRQ_STATE_ABORT;
++
++	drq->ring_drb = NULL;
++	drq->sw_ptr = 0;
++	drq->sw_p_idx = 0;
++	drq->sw_p_off = 0;
++
++	spin_unlock_irqrestore(&drq->drb_pool_lock, lock_flags);
++
++	if ( /*(drq->fre_head == 0) && */ (drq->flags & DMAD_FLAGS_SLEEP_BLOCK)) {
++		complete_all(&drq->drb_alloc_sync);
++	}
++
++	return 0;
++}
++
++/**
++ * dmad_cancel_requests - cancel DMA transmission of the given DMA channel
++ * @ch_req   : [in] Reference to the DMA request descriptor structure
++ * @shutdown : [in] Non-zero to force a immediate channel shutdown
++ * @return   : 0 if success, non-zero if any error
++ *
++ * Stop the DMA transmission and cancel all submitted requests of the given
++ * DMA channel.
++ */
++int dmad_drain_requests(dmad_chreq * ch_req, u8 shutdown)
++{
++	dmad_dbg("%s()\n", __func__);
++
++	if (ch_req == NULL) {
++		dmad_err("null ch_req!\n");
++		return -EFAULT;
++	}
++
++	return dmad_channel_drain(ch_req->controller, ch_req->drq, shutdown);
++}
++
++EXPORT_SYMBOL_GPL(dmad_drain_requests);
++
++/**
++ * dmad_probe_irq_source - probe DMA channel who asserts the shared sw-irq line
++ * @return : The channel number which asserts the shared sw-irq line
++ *
++ * Probe DMA channel who asserts the shared sw-irq line.
++ */
++int dmad_probe_irq_source_ahb(void)
++{
++	int channel;		/* interrupt channel number */
++
++	/* todo: spin_lock */
++
++	/* - Check DMA status register to get channel number */
++	for (channel = 0; channel < DMAD_AHB_MAX_CHANNELS; ++channel) {
++		if (getbl(channel+TC_OFFSET, (unsigned long)INT_STA))
++			return channel;
++	}
++
++	/* Perform DMA error checking if no valid channel was found who
++	 * assert the finish signal. */
++	for (channel = 0; channel < DMAD_AHB_MAX_CHANNELS; ++channel) {
++		if (getbl(channel+ERR_OFFSET, (unsigned long)INT_STA))
++			return channel;
++		if (getbl(channel+ABT_OFFSET, (unsigned long)INT_STA))
++			return channel;
++	}
++
++	/* todo: spin_unlock */
++
++	return -EFAULT;
++}
++
++EXPORT_SYMBOL_GPL(dmad_probe_irq_source_ahb);
++
++
++/**
++ * dmad_module_init - dma module-init function
++ * @return : 0 if success, non-zero if any error
++ */
++int dmad_module_init(void)
++{
++	int err = 0;
++	dmad_dbg("%s() >>\n", __func__);
++
++	/* clear device struct since the module may be load/unload many times */
++	memset(&dmad, 0, sizeof(dmad)-4);
++	dmad.drq_pool =
++	    kmalloc(DMAD_AHB_MAX_CHANNELS * sizeof(dmad_drq), GFP_KERNEL);
++	if (dmad.drq_pool == NULL) {
++		dmad_err("%s() failed to allocate drb pool!\n", __func__);
++		return -ENOMEM;
++	}
++	memset(dmad.drq_pool, 0,DMAD_AHB_MAX_CHANNELS*sizeof(dmad_drq));
++	spin_lock_init(&dmad.drq_pool_lock);
++	dmad.ahb_drq_pool = dmad.drq_pool;
++	dmad_dbg("DMA module init result: (%d)\n", err);
++	dmad_dbg("  AHB channels: %d\n;"
++		 "DRBs per channel: %d\n",
++		 DMAC_MAX_CHANNELS, DMAD_DRB_POOL_SIZE);
++
++	dmad_dbg("%s() return code (%d) <<\n", __func__, err);
++	return err;
++}
++
++/**
++ * dmad_module_init - dma module clean up function
++ */
++int __exit dmad_module_exit(struct platform_device *pdev)
++{
++	dmad_drq *drq;
++	u32 channel;
++	struct at_dma_platform_data *pdata;
++	pdata = dev_get_platdata(&pdev->dev);
++
++	dmad_dbg("%s() >>\n", __func__);
++
++	spin_lock(&dmad.drq_pool_lock);
++
++	/* cancel existing requests and unregister interrupt handler */
++	for (channel = 0; channel < DMAD_AHB_MAX_CHANNELS; ++channel) {
++
++		/* shutdown dma requests */
++		drq = (dmad_drq *) & dmad.ahb_drq_pool[channel];
++
++		if ((drq->state & DMAD_DRQ_STATE_READY) != 0)
++			dmad_channel_drain(DMAD_DMAC_AHB_CORE, drq, 1);
++
++		/* free registered irq handlers */
++		free_irq(ahb_irqs[channel], (void *)(unsigned long)(channel + 1));
++	}
++
++	spin_unlock(&dmad.drq_pool_lock);
++
++	if (dmad.drq_pool)
++		kfree(dmad.drq_pool);
++	memset(&dmad, 0, sizeof(dmad));
++
++	/* release I/O space */
++	release_region((uintptr_t)pdata->dmac_regs, resource_size(pdata->io));
++	dmad_dbg("DMA module unloaded!\n");
++
++	return 0;
++}
++
++#ifdef CONFIG_OF
++static const struct of_device_id atcdma100_of_id_table[] = {
++	{ .compatible = "andestech,atcdmac300" },
++	{}
++};
++MODULE_DEVICE_TABLE(of, atcdma100_of_id_table);
++
++static struct at_dma_platform_data *
++at_dma_parse_dt(struct platform_device *pdev)
++{
++	struct device_node *np = pdev->dev.of_node;
++	struct at_dma_platform_data *pdata;
++
++	if (!np) {
++		dev_err(&pdev->dev, "Missing DT data\n");
++		return NULL;
++	}
++
++	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
++	if (!pdata)
++		return NULL;
++
++	if (of_property_read_u32(np, "dma-channels", &pdata->nr_channels))
++		return NULL;
++
++	return pdata;
++}
++#else
++static inline struct at_dma_platform_data *
++at_dma_parse_dt(struct platform_device *pdev)
++{
++	return NULL;
++}
++#endif
++
++static int atcdma_probe(struct platform_device *pdev)
++{
++	struct at_dma_platform_data *pdata;
++	struct resource 	*io=0;
++	struct resource *mem = NULL;
++	int			irq;
++
++	pdata = dev_get_platdata(&pdev->dev);
++	dmad.plat = pdev;
++
++	if (!pdata)
++		pdata = at_dma_parse_dt(pdev);
++	pdev->dev.platform_data = pdata;
++	io = platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	pdata->io = io;
++	mem = request_mem_region(io->start, resource_size(io), pdev->name);
++
++	if (!mem){
++		printk("failed to get io memory region resouce.\n");
++		return -EINVAL;
++	}
++
++	pdata->dmac_regs = (void __iomem *) ioremap(mem->start, resource_size(io));
++	dmac_base = (uintptr_t)pdata->dmac_regs;
++
++	irq = platform_get_irq(pdev, 0);
++
++	if (irq < 0)
++		return irq;
++
++	intc_ftdmac020_init_irq(irq);
++
++	return dmad_module_init();
++
++}
++
++static int __exit atcdma_remove(struct platform_device *pdev)
++{
++	return dmad_module_exit(pdev);
++}
++
++
++static struct platform_driver atcdma100_driver = {
++	.probe		= atcdma_probe,
++	.remove		= __exit_p(atcdma_remove),
++	.driver = {
++		.name	= "atcdmac100",
++		.of_match_table = of_match_ptr(atcdma100_of_id_table),
++	},
++};
++
++static int __init atcdma_init(void)
++{
++	return platform_driver_register(&atcdma100_driver);
++}
++subsys_initcall(atcdma_init);
++
++#endif /* CONFIG_PLATFORM_AHBDMA */
+diff --git a/arch/riscv/platforms/dmad_intc.c b/arch/riscv/platforms/dmad_intc.c
+new file mode 100644
+index 000000000000..5f831add709a
+--- /dev/null
++++ b/arch/riscv/platforms/dmad_intc.c
+@@ -0,0 +1,49 @@
++/* SPDX-License-Identifier: GPL-2.0 */
++/*
++ * Copyright (C) 2018 Andes Technology Corporation
++ *
++ */
++
++#include <linux/irq.h>
++#include <linux/interrupt.h>
++#include <linux/ioport.h>
++#include <asm/io.h>
++#include <asm/dmad.h>
++
++#ifdef CONFIG_PLATFORM_AHBDMA
++extern int dmad_probe_irq_source_ahb(void);
++void AHBDMA_irq_rounter(struct irq_desc *desc)
++{
++	int ahb_irq;
++	struct irq_desc *ahb_desc;
++
++	raw_spin_lock(&desc->lock);
++	ahb_irq = dmad_probe_irq_source_ahb();
++
++	if (ahb_irq >= 0) {
++		ahb_irq += DMA_IRQ0;
++		ahb_desc = irq_to_desc(ahb_irq);
++		ahb_desc->irq_data.irq = ahb_irq;
++		raw_spin_unlock(&desc->lock);
++		ahb_desc->handle_irq(ahb_desc);
++		raw_spin_lock(&desc->lock);
++	}
++	desc->irq_data.chip->irq_unmask(&desc->irq_data);
++	raw_spin_unlock(&desc->lock);
++}
++
++int intc_ftdmac020_init_irq(int irq)
++{
++	int i;
++	int ret;
++	/* Register all IRQ */
++	for (i = DMA_IRQ0;
++	     i < DMA_IRQ0 + DMA_IRQ_COUNT; i++) {
++		// level trigger
++		ret = irq_set_chip(i, &dummy_irq_chip);
++		irq_set_handler(i, handle_simple_irq);
++	}
++	irq_set_chained_handler(irq, AHBDMA_irq_rounter);
++	return 0;
++}
++#endif /* CONFIG_PLATFORM_AHBDMA */
+--
+2.25.1
diff --git a/board/andes/ae350/patches/linux/0004-Andes-support-for-FTSDC.patch b/board/andes/ae350/patches/linux/0004-Andes-support-for-FTSDC.patch
new file mode 100644
index 0000000000..9e0fd7303b
--- /dev/null
+++ b/board/andes/ae350/patches/linux/0004-Andes-support-for-FTSDC.patch
@@ -0,0 +1,1884 @@
+From 8ffdbcee891ea3b127f34d0ff745d7578b487a71 Mon Sep 17 00:00:00 2001
+From: Yu Chien Peter Lin <peterlin@andestech.com>
+Date: Tue, 28 Dec 2021 16:16:45 +0800
+Subject: [PATCH 04/12] Andes support for FTSDC
+
+Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
+---
+ drivers/mmc/host/Kconfig    |   11 +-
+ drivers/mmc/host/Makefile   |    1 +
+ drivers/mmc/host/ftsdc010.c | 1557 +++++++++++++++++++++++++++++++++++
+ drivers/mmc/host/ftsdc010.h |  257 ++++++
+ 4 files changed, 1825 insertions(+), 1 deletion(-)
+ create mode 100644 drivers/mmc/host/ftsdc010.c
+ create mode 100644 drivers/mmc/host/ftsdc010.h
+
+diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
+index 30ff42fd173e..834cdb8b73cc 100644
+--- a/drivers/mmc/host/Kconfig
++++ b/drivers/mmc/host/Kconfig
+@@ -503,7 +503,7 @@ config MMC_OMAP_HS
+
+ config MMC_WBSD
+	tristate "Winbond W83L51xD SD/MMC Card Interface support"
+-	depends on ISA_DMA_API && !M68K
++	depends on ISA_DMA_API
+	help
+	  This selects the Winbond(R) W83L51xD Secure digital and
+	  Multimedia card Interface.
+@@ -608,6 +608,15 @@ config MMC_DAVINCI
+	  If you have an DAVINCI board with a Multimedia Card slot,
+	  say Y or M here.  If unsure, say N.
+
++config MMC_FTSDC
++	tristate "Andestech SDC Multimedia Card Interface support"
++	depends on RISCV
++	help
++	  This selects the TI DAVINCI Multimedia card Interface.
++	  If you have an DAVINCI board with a Multimedia Card slot,
++	  say Y or M here.  If unsure, say N.
++
++
+ config MMC_GOLDFISH
+	tristate "goldfish qemu Multimedia Card Interface support"
+	depends on GOLDFISH || COMPILE_TEST
+diff --git a/drivers/mmc/host/Makefile b/drivers/mmc/host/Makefile
+index 451c25fc2c69..fbc58512f23a 100644
+--- a/drivers/mmc/host/Makefile
++++ b/drivers/mmc/host/Makefile
+@@ -34,6 +34,7 @@ obj-$(CONFIG_MMC_ATMELMCI)	+= atmel-mci.o
+ obj-$(CONFIG_MMC_TIFM_SD)	+= tifm_sd.o
+ obj-$(CONFIG_MMC_MVSDIO)	+= mvsdio.o
+ obj-$(CONFIG_MMC_DAVINCI)       += davinci_mmc.o
++obj-$(CONFIG_MMC_FTSDC)         += ftsdc010.o
+ obj-$(CONFIG_MMC_GOLDFISH)	+= android-goldfish.o
+ obj-$(CONFIG_MMC_SPI)		+= mmc_spi.o
+ ifeq ($(CONFIG_OF),y)
+diff --git a/drivers/mmc/host/ftsdc010.c b/drivers/mmc/host/ftsdc010.c
+new file mode 100644
+index 000000000000..940b4c03787c
+--- /dev/null
++++ b/drivers/mmc/host/ftsdc010.c
+@@ -0,0 +1,1557 @@
++/* drivers/mmc/host/ftsdc010.c
++ *  Copyright (C) 2010 Andestech
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ */
++#include <linux/module.h>
++#include <linux/dma-mapping.h>
++#include <linux/clk.h>
++#include <linux/mmc/host.h>
++#include <linux/mmc/mmc.h>
++#include <linux/mmc/card.h>
++#include <linux/platform_device.h>
++#include <linux/debugfs.h>
++#include <linux/seq_file.h>
++#include <linux/irq.h>
++#include <linux/interrupt.h>
++#include <linux/delay.h>
++#include <linux/slab.h>
++#include <linux/of.h>
++#include <linux/of_device.h>
++#include <asm/io.h>
++#include <asm/dmad.h>
++#include "ftsdc010.h"
++#include "../core/core.h"
++
++#define DRIVER_NAME "ftsdc010"
++#define REG_READ(addr) readl((host->base + addr))
++#define REG_WRITE(data, addr) writel((data), (host->base + addr))
++
++enum dbg_channels {
++	dbg_err   = (1 << 0),
++	dbg_debug = (1 << 1),
++	dbg_info  = (1 << 2),
++	dbg_irq   = (1 << 3),
++	dbg_sg    = (1 << 4),
++	dbg_dma   = (1 << 5),
++	dbg_pio   = (1 << 6),
++	dbg_fail  = (1 << 7),
++	dbg_conf  = (1 << 8),
++};
++
++static struct workqueue_struct *mywq;
++
++static const int dbgmap_err   = dbg_fail;
++static const int dbgmap_info  = dbg_info | dbg_conf;
++static const int dbgmap_debug = dbg_err | dbg_debug | dbg_info | dbg_conf;
++#define dbg(host, channels, args...)		  \
++	do {					  \
++	if (dbgmap_err & channels) 		  \
++		dev_err(&host->pdev->dev, args);  \
++	else if (dbgmap_info & channels)	  \
++		dev_info(&host->pdev->dev, args); \
++	else if (dbgmap_debug & channels)	  \
++		dev_dbg(&host->pdev->dev, args);  \
++	} while (0)
++static void finalize_request(struct ftsdc_host *host);
++static void ftsdc_send_request(struct mmc_host *mmc);
++#ifdef CONFIG_MMC_DEBUG
++static void dbg_dumpregs(struct ftsdc_host *host, char *prefix)
++{
++	u32 con, cmdarg, r0, r1, r2, r3, rcmd, dcon, dtimer,
++	    dlen, sta, clr, imask, pcon, ccon, bwidth, scon1,
++	    scon2, ssta, fea;
++
++	con	= REG_READ(SDC_CMD_REG);
++	cmdarg	= REG_READ(SDC_ARGU_REG);
++	r0	= REG_READ(SDC_RESPONSE0_REG);
++	r1	= REG_READ(SDC_RESPONSE1_REG);
++	r2	= REG_READ(SDC_RESPONSE2_REG);
++	r3	= REG_READ(SDC_RESPONSE3_REG);
++	rcmd	= REG_READ(SDC_RSP_CMD_REG);
++	dcon	= REG_READ(SDC_DATA_CTRL_REG);
++	dtimer	= REG_READ(SDC_DATA_TIMER_REG);
++	dlen	= REG_READ(SDC_DATA_LEN_REG);
++	sta	= REG_READ(SDC_STATUS_REG);
++	clr	= REG_READ(SDC_CLEAR_REG);
++	imask	= REG_READ(SDC_INT_MASK_REG);
++	pcon	= REG_READ(SDC_POWER_CTRL_REG);
++	ccon	= REG_READ(SDC_CLOCK_CTRL_REG);
++	bwidth	= REG_READ(SDC_BUS_WIDTH_REG);
++	scon1	= REG_READ(SDC_SDIO_CTRL1_REG);
++	scon2	= REG_READ(SDC_SDIO_CTRL2_REG);
++	ssta	= REG_READ(SDC_SDIO_STATUS_REG);
++	fea	= REG_READ(SDC_FEATURE_REG);
++
++	dbg(host, dbg_debug, "%s CON:[%08x]  STA:[%08x]  INT:[%08x], PWR:[%08x], CLK:[%08x]\n",
++				prefix, con, sta, imask, pcon, ccon);
++
++	dbg(host, dbg_debug, "%s DCON:[%08x] DTIME:[%08x]"
++			       " DLEN:[%08x] DWIDTH:[%08x]\n",
++				prefix, dcon, dtimer, dlen, bwidth);
++
++	dbg(host, dbg_debug, "%s R0:[%08x]   R1:[%08x]"
++			       "   R2:[%08x]   R3:[%08x]\n",
++			       prefix, r0, r1, r2, r3);
++
++	dbg(host, dbg_debug, "%s SCON1:[%08x]   SCON2:[%08x]"
++			       "   SSTA:[%08x]   FEA:[%08x]\n",
++				prefix, scon1, scon2, ssta, fea);
++}
++
++static void prepare_dbgmsg(struct ftsdc_host *host, struct mmc_command *cmd,
++			   int stop)
++{
++	snprintf(host->dbgmsg_cmd, 300,
++		 "#%u%s op:%i arg:0x%08x flags:0x08%x retries:%u",
++		 host->ccnt, (stop ? " (STOP)" : ""),
++		 cmd->opcode, cmd->arg, cmd->flags, cmd->retries);
++
++	if (cmd->data) {
++		snprintf(host->dbgmsg_dat, 300,
++			 "#%u bsize:%u blocks:%u bytes:%u",
++			 host->dcnt, cmd->data->blksz,
++			 cmd->data->blocks,
++			 cmd->data->blocks * cmd->data->blksz);
++	} else {
++		host->dbgmsg_dat[0] = '\0';
++	}
++}
++
++static void dbg_dumpcmd(struct ftsdc_host *host, struct mmc_command *cmd,
++			int fail)
++{
++	unsigned int dbglvl = fail ? dbg_fail : dbg_debug;
++
++	if (!cmd)
++		return;
++
++	if (cmd->error == 0) {
++		dbg(host, dbglvl, "CMD[OK] %s R0:0x%08x\n",
++			host->dbgmsg_cmd, cmd->resp[0]);
++	} else {
++		dbg(host, dbglvl, "CMD[ERR %i] %s Status:%s\n",
++			cmd->error, host->dbgmsg_cmd, host->status);
++	}
++
++	if (!cmd->data)
++		return;
++
++	if (cmd->data->error == 0) {
++		dbg(host, dbglvl, "DAT[OK] %s\n", host->dbgmsg_dat);
++	} else {
++		dbg(host, dbglvl, "DAT[ERR %i] %s DCNT:0x%08x\n",
++			cmd->data->error, host->dbgmsg_dat,
++			REG_READ(SDC_DATA_LEN_REG));
++	}
++}
++#else
++static void dbg_dumpcmd(struct ftsdc_host *host,
++			struct mmc_command *cmd, int fail) { }
++
++static void prepare_dbgmsg(struct ftsdc_host *host, struct mmc_command *cmd,
++			   int stop) { }
++
++static void dbg_dumpregs(struct ftsdc_host *host, char *prefix) { }
++
++#endif /* CONFIG_MMC_DEBUG */
++
++static inline bool ftsdc_dmaexist(struct ftsdc_host *host)
++{
++	return (host->dma_req != NULL);
++}
++
++static inline u32 enable_imask(struct ftsdc_host *host, u32 imask)
++{
++	u32 newmask;
++
++#ifdef CONFIG_MMC_DEBUG
++	if (imask & SDC_STATUS_REG_SDIO_INTR) printk("\n*** E ***\n");
++#endif
++	newmask = REG_READ(SDC_INT_MASK_REG);
++	newmask |= imask;
++
++	REG_WRITE(newmask, SDC_INT_MASK_REG);
++
++	return newmask;
++}
++
++static inline u32 disable_imask(struct ftsdc_host *host, u32 imask)
++{
++	u32 newmask;
++
++#ifdef CONFIG_MMC_DEBUG
++	if (imask & SDC_STATUS_REG_SDIO_INTR) printk("\n*** D ***\n");
++#endif
++	newmask = REG_READ(SDC_INT_MASK_REG);
++	newmask &= ~imask;
++
++	REG_WRITE(newmask, SDC_INT_MASK_REG);
++
++	return newmask;
++}
++
++static inline void clear_imask(struct ftsdc_host *host)
++{
++	u32 mask = REG_READ(SDC_INT_MASK_REG);
++
++	/* preserve the SDIO IRQ mask state */
++	mask &= (SDC_INT_MASK_REG_SDIO_INTR | SDC_INT_MASK_REG_CARD_CHANGE);
++	REG_WRITE(mask, SDC_INT_MASK_REG);
++}
++
++static inline void get_data_buffer(struct ftsdc_host *host)
++{
++	struct scatterlist *sg;
++
++	BUG_ON(host->buf_sgptr >= host->mrq->data->sg_len);
++
++	sg = &host->mrq->data->sg[host->buf_sgptr];
++
++	host->buf_bytes = sg->length;
++	host->buf_ptr = host->dodma ? (u32 *)sg->dma_address : sg_virt(sg);
++	host->buf_sgptr++;
++}
++
++static inline u32 cal_blksz(unsigned int blksz)
++{
++	u32 blksztwo = 0;
++
++	while (blksz >>= 1)
++		blksztwo++;
++
++	return blksztwo;
++}
++
++/**
++ * ftsdc_enable_irq - enable IRQ, after having disabled it.
++ * @host: The device state.
++ * @more: True if more IRQs are expected from transfer.
++ *
++ * Enable the main IRQ if needed after it has been disabled.
++ *
++ * The IRQ can be one of the following states:
++ *	- enable after data read/write
++ *	- disable when handle data read/write
++ */
++static void ftsdc_enable_irq(struct ftsdc_host *host, bool enable)
++{
++	unsigned long flags;
++	local_irq_save(flags);
++
++	host->irq_enabled = enable;
++
++	if (enable)
++		enable_irq(host->irq);
++	else
++		disable_irq(host->irq);
++
++	local_irq_restore(flags);
++}
++
++static void do_pio_read(struct ftsdc_host *host)
++{
++	u32 fifo;
++	u32 fifo_words;
++	u32 *ptr;
++	u32 status;
++	u32 retry = 0;
++
++	BUG_ON(host->buf_bytes != 0);
++
++	while (host->buf_sgptr < host->mrq->data->sg_len) {
++		get_data_buffer(host);
++
++		dbg(host, dbg_pio,
++		    "pio_read(): new target: [%i]@[%p]\n",
++		    host->buf_bytes, host->buf_ptr);
++
++		while (host->buf_bytes) {
++			status = REG_READ(SDC_STATUS_REG);
++			if (status & SDC_STATUS_REG_FIFO_OVERRUN) {
++				fifo = host->fifo_len > host->buf_bytes ?
++					host->buf_bytes : host->fifo_len;
++				dbg(host, dbg_pio,
++				    "pio_read(): fifo:[%02i] buffer:[%03i] dcnt:[%08X]\n",
++				    fifo, host->buf_bytes,
++				    REG_READ(SDC_DATA_LEN_REG));
++				host->buf_bytes -= fifo;
++				host->buf_count += fifo;
++				fifo_words = fifo >> 2;
++				ptr = host->buf_ptr;
++				while (fifo_words--)
++					*ptr++ = REG_READ(SDC_DATA_WINDOW_REG);
++				host->buf_ptr = ptr;
++				if (fifo & 3) {
++					u32 n = fifo & 3;
++					u32 data = REG_READ(SDC_DATA_WINDOW_REG);
++					u8 *p = (u8 *)host->buf_ptr;
++
++					while (n--) {
++						*p++ = data;
++						data >>= 8;
++					}
++				}
++			} else {
++				udelay(1);
++				if (++retry >= SDC_PIO_RETRY) {
++					host->mrq->data->error = -EIO;
++					goto err;
++				}
++			}
++		}
++	}
++err:
++
++	host->buf_active = XFER_NONE;
++	host->complete_what = COMPLETION_FINALIZE;
++}
++
++static void do_pio_write(struct ftsdc_host *host)
++{
++	u32 fifo;
++	u32 *ptr;
++	u32 status;
++	u32 retry = 0;
++
++	BUG_ON(host->buf_bytes != 0);
++
++	while (host->buf_sgptr < host->mrq->data->sg_len) {
++		get_data_buffer(host);
++
++		dbg(host, dbg_pio,
++		    "pio_write(): new source: [%i]@[%p]\n",
++		    host->buf_bytes, host->buf_ptr);
++
++		while (host->buf_bytes) {
++			status = REG_READ(SDC_STATUS_REG);
++			if (status & SDC_STATUS_REG_FIFO_UNDERRUN) {
++				fifo = host->fifo_len > host->buf_bytes ?
++					host->buf_bytes : host->fifo_len;
++
++				dbg(host, dbg_pio,
++				    "pio_write(): fifo:[%02i] buffer:[%03i] dcnt:[%08X]\n",
++				    fifo, host->buf_bytes,
++				    REG_READ(SDC_DATA_LEN_REG));
++
++				host->buf_bytes -= fifo;
++				host->buf_count += fifo;
++
++				fifo = (fifo + 3) >> 2;
++				ptr = host->buf_ptr;
++				while (fifo--) {
++					REG_WRITE(*ptr, SDC_DATA_WINDOW_REG);
++					ptr++;
++				}
++				host->buf_ptr = ptr;
++			} else {
++				udelay(1);
++				if (++retry >= SDC_PIO_RETRY) {
++					host->mrq->data->error = -EIO;
++					goto err;
++				}
++			}
++		}
++	}
++
++err:
++	host->buf_active = XFER_NONE;
++	host->complete_what = COMPLETION_FINALIZE;
++}
++
++static void do_dma_access(struct ftsdc_host *host)
++{
++	int res;
++	unsigned long timeout;
++	dmad_chreq *req = host->dma_req;
++	dmad_drb *drb = 0;
++
++	while (host->buf_sgptr < host->mrq->data->sg_len) {
++
++		reinit_completion(&host->dma_complete);
++		get_data_buffer(host);
++
++		dbg(host, dbg_dma,
++		    "dma_%s(): new target: [%i]@[%p]\n",
++		    host->buf_active == XFER_READ ? "read" : "write",
++		    host->buf_bytes, host->buf_ptr);
++
++		res = dmad_alloc_drb(req, &drb);
++
++		if (res != 0 || (drb == 0)) {
++			dbg(host, dbg_err, "%s() Failed to allocate dma request block!\n", __func__);
++			host->mrq->data->error = -ENODEV;
++			goto err;
++		}
++		drb->addr0 = host->mem->start + SDC_DATA_WINDOW_REG;
++		drb->addr1 = (dma_addr_t)host->buf_ptr;
++		drb->req_cycle = dmad_bytes_to_cycles(req, host->buf_bytes);
++		drb->sync = &host->dma_complete;
++		timeout = SDC_TIMEOUT_BASE*((host->buf_bytes+511)>>9);
++		res =  dmad_submit_request(req, drb, 1);
++		if (res != 0) {
++			dbg(host, dbg_err, "%s() Failed to submit dma request block!\n", __func__);
++			host->mrq->data->error = -ENODEV;
++			goto err;
++		}
++		dbg(host, dbg_err, "reach here!\n");
++		if (wait_for_completion_timeout(&host->dma_complete, timeout) == 0) {
++			dbg(host, dbg_err, "%s: read timeout\n", __func__);
++			host->mrq->data->error = -ETIMEDOUT;
++			goto err;
++		}
++	}
++
++	host->dma_finish = true;
++err:
++	host->buf_active = XFER_NONE;
++	host->complete_what = COMPLETION_FINALIZE;
++}
++
++static void ftsdc_work(struct work_struct *work)
++{
++	struct ftsdc_host *host =
++		container_of(work, struct ftsdc_host, work);
++
++	ftsdc_enable_irq(host, false);
++	if (host->dodma) {
++		do_dma_access(host);
++	} else {
++		if (host->buf_active == XFER_WRITE)
++			do_pio_write(host);
++
++		if (host->buf_active == XFER_READ)
++			do_pio_read(host);
++	}
++
++	tasklet_schedule(&host->pio_tasklet);
++	ftsdc_enable_irq(host, true);
++}
++
++static void pio_tasklet(unsigned long data)
++{
++	struct ftsdc_host *host = (struct ftsdc_host *) data;
++
++	if (host->complete_what == COMPLETION_XFER_PROGRESS) {
++		queue_work(mywq, (struct work_struct *)&host->work);
++		return;
++	}
++
++	if (host->complete_what == COMPLETION_FINALIZE) {
++		clear_imask(host);
++		if (host->buf_active != XFER_NONE) {
++			dbg(host, dbg_err, "unfinished %s "
++			    "- buf_count:[%u] buf_bytes:[%u]\n",
++			    (host->buf_active == XFER_READ) ? "read" : "write",
++			    host->buf_count, host->buf_bytes);
++
++			if (host->mrq->data)
++				host->mrq->data->error = -EINVAL;
++		}
++
++		finalize_request(host);
++	}
++}
++
++static void finalize_request(struct ftsdc_host *host)
++{
++	struct mmc_request *mrq = host->mrq;
++	struct mmc_command *cmd;
++	u32 con;
++	int debug_as_failure = 0;
++	if (host->complete_what != COMPLETION_FINALIZE)
++		return;
++
++	if (!mrq)
++		return;
++
++	cmd = host->cmd_is_stop ? mrq->stop : mrq->cmd;
++
++	if (cmd->data && (cmd->error == 0) &&
++	    (cmd->data->error == 0)) {
++		if (host->dodma && (!host->dma_finish)) {
++			dbg(host, dbg_dma, "DMA Missing (%d)!\n",
++			    host->dma_finish);
++			return;
++		}
++		host->dodma = false;
++	}
++
++	/* Read response from controller. */
++	if (cmd->flags & MMC_RSP_136) {
++		cmd->resp[3] = REG_READ(SDC_RESPONSE0_REG);
++		cmd->resp[2] = REG_READ(SDC_RESPONSE1_REG);
++		cmd->resp[1] = REG_READ(SDC_RESPONSE2_REG);
++		cmd->resp[0] = REG_READ(SDC_RESPONSE3_REG);
++	} else if (cmd->flags & MMC_RSP_PRESENT) {
++		cmd->resp[0] = REG_READ(SDC_RESPONSE0_REG);
++	}
++
++	if (cmd->error)
++		debug_as_failure = 1;
++
++	if (cmd->data && cmd->data->error)
++		debug_as_failure = 1;
++
++	dbg_dumpcmd(host, cmd, debug_as_failure);
++
++	clear_imask(host);
++	con = REG_READ(SDC_STATUS_REG);
++	con &= ~SDC_CLEAR_REG_SDIO_INTR;
++	REG_WRITE(con, SDC_CLEAR_REG);
++
++	if (cmd->data && cmd->error)
++		cmd->data->error = cmd->error;
++
++	if (cmd->data && cmd->data->stop && (!host->cmd_is_stop)) {
++		host->cmd_is_stop = 1;
++		ftsdc_send_request(host->mmc);
++		return;
++	}
++
++	/* If we have no data transfer we are finished here */
++	if (!mrq->data)
++		goto request_done;
++
++	/* Calulate the amout of bytes transfer if there was no error */
++	if (mrq->data->error == 0) {
++		mrq->data->bytes_xfered =
++			(mrq->data->blocks * mrq->data->blksz);
++	} else {
++		mrq->data->bytes_xfered = 0;
++	}
++
++request_done:
++	host->complete_what = COMPLETION_NONE;
++	host->mrq = NULL;
++
++	host->last_opcode = mrq->cmd->opcode;
++	mmc_request_done(host->mmc, mrq);
++}
++
++static void ftsdc_send_command(struct ftsdc_host *host,
++					struct mmc_command *cmd)
++{
++	u32 ccon = 0;
++	u32 newmask = 0;
++	u32 scon;
++
++	if (cmd->data) {
++		host->complete_what = COMPLETION_XFER_PROGRESS;
++		newmask |= SDC_INT_MASK_REG_RSP_TIMEOUT;
++	} else if (cmd->flags & MMC_RSP_PRESENT) {
++		host->complete_what = COMPLETION_RSPFIN;
++		newmask |= SDC_INT_MASK_REG_RSP_TIMEOUT;
++	} else {
++		host->complete_what = COMPLETION_CMDSENT;
++		newmask |= SDC_INT_MASK_REG_CMD_SEND;
++	}
++
++	ccon |= cmd->opcode & SDC_CMD_REG_INDEX;
++	ccon |= SDC_CMD_REG_CMD_EN;
++
++	if (cmd->flags & MMC_RSP_PRESENT) {
++		ccon |= SDC_CMD_REG_NEED_RSP;
++		newmask |= SDC_INT_MASK_REG_RSP_CRC_OK |
++			SDC_INT_MASK_REG_RSP_CRC_FAIL;
++	}
++
++	if (cmd->flags & MMC_RSP_136)
++		ccon |= SDC_CMD_REG_LONG_RSP;
++
++	/* applicatiion specific cmd must follow an MMC_APP_CMD. The
++	 * value will be updated in finalize_request function */
++	if (host->last_opcode == MMC_APP_CMD)
++		ccon |= SDC_CMD_REG_APP_CMD;
++
++	enable_imask(host, newmask);
++	REG_WRITE(cmd->arg, SDC_ARGU_REG);
++
++	scon = REG_READ(SDC_SDIO_CTRL1_REG);
++	if (host->mmc->card != NULL && mmc_card_sdio(host->mmc->card))
++		scon |= SDC_SDIO_CTRL1_REG_SDIO_ENABLE;
++	else
++		scon &= ~SDC_SDIO_CTRL1_REG_SDIO_ENABLE;
++	REG_WRITE(scon, SDC_SDIO_CTRL1_REG);
++
++	dbg_dumpregs(host, "");
++	dbg(host, dbg_debug, "CON[%x]\n", ccon);
++
++	REG_WRITE(ccon, SDC_CMD_REG);
++}
++
++static int ftsdc_setup_data(struct ftsdc_host *host, struct mmc_data *data)
++{
++	u32 dcon, newmask = 0;
++
++	/* configure data transfer paramter */
++	if (!data)
++		return 0;
++	if(host->mmc->card && host->mmc->card->type==(unsigned int)MMC_TYPE_SD){
++		if (((data->blksz - 1) & data->blksz) != 0) {
++			pr_warn("%s: can't do non-power-of 2 sized block transfers (blksz %d)\n", __func__, data->blksz);
++			return -EINVAL;
++		}
++	}
++
++	if (data->blksz <= 2) {
++		/* We cannot deal with unaligned blocks with more than
++		 * one block being transfered. */
++
++		if (data->blocks > 1) {
++			pr_warn("%s: can't do non-word sized block transfers (blksz %d)\n", __func__, data->blksz);
++			return -EINVAL;
++		}
++	}
++
++	/* data length */
++	dcon = data->blksz * data->blocks;
++	REG_WRITE(dcon, SDC_DATA_LEN_REG);
++
++	/* write data control */
++	dcon = 0;
++	dcon = cal_blksz(data->blksz);
++
++	/* enable UNDERFUN will trigger interrupt immediatedly
++	 * So setup it when rsp is received successfully
++	 */
++	if (data->flags & MMC_DATA_WRITE) {
++		dcon |= SDC_DATA_CTRL_REG_DATA_WRITE;
++	} else {
++		dcon &= ~SDC_DATA_CTRL_REG_DATA_WRITE;
++		newmask |= SDC_INT_MASK_REG_FIFO_OVERRUN;
++	}
++
++	/* always reset fifo since last transfer may fail */
++	dcon |= SDC_DATA_CTRL_REG_FIFO_RST;
++
++	/* enable data transfer which will be pended until cmd is send */
++	dcon |= SDC_DATA_CTRL_REG_DATA_EN;
++	if (ftsdc_dmaexist(host) &&
++			((data->blksz * data->blocks) & 0xf) == 0) {
++		newmask &= ~SDC_INT_MASK_REG_FIFO_OVERRUN;
++		dcon |= SDC_DATA_CTRL_REG_DMA_EN;
++		dcon |= SDC_DMA_TYPE_4;
++		host->dodma = true;
++
++	}
++	REG_WRITE(dcon, SDC_DATA_CTRL_REG);
++	/* add to IMASK register */
++	newmask |= SDC_INT_MASK_REG_DATA_CRC_FAIL |
++			SDC_INT_MASK_REG_DATA_TIMEOUT;
++
++	enable_imask(host, newmask);
++	/* handle sdio */
++	dcon = SDC_SDIO_CTRL1_REG_READ_WAIT_ENABLE & REG_READ(SDC_SDIO_CTRL1_REG);
++	dcon |= data->blksz | data->blocks << 15;
++	if (1 < data->blocks)
++		dcon |= SDC_SDIO_CTRL1_REG_SDIO_BLK_MODE;
++	REG_WRITE(dcon, SDC_SDIO_CTRL1_REG);
++
++	return 0;
++}
++
++#define BOTH_DIR (MMC_DATA_WRITE | MMC_DATA_READ)
++
++static int ftsdc_prepare_buffer(struct ftsdc_host *host, struct mmc_data *data)
++{
++	int rw = (data->flags & MMC_DATA_WRITE) ? 1 : 0;
++
++	if ((!host->mrq) || (!host->mrq->data))
++		return -EINVAL;
++
++	BUG_ON((data->flags & BOTH_DIR) == BOTH_DIR);
++	host->buf_sgptr = 0;
++	host->buf_bytes = 0;
++	host->buf_count = 0;
++	host->buf_active = rw ? XFER_WRITE : XFER_READ;
++	if (host->dodma) {
++		u32 dma_len;
++		u32 drb_size;
++		dma_len = dma_map_sg(mmc_dev(host->mmc), data->sg, data->sg_len,
++				     rw ? DMA_TO_DEVICE : DMA_FROM_DEVICE);
++		if (dma_len == 0)
++			return -ENOMEM;
++
++		dmad_config_channel_dir(host->dma_req,
++				rw ? DMAD_DIR_A1_TO_A0 : DMAD_DIR_A0_TO_A1);
++		drb_size = dmad_max_size_per_drb(host->dma_req);
++		if (drb_size < (data->blksz & data->blocks))
++			return -ENODEV;
++
++		host->dma_finish = false;
++	}
++	return 0;
++}
++
++static irqreturn_t ftsdc_irq(int irq, void *dev_id)
++{
++	struct ftsdc_host *host = dev_id;
++	struct mmc_command *cmd;
++	u32 mci_status;
++	u32 mci_clear;
++	u32 mci_imsk;
++	unsigned long iflags;
++
++	mci_status = REG_READ(SDC_STATUS_REG);
++	mci_imsk = REG_READ(SDC_INT_MASK_REG);
++
++	dbg(host, dbg_debug, "irq: status:0x%08x, mask : %08x\n", mci_status, mci_imsk);
++
++	if (mci_status & SDC_STATUS_REG_SDIO_INTR) {
++		if (mci_imsk & SDC_INT_MASK_REG_SDIO_INTR) {
++			mci_clear = SDC_CLEAR_REG_SDIO_INTR;
++			REG_WRITE(mci_clear, SDC_CLEAR_REG);
++
++			mmc_signal_sdio_irq(host->mmc);
++			return IRQ_HANDLED;
++		}
++	}
++
++	spin_lock_irqsave(&host->complete_lock, iflags);
++
++	mci_status = REG_READ(SDC_STATUS_REG);
++	mci_clear = 0;
++
++	if (mci_status & SDC_STATUS_REG_CARD_CHANGE) {
++		if ((mci_status & SDC_STATUS_REG_CARD_DETECT)
++			== SDC_CARD_INSERT) {
++			host->status = "card insert";
++			mmc_detect_change(host->mmc, msecs_to_jiffies(500));
++		} else {
++			host->status = "card remove";
++		}
++		mci_clear |= SDC_CLEAR_REG_CARD_CHANGE;
++		dbg(host, dbg_irq, "%s\n", host->status);
++
++		if (host->complete_what != COMPLETION_NONE) {
++			host->mrq->cmd->error = -EIO;
++			goto close_transfer;
++		}
++
++		goto irq_out;
++	}
++
++	if ((host->complete_what == COMPLETION_NONE) ||
++	    (host->complete_what == COMPLETION_FINALIZE)) {
++		host->status = "nothing to complete";
++		mci_clear = -1u;
++		goto irq_out;
++	}
++
++	if (!host->mrq) {
++		host->status = "no active mrq";
++		clear_imask(host);
++		goto irq_out;
++	}
++
++	cmd = host->cmd_is_stop ? host->mrq->stop : host->mrq->cmd;
++
++	if (!cmd) {
++		host->status = "no active cmd";
++		clear_imask(host);
++		goto irq_out;
++	}
++
++	if (mci_status & SDC_STATUS_REG_CMD_SEND) {
++		mci_clear |= SDC_CLEAR_REG_CMD_SEND;
++
++		if (host->complete_what == COMPLETION_CMDSENT) {
++			host->status = "ok: command sent";
++			goto close_transfer;
++		} else {
++			host->status = "error: command sent(status not match)";
++			cmd->error = -EINVAL;
++			goto fail_transfer;
++		}
++	}
++
++	/* handle error status */
++	if (mci_status & SDC_STATUS_REG_RSP_TIMEOUT) {
++		dbg(host, dbg_err, "CMDSTAT: error RSP TIMEOUT\n");
++		mci_clear |= SDC_CLEAR_REG_RSP_TIMEOUT;
++		cmd->error = -ETIMEDOUT;
++		host->status = "error: response timeout";
++		goto fail_transfer;
++	}
++
++	if (mci_status & SDC_STATUS_REG_RSP_CRC_FAIL) {
++		mci_clear |= SDC_CLEAR_REG_RSP_CRC_FAIL;
++		/* This is wierd hack */
++		if (cmd->flags & MMC_RSP_CRC) {
++			dbg(host, dbg_err, "CMDSTAT: error RSP CRC\n");
++			cmd->error = -EILSEQ;
++			host->status = "error: RSP CRC failed";
++			goto fail_transfer;
++		} else {
++			host->status = "R3 or R4 type command";
++			goto close_transfer;
++		}
++	}
++
++	if (mci_status & SDC_STATUS_REG_RSP_CRC_OK) {
++		mci_clear |= SDC_CLEAR_REG_RSP_CRC_OK;
++
++		if (host->complete_what == COMPLETION_XFER_PROGRESS) {
++			REG_WRITE(mci_clear, SDC_CLEAR_REG);
++
++			host->status = "RSP recv OK";
++			if (!cmd->data)
++				goto close_transfer;
++
++			if (host->dodma) {
++				tasklet_schedule(&host->pio_tasklet);
++				host->status = "dma access";
++				goto irq_out;
++			}
++
++			if (host->buf_active == XFER_WRITE)
++				enable_imask(host, SDC_INT_MASK_REG_FIFO_UNDERRUN);
++		} else if (host->complete_what == COMPLETION_RSPFIN) {
++			goto close_transfer;
++		}
++	}
++
++	/* handler data transfer */
++	if (mci_status & SDC_STATUS_REG_DATA_TIMEOUT) {
++		dbg(host, dbg_err, "CMDSTAT: error DATA TIMEOUT\n");
++		mci_clear |= SDC_CLEAR_REG_DATA_TIMEOUT;
++		cmd->error = -ETIMEDOUT;
++		host->status = "error: data timeout";
++		goto fail_transfer;
++	}
++
++	if (mci_status & SDC_STATUS_REG_DATA_CRC_FAIL) {
++		dbg(host, dbg_err, "CMDSTAT: error DATA CRC\n");
++		mci_clear |= SDC_CLEAR_REG_DATA_CRC_FAIL;
++		cmd->error = -EILSEQ;
++		host->status = "error: data CRC fail";
++		goto fail_transfer;
++	}
++
++	if ((mci_status & SDC_STATUS_REG_FIFO_UNDERRUN) ||
++		mci_status & SDC_STATUS_REG_FIFO_OVERRUN) {
++
++		disable_imask(host, SDC_INT_MASK_REG_FIFO_OVERRUN |
++				SDC_INT_MASK_REG_FIFO_UNDERRUN);
++
++		if (!host->dodma) {
++			if (host->buf_active == XFER_WRITE) {
++				tasklet_schedule(&host->pio_tasklet);
++				host->status = "pio tx";
++			} else if (host->buf_active == XFER_READ) {
++
++				tasklet_schedule(&host->pio_tasklet);
++				host->status = "pio rx";
++			}
++		}
++	}
++
++	goto irq_out;
++
++fail_transfer:
++	host->buf_active = XFER_NONE;
++
++close_transfer:
++	host->complete_what = COMPLETION_FINALIZE;
++
++	clear_imask(host);
++	tasklet_schedule(&host->pio_tasklet);
++
++irq_out:
++	REG_WRITE(mci_clear, SDC_CLEAR_REG);
++
++	dbg(host, dbg_debug, "irq: %s\n", host->status);
++	spin_unlock_irqrestore(&host->complete_lock, iflags);
++	return IRQ_HANDLED;
++}
++
++static void ftsdc_send_request(struct mmc_host *mmc)
++{
++	struct ftsdc_host *host = mmc_priv(mmc);
++	struct mmc_request *mrq = host->mrq;
++	struct mmc_command *cmd = host->cmd_is_stop ? mrq->stop : mrq->cmd;
++
++	host->ccnt++;
++	prepare_dbgmsg(host, cmd, host->cmd_is_stop);
++	dbg(host, dbg_debug, "%s\n", host->dbgmsg_cmd);
++
++	if (cmd->data) {
++		int res = ftsdc_setup_data(host, cmd->data);
++
++		host->dcnt++;
++
++		if (res) {
++			dbg(host, dbg_err, "setup data error %d\n", res);
++			cmd->error = res;
++			cmd->data->error = res;
++
++			mmc_request_done(mmc, mrq);
++			return;
++		}
++
++		res = ftsdc_prepare_buffer(host, cmd->data);
++
++		if (res) {
++			dbg(host, dbg_err, "data prepare error %d\n", res);
++			cmd->error = res;
++			cmd->data->error = res;
++
++			mmc_request_done(mmc, mrq);
++			return;
++		}
++	}
++
++	/* Send command */
++	ftsdc_send_command(host, cmd);
++}
++
++static int ftsdc_get_cd(struct mmc_host *mmc)
++{
++	struct ftsdc_host *host = mmc_priv(mmc);
++
++	u32 con = REG_READ(SDC_STATUS_REG);
++		dbg(host, dbg_debug, "get_cd status:%.8x\n\n", con);
++
++	return (con & SDC_STATUS_REG_CARD_DETECT) ? 0 : 1;
++}
++
++static void ftsdc_request(struct mmc_host *mmc, struct mmc_request *mrq)
++{
++	struct ftsdc_host *host = mmc_priv(mmc);
++	host->status = "mmc request";
++	host->cmd_is_stop = 0;
++	host->mrq = mrq;
++	if (ftsdc_get_cd(mmc) == 0) {
++		dbg(host, dbg_err, "%s: no medium present\n", __func__);
++		host->mrq->cmd->error = -ENOMEDIUM;
++		mmc_request_done(mmc, mrq);
++	} else {
++		ftsdc_send_request(mmc);
++	}
++	dbg(host, dbg_debug, "send request \n");
++}
++
++static void ftsdc_set_clk(struct ftsdc_host *host, struct mmc_ios *ios)
++{
++	u32 clk_div = 0;
++	u32 con;
++	struct ftsdc_mmc_config *pdata = host->pdev->dev.platform_data;
++	u32 freq = pdata->max_freq;
++
++	dbg(host, dbg_debug, "request clk : %u \n", ios->clock);
++	con = REG_READ(SDC_CLOCK_CTRL_REG);
++	if (ios->clock == 0) {
++		host->real_rate = 0;
++		con |= SDC_CLOCK_CTRL_REG_CLK_DIS;
++	} else {
++		clk_div = (freq / (ios->clock << 1)) - 1;
++		host->real_rate = freq / ((clk_div+1)<<1);
++		if (host->real_rate > ios->clock) {
++			++clk_div;
++			host->real_rate = freq / ((clk_div+1)<<1);
++		}
++		if (clk_div > 127)
++			dbg(host, dbg_err, "%s: no match clock rate, %u\n", __func__, ios->clock);
++
++		con = (con & ~SDC_CLOCK_CTRL_REG_CLK_DIV) | (clk_div & SDC_CLOCK_CTRL_REG_CLK_DIV);
++		con &= ~SDC_CLOCK_CTRL_REG_CLK_DIS;
++	}
++
++	REG_WRITE(con, SDC_CLOCK_CTRL_REG);
++}
++
++static void ftsdc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
++{
++	struct ftsdc_host *host = mmc_priv(mmc);
++	u32 con;
++
++	con = REG_READ(SDC_POWER_CTRL_REG);
++	switch (ios->power_mode) {
++	case MMC_POWER_ON:
++	case MMC_POWER_UP:
++		con |= SDC_POWER_CTRL_REG_POWER_ON;
++		break;
++	case MMC_POWER_OFF:
++	default:
++		con &= ~SDC_POWER_CTRL_REG_POWER_ON;
++		break;
++	}
++
++	REG_WRITE(con, SDC_POWER_CTRL_REG);
++
++	ftsdc_set_clk(host, ios);
++
++	if ((ios->power_mode == MMC_POWER_ON) ||
++	    (ios->power_mode == MMC_POWER_UP)) {
++		dbg(host, dbg_debug, "running at %ukHz (requested: %ukHz).\n",
++			host->real_rate/1000, ios->clock/1000);
++	} else {
++		dbg(host, dbg_debug, "powered down.\n");
++	}
++
++	host->bus_width = ios->bus_width;
++	/* write bus configure */
++	con = REG_READ(SDC_BUS_WIDTH_REG);
++
++	con &= ~(SDC_BUS_WIDTH_REG_SINGLE_BUS |
++			SDC_BUS_WIDTH_REG_WIDE_4_BUS |
++			SDC_BUS_WIDTH_REG_WIDE_8_BUS);
++	if (host->bus_width == MMC_BUS_WIDTH_1)
++		con |= SDC_BUS_WIDTH_REG_SINGLE_BUS;
++	else if (host->bus_width == MMC_BUS_WIDTH_4)
++		con |= SDC_BUS_WIDTH_REG_WIDE_4_BUS;
++	else if (host->bus_width == MMC_BUS_WIDTH_8)
++		con |= SDC_BUS_WIDTH_REG_WIDE_8_BUS;
++	else {
++		dbg(host, dbg_err, "set_ios: can't support bus mode");
++	}
++	REG_WRITE(con, SDC_BUS_WIDTH_REG);
++
++	/*set rsp and data timeout */
++	con = -1;
++	REG_WRITE(con, SDC_DATA_TIMER_REG);
++	if (ios->power_mode == MMC_POWER_UP)
++		mmc_delay(250);
++}
++
++static int ftsdc_get_ro(struct mmc_host *mmc)
++{
++	struct ftsdc_host *host = mmc_priv(mmc);
++	u32 con = REG_READ(SDC_STATUS_REG);
++	dbg(host, dbg_debug, "get_ro status:%.8x\n", con);
++
++	return (con & SDC_STATUS_REG_CARD_LOCK) ? 1 : 0;
++}
++
++
++static void ftsdc_enable_sdio_irq(struct mmc_host *mmc, int enable)
++{
++	struct ftsdc_host *host = mmc_priv(mmc);
++	unsigned long flags;
++	u32 con;
++#ifdef CONFIG_MMC_DEBUG
++	u32 ena;
++#endif
++
++	local_irq_save(flags);
++
++	con = REG_READ(SDC_INT_MASK_REG);
++#ifdef CONFIG_MMC_DEBUG
++	ena = (con & SDC_STATUS_REG_SDIO_INTR) ? 1:0;
++	if (ena == enable)
++		printk("\n*** XXX ***\n");
++#endif
++
++	con = enable ? (con | SDC_STATUS_REG_SDIO_INTR) : (con & ~SDC_STATUS_REG_SDIO_INTR);
++	REG_WRITE(con, SDC_INT_MASK_REG);
++
++#ifdef CONFIG_MMC_DEBUG
++	//check and ensure data out to SD host controller
++	ena = (REG_READ(SDC_INT_MASK_REG) & SDC_STATUS_REG_SDIO_INTR) ? 1:0;
++	if (ena != enable) {
++		printk("\n*** YYY ***\n");
++	}
++#endif
++
++	local_irq_restore(flags);
++}
++
++static struct mmc_host_ops ftsdc_ops = {
++	.request	= ftsdc_request,
++	.set_ios	= ftsdc_set_ios,
++	.get_ro		= ftsdc_get_ro,
++	.get_cd		= ftsdc_get_cd,
++	.enable_sdio_irq = ftsdc_enable_sdio_irq,
++};
++
++#ifdef CONFIG_DEBUG_FS
++
++static int ftsdc_state_show(struct seq_file *seq, void *v)
++{
++	struct ftsdc_host *host = seq->private;
++
++	seq_printf(seq, "Register base = 0x%08x\n", (u32)host->base);
++	seq_printf(seq, "Clock rate = %u\n", host->real_rate);
++	seq_printf(seq, "host status = %s\n", host->status);
++	seq_printf(seq, "IRQ = %d\n", host->irq);
++	seq_printf(seq, "IRQ enabled = %d\n", host->irq_enabled);
++	seq_printf(seq, "complete what = %d\n", host->complete_what);
++	seq_printf(seq, "dma support = %d\n", ftsdc_dmaexist(host));
++	seq_printf(seq, "use dma = %d\n", host->dodma);
++
++	return 0;
++}
++
++static int ftsdc_state_open(struct inode *inode, struct file *file)
++{
++	return single_open(file, ftsdc_state_show, inode->i_private);
++}
++
++static const struct file_operations ftsdc_fops_state = {
++	.owner		= THIS_MODULE,
++	.open		= ftsdc_state_open,
++	.read		= seq_read,
++	.llseek		= seq_lseek,
++	.release	= single_release,
++};
++
++#define DBG_REG(_r) { .addr = SDC_## _r ## _REG, .name = #_r }
++
++struct ftsdc_reg {
++	unsigned short	addr;
++	unsigned char	*name;
++} debug_regs[] = {
++	DBG_REG(CMD),
++	DBG_REG(ARGU),
++	DBG_REG(RESPONSE0),
++	DBG_REG(RESPONSE1),
++	DBG_REG(RESPONSE2),
++	DBG_REG(RESPONSE3),
++	DBG_REG(RSP_CMD),
++	DBG_REG(DATA_CTRL),
++	DBG_REG(DATA_TIMER),
++	DBG_REG(DATA_LEN),
++	DBG_REG(STATUS),
++	DBG_REG(CLEAR),
++	DBG_REG(INT_MASK),
++	DBG_REG(POWER_CTRL),
++	DBG_REG(CLOCK_CTRL),
++	DBG_REG(BUS_WIDTH),
++	DBG_REG(SDIO_CTRL1),
++	DBG_REG(SDIO_CTRL2),
++	DBG_REG(SDIO_STATUS),
++	DBG_REG(FEATURE),
++	DBG_REG(REVISION),
++	{}
++};
++
++static int ftsdc_regs_show(struct seq_file *seq, void *v)
++{
++	struct ftsdc_host *host = seq->private;
++	struct ftsdc_reg *rptr = debug_regs;
++
++	for (; rptr->name; rptr++)
++		seq_printf(seq, "SDI%s\t=0x%08x\n", rptr->name,
++			   REG_READ(rptr->addr));
++
++	return 0;
++}
++
++static int ftsdc_regs_open(struct inode *inode, struct file *file)
++{
++	return single_open(file, ftsdc_regs_show, inode->i_private);
++}
++
++static const struct file_operations ftsdc_fops_regs = {
++	.owner		= THIS_MODULE,
++	.open		= ftsdc_regs_open,
++	.read		= seq_read,
++	.llseek		= seq_lseek,
++	.release	= single_release,
++};
++
++static void ftsdc_debugfs_attach(struct ftsdc_host *host)
++{
++	struct device *dev = &host->pdev->dev;
++
++	host->debug_root = debugfs_create_dir(dev_name(dev), NULL);
++	if (IS_ERR(host->debug_root)) {
++		dev_err(dev, "failed to create debugfs root\n");
++		return;
++	}
++
++	host->debug_state = debugfs_create_file("state", 0444,
++						host->debug_root, host,
++						&ftsdc_fops_state);
++
++	if (IS_ERR(host->debug_state))
++		dev_err(dev, "failed to create debug state file\n");
++
++	host->debug_regs = debugfs_create_file("regs", 0444,
++					       host->debug_root, host,
++					       &ftsdc_fops_regs);
++
++	if (IS_ERR(host->debug_regs))
++		dev_err(dev, "failed to create debug regs file\n");
++}
++
++static void ftsdc_debugfs_remove(struct ftsdc_host *host)
++{
++	debugfs_remove(host->debug_regs);
++	debugfs_remove(host->debug_state);
++	debugfs_remove(host->debug_root);
++}
++
++#else
++static inline void ftsdc_debugfs_attach(struct ftsdc_host *host) { }
++static inline void ftsdc_debugfs_remove(struct ftsdc_host *host) { }
++
++#endif /* CONFIG_DEBUG_FS */
++
++#if (defined(CONFIG_PLATFORM_AHBDMA) || defined(CONFIG_PLATFORM_APBDMA))
++static int ftsdc_alloc_dma(struct ftsdc_host *host)
++{
++	dmad_chreq *req = host->dma_req;
++	req = kzalloc(sizeof(dmad_chreq), GFP_KERNEL);
++#ifdef CONFIG_PLATFORM_APBDMA
++	req->apb_req.addr0_ctrl  = APBBR_ADDRINC_FIXED;  /* (in)  APBBR_ADDRINC_xxx */
++/* for amerald */
++#if !defined(CONFIG_PLAT_AE3XX)
++	if((inl(pmu_base) & AMERALD_MASK) == AMERALD_PRODUCT_ID){
++		req->apb_req.addr0_reqn	= APBBR_REQN_SDC_AMERALD;
++	}else
++#endif
++	{
++		req->apb_req.addr0_reqn  = APBBR_REQN_SDC;       /* (in)  APBBR_REQN_xxx (also used to help determine bus selection) */
++	}
++	req->apb_req.addr1_ctrl  = APBBR_ADDRINC_I4X;    /* (in)  APBBR_ADDRINC_xxx */
++	req->apb_req.addr1_reqn  = APBBR_REQN_NONE;      /* (in)  APBBR_REQN_xxx (also used to help determine bus selection) */
++	req->apb_req.burst_mode  = 1;                    /* (in)  Burst mode (0: no burst 1-, 1: burst 4- data cycles per dma cycle) */
++	req->apb_req.data_width  = APBBR_DATAWIDTH_4;    /* (in)  APBBR_DATAWIDTH_4(word), APBBR_DATAWIDTH_2(half-word), APBBR_DATAWIDTH_1(byte) */
++	req->apb_req.tx_dir      = DMAD_DIR_A0_TO_A1;    /* (in)  DMAD_DIR_A0_TO_A1, DMAD_DIR_A1_TO_A0 */
++	req->controller          = DMAD_DMAC_APB_CORE;   /* (in)  DMAD_DMAC_AHB_CORE, DMAD_DMAC_APB_CORE */
++	req->flags               = DMAD_FLAGS_SLEEP_BLOCK | DMAD_FLAGS_BIDIRECTION;
++
++	if (dmad_channel_alloc(req) == 0) {
++		dbg(host, dbg_debug, "%s: APB dma channel allocated (ch: %d)\n", __func__, req->channel);
++		host->dma_req = req;
++		return 0;
++	}
++
++	memset(req, 0, sizeof(dmad_chreq));
++	dbg(host, dbg_info, "%s: APB dma channel allocation failed\n", __func__);
++#endif /* CONFIG_PLATFORM_APBDMA */
++
++#ifdef CONFIG_PLATFORM_AHBDMA
++	req->ahb_req.sync         = 1;                    /* (in)  non-zero if src and dst have different clock domain */
++	req->ahb_req.priority     = DMAC_CSR_CHPRI_1;     /* (in)  DMAC_CSR_CHPRI_0 (lowest) ~ DMAC_CSR_CHPRI_3 (highest) */
++	req->ahb_req.hw_handshake = 1;                    /* (in)  non-zero to enable hardware handshake mode */
++	req->ahb_req.burst_size   = DMAC_CSR_SIZE_4;      /* (in)  DMAC_CSR_SIZE_1 ~ DMAC_CSR_SIZE_256 */
++	req->ahb_req.addr0_width  = DMAC_CSR_WIDTH_32;    /* (in)  DMAC_CSR_WIDTH_8, DMAC_CSR_WIDTH_16, or DMAC_CSR_WIDTH_32 */
++	req->ahb_req.addr0_ctrl   = DMAC_CSR_AD_FIX;      /* (in)  DMAC_CSR_AD_INC, DMAC_CSR_AD_DEC, or DMAC_CSR_AD_FIX */
++	req->ahb_req.addr0_reqn   = DMAC_REQN_SDC;        /* (in)  DMAC_REQN_xxx (also used to help determine channel number) */
++	req->ahb_req.addr1_width  = DMAC_CSR_WIDTH_32;    /* (in)  DMAC_CSR_WIDTH_8, DMAC_CSR_WIDTH_16, or DMAC_CSR_WIDTH_32 */
++	req->ahb_req.addr1_ctrl   = DMAC_CSR_AD_INC;      /* (in)  DMAC_CSR_AD_INC, DMAC_CSR_AD_DEC, or DMAC_CSR_AD_FIX */
++	req->ahb_req.addr1_reqn   = DMAC_REQN_NONE;       /* (in)  DMAC_REQN_xxx (also used to help determine channel number) */
++	req->ahb_req.tx_dir       = DMAD_DIR_A0_TO_A1;    /* (in)  DMAD_DIR_A0_TO_A1, DMAD_DIR_A1_TO_A0 */
++
++	req->controller           = DMAD_DMAC_AHB_CORE;   /* (in)  DMAD_DMAC_AHB_CORE, DMAD_DMAC_APB_CORE */
++	req->flags                = DMAD_FLAGS_SLEEP_BLOCK | DMAD_FLAGS_BIDIRECTION;
++
++	if (dmad_channel_alloc(req) == 0) {
++		dbg(host, dbg_debug, "%s: AHB dma channel allocated (ch: %d)\n", __func__, req->channel);
++		host->dma_req = req;
++		return 0;
++	}
++	dbg(host, dbg_info, "%s: AHB dma channel allocation failed\n", __func__);
++#endif
++
++	kfree(req);
++	return -ENODEV;
++
++}
++#endif
++
++enum {
++	MMC_CTLR_VERSION_1 = 0,
++	MMC_CTLR_VERSION_2,
++};
++
++
++static struct platform_device_id ftsdc_mmc_devtype[] = {
++	{
++		.name	= "ag101p",
++		.driver_data = MMC_CTLR_VERSION_1,
++	}, {
++		.name	= "ae3xx",
++		.driver_data = MMC_CTLR_VERSION_2,
++	},
++	{},
++};
++MODULE_DEVICE_TABLE(platform, ftsdc_mmc_devtype);
++
++static const struct of_device_id ftsdc_mmc_dt_ids[] = {
++	{
++		.compatible = "andestech,atfsdc010",
++		.data = &ftsdc_mmc_devtype[MMC_CTLR_VERSION_1],
++	},
++	{
++		.compatible = "andestech,atfsdc010",
++		.data = &ftsdc_mmc_devtype[MMC_CTLR_VERSION_2],
++	},
++	{},
++};
++MODULE_DEVICE_TABLE(of, ftsdc_mmc_dt_ids);
++
++
++static struct ftsdc_mmc_config
++	*mmc_parse_pdata(struct platform_device *pdev)
++{
++	struct device_node *np;
++	struct ftsdc_mmc_config *pdata = pdev->dev.platform_data;
++	const struct of_device_id *match =
++		of_match_device(of_match_ptr(ftsdc_mmc_dt_ids), &pdev->dev);
++	u32 data;
++
++	np = pdev->dev.of_node;
++	if (!np)
++		return pdata;
++
++	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
++	pdev->dev.platform_data = (void *)pdata;
++
++	if (!pdata) {
++		dev_err(&pdev->dev, "Failed to allocate memory for struct ftsdc_mmc_config\n");
++		goto nodata;
++	}
++
++	if (match)
++		pdev->id_entry = match->data;
++
++	if (of_property_read_u32(np, "max-frequency", &pdata->max_freq))
++		dev_info(&pdev->dev, "'max-frequency' property not specified, defaulting to 25MHz\n");
++
++	of_property_read_u32(np, "bus-width", &data);
++	switch (data) {
++	case 1:
++	case 4:
++	case 8:
++		pdata->wires = data;
++		break;
++	default:
++		pdata->wires = 1;
++/*
++		dev_info(&pdev->dev, "Unsupported buswidth, defaulting to 1 bit\n");
++*/
++	}
++nodata:
++	return pdata;
++}
++
++static int __init ftsdc_probe(struct platform_device *pdev)
++{
++	struct ftsdc_host *host;
++	struct mmc_host	*mmc;
++	struct ftsdc_mmc_config *pdata = NULL;
++	struct resource *r, *mem = NULL;
++	int ret = -ENOMEM;
++	u32 con;
++	int irq = 0;
++	size_t mem_size;
++
++	pdata = mmc_parse_pdata(pdev);
++	if (pdata == NULL) {
++		dev_err(&pdev->dev, "Couldn't get platform data\n");
++		return -ENOENT;
++	}
++	ret = -ENODEV;
++	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	irq = platform_get_irq(pdev, 0);
++
++	if (!r || irq == NO_IRQ)
++		goto probe_out;
++
++	ret = -EBUSY;
++	mem_size = resource_size(r);
++	mem = request_mem_region(r->start, mem_size, pdev->name);
++
++	if (!mem){
++		dev_err(&pdev->dev,
++			"failed to get io memory region resouce.\n");
++		goto probe_out;
++	}
++	ret = -ENOMEM;
++	mmc = mmc_alloc_host(sizeof(struct ftsdc_host), &pdev->dev);
++	if (!mmc) {
++		goto probe_out;
++	}
++
++	host = mmc_priv(mmc);
++	host->mmc 	= mmc;
++	host->pdev	= pdev;
++	mywq = create_workqueue("atcsdc_queue");
++	if (NULL == mywq)
++		goto probe_free_host;
++
++	spin_lock_init(&host->complete_lock);
++	tasklet_init(&host->pio_tasklet, pio_tasklet, (unsigned long) host);
++	init_completion(&host->dma_complete);
++	INIT_WORK(&host->work, ftsdc_work);
++
++	host->complete_what 	= COMPLETION_NONE;
++	host->buf_active 	= XFER_NONE;
++
++#if (defined(CONFIG_PLATFORM_AHBDMA) || defined(CONFIG_PLATFORM_APBDMA))
++	ftsdc_alloc_dma(host);
++#endif
++	host->mem = mem;
++	host->base = (void __iomem *) ioremap(mem->start, mem_size);
++	if (IS_ERR(host->base)){
++		ret = PTR_ERR(host->base);
++		goto probe_free_mem_region;
++	}
++	host->irq = irq;
++
++	ret = request_irq(host->irq, ftsdc_irq, 0, DRIVER_NAME, host);
++	if (ret) {
++		dev_err(&pdev->dev, "failed to request mci interrupt.\n");
++		ret = -ENOENT;
++		goto probe_free_mem_region;
++	}
++	host->irq_enabled = true;
++	/* enable card change interruption */
++	con = REG_READ(SDC_INT_MASK_REG);
++	con |= SDC_INT_MASK_REG_CARD_CHANGE;
++	REG_WRITE(con, SDC_INT_MASK_REG);
++
++	con = REG_READ(SDC_BUS_WIDTH_REG);
++	mmc->ops 	= &ftsdc_ops;
++	mmc->ocr_avail	= MMC_VDD_32_33 | MMC_VDD_33_34;
++
++	if (con & SDC_WIDE_4_BUS_SUPPORT)
++		mmc->caps |= MMC_CAP_4_BIT_DATA;
++	else if (con & SDC_WIDE_8_BUS_SUPPORT)
++		mmc->caps |= MMC_CAP_8_BIT_DATA;
++
++#ifndef A320D_BUILDIN_SDC
++	mmc->caps |= MMC_CAP_SDIO_IRQ;
++#endif
++	mmc->f_min 	= pdata->max_freq / (2 * 128);
++	mmc->f_max 	= pdata->max_freq / 2;
++	/* limit SDIO mode max size */
++	mmc->max_req_size	= 128 * 1024 * 1024 - 1;
++	mmc->max_blk_size	= 2047;
++	mmc->max_req_size	= (mmc->max_req_size + 1) / (mmc->max_blk_size + 1);
++	mmc->max_seg_size	= mmc->max_req_size;
++	mmc->max_blk_count = (1<<17)-1;
++
++	/* kernel default value. see Doc/block/biodocs.txt */
++	/*
++	 'struct mmc_host' has no member named 'max_phys_segs'
++	 'struct mmc_host' has no member named 'max_hw_segs'
++	*/
++//	mmc->max_phys_segs	= 128;
++//	mmc->max_hw_segs	= 128;
++
++	/* set fifo lenght and default threshold half */
++	con = REG_READ(SDC_FEATURE_REG);
++	host->fifo_len = (con & SDC_FEATURE_REG_FIFO_DEPTH) * sizeof(u32);
++
++	dbg(host, dbg_debug,
++	    "probe: mapped mci_base:%p irq:%u.\n",
++	    host->base, host->irq);
++
++	dbg_dumpregs(host, "");
++	ret = mmc_add_host(mmc);
++	if (ret) {
++		dev_err(&pdev->dev, "failed to add mmc host.\n");
++		goto probe_free_irq;
++	}
++	ftsdc_debugfs_attach(host);
++	platform_set_drvdata(pdev, mmc);
++	dev_info(&pdev->dev, "%s - using %s SDIO IRQ\n", mmc_hostname(mmc),
++		 mmc->caps & MMC_CAP_SDIO_IRQ ? "hw" : "sw");
++	return 0;
++
++ probe_free_irq:
++	free_irq(host->irq, host);
++
++ probe_free_mem_region:
++	release_mem_region(host->mem->start, resource_size(host->mem));
++	destroy_workqueue(mywq);
++
++ probe_free_host:
++	mmc_free_host(mmc);
++
++ probe_out:
++	return ret;
++}
++
++static void ftsdc_shutdown(struct platform_device *pdev)
++{
++	struct mmc_host	*mmc = platform_get_drvdata(pdev);
++	struct ftsdc_host *host = mmc_priv(mmc);
++
++	flush_workqueue(mywq);
++	destroy_workqueue(mywq);
++
++	ftsdc_debugfs_remove(host);
++	mmc_remove_host(mmc);
++}
++
++static int __exit ftsdc_remove(struct platform_device *pdev)
++{
++	struct mmc_host		*mmc  = platform_get_drvdata(pdev);
++	struct ftsdc_host	*host = mmc_priv(mmc);
++
++	ftsdc_shutdown(pdev);
++
++	tasklet_disable(&host->pio_tasklet);
++
++	if (ftsdc_dmaexist(host))
++		kfree(host->dma_req);
++
++	free_irq(host->irq, host);
++
++	iounmap(host->base);
++	release_mem_region(host->mem->start, resource_size(host->mem));
++
++	mmc_free_host(mmc);
++	return 0;
++}
++
++#ifdef CONFIG_PM
++static int ftsdc_free_dma(struct ftsdc_host *host)
++{
++	dmad_channel_free(host->dma_req);
++	return 0;
++}
++
++static int ftsdc_suspend(struct platform_device *pdev, pm_message_t state)
++{
++	struct mmc_host *mmc = platform_get_drvdata(pdev);
++	struct ftsdc_host *host = mmc_priv(mmc);
++	int ret = 0;
++	if (mmc) {
++		ftsdc_free_dma(host);
++	}
++	return ret;
++
++}
++
++static int ftsdc_resume(struct platform_device *pdev)
++{
++	struct mmc_host *mmc = platform_get_drvdata(pdev);
++	int ret = 0;
++	struct ftsdc_host *host = mmc_priv(mmc);
++	if (mmc) {
++#if (defined(CONFIG_PLATFORM_AHBDMA) || defined(CONFIG_PLATFORM_APBDMA))
++		ftsdc_alloc_dma(host);
++#endif
++	}
++	return ret;
++}
++
++#else
++#define ftsdc_suspend NULL
++#define ftsdc_resume NULL
++#endif
++
++static struct platform_driver ftsdc_driver = {
++	.driver	= {
++		.name	= "ftsdc010",
++		.owner	= THIS_MODULE,
++		.of_match_table = of_match_ptr(ftsdc_mmc_dt_ids),
++	},
++	.remove		= __exit_p(ftsdc_remove),
++	.shutdown	= ftsdc_shutdown,
++	.suspend	= ftsdc_suspend,
++	.resume		= ftsdc_resume,
++};
++
++module_platform_driver_probe(ftsdc_driver, ftsdc_probe);
++MODULE_DESCRIPTION("Andestech Leopard MMC/SD Card Interface driver");
++MODULE_LICENSE("GPL v2");
+diff --git a/drivers/mmc/host/ftsdc010.h b/drivers/mmc/host/ftsdc010.h
+new file mode 100644
+index 000000000000..d8cbe57fab1d
+--- /dev/null
++++ b/drivers/mmc/host/ftsdc010.h
+@@ -0,0 +1,257 @@
++/*
++ *  linux/driver/mmc/ftsdc010.h - Andestech MMC/SD driver
++ *  Andestech FTSDC010 Device Driver
++ *
++ *  Andestech (C) 2005 Faraday Corp. (http://www.Andestech.com)
++ *
++ *  All Rights Reserved
++ */
++#ifndef _FTSDC010_H_
++#define _FTSDC010_H_
++
++#define DELAY_FOR_DMA_READ
++
++#ifdef SD_DEBUG
++	#define P_DEBUG(fmt, args...) printk(KERN_ALERT "SD: " fmt, ## args)
++#else
++	#define P_DEBUG(a...)
++#endif
++#define P_DEBUGG(a...)
++
++/* used for dma timeout */
++#define SDC_TIMEOUT_BASE			(HZ/2)	// Unit is 500 ms
++
++/* used for pio retry times */
++#define SDC_PIO_RETRY				0x300000
++
++/* sd controller register */
++#define SDC_CMD_REG				0x00000000
++#define SDC_ARGU_REG				0x00000004
++#define SDC_RESPONSE0_REG			0x00000008
++#define SDC_RESPONSE1_REG			0x0000000C
++#define SDC_RESPONSE2_REG			0x00000010
++#define SDC_RESPONSE3_REG			0x00000014
++#define SDC_RSP_CMD_REG				0x00000018
++#define SDC_DATA_CTRL_REG			0x0000001C
++#define SDC_DATA_TIMER_REG			0x00000020
++#define SDC_DATA_LEN_REG			0x00000024
++#define SDC_STATUS_REG				0x00000028
++#define SDC_CLEAR_REG				0x0000002C
++#define SDC_INT_MASK_REG			0x00000030
++#define SDC_POWER_CTRL_REG			0x00000034
++#define SDC_CLOCK_CTRL_REG			0x00000038
++#define SDC_BUS_WIDTH_REG			0x0000003C
++#define SDC_DATA_WINDOW_REG			0x00000040
++
++#ifdef A320D_BUILDIN_SDC
++#define SDC_FEATURE_REG				0x00000044
++#define SDC_REVISION_REG			0x00000048
++#else
++#define SDC_MMC_INT_RSP_REG			0x00000044
++#define SDC_GP_OUTPUT_REG			0x00000048
++#define SDC_FEATURE_REG				0x0000009C
++#define SDC_REVISION_REG			0x000000A0
++#endif
++
++#define SDC_SDIO_CTRL1_REG			0x0000006C
++#define SDC_SDIO_CTRL2_REG			0x00000070
++#define SDC_SDIO_STATUS_REG			0x00000074
++
++/* bit mapping of command register */
++#define SDC_CMD_REG_INDEX			0x0000003F
++#define SDC_CMD_REG_NEED_RSP			0x00000040
++#define SDC_CMD_REG_LONG_RSP			0x00000080
++#define SDC_CMD_REG_APP_CMD			0x00000100
++#define SDC_CMD_REG_CMD_EN			0x00000200
++#define SDC_CMD_REG_SDC_RST			0x00000400
++#define SDC_CMD_MMC_INT_STOP			0x00000800
++
++/* bit mapping of response command register */
++#define SDC_RSP_CMD_REG_INDEX			0x0000003F
++#define SDC_RSP_CMD_REG_APP			0x00000040
++
++/* bit mapping of data control register */
++#define SDC_DATA_CTRL_REG_BLK_SIZE		0x0000000F
++#define SDC_DATA_CTRL_REG_DATA_WRITE		0x00000010
++#define SDC_DATA_CTRL_REG_DMA_EN		0x00000020
++#define SDC_DATA_CTRL_REG_DATA_EN		0x00000040
++#define SDC_DATA_CTRL_REG_FIFOTH		0x00000080
++#define SDC_DATA_CTRL_REG_DMA_TYPE		0x00000300
++#define SDC_DATA_CTRL_REG_FIFO_RST		0x00000400
++#define SDC_CPRM_DATA_CHANGE_ENDIAN_EN		0x00000800
++#define SDC_CPRM_DATA_SWAP_HL_EN		0x00001000
++
++#define SDC_DMA_TYPE_1				0x00000000
++#define SDC_DMA_TYPE_4				0x00000100
++#define SDC_DMA_TYPE_8				0x00000200
++
++/* bit mapping of status register */
++#define SDC_STATUS_REG_RSP_CRC_FAIL		0x00000001
++#define SDC_STATUS_REG_DATA_CRC_FAIL		0x00000002
++#define SDC_STATUS_REG_RSP_TIMEOUT		0x00000004
++#define SDC_STATUS_REG_DATA_TIMEOUT		0x00000008
++#define SDC_STATUS_REG_RSP_CRC_OK		0x00000010
++#define SDC_STATUS_REG_DATA_CRC_OK		0x00000020
++#define SDC_STATUS_REG_CMD_SEND			0x00000040
++#define SDC_STATUS_REG_DATA_END			0x00000080
++#define SDC_STATUS_REG_FIFO_UNDERRUN		0x00000100
++#define SDC_STATUS_REG_FIFO_OVERRUN		0x00000200
++#define SDC_STATUS_REG_CARD_CHANGE		0x00000400
++#define SDC_STATUS_REG_CARD_DETECT		0x00000800
++#define SDC_STATUS_REG_CARD_LOCK		0x00001000
++#define SDC_STATUS_REG_CP_READY			0x00002000
++#define SDC_STATUS_REG_CP_BUF_READY		0x00004000
++#define SDC_STATUS_REG_PLAIN_TEXT_READY		0x00008000
++#define SDC_STATUS_REG_SDIO_INTR	    	0x00010000
++
++/* bit mapping of clear register */
++#define SDC_CLEAR_REG_RSP_CRC_FAIL		0x00000001
++#define SDC_CLEAR_REG_DATA_CRC_FAIL		0x00000002
++#define SDC_CLEAR_REG_RSP_TIMEOUT		0x00000004
++#define SDC_CLEAR_REG_DATA_TIMEOUT		0x00000008
++#define SDC_CLEAR_REG_RSP_CRC_OK		0x00000010
++#define SDC_CLEAR_REG_DATA_CRC_OK		0x00000020
++#define SDC_CLEAR_REG_CMD_SEND			0x00000040
++#define SDC_CLEAR_REG_DATA_END			0x00000080
++#define SDC_CLEAR_REG_CARD_CHANGE		0x00000400
++#define SDC_CLEAR_REG_SDIO_INTR			0x00010000
++
++/* bit mapping of int_mask register */
++#define SDC_INT_MASK_REG_RSP_CRC_FAIL		0x00000001
++#define SDC_INT_MASK_REG_DATA_CRC_FAIL		0x00000002
++#define SDC_INT_MASK_REG_RSP_TIMEOUT		0x00000004
++#define SDC_INT_MASK_REG_DATA_TIMEOUT		0x00000008
++#define SDC_INT_MASK_REG_RSP_CRC_OK		0x00000010
++#define SDC_INT_MASK_REG_DATA_CRC_OK		0x00000020
++#define SDC_INT_MASK_REG_CMD_SEND		0x00000040
++#define SDC_INT_MASK_REG_DATA_END		0x00000080
++#define SDC_INT_MASK_REG_FIFO_UNDERRUN		0x00000100
++#define SDC_INT_MASK_REG_FIFO_OVERRUN		0x00000200
++#define SDC_INT_MASK_REG_CARD_CHANGE		0x00000400
++#define SDC_INT_MASK_REG_CARD_LOCK		0x00001000
++#define SDC_INT_MASK_REG_CP_READY		0x00002000
++#define SDC_INT_MASK_REG_CP_BUF_READY		0x00004000
++#define SDC_INT_MASK_REG_PLAIN_TEXT_READY	0x00008000
++#define SDC_INT_MASK_REG_SDIO_INTR	    	0x00010000
++
++
++#define SDC_CARD_INSERT				0x0
++#define SDC_CARD_REMOVE				SDC_STATUS_REG_CARD_DETECT
++
++/* bit mapping of power control register */
++#define SDC_POWER_CTRL_REG_POWER_ON		0x00000010
++#define SDC_POWER_CTRL_REG_POWER_BITS		0x0000000F
++
++/* bit mapping of clock control register */
++#define SDC_CLOCK_CTRL_REG_CLK_DIV		0x0000007F
++#define SDC_CLOCK_CTRL_REG_CARD_TYPE		0x00000080
++#define SDC_CLOCK_CTRL_REG_CLK_DIS		0x00000100
++
++/* card type */
++#define SDC_CARD_TYPE_SD			SDC_CLOCK_REG_CARD_TYPE
++#define SDC_CARD_TYPE_MMC			0x0
++
++/* bit mapping of bus width register */
++#define SDC_BUS_WIDTH_REG_SINGLE_BUS		0x00000001
++#define SDC_BUS_WIDTH_REG_WIDE_8_BUS		0x00000002
++#define SDC_BUS_WIDTH_REG_WIDE_4_BUS		0x00000004
++#define SDC_BUS_WIDTH_REG_WIDE_BUS_SUPPORT	0x00000018
++#define SDC_BUS_WIDTH_REG_CARD_DETECT		0x00000020
++
++#define SDC_WIDE_4_BUS_SUPPORT			0x00000008
++#define SDC_WIDE_8_BUS_SUPPORT			0x00000010
++
++/* bit mapping of feature register */
++#define SDC_FEATURE_REG_FIFO_DEPTH		0x000000FF
++#define SDC_FEATURE_REG_CPRM_FUNCTION		0x00000100
++
++/* bit mapping of sdio control register */
++#define SDC_SDIO_CTRL1_REG_SDIO_BLK_NO		0xFFFF8000
++#define SDC_SDIO_CTRL1_REG_SDIO_ENABLE		0x00004000
++#define SDC_SDIO_CTRL1_REG_READ_WAIT_ENABLE	0x00002000
++#define SDC_SDIO_CTRL1_REG_SDIO_BLK_MODE	0x00001000
++#define SDC_SDIO_CTRL1_REG_SDIO_BLK_SIZE	0x00000FFF
++
++/* bit mapping of sdio status register */
++#define SDC_SDIO_SDIO_STATUS_REG_FIFO_REMAIN_NO	0x00FE0000
++#define SDC_SDIO_SDIO_STATUS_REG_SDIO_BLK_CNT	0x0001FFFF
++
++enum ftsdc_waitfor {
++	COMPLETION_NONE,
++	COMPLETION_FINALIZE,
++	COMPLETION_CMDSENT,
++	COMPLETION_RSPFIN,
++	COMPLETION_XFER_PROGRESS,
++};
++
++struct ftsdc_host {
++	struct platform_device	*pdev;
++	struct mmc_host		*mmc;
++	struct resource		*mem;
++	struct clk		*clk;
++	void __iomem		*base;
++	int			irq;
++
++	unsigned int		real_rate;
++	bool			irq_enabled;
++	unsigned int		fifo_len;	/* bytes */
++	unsigned int		last_opcode;	/* keep last successful cmd to judge application specific command */
++
++	struct mmc_request	*mrq;
++	int			cmd_is_stop;
++
++	spinlock_t		complete_lock;
++	enum ftsdc_waitfor	complete_what;
++
++	struct completion	dma_complete;
++	dmad_chreq		*dma_req;
++	bool			dodma;
++	bool			dma_finish;
++
++
++	u32			buf_sgptr;	/* keep next scallterlist buffer index */
++	u32			buf_bytes;	/* keep current total scallterlist buffer length */
++	u32			buf_count;	/* keep real data size rw from sd */
++	u32			*buf_ptr;	/* keep current scallterlist buffer address */
++#define XFER_NONE 0
++#define XFER_READ 1
++#define XFER_WRITE 2
++	u32			buf_active;	/* keep current transfer mode */
++
++	int			bus_width;
++
++	char 			dbgmsg_cmd[301];
++	char 			dbgmsg_dat[301];
++	char			*status;
++
++	unsigned int		ccnt, dcnt;
++	struct tasklet_struct	pio_tasklet;
++	struct work_struct work;
++
++#ifdef CONFIG_DEBUG_FS
++	struct dentry		*debug_root;
++	struct dentry		*debug_state;
++	struct dentry		*debug_regs;
++#endif
++};
++
++struct ftsdc_mmc_config {
++	/* get_cd()/get_wp() may sleep */
++	int	(*get_cd)(int module);
++	int	(*get_ro)(int module);
++
++	void	(*set_power)(int module, bool on);
++
++	/* wires == 0 is equivalent to wires == 4 (4-bit parallel) */
++	u8	wires;
++
++	u32     max_freq;
++
++	/* any additional host capabilities: OR'd in to mmc->f_caps */
++	u32     caps;
++
++	/* Number of sg segments */
++	u8	nr_sg;
++};
++
++#endif
+--
+2.25.1
diff --git a/board/andes/ae350/patches/linux/0005-Non-cacheability-and-Cache-support.patch b/board/andes/ae350/patches/linux/0005-Non-cacheability-and-Cache-support.patch
new file mode 100644
index 0000000000..326bbb71c7
--- /dev/null
+++ b/board/andes/ae350/patches/linux/0005-Non-cacheability-and-Cache-support.patch
@@ -0,0 +1,1132 @@
+From e0f510874201d32d720fc94948a266a29d9b4b52 Mon Sep 17 00:00:00 2001
+From: Yu Chien Peter Lin <peterlin@andestech.com>
+Date: Tue, 28 Dec 2021 16:20:40 +0800
+Subject: [PATCH 05/12] Non-cacheability and Cache support
+
+Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
+---
+ arch/riscv/andesv5/Makefile           |   4 +
+ arch/riscv/andesv5/cache.c            | 414 ++++++++++++++++++++++++++
+ arch/riscv/andesv5/cctl.c             | 260 ++++++++++++++++
+ arch/riscv/andesv5/noncache_dma.c     | 113 +++++++
+ arch/riscv/include/asm/andesv5/csr.h  | 160 ++++++++++
+ arch/riscv/include/asm/andesv5/proc.h |  36 +++
+ arch/riscv/include/asm/andesv5/smu.h  |  78 +++++
+ 7 files changed, 1065 insertions(+)
+ create mode 100644 arch/riscv/andesv5/Makefile
+ create mode 100644 arch/riscv/andesv5/cache.c
+ create mode 100644 arch/riscv/andesv5/cctl.c
+ create mode 100644 arch/riscv/andesv5/noncache_dma.c
+ create mode 100644 arch/riscv/include/asm/andesv5/csr.h
+ create mode 100644 arch/riscv/include/asm/andesv5/proc.h
+ create mode 100644 arch/riscv/include/asm/andesv5/smu.h
+
+diff --git a/arch/riscv/andesv5/Makefile b/arch/riscv/andesv5/Makefile
+new file mode 100644
+index 000000000000..6188956ae944
+--- /dev/null
++++ b/arch/riscv/andesv5/Makefile
+@@ -0,0 +1,4 @@
++obj-y += cctl.o
++obj-y += cache.o
++obj-y += noncache_dma.o
++obj-y += sbi.o
+diff --git a/arch/riscv/andesv5/cache.c b/arch/riscv/andesv5/cache.c
+new file mode 100644
+index 000000000000..3d4e82f3525e
+--- /dev/null
++++ b/arch/riscv/andesv5/cache.c
+@@ -0,0 +1,414 @@
++#include <linux/irqflags.h>
++#include <linux/module.h>
++#include <linux/cpu.h>
++#include <linux/of.h>
++#include <linux/of_address.h>
++#include <linux/of_device.h>
++#include <linux/cacheinfo.h>
++#include <linux/sizes.h>
++#include <linux/smp.h>
++#include <asm/csr.h>
++#include <asm/sbi.h>
++#include <asm/io.h>
++#include <asm/andesv5/proc.h>
++#include <asm/andesv5/csr.h>
++#ifdef CONFIG_PERF_EVENTS
++#include <asm/perf_event.h>
++#endif
++
++#define MAX_CACHE_LINE_SIZE 256
++#define EVSEL_MASK	0xff
++#define SEL_PER_CTL	8
++#define SEL_OFF(id)	(8 * (id % 8))
++
++static void __iomem *l2c_base;
++
++DEFINE_PER_CPU(struct andesv5_cache_info, cpu_cache_info) = {
++	.init_done = 0,
++	.dcache_line_size = SZ_32
++};
++static void fill_cpu_cache_info(struct andesv5_cache_info *cpu_ci)
++{
++	struct cpu_cacheinfo *this_cpu_ci =
++		get_cpu_cacheinfo(smp_processor_id());
++	struct cacheinfo *this_leaf = this_cpu_ci->info_list;
++	unsigned int i = 0;
++
++	for(; i< this_cpu_ci->num_leaves ; i++, this_leaf++)
++		if(this_leaf->type == CACHE_TYPE_DATA) {
++			cpu_ci->dcache_line_size = this_leaf->coherency_line_size;
++		}
++	cpu_ci->init_done = true;
++}
++
++
++inline int get_cache_line_size(void)
++{
++	struct andesv5_cache_info *cpu_ci =
++		&per_cpu(cpu_cache_info, smp_processor_id());
++
++	if(unlikely(cpu_ci->init_done == false))
++		fill_cpu_cache_info(cpu_ci);
++	return cpu_ci->dcache_line_size;
++}
++
++static uint32_t cpu_l2c_get_cctl_status(void)
++{
++	return readl((void*)(l2c_base + L2C_REG_STATUS_OFFSET));
++}
++
++void cpu_dcache_wb_range(unsigned long start, unsigned long end, int line_size)
++{
++	int mhartid = smp_processor_id();
++	unsigned long pa;
++	while (end > start) {
++		custom_csr_write(CCTL_REG_UCCTLBEGINADDR_NUM, start);
++		custom_csr_write(CCTL_REG_UCCTLCOMMAND_NUM, CCTL_L1D_VA_WB);
++
++		if (l2c_base) {
++			pa = virt_to_phys((void*)start);
++			writel(pa, (void*)(l2c_base + L2C_REG_CN_ACC_OFFSET(mhartid)));
++			writel(CCTL_L2_PA_WB, (void*)(l2c_base + L2C_REG_CN_CMD_OFFSET(mhartid)));
++			while ((cpu_l2c_get_cctl_status() & CCTL_L2_STATUS_CN_MASK(mhartid))
++					!= CCTL_L2_STATUS_IDLE);
++		}
++
++		start += line_size;
++	}
++}
++
++void cpu_dcache_inval_range(unsigned long start, unsigned long end, int line_size)
++{
++	int mhartid = smp_processor_id();
++	unsigned long pa;
++	while (end > start) {
++		custom_csr_write(CCTL_REG_UCCTLBEGINADDR_NUM, start);
++		custom_csr_write(CCTL_REG_UCCTLCOMMAND_NUM, CCTL_L1D_VA_INVAL);
++
++		if (l2c_base) {
++			pa = virt_to_phys((void*)start);
++			writel(pa, (void*)(l2c_base + L2C_REG_CN_ACC_OFFSET(mhartid)));
++			writel(CCTL_L2_PA_INVAL, (void*)(l2c_base + L2C_REG_CN_CMD_OFFSET(mhartid)));
++			while ((cpu_l2c_get_cctl_status() & CCTL_L2_STATUS_CN_MASK(mhartid))
++					!= CCTL_L2_STATUS_IDLE);
++		}
++
++		start += line_size;
++	}
++}
++void cpu_dma_inval_range(unsigned long start, unsigned long end)
++{
++	unsigned long flags;
++	unsigned long line_size = get_cache_line_size();
++	unsigned long old_start = start;
++	unsigned long old_end = end;
++	char cache_buf[2][MAX_CACHE_LINE_SIZE]={0};
++
++	if (unlikely(start == end))
++		return;
++
++	start = start & (~(line_size - 1));
++	end = ((end + line_size - 1) & (~(line_size - 1)));
++
++	local_irq_save(flags);
++	if (unlikely(start != old_start)) {
++		memcpy(&cache_buf[0][0], (void *)start, line_size);
++	}
++	if (unlikely(end != old_end)) {
++		memcpy(&cache_buf[1][0], (void *)(old_end & (~(line_size - 1))), line_size);
++	}
++	cpu_dcache_inval_range(start, end, line_size);
++	if (unlikely(start != old_start)) {
++		memcpy((void *)start, &cache_buf[0][0], (old_start & (line_size - 1)));
++	}
++	if (unlikely(end != old_end)) {
++		memcpy((void *)(old_end + 1), &cache_buf[1][(old_end & (line_size - 1)) + 1], end - old_end - 1);
++	}
++	local_irq_restore(flags);
++
++}
++EXPORT_SYMBOL(cpu_dma_inval_range);
++
++void cpu_dma_wb_range(unsigned long start, unsigned long end)
++{
++	unsigned long flags;
++	unsigned long line_size = get_cache_line_size();
++
++	local_irq_save(flags);
++	start = start & (~(line_size - 1));
++	cpu_dcache_wb_range(start, end, line_size);
++	local_irq_restore(flags);
++}
++EXPORT_SYMBOL(cpu_dma_wb_range);
++
++/* L1 Cache */
++int cpu_l1c_status(void)
++{
++	/* TODO */
++	// return SBI_CALL_0(SBI_L1CACHE_STATUS);
++	return 0;
++}
++
++void cpu_icache_enable(void *info)
++{
++	/* TODO */
++	// SBI_CALL_1(SBI_ICACHE_OP, 1);
++}
++
++void cpu_icache_disable(void *info)
++{
++	/* TODO */
++	// unsigned long flags;
++
++	// local_irq_save(flags);
++	// SBI_CALL_1(SBI_ICACHE_OP, 0);
++	// local_irq_restore(flags);
++}
++
++void cpu_dcache_enable(void *info)
++{
++	/* TODO */
++	// SBI_CALL_1(SBI_DCACHE_OP, 1);
++}
++
++void cpu_dcache_disable(void *info)
++{
++	/* TODO */
++	// unsigned long flags;
++
++	// local_irq_save(flags);
++	// SBI_CALL_1(SBI_DCACHE_OP, 0);
++	// local_irq_restore(flags);
++}
++
++/* L2 Cache */
++uint32_t cpu_l2c_ctl_status(void)
++{
++	return readl((void*)(l2c_base + L2C_REG_CTL_OFFSET));
++}
++
++void cpu_l2c_enable(void)
++{
++#ifdef CONFIG_SMP
++	int mhartid = smp_processor_id();
++#else
++	int mhartid = 0;
++#endif
++	unsigned int val;
++
++	/* No l2 cache */
++	if(!l2c_base)
++		return;
++
++	/* l2 cache has enabled */
++	if(cpu_l2c_ctl_status() & L2_CACHE_CTL_mskCEN)
++		return;
++
++	/* Enable l2 cache*/
++	val = readl((void*)(l2c_base + L2C_REG_CTL_OFFSET));
++	val |= L2_CACHE_CTL_mskCEN;
++
++	writel(val, (void*)(l2c_base + L2C_REG_CTL_OFFSET));
++	while ((cpu_l2c_get_cctl_status() & CCTL_L2_STATUS_CN_MASK(mhartid))
++			!= CCTL_L2_STATUS_IDLE);
++}
++
++void cpu_l2c_disable(void)
++{
++#ifdef CONFIG_SMP
++	int mhartid = smp_processor_id();
++#else
++	int mhartid = 0;
++#endif
++	unsigned int val;
++
++	/*No l2 cache */
++	if(!l2c_base)
++		return;
++
++	/*l2 cache has disabled*/
++	if(!(cpu_l2c_ctl_status() & L2_CACHE_CTL_mskCEN))
++		return;
++
++	/*L2 write-back and invalidate all*/
++	writel(CCTL_L2_WBINVAL_ALL, (void*)(l2c_base + L2C_REG_CN_CMD_OFFSET(mhartid)));
++	while ((cpu_l2c_get_cctl_status() & CCTL_L2_STATUS_CN_MASK(mhartid))
++			!= CCTL_L2_STATUS_IDLE);
++
++	/*Disable L2 cache*/
++	val = readl((void*)(l2c_base + L2C_REG_CTL_OFFSET));
++	val &= (~L2_CACHE_CTL_mskCEN);
++
++	writel(val, (void*)(l2c_base + L2C_REG_CTL_OFFSET));
++	while ((cpu_l2c_get_cctl_status() & CCTL_L2_STATUS_CN_MASK(mhartid))
++			!= CCTL_L2_STATUS_IDLE);
++}
++
++#ifndef CONFIG_SMP
++void cpu_l2c_inval_range(unsigned long pa, unsigned long size)
++{
++	unsigned long line_size = get_cache_line_size();
++	unsigned long start = pa, end = pa + size;
++	unsigned long align_start, align_end;
++
++	align_start = start & ~(line_size - 1);
++	align_end  = (end + line_size - 1) & ~(line_size - 1);
++
++	while(align_end > align_start){
++		writel(align_start, (void*)(l2c_base + L2C_REG_C0_ACC_OFFSET));
++		writel(CCTL_L2_PA_INVAL, (void*)(l2c_base + L2C_REG_C0_CMD_OFFSET));
++		while ((cpu_l2c_get_cctl_status() & CCTL_L2_STATUS_C0_MASK)
++				!= CCTL_L2_STATUS_IDLE);
++		align_start += line_size;
++	}
++}
++EXPORT_SYMBOL(cpu_l2c_inval_range);
++
++void cpu_l2c_wb_range(unsigned long pa, unsigned long size)
++{
++	unsigned long line_size = get_cache_line_size();
++	unsigned long start = pa, end = pa + size;
++	unsigned long align_start, align_end;
++
++	align_start = start & ~(line_size - 1);
++	align_end  = (end + line_size - 1) & ~(line_size - 1);
++
++	while(align_end > align_start){
++		writel(align_start, (void*)(l2c_base + L2C_REG_C0_ACC_OFFSET));
++		writel(CCTL_L2_PA_WB, (void*)(l2c_base + L2C_REG_C0_CMD_OFFSET));
++		while ((cpu_l2c_get_cctl_status() & CCTL_L2_STATUS_C0_MASK)
++				!= CCTL_L2_STATUS_IDLE);
++		align_start += line_size;
++	}
++}
++EXPORT_SYMBOL(cpu_l2c_wb_range);
++#else
++void cpu_l2c_inval_range(unsigned long pa, unsigned long size)
++{
++	int mhartid = smp_processor_id();
++	unsigned long line_size = get_cache_line_size();
++	unsigned long start = pa, end = pa + size;
++	unsigned long align_start, align_end;
++
++	align_start = start & ~(line_size - 1);
++	align_end  = (end + line_size - 1) & ~(line_size - 1);
++
++	while(align_end > align_start){
++		writel(align_start, (void*)(l2c_base + L2C_REG_CN_ACC_OFFSET(mhartid)));
++		writel(CCTL_L2_PA_INVAL, (void*)(l2c_base + L2C_REG_CN_CMD_OFFSET(mhartid)));
++		while ((cpu_l2c_get_cctl_status() & CCTL_L2_STATUS_CN_MASK(mhartid))
++				!= CCTL_L2_STATUS_IDLE);
++		align_start += line_size;
++	}
++}
++EXPORT_SYMBOL(cpu_l2c_inval_range);
++
++void cpu_l2c_wb_range(unsigned long pa, unsigned long size)
++{
++	int mhartid = smp_processor_id();
++	unsigned long line_size = get_cache_line_size();
++	unsigned long start = pa, end = pa + size;
++	unsigned long align_start, align_end;
++
++	align_start = start & ~(line_size - 1);
++	align_end  = (end + line_size - 1) & ~(line_size - 1);
++
++	while(align_end > align_start){
++		writel(align_start, (void*)(l2c_base + L2C_REG_CN_ACC_OFFSET(mhartid)));
++		writel(CCTL_L2_PA_WB, (void*)(l2c_base + L2C_REG_CN_CMD_OFFSET(mhartid)));
++		while ((cpu_l2c_get_cctl_status() & CCTL_L2_STATUS_CN_MASK(mhartid))
++				!= CCTL_L2_STATUS_IDLE);
++		align_start += line_size;
++	}
++}
++EXPORT_SYMBOL(cpu_l2c_wb_range);
++#endif
++
++#ifdef CONFIG_PERF_EVENTS
++int cpu_l2c_get_counter_idx(struct l2c_hw_events *l2c)
++{
++	int idx;
++
++	idx = find_next_zero_bit(l2c->used_mask, L2C_MAX_COUNTERS - 1, 0);
++	return idx;
++}
++
++void l2c_write_counter(int idx, u64 value)
++{
++	u32 vall = value;
++	u32 valh = value >> 32;
++
++	writel(vall, (void*)(l2c_base + L2C_REG_CN_HPM_OFFSET(idx)));
++	writel(valh, (void*)(l2c_base + L2C_REG_CN_HPM_OFFSET(idx) + 0x4));
++}
++
++u64 l2c_read_counter(int idx)
++{
++	u32 vall = readl((void*)(l2c_base + L2C_REG_CN_HPM_OFFSET(idx)));
++	u32 valh = readl((void*)(l2c_base + L2C_REG_CN_HPM_OFFSET(idx) + 0x4));
++	u64 val = ((u64)valh << 32) | vall;
++
++	return val;
++}
++
++void l2c_pmu_disable_counter(int idx)
++{
++	int n = idx / SEL_PER_CTL;
++	u32 vall = readl((void*)(l2c_base + L2C_HPM_CN_CTL_OFFSET(n)));
++	u32 valh = readl((void*)(l2c_base + L2C_HPM_CN_CTL_OFFSET(n) + 0x4));
++	u64 val = ((u64)valh << 32) | vall;
++
++	val |= (EVSEL_MASK << SEL_OFF(idx));
++	vall = val;
++	valh = val >> 32;
++	writel(vall, (void*)(l2c_base + L2C_HPM_CN_CTL_OFFSET(n)));
++	writel(valh, (void*)(l2c_base + L2C_HPM_CN_CTL_OFFSET(n) + 0x4));
++}
++
++#ifndef CONFIG_SMP
++void l2c_pmu_event_enable(u64 config, int idx)
++{
++	int n = idx / SEL_PER_CTL;
++	u32 vall = readl((void*)(l2c_base + L2C_HPM_CN_CTL_OFFSET(n)));
++	u32 valh = readl((void*)(l2c_base + L2C_HPM_CN_CTL_OFFSET(n) + 0x4));
++	u64 val = ((u64)valh << 32) | vall;
++
++	val = val & ~(EVSEL_MASK << SEL_OFF(idx));
++	val = val | (config << SEL_OFF(idx));
++	vall = val;
++	valh = val >> 32;
++	writel(vall, (void*)(l2c_base + L2C_HPM_CN_CTL_OFFSET(n)));
++	writel(valh, (void*)(l2c_base + L2C_HPM_CN_CTL_OFFSET(n) + 0x4));
++}
++#else
++void l2c_pmu_event_enable(u64 config, int idx)
++{
++	int n = idx / SEL_PER_CTL;
++	int mhartid = smp_processor_id();
++	u32 vall = readl((void*)(l2c_base + L2C_HPM_CN_CTL_OFFSET(n)));
++	u32 valh = readl((void*)(l2c_base + L2C_HPM_CN_CTL_OFFSET(n) + 0x4));
++	u64 val = ((u64)valh << 32) | vall;
++
++	if (config <= (CN_RECV_SNOOP_DATA(NR_CPUS - 1) & EVSEL_MASK))
++		config = config + mhartid * L2C_REG_PER_CORE_OFFSET;
++
++	val = val & ~(EVSEL_MASK << SEL_OFF(idx));
++	val = val | (config << SEL_OFF(idx));
++	vall = val;
++	valh = val >> 32;
++	writel(vall, (void*)(l2c_base + L2C_HPM_CN_CTL_OFFSET(n)));
++	writel(valh, (void*)(l2c_base + L2C_HPM_CN_CTL_OFFSET(n) + 0x4));
++}
++#endif
++#endif
++
++int __init l2c_init(void)
++{
++	struct device_node *node ;
++
++	node = of_find_compatible_node(NULL, NULL, "cache");
++	l2c_base = of_iomap(node, 0);
++
++	return 0;
++}
++arch_initcall(l2c_init)
+diff --git a/arch/riscv/andesv5/cctl.c b/arch/riscv/andesv5/cctl.c
+new file mode 100644
+index 000000000000..f3f61db29e0d
+--- /dev/null
++++ b/arch/riscv/andesv5/cctl.c
+@@ -0,0 +1,260 @@
++/*
++ *  Copyright (C) 2009 Andes Technology Corporation
++ *  Copyright (C) 2019 Andes Technology Corporation
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ */
++
++#include <linux/module.h>
++#include <linux/blkdev.h>
++#include <linux/proc_fs.h>
++#include <asm/andesv5/csr.h>
++#include <asm/andesv5/proc.h>
++
++#define INPUTLEN 32
++
++struct entry_struct{
++
++	char *name;
++	int perm;
++	const struct proc_ops *fops;
++};
++
++static struct proc_dir_entry *proc_cctl;
++
++#define DEBUG( enable, tagged, ...)				\
++	do{							\
++		if(enable){					\
++			if(tagged)				\
++			printk( "[ %30s() ] ", __func__);	\
++			printk( __VA_ARGS__);			\
++		}						\
++	} while( 0)
++
++static int debug = 0;
++module_param(debug, int, 0);
++
++void cpu_icache_smp_enable(void)
++{
++    int cpu_num = num_online_cpus();
++    int id = smp_processor_id();
++    int i, ret;
++
++    for(i = 0; i < cpu_num; i++){
++		if(i == id)
++			continue;
++        ret = smp_call_function_single(i, cpu_icache_enable,
++                                        NULL, true);
++        if(ret)
++            pr_err("Core %d enable I-cache Fail\n"
++                    "Error Code:%d \n", i, ret);
++    }
++    cpu_icache_enable(NULL);
++}
++
++void cpu_icache_smp_disable(void)
++{
++    int cpu_num = num_online_cpus();
++    int id = smp_processor_id();
++    int i, ret;
++
++    for(i = 0; i < cpu_num; i++){
++        if(i == id)
++            continue;
++        ret = smp_call_function_single(i, cpu_icache_disable,
++                                        NULL, true);
++        if(ret)
++            pr_err("Core %d disable I-cache Fail \n"
++                    "Error Code:%d \n", i, ret);
++    }
++    cpu_icache_disable(NULL);
++}
++
++void cpu_dcache_smp_enable(void)
++{
++    int cpu_num = num_online_cpus();
++    int id = smp_processor_id();
++    int i, ret;
++
++    for(i = 0; i < cpu_num; i++){
++        if(i == id)
++            continue;
++        ret = smp_call_function_single(i, cpu_dcache_enable,
++                                        NULL, true);
++        if(ret)
++            pr_err("Core %d disable D-cache Fail \n"
++                    "Error Code:%d \n", i, ret);
++    }
++    cpu_dcache_enable(NULL);
++}
++
++void cpu_dcache_smp_disable(void)
++{
++    int cpu_num = num_online_cpus();
++    int id = smp_processor_id();
++    int i, ret;
++
++    for(i = 0; i < cpu_num; i++){
++        if(i == id)
++            continue;
++        ret = smp_call_function_single(i, cpu_dcache_disable,
++                                        NULL, true);
++        if(ret)
++            pr_err("Core %d disable D-cache Fail \n"
++                    "Error Code:%d \n", i, ret);
++    }
++    cpu_dcache_disable(NULL);
++}
++
++static ssize_t proc_read_cache_en(struct file *file, char __user *userbuf,
++						size_t count, loff_t *ppos)
++{
++    int ret;
++    char buf[18];
++    if (!strncmp(file->f_path.dentry->d_name.name, "ic_en", 7))
++        ret = sprintf(buf, "I-cache: %s\n", (cpu_l1c_status() & CACHE_CTL_mskIC_EN) ? "Enabled" : "Disabled");
++    else if(!strncmp(file->f_path.dentry->d_name.name, "dc_en", 7))
++        ret = sprintf(buf, "D-cache: %s\n", (cpu_l1c_status() & CACHE_CTL_mskDC_EN) ? "Enabled" : "Disabled");
++	else if(!strncmp(file->f_path.dentry->d_name.name, "l2c_en", 7))
++        ret = sprintf(buf, "L2-cache: %s\n", (cpu_l2c_ctl_status() & L2_CACHE_CTL_mskCEN) ? "Enabled" : "Disabled");
++	else
++		return -EFAULT;
++
++    return simple_read_from_buffer(userbuf, count, ppos, buf, ret);
++}
++
++static ssize_t proc_write_cache_en(struct file *file,
++			const char __user *buffer, size_t count, loff_t *ppos)
++{
++
++	unsigned long en;
++	char inbuf[INPUTLEN];
++
++	if (count > INPUTLEN - 1)
++		count = INPUTLEN - 1;
++
++	if (copy_from_user(inbuf, buffer, count))
++		return -EFAULT;
++
++	inbuf[count] = '\0';
++
++	if (!sscanf(inbuf, "%lu", &en) || en > 1)
++		return -EFAULT;
++
++	if (!strncmp(file->f_path.dentry->d_name.name, "ic_en", 7)) {
++		if (en && !(cpu_l1c_status() & CACHE_CTL_mskIC_EN)) {
++#ifdef CONFIG_SMP
++			cpu_icache_smp_enable();
++#else
++			cpu_icache_enable(NULL);
++#endif
++			DEBUG(debug, 1, "I-cache: Enabled\n");
++		} else if (!en && (cpu_l1c_status() & CACHE_CTL_mskIC_EN)) {
++#ifdef CONFIG_SMP
++			cpu_icache_smp_disable();
++#else
++			cpu_icache_disable(NULL);
++#endif
++			DEBUG(debug, 1, "I-cache: Disabled\n");
++		}
++	} else if(!strncmp(file->f_path.dentry->d_name.name, "dc_en", 7)) {
++		if (en && !(cpu_l1c_status() & CACHE_CTL_mskDC_EN)) {
++#ifdef CONFIG_SMP
++			cpu_dcache_smp_enable();
++#else
++			cpu_dcache_enable(NULL);
++#endif
++			DEBUG(debug, 1, "D-cache: Enabled\n");
++		} else if (!en && (cpu_l1c_status() & CACHE_CTL_mskDC_EN)) {
++#ifdef CONFIG_SMP
++			cpu_dcache_smp_disable();
++#else
++			cpu_dcache_disable(NULL);
++#endif
++			DEBUG(debug, 1, "D-cache: Disabled\n");
++		}
++	}else if(!strncmp(file->f_path.dentry->d_name.name, "l2c_en", 7)){
++		if (en && !(cpu_l2c_ctl_status() & L2_CACHE_CTL_mskCEN)) {
++			cpu_l2c_enable();
++			DEBUG(debug, 1, "L2-cache: Enabled\n");
++		} else if (!en && (cpu_l2c_ctl_status() & L2_CACHE_CTL_mskCEN)) {
++			cpu_l2c_disable();
++			DEBUG(debug, 1, "L2-cache: Disabled\n");
++		}
++	}else{
++		return -EFAULT;
++	}
++
++	return count;
++}
++
++static const struct proc_ops en_fops = {
++	.proc_open = simple_open,
++	.proc_read = proc_read_cache_en,
++	.proc_write = proc_write_cache_en,
++};
++
++static void create_seq_entry(struct entry_struct *e, mode_t mode,
++			     struct proc_dir_entry *parent)
++{
++
++	struct proc_dir_entry *entry = proc_create(e->name, mode, parent, e->fops);
++
++	if (!entry)
++		printk(KERN_ERR "invalid %s register.\n", e->name);
++}
++
++static void install_proc_table(struct entry_struct *table)
++{
++	while (table->name) {
++
++		create_seq_entry(table, table->perm, proc_cctl);
++		table++;
++	}
++}
++
++static void remove_proc_table(struct entry_struct *table)
++{
++
++	while (table->name) {
++		remove_proc_entry(table->name, proc_cctl);
++		table++;
++	}
++}
++
++struct entry_struct proc_table_cache[] = {
++
++	{"ic_en", 0644, &en_fops},
++	{"dc_en", 0644, &en_fops},
++	{"l2c_en", 0644, &en_fops},
++	{NULL, 0, 0}
++};
++static int __init init_cctl(void)
++{
++
++	DEBUG(debug, 0, "CCTL module registered\n");
++
++	if(!(proc_cctl = proc_mkdir("cctl", NULL)))
++		return -ENOMEM;
++
++	install_proc_table(proc_table_cache);
++
++	return 0;
++}
++
++static void __exit cleanup_cctl(void)
++{
++
++	remove_proc_table(proc_table_cache);
++	remove_proc_entry("cctl", NULL);
++
++	DEBUG(debug, 1, "CCTL module unregistered\n");
++}
++
++module_init(init_cctl);
++module_exit(cleanup_cctl);
++
++MODULE_LICENSE("GPL");
++MODULE_DESCRIPTION("Userspace Cache Control Module");
+diff --git a/arch/riscv/andesv5/noncache_dma.c b/arch/riscv/andesv5/noncache_dma.c
+new file mode 100644
+index 000000000000..fa83cebad777
+--- /dev/null
++++ b/arch/riscv/andesv5/noncache_dma.c
+@@ -0,0 +1,113 @@
++/*
++ * Copyright (C) 2017 SiFive
++ *   Wesley Terpstra <wesley@sifive.com>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or
++ * (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, see the file COPYING, or write
++ * to the Free Software Foundation, Inc.,
++ */
++
++#include <linux/gfp.h>
++#include <linux/mm.h>
++#include <linux/dma-mapping.h>
++#include <linux/dma-direct.h>
++#include <linux/scatterlist.h>
++#include <asm/andesv5/proc.h>
++
++static void dma_flush_page(struct page *page, size_t size)
++{
++	unsigned long k_d_vaddr;
++	/*
++	 * Invalidate any data that might be lurking in the
++	 * kernel direct-mapped region for device DMA.
++	 */
++	k_d_vaddr = (unsigned long)page_address(page);
++	memset((void *)k_d_vaddr, 0, size);
++	cpu_dma_wb_range(k_d_vaddr, k_d_vaddr + size);
++	cpu_dma_inval_range(k_d_vaddr, k_d_vaddr + size);
++
++}
++
++
++static inline void cache_op(phys_addr_t paddr, size_t size,
++		void (*fn)(unsigned long start, unsigned long end))
++{
++	unsigned long start;
++
++	start = (unsigned long)phys_to_virt(paddr);
++	fn(start, start + size);
++}
++
++void arch_sync_dma_for_device(phys_addr_t paddr,
++		size_t size, enum dma_data_direction dir)
++{
++	switch (dir) {
++	case DMA_FROM_DEVICE:
++		cache_op(paddr, size, cpu_dma_inval_range);
++		break;
++	case DMA_TO_DEVICE:
++	case DMA_BIDIRECTIONAL:
++		cache_op(paddr, size, cpu_dma_wb_range);
++		break;
++	default:
++		BUG();
++	}
++}
++
++void arch_sync_dma_for_cpu(phys_addr_t paddr,
++		size_t size, enum dma_data_direction dir)
++{
++	switch (dir) {
++	case DMA_TO_DEVICE:
++		break;
++	case DMA_FROM_DEVICE:
++	case DMA_BIDIRECTIONAL:
++		cache_op(paddr, size, cpu_dma_inval_range);
++		break;
++	default:
++		BUG();
++	}
++}
++
++void *arch_dma_alloc(struct device *dev, size_t size, dma_addr_t *handle,
++               gfp_t gfp, unsigned long attrs)
++{
++	void* kvaddr, *coherent_kvaddr;
++	size = PAGE_ALIGN(size);
++
++	kvaddr = dma_direct_alloc_pages(dev, size, handle, gfp, attrs);
++	if (!kvaddr)
++		goto no_mem;
++	coherent_kvaddr = ioremap_nocache(dma_to_phys(dev, *handle), size);
++	if (!coherent_kvaddr)
++		goto no_map;
++
++	dma_flush_page(virt_to_page(kvaddr),size);
++	return coherent_kvaddr;
++no_map:
++	dma_direct_free_pages(dev, size, kvaddr, *handle, attrs);
++no_mem:
++	return NULL;
++}
++
++void arch_dma_free(struct device *dev, size_t size, void *vaddr,
++			   dma_addr_t handle, unsigned long attrs)
++{
++	void *kvaddr = phys_to_virt(dma_to_phys(dev, handle));
++
++	size = PAGE_ALIGN(size);
++	iounmap(vaddr);
++	dma_direct_free_pages(dev, size, kvaddr, handle, attrs);
++
++	return;
++}
+diff --git a/arch/riscv/include/asm/andesv5/csr.h b/arch/riscv/include/asm/andesv5/csr.h
+new file mode 100644
+index 000000000000..43936e1fb658
+--- /dev/null
++++ b/arch/riscv/include/asm/andesv5/csr.h
+@@ -0,0 +1,160 @@
++/* micm_cfg: Instruction Cache/Memory Configuration Register */
++#define MICM_CFG 0xfc0
++
++#define MICM_CFG_ISET_OFFSET		0
++#define MICM_CFG_IWAY_OFFSET		3
++#define MICM_CFG_ISZ_OFFSET		6
++#define MICM_CFG_ILCK_OFFSET		9
++#define MICM_CFG_IC_ECC_OFFSET		10
++#define MICM_CFG_ILMB_OFFSET		12
++#define MICM_CFG_ILMSZ_OFFSET		15
++#define MICM_CFG_ULM_2BANK_OFFSET	20
++#define MICM_CFG_ILM_ECC_OFFSET		21
++
++
++#define MICM_CFG_ISET_MASK	(0x7  << MICM_CFG_ISET_OFFSET)
++#define MICM_CFG_IWAY_MASK	(0x7  << MICM_CFG_IWAY_OFFSET)
++#define MICM_CFG_ISZ_MASK	(0x7  << MICM_CFG_ISZ_OFFSET)
++#define MICM_CFG_ILCK_MASK	(0x1  << MICM_CFG_ILCK_OFFSET)
++#define MICM_CFG_IC_ECC_MASK	(0x3  << MICM_CFG_IC_ECC_OFFSET)
++#define MICM_CFG_ILMB_MASK	(0x7  << MICM_CFG_ILMB_OFFSET)
++#define MICM_CFG_ILMSZ_MASK	(0x1f << MICM_CFG_ILMSZ_OFFSET)
++#define MICM_CFG_ULM_2BANK_MASK	(0x1  << MICM_CFG_ULM_2BANK_OFFSET)
++#define MICM_CFG_ILM_ECC_MASK	(0x3  << MICM_CFG_ILM_ECC_OFFSET)
++
++/* mdcm_cfg: Data Cache/Memory Configuration Register */
++#define MDCM_CFG 0xfc1
++
++#define MDCM_CFG_DSET_OFFSET		0
++#define MDCM_CFG_DWAY_OFFSET		3
++#define MDCM_CFG_DSZ_OFFSET		6
++#define MDCM_CFG_DLCK_OFFSET		9
++#define MDCM_CFG_DC_ECC_OFFSET		10
++#define MDCM_CFG_DLMB_OFFSET		12
++#define MDCM_CFG_DLMSZ_OFFSET		15
++#define MDCM_CFG_ULM_2BANK_OFFSET	20
++#define MDCM_CFG_DLM_ECC_OFFSET		21
++
++
++#define MDCM_CFG_DSET_MASK	(0x7  << MDCM_CFG_DSET_OFFSET)
++#define MDCM_CFG_DWAY_MASK	(0x7  << MDCM_CFG_DWAY_OFFSET)
++#define MDCM_CFG_DSZ_MASK	(0x7  << MDCM_CFG_DSZ_OFFSET)
++#define MDCM_CFG_DLCK_MASK	(0x1  << MDCM_CFG_DLCK_OFFSET)
++#define MDCM_CFG_DC_ECC_MASK	(0x3  << MDCM_CFG_DC_ECC_OFFSET)
++#define MDCM_CFG_DLMB_MASK	(0x7  << MDCM_CFG_DLMB_OFFSET)
++#define MDCM_CFG_DLMSZ_MASK	(0x1f << MDCM_CFG_DLMSZ_OFFSET)
++#define MDCM_CFG_ULM_2BANK_MASK	(0x1  << MDCM_CFG_ULM_2BANK_OFFSET)
++#define MDCM_CFG_DLM_ECC_MASK	(0x3  << MDCM_CFG_DLM_ECC_OFFSET)
++
++/* User mode control registers */
++#define CSR_UITB					   0x800
++#define CSR_UCODE					   0x801
++#define CSR_UDCAUSE					   0x809
++#define CCTL_REG_UCCTLBEGINADDR_NUM    0x80b
++#define CCTL_REG_UCCTLCOMMAND_NUM      0x80c
++#define CSR_WFE						   0x810
++#define CSR_SLEEPVALUE				   0x811
++#define CSR_TXEVT					   0x812
++
++#define custom_csr_write(csr_num,val) csr_write(csr_num,val)
++/* ucctlcommand */
++/* D-cache operation */
++#define CCTL_L1D_VA_INVAL	0
++#define CCTL_L1D_VA_WB		1
++#define CCTL_L1D_VA_WBINVAL	2
++
++/* non-blocking & write around */
++#define MMISC_CTL_NON_BLOCKING_ENABLE  (0x1  << MMISC_CTL_NON_BLOCKING_OFFSET)
++#define MMISC_CTL_NON_BLOCKING_OFFSET  0x8
++
++#define MCACHE_CTL_L1I_PREFETCH_OFFSET  9
++#define MCACHE_CTL_L1D_PREFETCH_OFFSET  10
++#define MCACHE_CTL_DC_WAROUND_OFFSET_1  13
++#define MCACHE_CTL_DC_WAROUND_OFFSET_2  14
++#define MCACHE_CTL_L1I_PREFETCH_EN  (0x1  << MCACHE_CTL_L1I_PREFETCH_OFFSET)
++#define MCACHE_CTL_L1D_PREFETCH_EN  (0x1  << MCACHE_CTL_L1D_PREFETCH_OFFSET)
++#define MCACHE_CTL_DC_WAROUND_1_EN  (0x1  << MCACHE_CTL_DC_WAROUND_OFFSET_1)
++#define MCACHE_CTL_DC_WAROUND_2_EN  (0x1  << MCACHE_CTL_DC_WAROUND_OFFSET_2)
++#define WRITE_AROUND_ENABLE  (MCACHE_CTL_L1I_PREFETCH_EN | MCACHE_CTL_L1D_PREFETCH_EN | MCACHE_CTL_DC_WAROUND_1_EN)
++
++/* L1 I-cache , D-cache */
++#define CACHE_CTL_offIC_EN  0   /* Enable I-cache */
++#define CACHE_CTL_offDC_EN  1   /* Enable D-cache */
++#define CACHE_CTL_mskIC_EN  ( 0x1  << CACHE_CTL_offIC_EN )
++#define CACHE_CTL_mskDC_EN  ( 0x1  << CACHE_CTL_offDC_EN )
++
++
++/* L2 cache */
++#define L2_CACHE_CTL_mskCEN 1
++/* L2 cache registers */
++#define L2C_REG_CFG_OFFSET	0
++#define L2C_REG_CTL_OFFSET	0x8
++#define L2C_HPM_C0_CTL_OFFSET	0x10
++#define L2C_HPM_C1_CTL_OFFSET	0x18
++#define L2C_HPM_C2_CTL_OFFSET	0x20
++#define L2C_HPM_C3_CTL_OFFSET	0x28
++#define L2C_REG_C0_CMD_OFFSET	0x40
++#define L2C_REG_C0_ACC_OFFSET	0x48
++#define L2C_REG_C1_CMD_OFFSET	0x50
++#define L2C_REG_C1_ACC_OFFSET	0x58
++#define L2C_REG_C2_CMD_OFFSET	0x60
++#define L2C_REG_C2_ACC_OFFSET	0x68
++#define L2C_REG_C3_CMD_OFFSET	0x70
++#define L2C_REG_C3_ACC_OFFSET	0x78
++#define L2C_REG_STATUS_OFFSET	0x80
++#define L2C_REG_C0_HPM_OFFSET	0x200
++
++/* L2 CCTL status */
++#define CCTL_L2_STATUS_IDLE	0
++#define CCTL_L2_STATUS_PROCESS	1
++#define CCTL_L2_STATUS_ILLEGAL	2
++/* L2 CCTL status cores mask */
++#define CCTL_L2_STATUS_C0_MASK	0xF
++#define CCTL_L2_STATUS_C1_MASK	0xF0
++#define CCTL_L2_STATUS_C2_MASK	0xF00
++#define CCTL_L2_STATUS_C3_MASK	0xF000
++
++/* L2 cache operation */
++#define CCTL_L2_PA_INVAL	0x8
++#define CCTL_L2_PA_WB		0x9
++#define CCTL_L2_PA_WBINVAL	0xA
++#define CCTL_L2_WBINVAL_ALL	0x12
++
++#define L2C_HPM_PER_CORE_OFFSET		0x8
++#define L2C_REG_PER_CORE_OFFSET		0x10
++#define CCTL_L2_STATUS_PER_CORE_OFFSET	4
++#define L2C_REG_CN_CMD_OFFSET(n)	\
++	L2C_REG_C0_CMD_OFFSET + (n * L2C_REG_PER_CORE_OFFSET)
++#define L2C_REG_CN_ACC_OFFSET(n)	\
++	L2C_REG_C0_ACC_OFFSET + (n * L2C_REG_PER_CORE_OFFSET)
++#define CCTL_L2_STATUS_CN_MASK(n)	\
++	CCTL_L2_STATUS_C0_MASK << (n * CCTL_L2_STATUS_PER_CORE_OFFSET)
++#define L2C_HPM_CN_CTL_OFFSET(n)	\
++	L2C_HPM_C0_CTL_OFFSET + (n * L2C_HPM_PER_CORE_OFFSET)
++#define L2C_REG_CN_HPM_OFFSET(n)	\
++	L2C_REG_C0_HPM_OFFSET + (n * L2C_HPM_PER_CORE_OFFSET)
++
++
++/* Debug/Trace Registers (shared with Debug Mode) */
++#define CSR_SCONTEXT            0x7aa
++
++/* Supervisor trap registers */
++#define CSR_SLIE				0x9c4
++#define CSR_SLIP				0x9c5
++#define CSR_SDCAUSE				0x9c9
++
++/* Supervisor counter registers */
++#define CSR_SCOUNTERINTEN		0x9cf
++#define CSR_SCOUNTERMASK_M		0x9d1
++#define CSR_SCOUNTERMASK_S		0x9d2
++#define CSR_SCOUNTERMASK_U		0x9d3
++#define CSR_SCOUNTEROVF			0x9d4
++#define CSR_SCOUNTINHIBIT		0x9e0
++#define CSR_SHPMEVENT3			0x9e3
++#define CSR_SHPMEVENT4			0x9e4
++#define CSR_SHPMEVENT5			0x9e5
++#define CSR_SHPMEVENT6			0x9e6
++
++/* Supervisor control registers */
++#define CSR_SCCTLDATA			0x9cd
++#define CSR_SMISC_CTL			0x9d0
+diff --git a/arch/riscv/include/asm/andesv5/proc.h b/arch/riscv/include/asm/andesv5/proc.h
+new file mode 100644
+index 000000000000..d06fbff65ad0
+--- /dev/null
++++ b/arch/riscv/include/asm/andesv5/proc.h
+@@ -0,0 +1,36 @@
++#include <asm/io.h>
++#include <asm/page.h>
++
++int cpu_l1c_status(void);
++void cpu_icache_enable(void *info);
++void cpu_icache_disable(void *info);
++void cpu_dcache_enable(void *info);
++void cpu_dcache_disable(void *info);
++uint32_t cpu_l2c_ctl_status(void);
++void cpu_l2c_enable(void);
++void cpu_l2c_disable(void);
++
++void cpu_dma_inval_range(unsigned long start, unsigned long end);
++void cpu_dma_wb_range(unsigned long start, unsigned long end);
++void cpu_l2c_inval_range(unsigned long pa, unsigned long size);
++void cpu_l2c_wb_range(unsigned long pa, unsigned long size);
++
++extern phys_addr_t pa_msb;;
++
++#define dma_remap(pa, size) ioremap((pa|(pa_msb << PAGE_SHIFT)), size)
++
++#define dma_unmap(vaddr) iounmap((void __force __iomem *)vaddr)
++
++
++/*
++ * struct andesv5_cache_info
++ * The member of this struct is dupilcated to some content of struct cacheinfo
++ * to reduce the latence of searching dcache inforamtion in andesv5/cache.c.
++ * At current only dcache-line-size is needed. when the content of
++ * andesv5_cache_info has been initilized by function fill_cpu_cache_info(),
++ * member init_done is set as true
++ */
++struct andesv5_cache_info {
++	bool init_done;
++	int dcache_line_size;
++};
+diff --git a/arch/riscv/include/asm/andesv5/smu.h b/arch/riscv/include/asm/andesv5/smu.h
+new file mode 100644
+index 000000000000..14813492c159
+--- /dev/null
++++ b/arch/riscv/include/asm/andesv5/smu.h
+@@ -0,0 +1,78 @@
++#ifndef _ASM_RISCV_SMU_H
++#define _ASM_RISCV_SMU_H
++
++#include <asm/sbi.h>
++#define MAX_PCS_SLOT    7
++
++#define PCS0_WE_OFF     0x90
++#define PCS0_CTL_OFF    0x94
++#define PCS0_STATUS_OFF 0x98
++
++/*
++ * PCS0 --> Always on power domain, includes the JTAG tap and DMI_AHB bus in
++ *  ncejdtm200.
++ * PCS1 --> Power domain for debug subsystem
++ * PCS2 --> Main power domain, includes the system bus and AHB, APB peripheral
++ *  IPs.
++ * PCS3 --> Power domain for Core0 and L2C.
++ * PCSN --> Power domain for Core (N-3)
++ */
++
++#define PCSN_WE_OFF(n)          n * 0x20 + PCS0_WE_OFF
++#define CN_PCS_WE_OFF(n)        (n + 3) * 0x20 + PCS0_WE_OFF
++#define CN_PCS_STATUS_OFF(n)    (n + 3) * 0x20 + PCS0_STATUS_OFF
++#define CN_PCS_CTL_OFF(n)       (n + 3) * 0x20 + PCS0_CTL_OFF
++
++
++#define PD_TYPE_MASK    0x7
++#define PD_STATUS_MASK  0xf8
++#define GET_PD_TYPE(val)        val & PD_TYPE_MASK
++#define GET_PD_STATUS(val)      (val & PD_STATUS_MASK) >> 3
++
++// PD_type
++#define ACTIVE  0
++#define RESET   1
++#define SLEEP   2
++#define TIMEOUT 7
++
++// PD_status for sleep type
++#define LightSleep_STATUS       0
++#define DeepSleep_STATUS        16
++
++// param of PCS_CTL for sleep cmd
++#define LightSleep_CTL          0
++#define DeepSleep_CTL           1
++
++// PCS_CTL
++#define PCS_CTL_PARAM_OFF       3
++#define SLEEP_CMD       3
++
++// wakeup events source offset
++#define PCS_WAKE_DBG_OFF	28
++#define PCS_WAKE_MSIP_OFF	29
++
++#define L2_CTL_OFF              0x8
++#define L2_COMMAND_OFF(cpu)     0x40 + 0x10 * cpu
++#define L2_STATUS_REG           0x80
++#define L2_WBINVAL_COMMAND      0x12
++
++extern unsigned int *wake_mask;
++extern void __iomem *l2c_base;
++
++void set_wakeup_enable(int cpu, unsigned int events);
++void set_sleep(int cpu, unsigned char sleep);
++void andes_suspend2standby(void);
++void andes_suspend2ram(void);
++
++static inline void sbi_suspend_prepare(char main_core, char enable)
++{
++	/* TODO */
++	// SBI_CALL_2(SBI_SUSPEND_PREPARE, main_core, enable);
++}
++
++static inline void sbi_suspend_mem(void)
++{
++	/* TODO */
++	// SBI_CALL_0(SBI_SUSPEND_MEM);
++}
++#endif
+--
+2.25.1
diff --git a/board/andes/ae350/patches/linux/0006-Add-andes-sbi-call-vendor-extension.patch b/board/andes/ae350/patches/linux/0006-Add-andes-sbi-call-vendor-extension.patch
new file mode 100644
index 0000000000..51b4277930
--- /dev/null
+++ b/board/andes/ae350/patches/linux/0006-Add-andes-sbi-call-vendor-extension.patch
@@ -0,0 +1,231 @@
+From d4d9304e009a8c754e16e1ebb17c0ec3071eb68e Mon Sep 17 00:00:00 2001
+From: Yu Chien Peter Lin <peterlin@andestech.com>
+Date: Tue, 28 Dec 2021 16:22:56 +0800
+Subject: [PATCH 06/12] Add andes sbi call vendor extension
+
+Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
+---
+ arch/riscv/andesv5/sbi.c     | 111 +++++++++++++++++++++++++++++++++++
+ arch/riscv/include/asm/sbi.h |  59 ++++++++++++++++++-
+ 2 files changed, 168 insertions(+), 2 deletions(-)
+ create mode 100755 arch/riscv/andesv5/sbi.c
+
+diff --git a/arch/riscv/andesv5/sbi.c b/arch/riscv/andesv5/sbi.c
+new file mode 100755
+index 000000000000..c5d2afd83ae0
+--- /dev/null
++++ b/arch/riscv/andesv5/sbi.c
+@@ -0,0 +1,111 @@
++/*
++ *  Copyright (C) 2020 Andes Technology Corporation
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ */
++
++#include <asm/andesv5/csr.h>
++#include <asm/andesv5/proc.h>
++#include <asm/sbi.h>
++
++void sbi_suspend_prepare(char main_core, char enable)
++{
++	sbi_ecall(SBI_EXT_ANDES, SBI_EXT_ANDES_SUSPEND_PREPARE, main_core, enable, 0, 0, 0, 0);
++}
++EXPORT_SYMBOL(sbi_suspend_prepare);
++
++void sbi_suspend_mem(void)
++{
++	sbi_ecall(SBI_EXT_ANDES, SBI_EXT_ANDES_SUSPEND_MEM, 0, 0, 0, 0, 0, 0);
++}
++EXPORT_SYMBOL(sbi_suspend_mem);
++
++void sbi_restart(int cpu_num)
++{
++	sbi_ecall(SBI_EXT_ANDES, SBI_EXT_ANDES_RESTART, cpu_num, 0, 0, 0, 0, 0);
++}
++EXPORT_SYMBOL(sbi_restart);
++
++void sbi_write_powerbrake(int val)
++{
++  sbi_ecall(SBI_EXT_ANDES, SBI_EXT_ANDES_WRITE_POWERBRAKE, val, 0, 0, 0, 0, 0);
++}
++EXPORT_SYMBOL(sbi_write_powerbrake);
++
++int sbi_read_powerbrake(void)
++{
++  struct sbiret ret;
++  ret = sbi_ecall(SBI_EXT_ANDES, SBI_EXT_ANDES_READ_POWERBRAKE, 0, 0, 0, 0, 0, 0);
++  return ret.value;
++}
++EXPORT_SYMBOL(sbi_read_powerbrake);
++
++void sbi_set_suspend_mode(int suspend_mode)
++{
++	sbi_ecall(SBI_EXT_ANDES, SBI_EXT_ANDES_SET_SUSPEND_MODE, suspend_mode, 0, 0, 0, 0, 0);
++}
++EXPORT_SYMBOL(sbi_set_suspend_mode);
++
++void sbi_set_reset_vec(int val)
++{
++	sbi_ecall(SBI_EXT_ANDES, SBI_EXT_ANDES_SET_RESET_VEC, val, 0, 0, 0, 0, 0);
++}
++EXPORT_SYMBOL(sbi_set_reset_vec);
++
++void sbi_set_pma(void *arg)
++{
++	phys_addr_t offset = ((struct pma_arg_t*)arg)->offset;
++	unsigned long vaddr = ((struct pma_arg_t*)arg)->vaddr;
++	size_t size = ((struct pma_arg_t*)arg)->size;
++	size_t entry_id = ((struct pma_arg_t*)arg)->entry_id;
++	sbi_ecall(SBI_EXT_ANDES, SBI_EXT_ANDES_SET_PMA, offset, vaddr, size, entry_id, 0, 0);
++}
++EXPORT_SYMBOL(sbi_set_pma);
++
++void sbi_free_pma(unsigned long entry_id)
++{
++	sbi_ecall(SBI_EXT_ANDES, SBI_EXT_ANDES_FREE_PMA, entry_id, 0, 0, 0, 0, 0);
++}
++EXPORT_SYMBOL(sbi_free_pma);
++
++long sbi_probe_pma(void)
++{
++	struct sbiret ret;
++	ret = sbi_ecall(SBI_EXT_ANDES, SBI_EXT_ANDES_PROBE_PMA, 0, 0, 0, 0, 0, 0);
++	return ret.value;
++}
++EXPORT_SYMBOL(sbi_probe_pma);
++
++void sbi_set_trigger(unsigned int type, uintptr_t data, int enable)
++{
++	sbi_ecall(SBI_EXT_ANDES, SBI_EXT_ANDES_TRIGGER, type, data, enable, 0, 0, 0);
++}
++EXPORT_SYMBOL(sbi_set_trigger);
++
++long sbi_get_marchid(void)
++{
++	struct sbiret ret;
++	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_MARCHID, 0, 0, 0, 0, 0, 0);
++	return ret.value;
++}
++EXPORT_SYMBOL(sbi_get_marchid);
++
++long sbi_get_micm_cfg(void)
++{
++	struct sbiret ret;
++	ret = sbi_ecall(SBI_EXT_ANDES, SBI_EXT_ANDES_GET_MICM_CFG,
++			0, 0, 0, 0, 0, 0);
++	return ret.value;
++}
++EXPORT_SYMBOL(sbi_get_micm_cfg);
++
++long sbi_get_mdcm_cfg(void)
++{
++	struct sbiret ret;
++	ret = sbi_ecall(SBI_EXT_ANDES, SBI_EXT_ANDES_GET_MDCM_CFG,
++			0, 0, 0, 0, 0, 0);
++	return ret.value;
++}
++EXPORT_SYMBOL(sbi_get_mdcm_cfg);
+diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
+index c0fdb05ffa0b..d3b2d34136f0 100644
+--- a/arch/riscv/include/asm/sbi.h
++++ b/arch/riscv/include/asm/sbi.h
+@@ -10,6 +10,14 @@
+ #include <linux/types.h>
+
+ #ifdef CONFIG_RISCV_SBI
++
++struct pma_arg_t {
++	phys_addr_t offset;
++	unsigned long vaddr;
++	size_t size;
++	size_t entry_id;
++};
++
+ enum sbi_ext_id {
+ #ifdef CONFIG_RISCV_SBI_V01
+	SBI_EXT_0_1_SET_TIMER = 0x0,
+@@ -27,6 +35,7 @@ enum sbi_ext_id {
+	SBI_EXT_IPI = 0x735049,
+	SBI_EXT_RFENCE = 0x52464E43,
+	SBI_EXT_HSM = 0x48534D,
++	SBI_EXT_ANDES = 0x0900031E,
+ };
+
+ enum sbi_ext_base_fid {
+@@ -51,10 +60,10 @@ enum sbi_ext_rfence_fid {
+	SBI_EXT_RFENCE_REMOTE_FENCE_I = 0,
+	SBI_EXT_RFENCE_REMOTE_SFENCE_VMA,
+	SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID,
+-	SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID,
+	SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA,
+-	SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID,
++	SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID,
+	SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA,
++	SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID,
+ };
+
+ enum sbi_ext_hsm_fid {
+@@ -63,6 +72,35 @@ enum sbi_ext_hsm_fid {
+	SBI_EXT_HSM_HART_STATUS,
+ };
+
++enum sbi_ext_andes_fid {
++	SBI_EXT_ANDES_GET_MCACHE_CTL_STATUS = 0,
++	SBI_EXT_ANDES_GET_MMISC_CTL_STATUS,
++	SBI_EXT_ANDES_SET_MCACHE_CTL,
++	SBI_EXT_ANDES_SET_MMISC_CTL,
++	SBI_EXT_ANDES_ICACHE_OP,
++	SBI_EXT_ANDES_DCACHE_OP,
++	SBI_EXT_ANDES_L1CACHE_I_PREFETCH,
++	SBI_EXT_ANDES_L1CACHE_D_PREFETCH,
++	SBI_EXT_ANDES_NON_BLOCKING_LOAD_STORE,
++	SBI_EXT_ANDES_WRITE_AROUND,
++	SBI_EXT_ANDES_TRIGGER,
++	SBI_EXT_ANDES_SET_PFM,
++	SBI_EXT_ANDES_READ_POWERBRAKE,
++	SBI_EXT_ANDES_WRITE_POWERBRAKE,
++	SBI_EXT_ANDES_SUSPEND_PREPARE,
++	SBI_EXT_ANDES_SUSPEND_MEM,
++	SBI_EXT_ANDES_SET_SUSPEND_MODE,
++	SBI_EXT_ANDES_ENTER_SUSPEND_MODE,
++	SBI_EXT_ANDES_RESTART,
++	SBI_EXT_ANDES_SET_RESET_VEC,
++	SBI_EXT_ANDES_SET_PMA,
++	SBI_EXT_ANDES_FREE_PMA,
++	SBI_EXT_ANDES_PROBE_PMA,
++	SBI_EXT_ANDES_DCACHE_WBINVAL_ALL,
++	SBI_EXT_ANDES_GET_MICM_CFG,
++	SBI_EXT_ANDES_GET_MDCM_CFG,
++};
++
+ enum sbi_hsm_hart_status {
+	SBI_HSM_HART_STATUS_STARTED = 0,
+	SBI_HSM_HART_STATUS_STOPPED,
+@@ -146,6 +184,23 @@ static inline unsigned long sbi_minor_version(void)
+ }
+
+ int sbi_err_map_linux_errno(int err);
++
++void sbi_suspend_prepare(char main_core, char enable);
++void sbi_suspend_mem(void);
++void sbi_restart(int cpu_num);
++void sbi_write_powerbrake(int val);
++int sbi_read_powerbrake(void);
++void sbi_set_suspend_mode(int suspend_mode);
++void sbi_set_reset_vec(int val);
++void sbi_set_pma(void *arg);
++void sbi_free_pma(unsigned long entry_id);
++long sbi_probe_pma(void);
++void sbi_set_trigger(unsigned int type, uintptr_t data, int enable);
++long sbi_get_marchid(void);
++int get_custom_csr_cacheinfo(const char *propname, u32 *out_value);
++long sbi_get_micm_cfg(void);
++long sbi_get_mdcm_cfg(void);
++
+ #else /* CONFIG_RISCV_SBI */
+ /* stubs for code that is only reachable under IS_ENABLED(CONFIG_RISCV_SBI): */
+ void sbi_set_timer(uint64_t stime_value);
+--
+2.25.1
diff --git a/board/andes/ae350/patches/linux/0007-riscv-Porting-pte-update-function-local_flush_tlb_al.patch b/board/andes/ae350/patches/linux/0007-riscv-Porting-pte-update-function-local_flush_tlb_al.patch
new file mode 100644
index 0000000000..238a71841d
--- /dev/null
+++ b/board/andes/ae350/patches/linux/0007-riscv-Porting-pte-update-function-local_flush_tlb_al.patch
@@ -0,0 +1,101 @@
+From 7c7587775d5b86d5822777e226a6bf0bb3704bed Mon Sep 17 00:00:00 2001
+From: Yu Chien Peter Lin <peterlin@andestech.com>
+Date: Tue, 28 Dec 2021 16:44:26 +0800
+Subject: [PATCH 07/12] riscv: Porting pte update function
+ "local_flush_tlb_all"
+
+Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
+---
+ arch/riscv/include/asm/pgtable-64.h |  1 +
+ arch/riscv/include/asm/pgtable.h    | 20 ++++++++++++++++++--
+ 2 files changed, 19 insertions(+), 2 deletions(-)
+
+diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
+index f3b0da64c6c8..69a9a87b3365 100644
+--- a/arch/riscv/include/asm/pgtable-64.h
++++ b/arch/riscv/include/asm/pgtable-64.h
+@@ -53,6 +53,7 @@ static inline int pud_leaf(pud_t pud)
+ static inline void set_pud(pud_t *pudp, pud_t pud)
+ {
+	*pudp = pud;
++	local_flush_tlb_all();
+ }
+
+ static inline void pud_clear(pud_t *pudp)
+diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
+index 73e8b5e5bb65..0fa3fc6658ed 100644
+--- a/arch/riscv/include/asm/pgtable.h
++++ b/arch/riscv/include/asm/pgtable.h
+@@ -7,7 +7,6 @@
+ #define _ASM_RISCV_PGTABLE_H
+
+ #include <linux/mmzone.h>
+-#include <linux/sizes.h>
+
+ #include <asm/pgtable-bits.h>
+
+@@ -18,6 +17,7 @@
+ #include <asm/page.h>
+ #include <asm/tlbflush.h>
+ #include <linux/mm_types.h>
++#include <linux/sizes.h>
+
+ #ifdef CONFIG_MMU
+
+@@ -99,6 +99,7 @@
+				| _PAGE_DIRTY)
+
+ #define PAGE_KERNEL		__pgprot(_PAGE_KERNEL)
++#define PAGE_KERNEL_EXEC	__pgprot(_PAGE_KERNEL | _PAGE_EXEC)
+ #define PAGE_KERNEL_READ	__pgprot(_PAGE_KERNEL & ~_PAGE_WRITE)
+ #define PAGE_KERNEL_EXEC	__pgprot(_PAGE_KERNEL | _PAGE_EXEC)
+ #define PAGE_KERNEL_READ_EXEC	__pgprot((_PAGE_KERNEL & ~_PAGE_WRITE) \
+@@ -134,6 +135,12 @@ extern pgd_t swapper_pg_dir[];
+ #define __S110	PAGE_SHARED_EXEC
+ #define __S111	PAGE_SHARED_EXEC
+
++#define pgprot_noncached pgprot_noncached
++static inline pgprot_t pgprot_noncached(pgprot_t _prot)
++{
++       return __pgprot(pgprot_val(_prot) | _PAGE_NONCACHEABLE);
++}
++
+ static inline int pmd_present(pmd_t pmd)
+ {
+	return (pmd_val(pmd) & (_PAGE_PRESENT | _PAGE_PROT_NONE));
+@@ -159,6 +166,7 @@ static inline int pmd_leaf(pmd_t pmd)
+ static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
+ {
+	*pmdp = pmd;
++	local_flush_tlb_all();
+ }
+
+ static inline void pmd_clear(pmd_t *pmdp)
+@@ -195,9 +203,16 @@ static inline unsigned long pte_pfn(pte_t pte)
+ #define pte_page(x)     pfn_to_page(pte_pfn(x))
+
+ /* Constructs a page table entry */
++extern phys_addr_t pa_msb;
+ static inline pte_t pfn_pte(unsigned long pfn, pgprot_t prot)
+ {
+-	return __pte((pfn << _PAGE_PFN_SHIFT) | pgprot_val(prot));
++	pte_t ret;
++	if (pgprot_val(prot) & _PAGE_NONCACHEABLE) {
++		ret = __pte(((pfn|pa_msb) << _PAGE_PFN_SHIFT) | (pgprot_val(prot) & ~_PAGE_NONCACHEABLE));
++	} else {
++		ret = __pte((pfn << _PAGE_PFN_SHIFT) | pgprot_val(prot));
++	}
++	return ret;
+ }
+
+ #define mk_pte(page, prot)       pfn_pte(page_to_pfn(page), prot)
+@@ -327,6 +342,7 @@ static inline int pte_same(pte_t pte_a, pte_t pte_b)
+ static inline void set_pte(pte_t *ptep, pte_t pteval)
+ {
+	*ptep = pteval;
++	local_flush_tlb_all();
+ }
+
+ void flush_icache_pte(pte_t pte);
+--
+2.25.1
diff --git a/board/andes/ae350/patches/linux/0008-Support-time32-stat64-sys_clone3-syscalls.patch b/board/andes/ae350/patches/linux/0008-Support-time32-stat64-sys_clone3-syscalls.patch
new file mode 100644
index 0000000000..9d604ae5bc
--- /dev/null
+++ b/board/andes/ae350/patches/linux/0008-Support-time32-stat64-sys_clone3-syscalls.patch
@@ -0,0 +1,47 @@
+From 4d02088e32ecb5abb3c84d9364f15db2044fadf3 Mon Sep 17 00:00:00 2001
+From: Yu Chien Peter Lin <peterlin@andestech.com>
+Date: Tue, 28 Dec 2021 16:47:28 +0800
+Subject: [PATCH 08/12] Support time32, stat64, sys_clone3 syscalls
+
+Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
+---
+ arch/riscv/include/asm/unistd.h      | 3 +++
+ arch/riscv/include/uapi/asm/unistd.h | 6 +++---
+ 2 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/arch/riscv/include/asm/unistd.h b/arch/riscv/include/asm/unistd.h
+index 977ee6181dab..42ebae0693b1 100644
+--- a/arch/riscv/include/asm/unistd.h
++++ b/arch/riscv/include/asm/unistd.h
+@@ -9,6 +9,9 @@
+  */
+
+ #define __ARCH_WANT_SYS_CLONE
++#define __ARCH_WANT_STAT64
++#define __ARCH_WANT_SYS_CLONE3
++#define __ARCH_WANT_TIME32_SYSCALLS
+
+ #include <uapi/asm/unistd.h>
+
+diff --git a/arch/riscv/include/uapi/asm/unistd.h b/arch/riscv/include/uapi/asm/unistd.h
+index 8062996c2dfd..c05ce62b2b33 100644
+--- a/arch/riscv/include/uapi/asm/unistd.h
++++ b/arch/riscv/include/uapi/asm/unistd.h
+@@ -15,12 +15,12 @@
+  * along with this program.  If not, see <https://www.gnu.org/licenses/>.
+  */
+
+-#ifdef __LP64__
+ #define __ARCH_WANT_NEW_STAT
+ #define __ARCH_WANT_SET_GET_RLIMIT
+-#endif /* __LP64__ */
+-
++#define __ARCH_WANT_SYS_NEWFSTATAT
+ #define __ARCH_WANT_SYS_CLONE3
++#define __ARCH_WANT_TIME32_SYSCALLS
++#define __ARCH_WANT_STAT64
+
+ #include <asm-generic/unistd.h>
+
+--
+2.25.1
diff --git a/board/andes/ae350/patches/linux/0009-dma-Support-smp-up-with-dma.patch b/board/andes/ae350/patches/linux/0009-dma-Support-smp-up-with-dma.patch
new file mode 100644
index 0000000000..9c731f003b
--- /dev/null
+++ b/board/andes/ae350/patches/linux/0009-dma-Support-smp-up-with-dma.patch
@@ -0,0 +1,120 @@
+From 27a98deea31b3d724fccb2728f43053ee1a814df Mon Sep 17 00:00:00 2001
+From: Yu Chien Peter Lin <peterlin@andestech.com>
+Date: Tue, 28 Dec 2021 16:59:12 +0800
+Subject: [PATCH 09/12] dma: Support smp/up with dma
+
+Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
+---
+ arch/riscv/mm/dma-mapping.c | 101 ++++++++++++++++++++++++++++++++++++
+ 1 file changed, 101 insertions(+)
+ create mode 100755 arch/riscv/mm/dma-mapping.c
+
+diff --git a/arch/riscv/mm/dma-mapping.c b/arch/riscv/mm/dma-mapping.c
+new file mode 100755
+index 000000000000..8072e765f3ae
+--- /dev/null
++++ b/arch/riscv/mm/dma-mapping.c
+@@ -0,0 +1,101 @@
++#include <linux/dma-direct.h>
++#include <linux/swiotlb.h>
++
++
++/********************************************
++ * The following APIs are for dummy DMA ops *
++ ********************************************/
++
++static void *__dummy_alloc(struct device *dev, size_t size,
++			   dma_addr_t *dma_handle, gfp_t flags,
++			   unsigned long attrs)
++{
++	return NULL;
++}
++
++static void __dummy_free(struct device *dev, size_t size,
++			 void *vaddr, dma_addr_t dma_handle,
++			 unsigned long attrs)
++{
++}
++
++static int __dummy_mmap(struct device *dev,
++			struct vm_area_struct *vma,
++			void *cpu_addr, dma_addr_t dma_addr, size_t size,
++			unsigned long attrs)
++{
++	return -ENXIO;
++}
++
++static dma_addr_t __dummy_map_page(struct device *dev, struct page *page,
++				   unsigned long offset, size_t size,
++				   enum dma_data_direction dir,
++				   unsigned long attrs)
++{
++	return 0;
++}
++
++static void __dummy_unmap_page(struct device *dev, dma_addr_t dev_addr,
++			       size_t size, enum dma_data_direction dir,
++			       unsigned long attrs)
++{
++}
++
++static int __dummy_map_sg(struct device *dev, struct scatterlist *sgl,
++			  int nelems, enum dma_data_direction dir,
++			  unsigned long attrs)
++{
++	return 0;
++}
++
++static void __dummy_unmap_sg(struct device *dev,
++			     struct scatterlist *sgl, int nelems,
++			     enum dma_data_direction dir,
++			     unsigned long attrs)
++{
++}
++
++static void __dummy_sync_single(struct device *dev,
++				dma_addr_t dev_addr, size_t size,
++				enum dma_data_direction dir)
++{
++}
++
++static void __dummy_sync_sg(struct device *dev,
++			    struct scatterlist *sgl, int nelems,
++			    enum dma_data_direction dir)
++{
++}
++
++// static int __dummy_mapping_error(struct device *hwdev, dma_addr_t dma_addr)
++// {
++// 	return 1;
++// }
++
++static int __dummy_dma_supported(struct device *hwdev, u64 mask)
++{
++	return 0;
++}
++
++const struct dma_map_ops dummy_dma_ops = {
++	.alloc                  = __dummy_alloc,
++	.free                   = __dummy_free,
++	.mmap                   = __dummy_mmap,
++	.map_page               = __dummy_map_page,
++	.unmap_page             = __dummy_unmap_page,
++	.map_sg                 = __dummy_map_sg,
++	.unmap_sg               = __dummy_unmap_sg,
++	.sync_single_for_cpu    = __dummy_sync_single,
++	.sync_single_for_device = __dummy_sync_single,
++	.sync_sg_for_cpu        = __dummy_sync_sg,
++	.sync_sg_for_device     = __dummy_sync_sg,
++	// .mapping_error          = __dummy_mapping_error,
++	.dma_supported          = __dummy_dma_supported,
++};
++EXPORT_SYMBOL(dummy_dma_ops);
++
++void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
++		const struct iommu_ops *iommu, bool coherent)
++{
++	dev->dma_coherent = coherent;
++}
+--
+2.25.1
diff --git a/board/andes/ae350/patches/linux/0010-riscv-platform-Fix-atcdmac300-chained-irq-mapping-is.patch b/board/andes/ae350/patches/linux/0010-riscv-platform-Fix-atcdmac300-chained-irq-mapping-is.patch
new file mode 100644
index 0000000000..b81c9dce8b
--- /dev/null
+++ b/board/andes/ae350/patches/linux/0010-riscv-platform-Fix-atcdmac300-chained-irq-mapping-is.patch
@@ -0,0 +1,300 @@
+From 356bf37d40fb4b9f9044cb872d3ebd74a3b0c4ff Mon Sep 17 00:00:00 2001
+From: Yu Chien Peter Lin <peterlin@andestech.com>
+Date: Tue, 28 Dec 2021 17:02:35 +0800
+Subject: [PATCH 10/12] riscv/platform: Fix atcdmac300 chained irq mapping
+ issue
+
+Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
+---
+ arch/riscv/include/asm/atcdmac300.h     |  2 +-
+ arch/riscv/platforms/ae350/atcdmac300.c | 95 +++++++++++++------------
+ 2 files changed, 51 insertions(+), 46 deletions(-)
+
+diff --git a/arch/riscv/include/asm/atcdmac300.h b/arch/riscv/include/asm/atcdmac300.h
+index 20fe88212dfc..0d4dcc08e7f3 100644
+--- a/arch/riscv/include/asm/atcdmac300.h
++++ b/arch/riscv/include/asm/atcdmac300.h
+@@ -198,7 +198,7 @@ typedef struct channel_control
+ #define DMAC_REQN_UART2RX		7
+ #define DMAC_REQN_I2C			8
+ #define DMAC_REQN_SDC			9
+-#define DMAC_REQN_NONE			15
++#define DMAC_REQN_NONE			16
+
+
+ enum DMAD_DMAC_CORE {
+diff --git a/arch/riscv/platforms/ae350/atcdmac300.c b/arch/riscv/platforms/ae350/atcdmac300.c
+index e635328f9362..8f434b1f8845 100644
+--- a/arch/riscv/platforms/ae350/atcdmac300.c
++++ b/arch/riscv/platforms/ae350/atcdmac300.c
+@@ -526,8 +526,8 @@ static irqreturn_t dmad_ahb_isr(int irq, void *dev_id)
+
+		dmad_dbg("dma finish\n");
+
+-		dmad_dbg("finish drb(%d 0x%08x) addr0(0x%08x) "
+-			 "addr1(0x%08x) size(0x%08x)\n",
++		dmad_dbg("finish drb(%d 0x%08x) addr0(0x%08llx) "
++			 "addr1(0x%08llx) size(0x%08llx)\n",
+			 drb->node, (u32) drb, drb->src_addr,
+			 drb->dst_addr, drb->req_cycle);
+
+@@ -548,8 +548,8 @@ static irqreturn_t dmad_ahb_isr(int irq, void *dev_id)
+			// Lookup next DRB (DMA Request Block)
+			drb_iter = &drq->drb_pool[drq->sbt_head];
+
+-			dmad_dbg("exec drb(%d 0x%08x) addr0(0x%08x) "
+-				 "addr1(0x%08x) size(0x%08x)\n",
++			dmad_dbg("exec drb(%d 0x%08x) addr0(0x%08llx) "
++				 "addr1(0x%08llx) size(0x%08llx)\n",
+				 drb_iter->node, (u32) drb_iter,
+				 drb_iter->src_addr, drb_iter->dst_addr,
+				 drb_iter->req_cycle);
+@@ -640,7 +640,7 @@ static void dmad_ahb_config_dir(dmad_chreq * ch_req, unsigned long * channel_cmd
+	dmad_drq *drq = (dmad_drq *) ch_req->drq;
+	dmad_ahb_chreq *ahb_req = (dmad_ahb_chreq *) (&ch_req->ahb_req);
+	channel_control ch_ctl;
+-	dmad_dbg("%s() channel_cmds(0x%08x)\n",__func__, channel_cmds[0]);
++	dmad_dbg("%s() channel_cmds(0x%08lx)\n",__func__, channel_cmds[0]);
+	channel_cmds[0] &= ~(u32)(SRCWIDTH_MASK|SRCADDRCTRL_MASK|
+		DSTWIDTH_MASK|DSTADDRCTRL_MASK|
+		SRC_HS|DST_HS|SRCREQSEL_MASK|DSTREQSEL_MASK);
+@@ -656,6 +656,7 @@ static void dmad_ahb_config_dir(dmad_chreq * ch_req, unsigned long * channel_cmd
+		memcpy((u8 *)&ch_ctl.dWidth,(u8 *)&ahb_req->addr0_width,12);
+		drq->flags |= (addr_t) DMAD_DRQ_DIR_A1_TO_A0;
+	}
++
+	channel_cmds[0] |=(((ch_ctl.sWidth << SRCWIDTH) &SRCWIDTH_MASK) |
+		((ch_ctl.sCtrl << SRCADDRCTRL) &SRCADDRCTRL_MASK) |
+		((ch_ctl.dWidth << DSTWIDTH) &DSTWIDTH_MASK) |
+@@ -673,7 +674,7 @@ static void dmad_ahb_config_dir(dmad_chreq * ch_req, unsigned long * channel_cmd
+				((ch_ctl.dReqn <<DSTREQSEL)&DSTREQSEL_MASK));
+		}
+	}
+-	dmad_dbg("%s() channel_cmds(0x%08x)\n",
++	dmad_dbg("%s() channel_cmds(0x%08lx)\n",
+		 __func__, channel_cmds[0]);
+ }
+
+@@ -692,16 +693,19 @@ static int dmad_ahb_init(dmad_chreq * ch_req)
+	dmad_ahb_chreq *ahb_req = (dmad_ahb_chreq *) (&ch_req->ahb_req);
+	u32 channel = (u32) ch_req->channel;
+
++	int virq=0;
++
+	unsigned long channel_base = drq->channel_base;
+	addr_t channel_cmds[1];
+	unsigned long lock_flags;
+	dmad_dbg("%s()\n", __func__);
+	/* register interrupt handler */
+-	err = request_irq(ahb_irqs[channel], dmad_ahb_isr, 0,
++	virq = ftdmac020_find_irq(ahb_irqs[channel]);
++	err = request_irq(virq, dmad_ahb_isr, 0,
+			  "AHB_DMA", (void *)(unsigned long)(channel + 1));
+	if (unlikely(err != 0)) {
+		dmad_err("unable to request IRQ %d for AHB DMA "
+-			 "(error %d)\n", ahb_irqs[channel], err);
++			 "(error %d)\n", virq, err);
+		free_irq(ahb_irqs[channel], (void *)(unsigned long)(channel + 1));
+		return err;
+	}
+@@ -995,9 +999,9 @@ int dmad_channel_alloc(dmad_chreq * ch_req)
+
+		}
+
+-		dmad_dbg("%s() ring: base(0x%08x) port(0x%08x) periods(0x%08x)"
+-			 " period_size(0x%08x) period_bytes(0x%08x)"
+-			 " remnant_size(0x%08x)\n",
++		dmad_dbg("%s() ring: base(0x%08llx) port(0x%08lx) periods(0x%08x)"
++			 " period_size(0x%08x) period_bytes(0x%08llx)"
++			 " remnant_size(0x%08llx)\n",
+			 __func__, drq_iter->ring_base, drq_iter->ring_port,
+			 drq_iter->periods, drq_iter->period_size,
+			 drq_iter->period_bytes, drq_iter->remnant_size);
+@@ -1484,13 +1488,13 @@ static inline int dmad_submit_request_internal(dmad_drq * drq, dmad_drb * drb)
+
+		drb->state = DMAD_DRB_STATE_SUBMITTED;
+
+-		dmad_dbg("%s() submit drb(%d 0x%08x) addr0(0x%08x) "
+-			 "addr1(0x%08x) size(0x%08x) state(%d)\n", __func__,
++		dmad_dbg("%s() submit drb(%d 0x%08x) addr0(0x%08llx) "
++			 "addr1(0x%08llx) size(0x%08llx) state(%d)\n", __func__,
+			 drb->node, (u32) drb, drb->src_addr, drb->dst_addr,
+			 drb->req_cycle, drb->state);
+	} else {
+-		dmad_dbg("%s() skip drb(%d 0x%08x) addr0(0x%08x) addr1(0x%08x)"
+-			 " size(0x%08x) state(%d)\n", __func__,
++		dmad_dbg("%s() skip drb(%d 0x%08x) addr0(0x%08llx) addr1(0x%08llx)"
++			 " size(0x%08llx) state(%d)\n", __func__,
+			 drb->node, (u32) drb, drb->src_addr, drb->dst_addr,
+			 drb->req_cycle, drb->state);
+	}
+@@ -1545,8 +1549,8 @@ int dmad_submit_request(dmad_chreq * ch_req, dmad_drb * drb, u8 keep_fired)
+			 drb->node);
+
+	/* Queue DRB to the end of the submitted list */
+-	dmad_dbg("submit drb(%d 0x%08x) addr0(0x%08x) addr1(0x%08x) "
+-		 "size(0x%08x) sync(0x%08x) fire(%d)\n",
++	dmad_dbg("submit drb(%d 0x%08x) addr0(0x%08llx) addr1(0x%08llx) "
++		 "size(0x%08llx) sync(0x%08x) fire(%d)\n",
+		 drb->node, (u32) drb, drb->src_addr, drb->dst_addr,
+		 drb->req_cycle, (u32) drb->sync, keep_fired);
+
+@@ -1636,8 +1640,8 @@ int dmad_withdraw_request(dmad_chreq * ch_req, dmad_drb * drb)
+		return -EBADR;
+	}
+
+-	dmad_dbg("cancel drb(%d 0x%08x) addr0(0x%08x) addr1(0x%08x) "
+-		 "size(0x%08x) state(%d)\n",
++	dmad_dbg("cancel drb(%d 0x%08x) addr0(0x%08llx) addr1(0x%08llx) "
++		 "size(0x%08llx) state(%d)\n",
+		 drb->node, (u32) drb, drb->src_addr, drb->dst_addr,
+		 drb->req_cycle, drb->state);
+
+@@ -1687,8 +1691,8 @@ static inline int dmad_kickoff_requests_internal(dmad_drq * drq)
+		return -EBADR;
+	}
+
+-	dmad_dbg("%s() drb(%d 0x%08x) addr0(0x%08x) addr1(0x%08x) "
+-		 "size(0x%08x) state(%d)\n", __func__,
++	dmad_dbg("%s() drb(%d 0x%08x) addr0(0x%08llx) addr1(0x%08llx) "
++		 "size(0x%08llx) state(%d)\n", __func__,
+		 drb->node, (u32) drb, drb->src_addr, drb->dst_addr,
+		 drb->req_cycle, drb->state);
+
+@@ -1749,10 +1753,10 @@ int dmad_kickoff_requests(dmad_chreq * ch_req)
+
+	dmad_get_head(drq->drb_pool, &drq->sbt_head, &drq->sbt_tail, &drb);
+
+-	dmad_dbg("drq(0x%08x) channel_base(0x%08x)\n",
++	dmad_dbg("drq(0x%08x) channel_base(0x%08lx)\n",
+		 (u32) drq, drq->channel_base);
+-	dmad_dbg("kick off drb(%d 0x%08x) addr0(0x%08x) addr1(0x%08x) "
+-		 "size(0x%08x) state(%d) a1_to_a0(%d)\n",
++	dmad_dbg("kick off drb(%d 0x%08x) addr0(0x%08llx) addr1(0x%08llx) "
++		 "size(0x%08llx) state(%d) a1_to_a0(%d)\n",
+		 (u32) drb->node, (u32) drb, drb->addr0, drb->addr1,
+		 drb->req_cycle, drb->state,
+		 drq->flags & DMAD_DRQ_DIR_A1_TO_A0);
+@@ -1876,9 +1880,9 @@ int dmad_update_ring(dmad_chreq * ch_req)
+
+	spin_unlock_irqrestore(&drq->drb_pool_lock, lock_flags);
+
+-	dmad_dbg("%s() ring: base(0x%08x) port(0x%08x) periods(0x%08x) "
+-		 "period_size(0x%08x) period_bytes(0x%08x) "
+-		 "remnant_size(0x%08x)\n",
++	dmad_dbg("%s() ring: base(0x%08llx) port(0x%08lx) periods(0x%08x) "
++		 "period_size(0x%08x) period_bytes(0x%08llx) "
++		 "remnant_size(0x%08llx)\n",
+		 __func__, drq->ring_base, drq->ring_port,
+		 drq->periods, drq->period_size, drq->period_bytes,
+		 drq->remnant_size);
+@@ -1948,10 +1952,10 @@ int dmad_update_ring_sw_ptr(dmad_chreq * ch_req,
+		sw_p_off += period_size;
+	}
+
+-	dmad_dbg("%s() ring_ptr(0x%08x) ring_p_idx(0x%08x) "
+-		 "ring_p_off(0x%08x)\n",
++	dmad_dbg("%s() ring_ptr(0x%08llx) ring_p_idx(0x%08x) "
++		 "ring_p_off(0x%08llx)\n",
+		 __func__, ring_ptr, ring_p_idx, ring_p_off);
+-	dmad_dbg("%s() sw_ptr(0x%08x) sw_p_idx(0x%08x) sw_p_off(0x%08x)\n",
++	dmad_dbg("%s() sw_ptr(0x%08llx) sw_p_idx(0x%08x) sw_p_off(0x%08llx)\n",
+		 __func__, sw_ptr, sw_p_idx, sw_p_off);
+
+	if (drq->ring_drb &&
+@@ -1971,8 +1975,8 @@ int dmad_update_ring_sw_ptr(dmad_chreq * ch_req,
+		drb->addr1 = drq->dev_addr;
+		drb->req_cycle = 0;	// redundent, though, no harm to performance
+
+-		dmad_dbg("init_drb(%d 0x%08x) addr0(0x%08x) addr1(0x%08x) "
+-			 "size(0x%08x) state(%d)\n",
++		dmad_dbg("init_drb(%d 0x%08x) addr0(0x%08llx) addr1(0x%08llx) "
++			 "size(0x%08llx) state(%d)\n",
+			 (u32) drb->node, (u32) drb, drb->src_addr,
+			 drb->dst_addr, drb->req_cycle, drb->state);
+
+@@ -2024,8 +2028,8 @@ int dmad_update_ring_sw_ptr(dmad_chreq * ch_req,
+		/* update drb size at ring_ptr */
+		drb->req_cycle = sw_p_off;
+
+-		dmad_dbg("ring_drb(%d 0x%08x) addr0(0x%08x) addr1(0x%08x) "
+-			 "size(0x%08x) state(%d)\n",
++		dmad_dbg("ring_drb(%d 0x%08x) addr0(0x%08llx) addr1(0x%08llx) "
++			 "size(0x%08llx) state(%d)\n",
+			 (u32) drb->node, (u32) drb, drb->addr0, drb->addr1,
+			 drb->req_cycle, drb->state);
+
+@@ -2069,8 +2073,8 @@ int dmad_update_ring_sw_ptr(dmad_chreq * ch_req,
+		else
+			drb->req_cycle = period_size;
+
+-		dmad_dbg("ring_drb(%d 0x%08x) addr0(0x%08x) addr1(0x%08x) "
+-			 "size(0x%08x) state(%d)\n",
++		dmad_dbg("ring_drb(%d 0x%08x) addr0(0x%08llx) addr1(0x%08llx) "
++			 "size(0x%08llx) state(%d)\n",
+			 (u32) drb->node, (u32) drb, drb->addr0, drb->addr1,
+			 drb->req_cycle, drb->state);
+
+@@ -2147,8 +2151,8 @@ int dmad_update_ring_sw_ptr(dmad_chreq * ch_req,
+				drb->req_cycle = period_size;
+			}
+
+-			dmad_dbg("inbtw_drb(%d 0x%08x) addr0(0x%08x) "
+-				 "addr1(0x%08x) size(0x%08x) state(%d)\n",
++			dmad_dbg("inbtw_drb(%d 0x%08x) addr0(0x%08llx) "
++				 "addr1(0x%08llx) size(0x%08llx) state(%d)\n",
+				 (u32) drb->node, (u32) drb, drb->addr0,
+				 drb->addr1, drb->req_cycle, drb->state);
+
+@@ -2166,8 +2170,8 @@ int dmad_update_ring_sw_ptr(dmad_chreq * ch_req,
+		drb->addr1 = drq->dev_addr;
+		drb->req_cycle = sw_p_off;
+
+-		dmad_dbg("swptr_drb(%d 0x%08x) addr0(0x%08x) addr1(0x%08x) "
+-			 "size(0x%08x) state(%d)\n",
++		dmad_dbg("swptr_drb(%d 0x%08x) addr0(0x%08llx) addr1(0x%08llx) "
++			 "size(0x%08llx) state(%d)\n",
+			 (u32) drb->node, (u32) drb, drb->addr0, drb->addr1,
+			 drb->req_cycle, drb->state);
+
+@@ -2254,8 +2258,8 @@ static int dmad_channel_drain(u32 controller, dmad_drq * drq, u8 shutdown)
+	dmad_detach_head(drq->drb_pool, &drq->sbt_head, &drq->sbt_tail, &drb);
+
+	while (drb) {
+-		dmad_dbg("cancel sbt drb(%d 0x%08x) addr0(0x%08x) "
+-			 "addr1(0x%08x) size(0x%08x) state(%d)\n",
++		dmad_dbg("cancel sbt drb(%d 0x%08x) addr0(0x%08llx) "
++			 "addr1(0x%08llx) size(0x%08llx) state(%d)\n",
+			 drb->node, (u32) drb, drb->src_addr, drb->dst_addr,
+			 drb->req_cycle, (u32) drb->state);
+
+@@ -2276,8 +2280,8 @@ static int dmad_channel_drain(u32 controller, dmad_drq * drq, u8 shutdown)
+	dmad_detach_head(drq->drb_pool, &drq->rdy_head, &drq->rdy_tail, &drb);
+
+	while (drb) {
+-		dmad_dbg("cancel rdy drb(%d 0x%08x) addr0(0x%08x) "
+-			 "addr1(0x%08x) size(0x%08x) state(%d)\n",
++		dmad_dbg("cancel rdy drb(%d 0x%08x) addr0(0x%08llx) "
++			 "addr1(0x%08llx) size(0x%08llx) state(%d)\n",
+			 drb->node, (u32) drb, drb->src_addr, drb->dst_addr,
+			 drb->req_cycle, (u32) drb->state);
+
+@@ -2474,6 +2478,7 @@ at_dma_parse_dt(struct platform_device *pdev)
+ static int atcdma_probe(struct platform_device *pdev)
+ {
+	struct at_dma_platform_data *pdata;
++	struct device_node *np = pdev->dev.of_node;
+	struct resource 	*io=0;
+	struct resource *mem = NULL;
+	int			irq;
+@@ -2501,7 +2506,7 @@ static int atcdma_probe(struct platform_device *pdev)
+	if (irq < 0)
+		return irq;
+
+-	intc_ftdmac020_init_irq(irq);
++	ftdmac020_init(np, irq);
+
+	return dmad_module_init();
+
+--
+2.25.1
diff --git a/board/andes/ae350/patches/linux/0011-DMA-Add-msb-bit-patch.patch b/board/andes/ae350/patches/linux/0011-DMA-Add-msb-bit-patch.patch
new file mode 100644
index 0000000000..3f60ce850e
--- /dev/null
+++ b/board/andes/ae350/patches/linux/0011-DMA-Add-msb-bit-patch.patch
@@ -0,0 +1,387 @@
+From 6a328cfbcec652d8a56eb4103ace8b818b76240d Mon Sep 17 00:00:00 2001
+From: Yu Chien Peter Lin <peterlin@andestech.com>
+Date: Tue, 28 Dec 2021 17:04:05 +0800
+Subject: [PATCH 11/12] DMA: Add msb bit patch
+
+Reformed from the commit:
+c32ef675cffe7a609d7afe2eb1ae92981a503144
+
+Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
+---
+ arch/riscv/Kconfig                    |  5 ++
+ arch/riscv/Makefile                   |  2 +-
+ arch/riscv/include/asm/device.h       | 11 ++++
+ arch/riscv/include/asm/dmad.h         |  3 +
+ arch/riscv/include/asm/io.h           | 14 ++++
+ arch/riscv/include/asm/irq.h          | 14 ++++
+ arch/riscv/include/asm/perf_event.h   |  7 +-
+ arch/riscv/include/asm/pgtable-bits.h |  6 ++
+ arch/riscv/kernel/head.S              |  1 +
+ arch/riscv/kernel/setup.c             |  7 ++
+ arch/riscv/mm/Makefile                |  5 +-
+ arch/riscv/mm/ioremap_nocache.c       | 16 +++++
+ arch/riscv/platforms/dmad_intc.c      | 93 +++++++++++++++++++++++----
+ 13 files changed, 169 insertions(+), 15 deletions(-)
+ create mode 100755 arch/riscv/include/asm/device.h
+ create mode 100644 arch/riscv/mm/ioremap_nocache.c
+
+diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
+index 1b894c327578..84a83f3a1af6 100644
+--- a/arch/riscv/Kconfig
++++ b/arch/riscv/Kconfig
+@@ -14,6 +14,7 @@ config RISCV
+	def_bool y
+	select ARCH_CLOCKSOURCE_INIT
+	select ARCH_SUPPORTS_ATOMIC_RMW
++	select PHYS_ADDR_T_64BIT
+	select ARCH_HAS_BINFMT_FLAT
+	select ARCH_HAS_DEBUG_VM_PGTABLE
+	select ARCH_HAS_DEBUG_VIRTUAL if MMU
+@@ -88,6 +89,9 @@ config RISCV
+	select SYSCTL_EXCEPTION_TRACE
+	select THREAD_INFO_IN_TASK
+	select UACCESS_MEMCPY if !MMU
++	select ARCH_HAS_SETUP_DMA_OPS
++	select ARCH_HAS_SYNC_DMA_FOR_CPU
++	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
+
+ config ARCH_MMAP_RND_BITS_MIN
+	default 18 if 64BIT
+@@ -204,6 +208,7 @@ source "arch/riscv/Kconfig.socs"
+
+ menu "Platform type"
+
++source "arch/riscv/platforms/Kconfig"
+ choice
+	prompt "Base ISA"
+	default ARCH_RV64I
+diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
+index 226c366072da..2d539750c20e 100644
+--- a/arch/riscv/Makefile
++++ b/arch/riscv/Makefile
+@@ -83,7 +83,7 @@ KBUILD_IMAGE	:= $(boot)/Image.gz
+
+ head-y := arch/riscv/kernel/head.o
+
+-core-y += arch/riscv/
++core-y += arch/riscv/kernel/ arch/riscv/mm/ arch/riscv/net/ arch/riscv/platforms/ arch/riscv/andesv5/
+
+ libs-y += arch/riscv/lib/
+ libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
+diff --git a/arch/riscv/include/asm/device.h b/arch/riscv/include/asm/device.h
+new file mode 100755
+index 000000000000..122a483f7f03
+--- /dev/null
++++ b/arch/riscv/include/asm/device.h
+@@ -0,0 +1,11 @@
++#ifndef __ASM_DEVICE_H
++#define __ASM_DEVICE_H
++
++struct dev_archdata {
++	bool dma_coherent;
++};
++
++struct pdev_archdata {
++};
++
++#endif
+\ No newline at end of file
+diff --git a/arch/riscv/include/asm/dmad.h b/arch/riscv/include/asm/dmad.h
+index 44c87b49e606..54b47c410915 100644
+--- a/arch/riscv/include/asm/dmad.h
++++ b/arch/riscv/include/asm/dmad.h
+@@ -68,4 +68,7 @@ struct at_dma_platform_data {
+	void __iomem	*apb_regs;
+ };
+
++int ftdmac020_find_irq(int hwirq);
++int ftdmac020_init(struct device_node *node, int irq);
++
+ #endif  /* __NDS_DMAD_INC__ */
+diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
+index c025a746a148..328afc17b1f6 100644
+--- a/arch/riscv/include/asm/io.h
++++ b/arch/riscv/include/asm/io.h
+@@ -16,6 +16,20 @@
+ #include <asm/mmiowb.h>
+ #include <asm/early_ioremap.h>
+
++/*
++ * The RISC-V ISA doesn't yet specify how to query or modify PMAs, so we can't
++ * change the properties of memory regions.  This should be fixed by the
++ * upcoming platform spec.
++ */
++/*
++ * That being said, before PMA is ready, Andes augmented PA with an MSB bit
++ * to indicate the non-cacheability.
++ */
++#define ioremap_nocache ioremap_nocache
++extern void __iomem *ioremap_nocache(phys_addr_t offset, size_t size);
++#define ioremap_wc(addr, size) ioremap_nocache((addr), (size))
++#define ioremap_wt(addr, size) ioremap_nocache((addr), (size))
++
+ /*
+  * MMIO access functions are separated out to break dependency cycles
+  * when using {read,write}* fns in low-level headers
+diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
+index 9807ad164015..65e5d0514bfc 100644
+--- a/arch/riscv/include/asm/irq.h
++++ b/arch/riscv/include/asm/irq.h
+@@ -10,6 +10,20 @@
+ #include <linux/interrupt.h>
+ #include <linux/linkage.h>
+
++#define NR_IRQS         72
++
++/*
++ * Use this value to indicate lack of interrupt
++ * capability
++ */
++#ifndef NO_IRQ
++#define NO_IRQ  ((unsigned int)(-1))
++#endif
++
++#define INTERRUPT_CAUSE_PMU        274
++
++void riscv_software_interrupt(void);
++
+ #include <asm-generic/irq.h>
+
+ #endif /* _ASM_RISCV_IRQ_H */
+diff --git a/arch/riscv/include/asm/perf_event.h b/arch/riscv/include/asm/perf_event.h
+index 062efd3a1d5d..216462b7578a 100644
+--- a/arch/riscv/include/asm/perf_event.h
++++ b/arch/riscv/include/asm/perf_event.h
+@@ -18,8 +18,13 @@
+ /*
+  * The RISCV_MAX_COUNTERS parameter should be specified.
+  */
+-
++#ifdef CONFIG_ANDES_PMU
++#define RISCV_MAX_COUNTERS	7
++#define L2C_MAX_COUNTERS	32
++#define BASE_COUNTERS		3
++#else
+ #define RISCV_MAX_COUNTERS	2
++#endif	/* CONFIG_ANDES_PMU */
+
+ /*
+  * These are the indexes of bits in counteren register *minus* 1,
+diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
+index bbaeb5d35842..5a04317040bf 100644
+--- a/arch/riscv/include/asm/pgtable-bits.h
++++ b/arch/riscv/include/asm/pgtable-bits.h
+@@ -24,6 +24,12 @@
+ #define _PAGE_DIRTY     (1 << 7)    /* Set by hardware on any write */
+ #define _PAGE_SOFT      (1 << 8)    /* Reserved for software */
+
++#ifdef CONFIG_ANDES_QEMU_SUPPORT
++#define _PAGE_NONCACHEABLE      0
++#else
++#define _PAGE_NONCACHEABLE      (1 << 31)
++#endif
++
+ #define _PAGE_SPECIAL   _PAGE_SOFT
+ #define _PAGE_TABLE     _PAGE_PRESENT
+
+diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
+index 1a819c18bede..dd0e3280c62c 100644
+--- a/arch/riscv/kernel/head.S
++++ b/arch/riscv/kernel/head.S
+@@ -263,6 +263,7 @@ clear_bss_done:
+	/* Initialize page tables and relocate to virtual addresses */
+	la sp, init_thread_union + THREAD_SIZE
+	mv a0, s1
++	call setup_maxpa
+	call setup_vm
+ #ifdef CONFIG_MMU
+	la a0, early_pg_dir
+diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
+index 117f3212a8e4..115a5c91bdae 100644
+--- a/arch/riscv/kernel/setup.c
++++ b/arch/riscv/kernel/setup.c
+@@ -48,6 +48,13 @@ struct screen_info screen_info __section(".data") = {
+  * BSS.
+  */
+ atomic_t hart_lottery __section(".sdata");
++phys_addr_t pa_msb;
++asmlinkage void __init setup_maxpa(void)
++{
++    csr_write(satp, SATP_PPN);
++    pa_msb = (csr_read(satp) + 1) >>1;
++}
++
+ unsigned long boot_cpu_hartid;
+ static DEFINE_PER_CPU(struct cpu, cpu_devices);
+
+diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
+index 7ebaef10ea1b..2c154ae85b10 100644
+--- a/arch/riscv/mm/Makefile
++++ b/arch/riscv/mm/Makefile
+@@ -2,8 +2,7 @@
+
+ CFLAGS_init.o := -mcmodel=medany
+ ifdef CONFIG_FTRACE
+-CFLAGS_REMOVE_init.o = $(CC_FLAGS_FTRACE)
+-CFLAGS_REMOVE_cacheflush.o = $(CC_FLAGS_FTRACE)
++CFLAGS_REMOVE_init.o = -pg
+ endif
+
+ KCOV_INSTRUMENT_init.o := n
+@@ -12,7 +11,9 @@ obj-y += init.o
+ obj-y += extable.o
+ obj-$(CONFIG_MMU) += fault.o pageattr.o
+ obj-y += cacheflush.o
++obj-y += dma-mapping.o
+ obj-y += context.o
++obj-y += ioremap_nocache.o
+
+ ifeq ($(CONFIG_MMU),y)
+ obj-$(CONFIG_SMP) += tlbflush.o
+diff --git a/arch/riscv/mm/ioremap_nocache.c b/arch/riscv/mm/ioremap_nocache.c
+new file mode 100644
+index 000000000000..c7422219d561
+--- /dev/null
++++ b/arch/riscv/mm/ioremap_nocache.c
+@@ -0,0 +1,16 @@
++// SPDX-License-Identifier: GPL-2.0-only
++/*
++ * (C) Copyright 1995 1996 Linus Torvalds
++ * (C) Copyright 2012 Regents of the University of California
++ */
++#include <linux/io.h>
++
++#include <asm/pgtable.h>
++void __iomem *ioremap_nocache(phys_addr_t offset, size_t size)
++{
++	void __iomem *ret;
++	pgprot_t pgprot = pgprot_noncached(PAGE_KERNEL);
++	ret = ioremap_prot(offset, size, pgprot.pgprot);
++	return ret;
++}
++EXPORT_SYMBOL(ioremap_nocache);
+diff --git a/arch/riscv/platforms/dmad_intc.c b/arch/riscv/platforms/dmad_intc.c
+index 5f831add709a..e270e31e999b 100644
+--- a/arch/riscv/platforms/dmad_intc.c
++++ b/arch/riscv/platforms/dmad_intc.c
+@@ -5,6 +5,9 @@
+  */
+
+ #include <linux/irq.h>
++#include <linux/irqchip.h>
++#include <linux/irqchip/chained_irq.h>
++#include <linux/irqdomain.h>
+ #include <linux/interrupt.h>
+ #include <linux/ioport.h>
+ #include <asm/io.h>
+@@ -12,7 +15,49 @@
+
+ #ifdef CONFIG_PLATFORM_AHBDMA
+ extern int dmad_probe_irq_source_ahb(void);
+-void AHBDMA_irq_rounter(struct irq_desc *desc)
++
++/*
++ * Generic dummy implementation which can be used for
++ * real dumb interrupt sources
++ */
++struct irq_chip atcdmac_irq_chip = {
++	.name		= "Andes DMAC",
++};
++
++struct ftdmac020_info {
++	int			parent_irq;
++	struct irq_domain	*irq_domain;
++};
++
++struct ftdmac020_info *ftdmac020;
++
++static int ftdmac020_irq_map(struct irq_domain *domain, unsigned int virq,
++			       irq_hw_number_t hwirq)
++{
++	irq_set_chip_and_handler(virq, &atcdmac_irq_chip, handle_simple_irq);
++	irq_set_chip_data(virq, domain->host_data);
++
++	return 0;
++}
++
++static void ftdmac020_irq_unmap(struct irq_domain *d, unsigned int virq)
++{
++	irq_set_chip_and_handler(virq, NULL, NULL);
++	irq_set_chip_data(virq, NULL);
++}
++
++static const struct irq_domain_ops ftdmac020_irq_ops = {
++	.map    = ftdmac020_irq_map,
++	.unmap  = ftdmac020_irq_unmap,
++};
++
++
++/*
++ * The atcdmac300 provides a single hardware interrupt for all of the dmad
++ * channel, so we use a self-defined interrupt chip to translate this single interrupt
++ * into multiple interrupts, each associated with a single dma channel.
++ */
++static void AHBDMA_irq_rounter(struct irq_desc *desc)
+ {
+	int ahb_irq;
+	struct irq_desc *ahb_desc;
+@@ -29,21 +74,47 @@ void AHBDMA_irq_rounter(struct irq_desc *desc)
+		raw_spin_lock(&desc->lock);
+	}
+	desc->irq_data.chip->irq_unmask(&desc->irq_data);
++	desc->irq_data.chip->irq_eoi(&desc->irq_data);
+	raw_spin_unlock(&desc->lock);
+ }
+
+-int intc_ftdmac020_init_irq(int irq)
++int ftdmac020_find_irq(int hwirq){
++	int virq;
++
++	virq = irq_find_mapping(ftdmac020->irq_domain, hwirq);
++	printk("[ftdmac020_irq_mapping]: virq=%d, hwirq=%d,\n",virq,hwirq);
++	if (!virq)
++		return -EINVAL;
++
++	return virq;
++}
++
++int ftdmac020_init(struct device_node *node, int irq)
+ {
+-	int i;
+-	int ret;
+-	/* Register all IRQ */
+-	for (i = DMA_IRQ0;
+-	     i < DMA_IRQ0 + DMA_IRQ_COUNT; i++) {
+-		// level trigger
+-		ret = irq_set_chip(i, &dummy_irq_chip);
+-		irq_set_handler(i, handle_simple_irq);
++	int ret=0;
++
++	ftdmac020 = kzalloc(sizeof(struct ftdmac020_info), GFP_KERNEL);
++
++	ftdmac020->parent_irq=irq;
++
++	ftdmac020->irq_domain = __irq_domain_add(of_node_to_fwnode(node), DMA_IRQ_COUNT, DMA_IRQ0+DMA_IRQ_COUNT,
++					 ~0, &ftdmac020_irq_ops, ftdmac020);
++	if (!ftdmac020->irq_domain) {
++		printk("ftdmac020: Failed to create irqdomain\n");
++		return -EINVAL;
++	}
++
++	ret = irq_create_strict_mappings(ftdmac020->irq_domain, DMA_IRQ0, DMA_IRQ0, DMA_IRQ_COUNT);
++	if(unlikely(ret < 0)){
++		printk("ftdmac020: Failed to create irq_create_strict_mappings()\n");
++		return -EINVAL;
+	}
+-	irq_set_chained_handler(irq, AHBDMA_irq_rounter);
++
++	ftdmac020->irq_domain->name = "ftdmac020-domain";
++	irq_set_chained_handler_and_data(ftdmac020->parent_irq,
++					 AHBDMA_irq_rounter, ftdmac020);
++
+	return 0;
+ }
++
+ #endif /* CONFIG_PLATFORM_AHBDMA */
+--
+2.25.1
diff --git a/board/andes/ae350/patches/linux/0012-Remove-unused-Andes-SBI-call.patch b/board/andes/ae350/patches/linux/0012-Remove-unused-Andes-SBI-call.patch
new file mode 100644
index 0000000000..22a278ddff
--- /dev/null
+++ b/board/andes/ae350/patches/linux/0012-Remove-unused-Andes-SBI-call.patch
@@ -0,0 +1,147 @@
+From f476cc67c2821f931ff6ffd841327417b9967909 Mon Sep 17 00:00:00 2001
+From: Yu Chien Peter Lin <peterlin@andestech.com>
+Date: Tue, 28 Dec 2021 17:34:59 +0800
+Subject: [PATCH 12/12] Remove unused Andes SBI call
+
+Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
+---
+ arch/riscv/andesv5/sbi.c     | 92 ------------------------------------
+ arch/riscv/include/asm/sbi.h | 16 -------
+ 2 files changed, 108 deletions(-)
+
+diff --git a/arch/riscv/andesv5/sbi.c b/arch/riscv/andesv5/sbi.c
+index c5d2afd83ae0..647587b81988 100755
+--- a/arch/riscv/andesv5/sbi.c
++++ b/arch/riscv/andesv5/sbi.c
+@@ -10,80 +10,6 @@
+ #include <asm/andesv5/proc.h>
+ #include <asm/sbi.h>
+
+-void sbi_suspend_prepare(char main_core, char enable)
+-{
+-	sbi_ecall(SBI_EXT_ANDES, SBI_EXT_ANDES_SUSPEND_PREPARE, main_core, enable, 0, 0, 0, 0);
+-}
+-EXPORT_SYMBOL(sbi_suspend_prepare);
+-
+-void sbi_suspend_mem(void)
+-{
+-	sbi_ecall(SBI_EXT_ANDES, SBI_EXT_ANDES_SUSPEND_MEM, 0, 0, 0, 0, 0, 0);
+-}
+-EXPORT_SYMBOL(sbi_suspend_mem);
+-
+-void sbi_restart(int cpu_num)
+-{
+-	sbi_ecall(SBI_EXT_ANDES, SBI_EXT_ANDES_RESTART, cpu_num, 0, 0, 0, 0, 0);
+-}
+-EXPORT_SYMBOL(sbi_restart);
+-
+-void sbi_write_powerbrake(int val)
+-{
+-  sbi_ecall(SBI_EXT_ANDES, SBI_EXT_ANDES_WRITE_POWERBRAKE, val, 0, 0, 0, 0, 0);
+-}
+-EXPORT_SYMBOL(sbi_write_powerbrake);
+-
+-int sbi_read_powerbrake(void)
+-{
+-  struct sbiret ret;
+-  ret = sbi_ecall(SBI_EXT_ANDES, SBI_EXT_ANDES_READ_POWERBRAKE, 0, 0, 0, 0, 0, 0);
+-  return ret.value;
+-}
+-EXPORT_SYMBOL(sbi_read_powerbrake);
+-
+-void sbi_set_suspend_mode(int suspend_mode)
+-{
+-	sbi_ecall(SBI_EXT_ANDES, SBI_EXT_ANDES_SET_SUSPEND_MODE, suspend_mode, 0, 0, 0, 0, 0);
+-}
+-EXPORT_SYMBOL(sbi_set_suspend_mode);
+-
+-void sbi_set_reset_vec(int val)
+-{
+-	sbi_ecall(SBI_EXT_ANDES, SBI_EXT_ANDES_SET_RESET_VEC, val, 0, 0, 0, 0, 0);
+-}
+-EXPORT_SYMBOL(sbi_set_reset_vec);
+-
+-void sbi_set_pma(void *arg)
+-{
+-	phys_addr_t offset = ((struct pma_arg_t*)arg)->offset;
+-	unsigned long vaddr = ((struct pma_arg_t*)arg)->vaddr;
+-	size_t size = ((struct pma_arg_t*)arg)->size;
+-	size_t entry_id = ((struct pma_arg_t*)arg)->entry_id;
+-	sbi_ecall(SBI_EXT_ANDES, SBI_EXT_ANDES_SET_PMA, offset, vaddr, size, entry_id, 0, 0);
+-}
+-EXPORT_SYMBOL(sbi_set_pma);
+-
+-void sbi_free_pma(unsigned long entry_id)
+-{
+-	sbi_ecall(SBI_EXT_ANDES, SBI_EXT_ANDES_FREE_PMA, entry_id, 0, 0, 0, 0, 0);
+-}
+-EXPORT_SYMBOL(sbi_free_pma);
+-
+-long sbi_probe_pma(void)
+-{
+-	struct sbiret ret;
+-	ret = sbi_ecall(SBI_EXT_ANDES, SBI_EXT_ANDES_PROBE_PMA, 0, 0, 0, 0, 0, 0);
+-	return ret.value;
+-}
+-EXPORT_SYMBOL(sbi_probe_pma);
+-
+-void sbi_set_trigger(unsigned int type, uintptr_t data, int enable)
+-{
+-	sbi_ecall(SBI_EXT_ANDES, SBI_EXT_ANDES_TRIGGER, type, data, enable, 0, 0, 0);
+-}
+-EXPORT_SYMBOL(sbi_set_trigger);
+-
+ long sbi_get_marchid(void)
+ {
+	struct sbiret ret;
+@@ -91,21 +17,3 @@ long sbi_get_marchid(void)
+	return ret.value;
+ }
+ EXPORT_SYMBOL(sbi_get_marchid);
+-
+-long sbi_get_micm_cfg(void)
+-{
+-	struct sbiret ret;
+-	ret = sbi_ecall(SBI_EXT_ANDES, SBI_EXT_ANDES_GET_MICM_CFG,
+-			0, 0, 0, 0, 0, 0);
+-	return ret.value;
+-}
+-EXPORT_SYMBOL(sbi_get_micm_cfg);
+-
+-long sbi_get_mdcm_cfg(void)
+-{
+-	struct sbiret ret;
+-	ret = sbi_ecall(SBI_EXT_ANDES, SBI_EXT_ANDES_GET_MDCM_CFG,
+-			0, 0, 0, 0, 0, 0);
+-	return ret.value;
+-}
+-EXPORT_SYMBOL(sbi_get_mdcm_cfg);
+diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
+index d3b2d34136f0..40dc3a54a32c 100644
+--- a/arch/riscv/include/asm/sbi.h
++++ b/arch/riscv/include/asm/sbi.h
+@@ -83,22 +83,6 @@ enum sbi_ext_andes_fid {
+	SBI_EXT_ANDES_L1CACHE_D_PREFETCH,
+	SBI_EXT_ANDES_NON_BLOCKING_LOAD_STORE,
+	SBI_EXT_ANDES_WRITE_AROUND,
+-	SBI_EXT_ANDES_TRIGGER,
+-	SBI_EXT_ANDES_SET_PFM,
+-	SBI_EXT_ANDES_READ_POWERBRAKE,
+-	SBI_EXT_ANDES_WRITE_POWERBRAKE,
+-	SBI_EXT_ANDES_SUSPEND_PREPARE,
+-	SBI_EXT_ANDES_SUSPEND_MEM,
+-	SBI_EXT_ANDES_SET_SUSPEND_MODE,
+-	SBI_EXT_ANDES_ENTER_SUSPEND_MODE,
+-	SBI_EXT_ANDES_RESTART,
+-	SBI_EXT_ANDES_SET_RESET_VEC,
+-	SBI_EXT_ANDES_SET_PMA,
+-	SBI_EXT_ANDES_FREE_PMA,
+-	SBI_EXT_ANDES_PROBE_PMA,
+-	SBI_EXT_ANDES_DCACHE_WBINVAL_ALL,
+-	SBI_EXT_ANDES_GET_MICM_CFG,
+-	SBI_EXT_ANDES_GET_MDCM_CFG,
+ };
+
+ enum sbi_hsm_hart_status {
+--
+2.25.1
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
index 0000000000..2b0bae875e
--- /dev/null
+++ b/board/andes/ae350/patches/uboot/0001-Fix-mmc-no-partition-table-error.patch
@@ -0,0 +1,27 @@
+From ea4675215b53d16a72d29b8a6fc6a86cccf59cf0 Mon Sep 17 00:00:00 2001
+From: Yu Chien Peter Lin <peterlin@andestech.com>
+Date: Wed, 5 Jan 2022 11:00:59 +0800
+Subject: [PATCH 1/3] Fix mmc no partition table error
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
index 0000000000..8ee4240619
--- /dev/null
+++ b/board/andes/ae350/patches/uboot/0002-Prevent-fw_dynamic-from-relocation.patch
@@ -0,0 +1,27 @@
+From 4c0c5378d032f2f95577585935624baf7b4decf3 Mon Sep 17 00:00:00 2001
+From: Yu Chien Peter Lin <peterlin@andestech.com>
+Date: Wed, 5 Jan 2022 11:02:26 +0800
+Subject: [PATCH 2/3] Prevent fw_dynamic from relocation
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
index 0000000000..81870647b8
--- /dev/null
+++ b/board/andes/ae350/patches/uboot/0003-Fix-u-boot-proper-booting-issue.patch
@@ -0,0 +1,26 @@
+From 3d09501175ae6f5e3f6520b48b1358226a99ff16 Mon Sep 17 00:00:00 2001
+From: Yu Chien Peter Lin <peterlin@andestech.com>
+Date: Wed, 5 Jan 2022 18:17:39 +0800
+Subject: [PATCH 3/3] Fix u-boot proper booting issue
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
index 0000000000..19cfa721a7
--- /dev/null
+++ b/board/andes/ae350/readme.txt
@@ -0,0 +1,66 @@
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
+  $ make ae350_andestar45_defconfig
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
+  |-- rootfs.cpio
+  |-- rootfs.ext2
+  |-- rootfs.ext4 -> rootfs.ext2
+  |-- rootfs.tar
+  |-- sdcard.img
+  |-- u-boot-spl.bin
+  `-- u-boot.itb
+
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
diff --git a/configs/ae350_andestar45_defconfig b/configs/ae350_andestar45_defconfig
new file mode 100644
index 0000000000..fb4587b1a7
--- /dev/null
+++ b/configs/ae350_andestar45_defconfig
@@ -0,0 +1,46 @@
+BR2_riscv=y
+BR2_riscv_custom=y
+BR2_RISCV_ISA_CUSTOM_RVM=y
+BR2_RISCV_ISA_CUSTOM_RVF=y
+BR2_RISCV_ISA_CUSTOM_RVD=y
+BR2_RISCV_ISA_CUSTOM_RVC=y
+BR2_GLOBAL_PATCH_DIR="board/andes/ae350/patches"
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_BINUTILS_VERSION_2_37_X=y
+BR2_GCC_VERSION_11_X=y
+BR2_GCC_ENABLE_OPENMP=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/andes/ae350/genimage_sdcard.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.84"
+BR2_LINUX_KERNEL_DEFCONFIG="ae350_rv64_smp"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/andes/ae350/linux.config.fragment"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/andes/ae350/ae350.dts"
+BR2_PACKAGE_OPENSSL=y
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
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

