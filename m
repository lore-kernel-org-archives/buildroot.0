Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55FBC43217
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 21:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66A1741743;
	Thu, 24 Nov 2022 21:57:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66A1741743
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4w8i3TLSnp4D; Thu, 24 Nov 2022 21:57:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A4FC41C36;
	Thu, 24 Nov 2022 21:57:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A4FC41C36
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 691BD1BF311
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 21:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4453840180
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 21:57:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4453840180
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eCmR78a7yJRU for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 21:57:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B42B400EF
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 21:57:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B42B400EF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 667CC8462D; Thu, 24 Nov 2022 21:57:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Nov 2022 22:56:39 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 76f274063363f79c467c16452d0f1275f1d783c3
X-Git-Newrev: 3e708ed1f2e3da30296336249a6b02d287549e63
X-Patchwork-Hint: ignore
Message-Id: <20221124215705.667CC8462D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/andes_ae350_45: bump
 OpenSBI, U-Boot and Linux
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

commit: https://git.buildroot.net/buildroot/commit/?id=3e708ed1f2e3da30296336249a6b02d287549e63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch bumps following packages to the newer version:
- OpenSBI v1.1
- U-boot v2022.10
- Linux 6.0

Linux kernel is hosted on AndesTech Github which includes ethernet,
SD card, DMAC, RTC, WDT drivers support. OpenSBI is based on v1.1
with andes platfrom fdt driver.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/andes/ae350/ae350.dts                        | 274 ---------------------
 board/andes/ae350/genimage_sdcard.cfg              |   2 +-
 ...001-Disable-PIC-explicitly-for-assembling.patch |  29 ---
 .../0002-Enable-cache-for-opensbi-jump-mode.patch  |  25 --
 .../0001-Fix-mmc-no-partition-table-error.patch    |  27 --
 ...0_mci-Support-DTS-of-ftsdc010-driver-for-.patch |  38 +++
 .../0002-Prevent-fw_dynamic-from-relocation.patch  |  27 --
 ...evice-tree-blob-address-at-8-byte-boundar.patch |  42 ++++
 .../0003-Fix-u-boot-proper-booting-issue.patch     |  26 --
 .../0004-Enable-printing-OpenSBI-boot-logo.patch   |  25 --
 board/andes/ae350/post-build.sh                    |   2 +-
 board/andes/ae350/readme.txt                       |   4 +-
 .../rootfs_overlay/boot/extlinux/extlinux.conf     |   2 +-
 board/andes/ae350/uboot.config.fragment            |   6 +-
 configs/andes_ae350_45_defconfig                   |  19 +-
 15 files changed, 98 insertions(+), 450 deletions(-)

