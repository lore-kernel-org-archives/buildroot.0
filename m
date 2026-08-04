Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03337C561E6
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 20:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F0BC40781;
	Tue,  4 Aug 2026 20:01:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KeCWUVQzf1OT; Tue,  4 Aug 2026 20:01:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5F174076E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785873691;
	bh=mK+TjYhUuu360ctjpHpaafdEN0kdkmKFFaaTf0vF8xI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ftqh28lYUT4E4N8/E55iGskUUlAl2T7EUlGMOJ/Na5m41EKNnqFd0ApBzR5o9VBRD
	 Uce61c9tCD0623PgIsOkRlWajRlgpOq0FccPFhf7McNlw9ErkPaK/Rhwni9mDErqaE
	 udvKzW//tZZBANCzY24voFwXhkB5dY7xPcTIRRDEcruFkRwamiDmOLWlawsL+tFRpw
	 q7zGv92skrnXq4DFHU4NJlERzafrstiouHpjaJICISUBr8f3ytc7V6HPkR3a8ffNty
	 Z2s+zceXfhUeWAila3dGKeUxS0ycETdmK3S09HW0Uo5D8929rpRps/qnfWu9CmjRmM
	 gCJa7dS4wTPDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5F174076E;
	Tue,  4 Aug 2026 20:01:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AEA823F
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 20:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CDD8400DB
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 20:01:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b_NNEJWbtIiz for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 20:01:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27C23400AD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27C23400AD
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 20:01:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC4E88C582; Tue,  4 Aug 2026 20:00:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Aug 2026 22:00:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6737c90bc6f89cf0c702707933207dd7c5e3398a
X-Git-Newrev: 81490b959246ee2ab8a88c9c56d6223ba13129ec
X-Patchwork-Hint: ignore
Message-Id: <20260804200032.DC4E88C582@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/s6lx9_microboard_defconfig: remove
 defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3180969722444989425=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3180969722444989425==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/81490b959246ee2ab8a88c9c56d6223ba13129ec
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This configuration for the s6lx9 microboard was added back in March 2012
(commit 49084a198247575650c155b6f5f147fb034becc5), and has not been
updated in any significant way since then.

This defconfig still use a 4.4.7 (no longer maintained) and out of tree
devicetree (lx9_mmu.dts).

Remove its support.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/14728914045 (s6lx9_microboard_defconfig)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                            |   1 -
 DEVELOPERS                                     |   4 -
 board/avnet/s6lx9_microboard/lx9_mmu.dts       | 247 -------------------------
 board/avnet/s6lx9_microboard/lx9_mmu_defconfig |  68 -------
 board/avnet/s6lx9_microboard/readme.txt        |  70 -------
 configs/s6lx9_microboard_defconfig             |  11 --
 6 files changed, 401 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 2567d30c51..e042228a4a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -129,7 +129,6 @@ configs/olpc_xo175_defconfig lib_defconfig.ForceCheckHash
 configs/olpc_xo1_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_pc2_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_zero_plus_defconfig lib_defconfig.ForceCheckHash
-configs/s6lx9_microboard_defconfig lib_defconfig.ForceCheckHash
 configs/sipeed_lichee_rv_defconfig lib_defconfig.ForceCheckHash
 configs/sipeed_lichee_rv_dock_defconfig lib_defconfig.ForceCheckHash
 configs/sipeed_licheepi_nano_defconfig lib_defconfig.ForceCheckHash
diff --git a/DEVELOPERS b/DEVELOPERS
index 9b485a2d6e..7fef515471 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2795,10 +2795,6 @@ F:	package/synergy/
 N:	Qais Yousef <qais.yousef@arm.com>
 F:	package/bpftrace/
 
-N:	Rafal Susz <rafal.susz@gmail.com>
-F:	board/avnet/s6lx9_microboard/
-F:	configs/s6lx9_microboard_defconfig
-
 N:	Rafał Miłecki <rafal@milecki.pl>
 F:	board/broadcom/northstar/
 F:	configs/broadcom_northstar_defconfig