diff --git a/board/andes/ae350/ae350.dts b/board/andes/ae350/ae350.dts
deleted file mode 100755
index 5e5d70ab25..0000000000
--- a/board/andes/ae350/ae350.dts
+++ /dev/null
@@ -1,274 +0,0 @@
-/dts-v1/;
-
-/ {
-	#address-cells = <2>;
-	#size-cells = <2>;
-	compatible = "andestech,ae350";
-	model = "andestech,ax45";
-	aliases {
-		uart0 = &serial0;
-		spi0 = &spi;
-	};
-
-	chosen {
-		bootargs = "console=ttyS0,38400n8 earlycon=sbi debug loglevel=7";
-		stdout-path = "uart0:38400n8";
-	};
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		timebase-frequency = <60000000>;
-		CPU0: cpu@0 {
-			device_type = "cpu";
-			reg = <0>;
-			status = "okay";
-			compatible = "riscv";
-			riscv,isa = "rv64i2p0m2p0a2p0f2p0d2p0c2p0xv5-1p1xdsp0p0";
-			riscv,priv-major = <1>;
-			riscv,priv-minor = <10>;
-			mmu-type = "riscv,sv48";
-			clock-frequency = <60000000>;
-			i-cache-size = <0x8000>;
-			i-cache-sets = <256>;
-			i-cache-block-size = <64>;
-			i-cache-line-size = <64>;
-			d-cache-size = <0x8000>;
-			d-cache-sets = <128>;
-			d-cache-block-size = <64>;
-			d-cache-line-size = <64>;
-			next-level-cache = <&L2>;
-			CPU0_intc: interrupt-controller {
-				#interrupt-cells = <1>;
-				interrupt-controller;
-				compatible = "riscv,cpu-intc";
-			};
-		};
-		CPU1: cpu@1 {
-			device_type = "cpu";
-			reg = <1>;
-			status = "okay";
-			compatible = "riscv";
-			riscv,isa = "rv64i2p0m2p0a2p0f2p0d2p0c2p0xv5-1p1xdsp0p0";
-			riscv,priv-major = <1>;
-			riscv,priv-minor = <10>;
-			mmu-type = "riscv,sv48";
-			clock-frequency = <60000000>;
-			i-cache-size = <0x8000>;
-			i-cache-sets = <256>;
-			i-cache-block-size = <64>;
-			i-cache-line-size = <64>;
-			d-cache-size = <0x8000>;
-			d-cache-sets = <128>;
-			d-cache-block-size = <64>;
-			d-cache-line-size = <64>;
-			next-level-cache = <&L2>;
-			CPU1_intc: interrupt-controller {
-				#interrupt-cells = <1>;
-				interrupt-controller;
-				compatible = "riscv,cpu-intc";
-			};
-		};
-		CPU2: cpu@2 {
-			device_type = "cpu";
-			reg = <2>;
-			status = "okay";
-			compatible = "riscv";
-			riscv,isa = "rv64i2p0m2p0a2p0f2p0d2p0c2p0xv5-1p1xdsp0p0";
-			riscv,priv-major = <1>;
-			riscv,priv-minor = <10>;
-			mmu-type = "riscv,sv48";
-			clock-frequency = <60000000>;
-			i-cache-size = <0x8000>;
-			i-cache-sets = <256>;
-			i-cache-block-size = <64>;
-			i-cache-line-size = <64>;
-			d-cache-size = <0x8000>;
-			d-cache-sets = <128>;
-			d-cache-block-size = <64>;
-			d-cache-line-size = <64>;
-			next-level-cache = <&L2>;
-			CPU2_intc: interrupt-controller {
-				#interrupt-cells = <1>;
-				interrupt-controller;
-				compatible = "riscv,cpu-intc";
-			};
-		};
-		CPU3: cpu@3 {
-			device_type = "cpu";
-			reg = <3>;
-			status = "okay";
-			compatible = "riscv";
-			riscv,isa = "rv64i2p0m2p0a2p0f2p0d2p0c2p0xv5-1p1xdsp0p0";
-			riscv,priv-major = <1>;
-			riscv,priv-minor = <10>;
-			mmu-type = "riscv,sv48";
-			clock-frequency = <60000000>;
-			i-cache-size = <0x8000>;
-			i-cache-sets = <256>;
-			i-cache-block-size = <64>;
-			i-cache-line-size = <64>;
-			d-cache-size = <0x8000>;
-			d-cache-sets = <128>;
-			d-cache-block-size = <64>;
-			d-cache-line-size = <64>;
-			next-level-cache = <&L2>;
-			CPU3_intc: interrupt-controller {
-				#interrupt-cells = <1>;
-				interrupt-controller;
-				compatible = "riscv,cpu-intc";
-			};
-		};
-	};
-	L2: l2-cache@e0500000 {
-		compatible = "cache";
-		cache-level = <2>;
-		cache-size = <0x80000>;
-		reg = <0x00000000 0xe0500000 0x00000000 0x00001000>;
-		andes,inst-prefetch = <3>;
-		andes,data-prefetch = <3>;
-		// The value format is <XRAMOCTL XRAMICTL>
-		andes,tag-ram-ctl = <0 0>;
-		andes,data-ram-ctl = <0 0>;
-	};
-	memory@0 {
-		reg = <0x00000000 0x00000000 0x00000000 0x80000000>;
-		device_type = "memory";
-	};
-	soc {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		compatible = "andestech,riscv-ae350-soc", "simple-bus";
-		ranges;
-		plic0: interrupt-controller@e4000000 {
-			compatible = "riscv,plic0";
-			reg = <0x00000000 0xe4000000 0x00000000 0x02000000>;
-			interrupts-extended = < &CPU0_intc 11 &CPU0_intc 9 &CPU1_intc 11 &CPU1_intc 9 &CPU2_intc 11 &CPU2_intc 9 &CPU3_intc 11 &CPU3_intc 9>;
-			interrupt-controller;
-			#address-cells = <2>;
-			#interrupt-cells = <2>;
-			riscv,ndev = <71>;
-		};
-		plic1: interrupt-controller@e6400000 {
-			compatible = "riscv,plic1";
-			reg = <0x00000000 0xe6400000 0x00000000 0x00400000>;
-			interrupts-extended = < &CPU0_intc 3 &CPU1_intc 3 &CPU2_intc 3 &CPU3_intc 3>;
-			interrupt-controller;
-			#address-cells = <2>;
-			#interrupt-cells = <2>;
-			riscv,ndev = <4>;
-		};
-		plmt0: plmt0@e6000000 {
-			compatible = "riscv,plmt0";
-			reg = <0x00000000 0xe6000000 0x00000000 0x00100000>;
-			interrupts-extended = < &CPU0_intc 7 &CPU1_intc 7 &CPU2_intc 7 &CPU3_intc 7>;
-		};
-		spiclk: virt_100mhz {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <100000000>;
-		};
-		timer0: timer@f0400000 {
-			compatible = "andestech,atcpit100";
-			reg = <0x00000000 0xf0400000 0x00000000 0x00001000>;
-			interrupts = <3 4>;
-			interrupt-parent = <&plic0>;
-			clock-frequency = <60000000>;
-		};
-		pwm: pwm@f0400000 {
-			compatible = "andestech,atcpit100-pwm";
-			reg = <0x00000000 0xf0400000 0x00000000 0x00001000>;
-			interrupts = <3 4>;
-			interrupt-parent = <&plic0>;
-			clock-frequency = <60000000>;
-			pwm-cells = <2>;
-		};
-		wdt: wdt@f0500000 {
-			compatible = "andestech,atcwdt200";
-			reg = <0x00000000 0xf0500000 0x00000000 0x00001000>;
-			interrupts = <3 4>;
-			interrupt-parent = <&plic0>;
-			clock-frequency = <15000000>;
-		};
-		serial0: serial@f0300000 {
-			compatible = "andestech,uart16550", "ns16550a";
-			reg = <0x00000000 0xf0300000 0x00000000 0x00001000>;
-			interrupts = <9 4>;
-			interrupt-parent = <&plic0>;
-			clock-frequency = <19660800>;
-			reg-shift = <2>;
-			reg-offset = <32>;
-			no-loopback-test = <1>;
-		};
-		rtc0: rtc@f0600000 {
-			compatible = "andestech,atcrtc100";
-			reg = <0x00000000 0xf0600000 0x00000000 0x00001000>;
-			interrupts = <1 4 2 4>;
-			interrupt-parent = <&plic0>;
-			wakeup-source;
-		};
-		gpio: gpio@f0700000 {
-			compatible = "andestech,atcgpio100";
-			reg = <0x00000000 0xf0700000 0x00000000 0x00001000>;
-			interrupts = <7 4>;
-			interrupt-parent = <&plic0>;
-			wakeup-source;
-		};
-		mac0: mac@e0100000 {
-			compatible = "andestech,atmac100";
-			reg = <0x00000000 0xe0100000 0x00000000 0x00001000>;
-			interrupts = <19 4>;
-			interrupt-parent = <&plic0>;
-			dma-coherent;
-		};
-		smu: smu@f0100000 {
-			compatible = "andestech,atcsmu";
-			reg = <0x00000000 0xf0100000 0x00000000 0x00001000>;
-		};
-		mmc0: mmc@f0e00000 {
-			compatible = "andestech,atfsdc010";
-			reg = <0x00000000 0xf0e00000 0x00000000 0x00001000>;
-			interrupts = <18 4>;
-			interrupt-parent = <&plic0>;
-			clock-freq-min-max = <400000 100000000>;
-			max-frequency = <100000000>;
-			fifo-depth = <16>;
-			cap-sd-highspeed;
-			dma-coherent;
-		};
-		dma0: dma@f0c00000 {
-			compatible = "andestech,atcdmac300";
-			reg = <0x00000000 0xf0c00000 0x00000000 0x00001000>;
-			interrupts = <10 4 64 4 65 4 66 4 67 4 68 4 69 4 70 4 71 4>;
-			interrupt-parent = <&plic0>;
-			dma-channels = <8>;
-		};
-		lcd0: lcd@e0200000 {
-			compatible = "andestech,atflcdc100";
-			reg = <0x00000000 0xe0200000 0x00000000 0x00001000>;
-			interrupts = <20 4>;
-			interrupt-parent = <&plic0>;
-			dma-coherent;
-		};
-		pmu: pmu {
-			compatible = "riscv,andes-pmu";
-			device_type = "pmu";
-		};
-		spi: spi@f0b00000 {
-			compatible = "andestech,atcspi200";
-			reg = <0x00000000 0xf0b00000 0x00000000 0x00001000>;
-			interrupts = <4 4>;
-			interrupt-parent = <&plic0>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			num-cs = <1>;
-			clocks = <&spiclk>;
-			flash@0 {
-				compatible = "jedec,spi-nor";
-				reg = <0x00000000>;
-				spi-max-frequency = <50000000>;
-				spi-cpol;
-				spi-cpha;
-			};
-		};
-	};
-};
diff --git a/board/andes/ae350/genimage_sdcard.cfg b/board/andes/ae350/genimage_sdcard.cfg
index b8b9fe6a62..58c6f8f156 100644
--- a/board/andes/ae350/genimage_sdcard.cfg
+++ b/board/andes/ae350/genimage_sdcard.cfg
@@ -3,7 +3,7 @@ image boot.vfat {
 		files = {
 			"u-boot-spl.bin",
 			"u-boot.itb",
-			"ae350.dtb",
+			"ae350_ax45mp.dtb",
 		}
 	}
 	size = 2M
diff --git a/board/andes/ae350/patches/opensbi/0001-Disable-PIC-explicitly-for-assembling.patch b/board/andes/ae350/patches/opensbi/0001-Disable-PIC-explicitly-for-assembling.patch
deleted file mode 100644
index aeafed4c9f..0000000000
--- a/board/andes/ae350/patches/opensbi/0001-Disable-PIC-explicitly-for-assembling.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 3ccb71eeca42dbcd5e4d00ae1877a489ae82598d Mon Sep 17 00:00:00 2001
-From: Yu Chien Peter Lin <peterlin@andestech.com>
-Date: Wed, 29 Dec 2021 16:04:54 +0800
-Subject: [PATCH] Disable PIC explicitly for assembling
-
-This patch is necessary if the fw_dynamic load address
-is not equal to link address.
-However, they are equal currently, since we include an u-boot
-patch for preventing fw_dynamic relocation.
-
-Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
----
- Makefile | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Makefile b/Makefile
-index d6f097d..441518d 100644
---- a/Makefile
-+++ b/Makefile
-@@ -225,6 +225,7 @@ ASFLAGS		+=	-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
- ASFLAGS		+=	$(GENFLAGS)
- ASFLAGS		+=	$(platform-asflags-y)
- ASFLAGS		+=	$(firmware-asflags-y)
-+ASFLAGS		+=	-fno-pic
-
- ARFLAGS		=	rcs
-
---
-2.25.1
diff --git a/board/andes/ae350/patches/opensbi/0002-Enable-cache-for-opensbi-jump-mode.patch b/board/andes/ae350/patches/opensbi/0002-Enable-cache-for-opensbi-jump-mode.patch
deleted file mode 100644
index ae48a760c8..0000000000
--- a/board/andes/ae350/patches/opensbi/0002-Enable-cache-for-opensbi-jump-mode.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 325328f4204b40b1fcc8db3b46c7c8805710d21c Mon Sep 17 00:00:00 2001
-From: Yu Chien Peter Lin <peterlin@andestech.com>
-Date: Thu, 30 Dec 2021 08:47:34 +0800
-Subject: [PATCH] Enable cache for opensbi jump mode
-
-Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
----
- firmware/fw_base.S | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/firmware/fw_base.S b/firmware/fw_base.S
-index ab33e11..155d230 100644
---- a/firmware/fw_base.S
-+++ b/firmware/fw_base.S
-@@ -46,6 +46,8 @@
-	.globl _start
-	.globl _start_warm
- _start:
-+	li t0, 0x80003
-+	csrw  0x7ca, t0
-	/* Find preferred boot HART id */
-	MOV_3R	s0, a0, s1, a1, s2, a2
-	call	fw_boot_hart
---
-2.25.1
diff --git a/board/andes/ae350/patches/uboot/0001-Fix-mmc-no-partition-table-error.patch b/board/andes/ae350/patches/uboot/0001-Fix-mmc-no-partition-table-error.patch
deleted file mode 100644
index 7aff3cebf6..0000000000
--- a/board/andes/ae350/patches/uboot/0001-Fix-mmc-no-partition-table-error.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From ea4675215b53d16a72d29b8a6fc6a86cccf59cf0 Mon Sep 17 00:00:00 2001
-From: Yu Chien Peter Lin <peterlin@andestech.com>
-Date: Wed, 5 Jan 2022 11:00:59 +0800
-Subject: [PATCH] Fix mmc no partition table error
-
-Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
----
- drivers/mmc/ftsdc010_mci.c | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/drivers/mmc/ftsdc010_mci.c b/drivers/mmc/ftsdc010_mci.c
-index 570d54cf..3b1e0aa0 100644
---- a/drivers/mmc/ftsdc010_mci.c
-+++ b/drivers/mmc/ftsdc010_mci.c
-@@ -438,10 +438,6 @@ static int ftsdc010_mmc_probe(struct udevice *dev)
-		return ret;
- #endif
-
--	if (dev_read_bool(dev, "cap-mmc-highspeed") || \
--		  dev_read_bool(dev, "cap-sd-highspeed"))
--		chip->caps |= MMC_MODE_HS | MMC_MODE_HS_52MHz;
--
-	ftsdc_setup_cfg(&plat->cfg, dev->name, chip->buswidth, chip->caps,
-			priv->minmax[1] , priv->minmax[0]);
-	chip->mmc = &plat->mmc;
---
-2.25.1
diff --git a/board/andes/ae350/patches/uboot/0001-mmc-ftsdc010_mci-Support-DTS-of-ftsdc010-driver-for-.patch b/board/andes/ae350/patches/uboot/0001-mmc-ftsdc010_mci-Support-DTS-of-ftsdc010-driver-for-.patch
new file mode 100644
index 0000000000..be89a1563f
--- /dev/null
+++ b/board/andes/ae350/patches/uboot/0001-mmc-ftsdc010_mci-Support-DTS-of-ftsdc010-driver-for-.patch
@@ -0,0 +1,38 @@
+From 16aad5594e08550295ea3c12c1c9ed6f64774748 Mon Sep 17 00:00:00 2001
+From: Rick Chen <rick@andestech.com>
+Date: Tue, 29 Mar 2022 13:41:10 +0800
+Subject: [PATCH] mmc: ftsdc010_mci: Support DTS of ftsdc010 driver for
+ generic dma
+
+The ftsdc010 driver has been implemented for generic dma in Linux
+kernel. And its compatible is andestech,atfsdc010g to distinguish
+the legacy andestech,atfsdc010 which is not for generic dma.
+
+Althought the ftsdc010_mci driver in U-Boot does not use dma, but
+it still can work well with the mmc node for generic dma. So add
+the compatible string to support it.
+
+Signed-off-by: Rick Chen <rick@andestech.com>
+
+Upstream-Status: Pending
+
+Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
+---
+ drivers/mmc/ftsdc010_mci.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/drivers/mmc/ftsdc010_mci.c b/drivers/mmc/ftsdc010_mci.c
+index 570d54cf9d..65b1d447a8 100644
+--- a/drivers/mmc/ftsdc010_mci.c
++++ b/drivers/mmc/ftsdc010_mci.c
+@@ -460,6 +460,7 @@ int ftsdc010_mmc_bind(struct udevice *dev)
+ 
+ static const struct udevice_id ftsdc010_mmc_ids[] = {
+ 	{ .compatible = "andestech,atfsdc010" },
++	{ .compatible = "andestech,atfsdc010g" },
+ 	{ }
+ };
+ 
+-- 
+2.34.1
+
diff --git a/board/andes/ae350/patches/uboot/0002-Prevent-fw_dynamic-from-relocation.patch b/board/andes/ae350/patches/uboot/0002-Prevent-fw_dynamic-from-relocation.patch
deleted file mode 100644
index c6e1896f1c..0000000000
--- a/board/andes/ae350/patches/uboot/0002-Prevent-fw_dynamic-from-relocation.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 4c0c5378d032f2f95577585935624baf7b4decf3 Mon Sep 17 00:00:00 2001
-From: Yu Chien Peter Lin <peterlin@andestech.com>
-Date: Wed, 5 Jan 2022 11:02:26 +0800
-Subject: [PATCH] Prevent fw_dynamic from relocation
-
-This patch prevents OpenSBI relocation, load fw_dynamic to link address
-
-Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
----
- board/AndesTech/ax25-ae350/Kconfig | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/board/AndesTech/ax25-ae350/Kconfig b/board/AndesTech/ax25-ae350/Kconfig
-index e50f505a..385c4c11 100644
---- a/board/AndesTech/ax25-ae350/Kconfig
-+++ b/board/AndesTech/ax25-ae350/Kconfig
-@@ -25,7 +25,7 @@ config SPL_TEXT_BASE
-	default 0x800000
-
- config SPL_OPENSBI_LOAD_ADDR
--	default 0x01000000
-+	default 0x0
-
- config BOARD_SPECIFIC_OPTIONS # dummy
-	def_bool y
---
-2.25.1
diff --git a/board/andes/ae350/patches/uboot/0002-spl-Align-device-tree-blob-address-at-8-byte-boundar.patch b/board/andes/ae350/patches/uboot/0002-spl-Align-device-tree-blob-address-at-8-byte-boundar.patch
new file mode 100644
index 0000000000..5080554ca1
--- /dev/null
+++ b/board/andes/ae350/patches/uboot/0002-spl-Align-device-tree-blob-address-at-8-byte-boundar.patch
@@ -0,0 +1,42 @@
+From 933ad8a59f7fd9b2088badc3e97167d750a40b5a Mon Sep 17 00:00:00 2001
+From: Bin Meng <bmeng.cn@gmail.com>
+Date: Mon, 12 Jul 2021 11:52:31 +0800
+Subject: [PATCH] spl: Align device tree blob address at 8-byte boundary
+
+Since libfdt v1.6.1, a new requirement on the device tree address via:
+
+  commit 5e735860c478 ("libfdt: Check for 8-byte address alignment in fdt_ro_probe_()")
+
+must be met that the device tree must be loaded in to memory at an
+8-byte aligned address.
+
+Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
+
+This patch was imported from U-boot patchwork:
+https://patchwork.ozlabs.org/project/uboot/patch/20210712035231.26475-1-bmeng.cn@gmail.com/
+
+Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
+---
+ common/spl/spl_fit.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/common/spl/spl_fit.c b/common/spl/spl_fit.c
+index a35be529..a76ad14a 100644
+--- a/common/spl/spl_fit.c
++++ b/common/spl/spl_fit.c
+@@ -382,6 +382,12 @@ static int spl_fit_append_fdt(struct spl_image_info *spl_image,
+ 	 */
+ 	image_info.load_addr = spl_image->load_addr + spl_image->size;
+ 
++	/*
++	 * Since libfdt v1.6.1, the device tree must be loaded in to memory
++	 * at an 8-byte aligned address.
++	 */
++	image_info.load_addr = roundup(image_info.load_addr, 8);
++
+ 	/* Figure out which device tree the board wants to use */
+ 	node = spl_fit_get_image_node(ctx, FIT_FDT_PROP, index++);
+ 	if (node < 0) {
+-- 
+2.34.1
+
diff --git a/board/andes/ae350/patches/uboot/0003-Fix-u-boot-proper-booting-issue.patch b/board/andes/ae350/patches/uboot/0003-Fix-u-boot-proper-booting-issue.patch
deleted file mode 100644
index 20598fdba4..0000000000
--- a/board/andes/ae350/patches/uboot/0003-Fix-u-boot-proper-booting-issue.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 3d09501175ae6f5e3f6520b48b1358226a99ff16 Mon Sep 17 00:00:00 2001
-From: Yu Chien Peter Lin <peterlin@andestech.com>
-Date: Wed, 5 Jan 2022 18:17:39 +0800
-Subject: [PATCH] Fix u-boot proper booting issue
-
-Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
----
- arch/riscv/cpu/start.S | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/arch/riscv/cpu/start.S b/arch/riscv/cpu/start.S
-index 76850ec9..2ccda4f5 100644
---- a/arch/riscv/cpu/start.S
-+++ b/arch/riscv/cpu/start.S
-@@ -139,7 +139,9 @@ call_harts_early_init:
-	 * accesses gd).
-	 */
-	mv	gp, s0
-+#if !CONFIG_IS_ENABLED(RISCV_SMODE)
-	bnez	tp, secondary_hart_loop
-+#endif
- #endif
-
-	jal	board_init_f_init_reserve
---
-2.25.1
diff --git a/board/andes/ae350/patches/uboot/0004-Enable-printing-OpenSBI-boot-logo.patch b/board/andes/ae350/patches/uboot/0004-Enable-printing-OpenSBI-boot-logo.patch
deleted file mode 100644
index efd78ab26d..0000000000
--- a/board/andes/ae350/patches/uboot/0004-Enable-printing-OpenSBI-boot-logo.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 3847a959ac4c07facbd80104ca5fa6a91fad5f35 Mon Sep 17 00:00:00 2001
-From: Yu Chien Peter Lin <peterlin@andestech.com>
-Date: Thu, 6 Jan 2022 13:50:07 +0800
-Subject: [PATCH] Enable printing OpenSBI boot logo
-
-Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
----
- include/opensbi.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/opensbi.h b/include/opensbi.h
-index d812cc8c..91fb8fd9 100644
---- a/include/opensbi.h
-+++ b/include/opensbi.h
-@@ -20,7 +20,7 @@
-
- enum sbi_scratch_options {
-	/** Disable prints during boot */
--	SBI_SCRATCH_NO_BOOT_PRINTS = (1 << 0),
-+	SBI_SCRATCH_NO_BOOT_PRINTS = 0,
- };
-
- /** Representation dynamic info passed by previous booting stage */
---
-2.25.1
diff --git a/board/andes/ae350/post-build.sh b/board/andes/ae350/post-build.sh
index 0e6ce228f4..84187a064b 100755
--- a/board/andes/ae350/post-build.sh
+++ b/board/andes/ae350/post-build.sh
@@ -1,3 +1,3 @@
 #!/bin/sh
 cp $BINARIES_DIR/Image $TARGET_DIR/boot
-cp $BINARIES_DIR/ae350.dtb $TARGET_DIR/boot
+cp $BINARIES_DIR/ae350_ax45mp.dtb $TARGET_DIR/boot
diff --git a/board/andes/ae350/readme.txt b/board/andes/ae350/readme.txt
index 6825468d50..4de4cb3894 100644
--- a/board/andes/ae350/readme.txt
+++ b/board/andes/ae350/readme.txt
@@ -30,12 +30,10 @@ Result of the build
 After building, you should obtain the following files:
 
   output/images/
-  |-- ae350.dtb
+  |-- ae350_ax45mp.dtb
   |-- boot.vfat
   |-- fw_dynamic.bin
   |-- fw_dynamic.elf
-  |-- fw_jump.bin
-  |-- fw_jump.elf
   |-- Image
   |-- rootfs.ext2
   |-- rootfs.ext4 -> rootfs.ext2
diff --git a/board/andes/ae350/rootfs_overlay/boot/extlinux/extlinux.conf b/board/andes/ae350/rootfs_overlay/boot/extlinux/extlinux.conf
index 549eb93abc..be19e196a8 100644
--- a/board/andes/ae350/rootfs_overlay/boot/extlinux/extlinux.conf
+++ b/board/andes/ae350/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -1,4 +1,4 @@
 label linux
    kernel /boot/Image
-   fdt /boot/ae350.dtb
+   fdt /boot/ae350_ax45mp.dtb
    append earlycon=sbi root=/dev/mmcblk0p2 rootwait
diff --git a/board/andes/ae350/uboot.config.fragment b/board/andes/ae350/uboot.config.fragment
index 4992d712a5..fa38bbca3a 100644
--- a/board/andes/ae350/uboot.config.fragment
+++ b/board/andes/ae350/uboot.config.fragment
@@ -1,5 +1,7 @@
 CONFIG_SPL_FS_FAT=y
 CONFIG_SPL_MMC=y
 # CONFIG_SPL_RAM_SUPPORT is not set
-# CONFIG_OF_BOARD is not set
-CONFIG_OF_SEPARATE=y
+CONFIG_SPL_OPENSBI_LOAD_ADDR=0x0
+CONFIG_SPL_OPENSBI_SCRATCH_OPTIONS=0x0
+CONFIG_DISPLAY_CPUINFO=y
+CONFIG_DISPLAY_BOARDINFO=y
diff --git a/configs/andes_ae350_45_defconfig b/configs/andes_ae350_45_defconfig
index a35ddd06ba..998276635b 100644
--- a/configs/andes_ae350_45_defconfig
+++ b/configs/andes_ae350_45_defconfig
@@ -4,32 +4,33 @@ BR2_RISCV_ISA_CUSTOM_RVM=y
 BR2_RISCV_ISA_CUSTOM_RVF=y
 BR2_RISCV_ISA_CUSTOM_RVD=y
 BR2_RISCV_ISA_CUSTOM_RVC=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0=y
 BR2_GLOBAL_PATCH_DIR="board/andes/ae350/patches"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_ROOTFS_OVERLAY="board/andes/ae350/rootfs_overlay"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/andes/ae350/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/andes/ae350/genimage_sdcard.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/andestech/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="v5.10.84-ae350_45"
-BR2_LINUX_KERNEL_DEFCONFIG="ae350_rv64_smp"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,andestech,linux,v6.0.y_ae350-ax45mp)/linux-v6.0.y_ae350-ax45mp.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="ae350_ax45mp"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/andes/ae350/ae350.dts"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="andes/ae350_ax45mp"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_OPENSBI=y
+BR2_TARGET_OPENSBI_CUSTOM_TARBALL=y
+BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION="$(call github,riscv,opensbi,22f38ee6c658a660083aa45c4ec6c72f66a17260)/opensbi-22f38ee6c658a660083aa45c4ec6c72f66a17260.tar.gz"
 BR2_TARGET_OPENSBI_PLAT="andes/ae350"
+# BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,u-boot,u-boot,a5dfa3b8a0f7ad555495bad1386613d2de4ba619)/u-boot-a5dfa3b8a0f7ad555495bad1386613d2de4ba619.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ae350_rv64_spl_xip"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/andes/ae350/uboot.config.fragment"
-BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