diff --git a/board/avnet/s6lx9_microboard/lx9_mmu.dts b/board/avnet/s6lx9_microboard/lx9_mmu.dts
deleted file mode 100644
index 8ffedd9feb..0000000000
--- a/board/avnet/s6lx9_microboard/lx9_mmu.dts
+++ /dev/null
@@ -1,247 +0,0 @@
-/*
- * Device Tree Generator version: 1.3
- *
- * (C) Copyright 2007-2008 Xilinx, Inc.
- * (C) Copyright 2007-2009 Michal Simek
- *
- * Michal SIMEK <monstr@monstr.eu>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation; either version 2 of
- * the License, or (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
- * MA 02111-1307 USA
- *
- * CAUTION: This file is automatically generated by libgen.
- * Version: Xilinx EDK 13.2 EDK_O.61xd
- *
- * XPS project directory: device-tree_bsp_230-orig
- */
-
-/dts-v1/;
-/ {
-    #address-cells = <1>;
-    #size-cells = <1>;
-    compatible = "xlnx,microblaze";
-    model = "testing";
-    MCB3_LPDDR: memory@80000000 {
-        device_type = "memory";
-        reg = < 0x80000000 0x4000000 >;
-    } ;
-    aliases {
-        ethernet0 = &Ethernet_MAC;
-        serial0 = &USB_Uart;
-    } ;
-    chosen {
-        bootargs = "console=ttyUL0";
-        linux,stdout-path = "/axi@0/serial@40600000";
-    } ;
-    cpus {
-        #address-cells = <1>;
-        #cpus = <0x1>;
-        #size-cells = <0>;
-        microblaze_0: cpu@0 {
-            clock-frequency = <66666667>;
-            compatible = "xlnx,microblaze-8.20.a";
-            d-cache-baseaddr = <0x80000000>;
-            d-cache-highaddr = <0x83ffffff>;
-            d-cache-line-size = <0x10>;
-            d-cache-size = <0x2000>;
-            device_type = "cpu";
-            i-cache-baseaddr = <0x80000000>;
-            i-cache-highaddr = <0x83ffffff>;
-            i-cache-line-size = <0x10>;
-            i-cache-size = <0x2000>;
-            model = "microblaze,8.20.a";
-            reg = <0>;
-            timebase-frequency = <66666667>;
-            xlnx,addr-tag-bits = <0xd>;
-            xlnx,allow-dcache-wr = <0x1>;
-            xlnx,allow-icache-wr = <0x1>;
-            xlnx,area-optimized = <0x0>;
-            xlnx,avoid-primitives = <0x0>;
-            xlnx,branch-target-cache-size = <0x0>;
-            xlnx,cache-byte-size = <0x2000>;
-            xlnx,d-axi = <0x1>;
-            xlnx,d-lmb = <0x1>;
-            xlnx,d-plb = <0x0>;
-            xlnx,data-size = <0x20>;
-            xlnx,dcache-addr-tag = <0xd>;
-            xlnx,dcache-always-used = <0x1>;
-            xlnx,dcache-byte-size = <0x2000>;
-            xlnx,dcache-data-width = <0x0>;
-            xlnx,dcache-force-tag-lutram = <0x0>;
-            xlnx,dcache-interface = <0x0>;
-            xlnx,dcache-line-len = <0x4>;
-            xlnx,dcache-use-fsl = <0x0>;
-            xlnx,dcache-use-writeback = <0x0>;
-            xlnx,dcache-victims = <0x0>;
-            xlnx,debug-enabled = <0x1>;
-            xlnx,div-zero-exception = <0x0>;
-            xlnx,dynamic-bus-sizing = <0x1>;
-            xlnx,ecc-use-ce-exception = <0x0>;
-            xlnx,edge-is-positive = <0x1>;
-            xlnx,endianness = <0x1>;
-            xlnx,family = "spartan6";
-            xlnx,fault-tolerant = <0x0>;
-            xlnx,fpu-exception = <0x0>;
-            xlnx,freq = <0x3f940ab>;
-            xlnx,fsl-data-size = <0x20>;
-            xlnx,fsl-exception = <0x0>;
-            xlnx,fsl-links = <0x0>;
-            xlnx,i-axi = <0x0>;
-            xlnx,i-lmb = <0x1>;
-            xlnx,i-plb = <0x0>;
-            xlnx,icache-always-used = <0x1>;
-            xlnx,icache-data-width = <0x0>;
-            xlnx,icache-force-tag-lutram = <0x0>;
-            xlnx,icache-interface = <0x0>;
-            xlnx,icache-line-len = <0x4>;
-            xlnx,icache-streams = <0x0>;
-            xlnx,icache-use-fsl = <0x0>;
-            xlnx,icache-victims = <0x0>;
-            xlnx,ill-opcode-exception = <0x0>;
-            xlnx,instance = "microblaze_0";
-            xlnx,interconnect = <0x2>;
-            xlnx,interconnect-m-axi-dc-aw-register = <0x0>;
-            xlnx,interconnect-m-axi-dc-read-issuing = <0x2>;
-            xlnx,interconnect-m-axi-dc-w-register = <0x0>;
-            xlnx,interconnect-m-axi-dc-write-issuing = <0x20>;
-            xlnx,interconnect-m-axi-dp-read-issuing = <0x1>;
-            xlnx,interconnect-m-axi-dp-write-issuing = <0x1>;
-            xlnx,interconnect-m-axi-ic-read-issuing = <0x2>;
-            xlnx,interconnect-m-axi-ip-read-issuing = <0x1>;
-            xlnx,interrupt-is-edge = <0x0>;
-            xlnx,lockstep-slave = <0x0>;
-            xlnx,mmu-dtlb-size = <0x1>;
-            xlnx,mmu-itlb-size = <0x1>;
-            xlnx,mmu-privileged-instr = <0x0>;
-            xlnx,mmu-tlb-access = <0x3>;
-            xlnx,mmu-zones = <0x2>;
-            xlnx,number-of-pc-brk = <0x1>;
-            xlnx,number-of-rd-addr-brk = <0x0>;
-            xlnx,number-of-wr-addr-brk = <0x0>;
-            xlnx,opcode-0x0-illegal = <0x0>;
-            xlnx,optimization = <0x0>;
-            xlnx,pvr = <0x0>;
-            xlnx,pvr-user1 = <0x0>;
-            xlnx,pvr-user2 = <0x0>;
-            xlnx,reset-msr = <0x0>;
-            xlnx,sco = <0x0>;
-            xlnx,stream-interconnect = <0x0>;
-            xlnx,unaligned-exceptions = <0x0>;
-            xlnx,use-barrel = <0x1>;
-            xlnx,use-branch-target-cache = <0x0>;
-            xlnx,use-dcache = <0x1>;
-            xlnx,use-div = <0x0>;
-            xlnx,use-ext-brk = <0x1>;
-            xlnx,use-ext-nm-brk = <0x1>;
-            xlnx,use-extended-fsl-instr = <0x0>;
-            xlnx,use-fpu = <0x0>;
-            xlnx,use-hw-mul = <0x1>;
-            xlnx,use-icache = <0x1>;
-            xlnx,use-interrupt = <0x1>;
-            xlnx,use-mmu = <0x3>;
-            xlnx,use-msr-instr = <0x1>;
-            xlnx,use-pcmp-instr = <0x0>;
-            xlnx,use-stack-protection = <0x0>;
-        } ;
-    } ;
-    axi4lite_0: axi@0 {
-        #address-cells = <1>;
-        #size-cells = <1>;
-        compatible = "xlnx,axi-interconnect-1.03.a", "simple-bus";
-        ranges ;
-        Ethernet_MAC: ethernet@40e00000 {
-            compatible = "xlnx,axi-ethernetlite-1.00.a", "xlnx,xps-ethernetlite-1.00.a";
-            device_type = "network";
-            interrupt-parent = <&microblaze_0_intc>;
-            interrupts = < 2 0 >;
-            local-mac-address = [ 00 0a 35 aa de 00 ];
-//            phy-handle = <&phy0>;
-            reg = < 0x40e00000 0x10000 >;
-            xlnx,duplex = <0x1>;
-            xlnx,family = "spartan6";
-            xlnx,include-global-buffers = <0x0>;
-            xlnx,include-internal-loopback = <0x0>;
-            xlnx,include-mdio = <0x1>;
-            xlnx,include-phy-constraints = <0x1>;
-            xlnx,interconnect-s-axi-read-acceptance = <0x1>;
-            xlnx,interconnect-s-axi-write-acceptance = <0x1>;
-            xlnx,rx-ping-pong = <0x0>;
-            xlnx,s-axi-aclk-period-ps = <0x3a98>;
-            xlnx,s-axi-id-width = <0x1>;
-            xlnx,s-axi-supports-narrow-burst = <0x0>;
-            xlnx,tx-ping-pong = <0x0>;
-/*
-            mdio {
-                #address-cells = <1>;
-                #size-cells = <0>;
-                phy0: phy@7 {
-                    compatible = "marvell,88e1111";
-                    device_type = "ethernet-phy";
-                    reg = <7>;
-                } ;
-            } ;
-*/
-        } ;
-        SPI_FLASH: spi@40a00000 {
-            compatible = "xlnx,axi-spi-1.01.a", "xlnx,xps-spi-2.00.a";
-            interrupt-parent = <&microblaze_0_intc>;
-            interrupts = < 1 2 >;
-            reg = < 0x40a00000 0x10000 >;
-            xlnx,family = "spartan6";
-            xlnx,fifo-exist = <0x1>;
-            xlnx,num-ss-bits = <0x1>;
-            xlnx,num-transfer-bits = <0x8>;
-            xlnx,sck-ratio = <0x4>;
-        } ;
-        USB_Uart: serial@40600000 {
-            clock-frequency = <66666667>;
-            compatible = "xlnx,axi-uartlite-1.02.a", "xlnx,xps-uartlite-1.00.a";
-            current-speed = <115200>;
-            device_type = "serial";
-            interrupt-parent = <&microblaze_0_intc>;
-            interrupts = < 3 0 >;
-            port-number = <0>;
-            reg = < 0x40600000 0x10000 >;
-            xlnx,baudrate = <0x1c200>;
-            xlnx,data-bits = <0x8>;
-            xlnx,family = "spartan6";
-            xlnx,odd-parity = <0x1>;
-            xlnx,s-axi-aclk-freq-hz = <0x3f940ab>;
-            xlnx,use-parity = <0x0>;
-        } ;
-        microblaze_0_intc: interrupt-controller@41200000 {
-            #interrupt-cells = <0x2>;
-            compatible = "xlnx,axi-intc-1.01.a", "xlnx,xps-intc-1.00.a";
-            interrupt-controller ;
-            reg = < 0x41200000 0x10000 >;
-            xlnx,kind-of-intr = <0xc>;
-            xlnx,num-intr-inputs = <0x4>;
-        } ;
-        system_timer: timer@41c00000 {
-            clock-frequency = <66666667>;
-            compatible = "xlnx,axi-timer-1.02.a", "xlnx,xps-timer-1.00.a";
-            interrupt-parent = <&microblaze_0_intc>;
-            interrupts = < 0 2 >;
-            reg = < 0x41c00000 0x10000 >;
-            xlnx,count-width = <0x20>;
-            xlnx,family = "spartan6";
-            xlnx,gen0-assert = <0x1>;
-            xlnx,gen1-assert = <0x1>;
-            xlnx,one-timer-only = <0x0>;
-            xlnx,trig0-assert = <0x1>;
-            xlnx,trig1-assert = <0x1>;
-        } ;
-    } ;
-} ;
diff --git a/board/avnet/s6lx9_microboard/lx9_mmu_defconfig b/board/avnet/s6lx9_microboard/lx9_mmu_defconfig
deleted file mode 100644
index 5d01ca00a1..0000000000
--- a/board/avnet/s6lx9_microboard/lx9_mmu_defconfig
+++ /dev/null
@@ -1,68 +0,0 @@
-CONFIG_EXPERIMENTAL=y
-CONFIG_SYSVIPC=y
-CONFIG_IKCONFIG=y
-CONFIG_IKCONFIG_PROC=y
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_INITRAMFS_SOURCE="rootfs.cpio"
-CONFIG_INITRAMFS_COMPRESSION_GZIP=y
-# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
-CONFIG_EXPERT=y
-CONFIG_KALLSYMS_ALL=y
-CONFIG_KALLSYMS_EXTRA_PASS=y
-# CONFIG_HOTPLUG is not set
-# CONFIG_BASE_FULL is not set
-# CONFIG_FUTEX is not set
-# CONFIG_EPOLL is not set
-# CONFIG_SIGNALFD is not set
-# CONFIG_SHMEM is not set
-CONFIG_SLAB=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-# CONFIG_BLK_DEV_BSG is not set
-# CONFIG_OPT_LIB_ASM is not set
-CONFIG_KERNEL_BASE_ADDR=0x80000000
-CONFIG_XILINX_MICROBLAZE0_FAMILY="spartan6"
-CONFIG_XILINX_MICROBLAZE0_USE_MSR_INSTR=1
-# CONFIG_XILINX_MICROBLAZE0_USE_PCMP_INSTR is not set
-CONFIG_XILINX_MICROBLAZE0_USE_BARREL=1
-CONFIG_XILINX_MICROBLAZE0_USE_HW_MUL=1
-CONFIG_XILINX_MICROBLAZE0_HW_VER="8.20.a"
-CONFIG_HZ_100=y
-CONFIG_MMU=y
-CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE_FORCE=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-# CONFIG_INET_LRO is not set
-# CONFIG_IPV6 is not set
-CONFIG_PROC_DEVICETREE=y
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=8192
-CONFIG_NETDEVICES=y
-CONFIG_NET_ETHERNET=y
-CONFIG_XILINX_EMACLITE=y
-# CONFIG_INPUT is not set
-# CONFIG_SERIO is not set
-# CONFIG_VT is not set
-CONFIG_SERIAL_UARTLITE=y
-CONFIG_SERIAL_UARTLITE_CONSOLE=y
-# CONFIG_HW_RANDOM is not set
-# CONFIG_HWMON is not set
-# CONFIG_USB_SUPPORT is not set
-CONFIG_EXT2_FS=y
-# CONFIG_DNOTIFY is not set
-CONFIG_NFS_FS=y
-CONFIG_NFS_V3=y
-CONFIG_CIFS=y
-CONFIG_CIFS_STATS=y
-CONFIG_CIFS_STATS2=y
-CONFIG_PARTITION_ADVANCED=y
-CONFIG_DEBUG_KERNEL=y
-CONFIG_DETECT_HUNG_TASK=y
-CONFIG_DEBUG_SLAB=y
-CONFIG_DEBUG_SPINLOCK=y
-CONFIG_DEBUG_INFO=y
-CONFIG_EARLY_PRINTK=y
-# CONFIG_CRYPTO_ANSI_CPRNG is not set
diff --git a/board/avnet/s6lx9_microboard/readme.txt b/board/avnet/s6lx9_microboard/readme.txt
deleted file mode 100644
index 3cb2ce982a..0000000000
--- a/board/avnet/s6lx9_microboard/readme.txt
+++ /dev/null
@@ -1,70 +0,0 @@
-This is the buildroot board support for the Avnet Spartan6 LX9 MicroBoard.
-
-The Avnet S6LX9 Microboard is a small USB-Stick sized module containing
-a Spartan6 FPGA capable of running the Microblaze softcore processor
-together with RAM and FLASH memory.
-
-The board can be bought from Avnet (avnet.com) or from Trenz Electronic
-(www.trenz-electronic.de) for a low price.
-
-To run the Linux built with buildroot you have to install the FPGA bitfile
-and u-boot as described in the tutorial AvtS6LX9MicroBoard_SW302_PetaLinux
-available on http://www.em.avnet.com/s6microboard
-
-On this site also is a forum containing information on how to build your own
-Microblaze processor for the Microboard.
-
-The image file (default name is simpleImage.lx9_mmu.ub) has to be copied
-to your tftp folder (often /tftpboot/) or can be programmed into the
-board's SPI flash.
-
-Sample session:
-
-$ make s6lx9_microboard_defconfig
-$ make
-$ cp build/linux-<version>/arch/microblaze/boot/simpleImage.lx9_mmu.ub /tftpboot/br12.2a.ub
-$ minicom
-<hit the reset button on the S6LX9 Microboard>
-
-                Icache:ON
-                Dcache:ON
-        U-Boot Start:0x83f00000
-SF: Got idcode 20 ba 18 10 01
-*** Warning - bad CRC, using default environment
-
-Net:   Xilinx_Emaclite
-MAC:   00:0a:35:00:63:37
-U-BOOT for Avnet-LX9-Microboard-AXI-tiny-13.1
-
-BOOTP broadcast 1
-DHCP client bound to address 192.168.11.122
-Hit any key to stop autoboot:  0
-U-Boot-PetaLinux> tftp br12.2a.ub
-Using Xilinx_Emaclite device
-TFTP from server 192.168.11.10; our IP address is 192.168.11.122
-Filename 'br12.2a.ub'.
-Load address: 0x80002000
-Loading: #################################################################
-         #################################################################
-         #################################################################
-         #################################################################
-         #################################################################
-         ##############################
-done
-Bytes transferred = 5207724 (4f76ac hex)
-U-Boot-PetaLinux> bootm
-## Booting kernel from Legacy Image at 80002000 ...
-   Image Name:   Linux-3.1.0
-   Image Type:   MicroBlaze Linux Kernel Image (uncompressed)
-   Data Size:    5207660 Bytes =  5 MB
-   Load Address: 80000000
-   Entry Point:  80000000
-   Verifying Checksum ... OK
-   Loading Kernel Image ... OK
-OK
-## Transferring control to Linux (at address 80000000), 0x80000000 ramdisk 0x00000000, FDT 0x00000000...
-Early console on uartlite at 0x40600000
-..... boot log skipped
-
-Welcome to Microblaze Buildroot
-Microblaze login:
diff --git a/configs/s6lx9_microboard_defconfig b/configs/s6lx9_microboard_defconfig
deleted file mode 100644
index b2d1d49d79..0000000000
--- a/configs/s6lx9_microboard_defconfig
+++ /dev/null
@@ -1,11 +0,0 @@
-BR2_microblazeel=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.7"
-BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/avnet/s6lx9_microboard/lx9_mmu_defconfig"
-BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/avnet/s6lx9_microboard/lx9_mmu.dts"
-BR2_TARGET_ROOTFS_INITRAMFS=y
-# BR2_TARGET_ROOTFS_TAR is not set

--===============3180969722444989425==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3180969722444989425==--
