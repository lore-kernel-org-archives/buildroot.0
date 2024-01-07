Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2A5C46CD2
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 00:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC26F80E55;
	Sun,  7 Jan 2024 00:03:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC26F80E55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x46plIyqdp_l; Sun,  7 Jan 2024 00:03:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE75680E9D;
	Sun,  7 Jan 2024 00:03:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE75680E9D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 54E581BF3C6
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 00:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3394460B0F
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 00:03:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3394460B0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ypwgudqsxuV3 for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 00:03:39 +0000 (UTC)
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com
 [148.163.156.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1BF6260AB5
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 00:03:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BF6260AB5
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
 by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 406CYtxM016901; Sat, 6 Jan 2024 16:03:38 -0800
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3vf707sbuy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 06 Jan 2024 16:03:38 -0800 (PST)
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com
 [10.192.0.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits)
 client-signature RSA-PSS (2048 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 282A7401C2;
 Sun,  7 Jan 2024 00:03:37 +0000 (UTC)
Received: from us01arcgnu3.internal.synopsys.com
 (us01arcgnu3.internal.synopsys.com [10.194.34.166])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id 4D0CBA005E;
 Sun,  7 Jan 2024 00:03:35 +0000 (UTC)
X-SNPS-Relay: synopsys.com
To: buildroot@buildroot.org
Date: Sat,  6 Jan 2024 16:03:23 -0800
Message-Id: <20240107000323.543754-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Proofpoint-GUID: U9N2WGbzfoi0_bH6oSp4ZJ0J5kkuLdnB
X-Proofpoint-ORIG-GUID: U9N2WGbzfoi0_bH6oSp4ZJ0J5kkuLdnB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401060151
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=pfptdkimsnps; bh=5zpv7pKkxPOoSJr8l
 2BcHU+RzAEX6kvZYTIfefArdNk=; b=eCW4c6KA286YEQRhsPFit/6RV7Eb87/4I
 JhEgdXX/Ko3w30eJhK3MBiLSHHFkLDkS9ajCMhlT9iLFKQCUvEipN810xulxs25k
 nVF1uPsBCdSOF3IsL15lDUrbSgzX6/qARqtTZ39CRSfK3ed62R8ub19Db+KxrkeP
 1EJRM9ybveE/woflSO9g0o7mxmOQVkHsGZJFEqPC9rADivQkBtmeOEugqAbj9p9H
 9hfC1Vv+MlSvvrAZn9XhZhZpTudwbW8n4uOUXbmM/GbWT5sGcEKrnYhvpBAm6VAg
 i5/BJDSiWo8ghNUcC7f0Siir0FH0Z9J2LUPXmTYbrHuDBRctGxVLw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1704585817; bh=nlX+IZ173vLVhrA9bTX2DGiJn4ZX2riUMH5w8YGlLvI=;
 h=From:To:Cc:Subject:Date:From;
 b=hgXmWcxlvMTz9V6wWI1eQRWyW52ZO7tsO/TeUw8KFPm5H//iJ43VSjqLNbRqxb0iv
 7/jTkYDDLoBcuC0V1tANfn3AgtfoNN9P7UhSzyZ4ibSTnsQthPY3D2620Z8TPAdKwy
 editJyL6H7dblDNvAbe9hjUggDEEu9fTOIpmzi3xiYXHVzuLVQO/J7hSWK9AC2p/Hg
 wLqrR8UdGYN8I7oxZRE2KyPN6ouLG2TbSkmKh+NMAsbcVFRCNObG4hC6u2kWNbEQ6l
 DwuxXoTbriyXGj9eUdnJQiaeuBJf57Ovbg1CFfI1QFWjFBD0RZuH9WQeAD84fuxIJV
 duU7uTrHejUnQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=pfptdkimsnps header.b=eCW4c6KA; 
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=mail header.b=hgXmWcxl
Subject: [Buildroot] [PATCH] ARC: Enable excution of ARCv2 defconfigs in
 simulation
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
From: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Reply-To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Even though we initially called defconfig after FPGA prototyping
platform HAPS, it's nevertheless is useful for running the same image
in software simulation.

We do a couple of quirks to the config though:
1. Switch from SMP Linux config to UP.
   That's needed to make it runnable in Free nSIM which doesn't
   support SMP (licenceable full version does support SMP though).

2. Add default Ethernet interface for DHCP boot-time initialization
   so that in nSIM & QEMU we get a networking interface out of the box
   on start.

And while at it, improve documentation with build & run commands.
And to make instructions smaller and more readable swhich from explicit
passing all the optopns to the nSIM driver to use of so-called "props"
files (basically, a newline-separated list of options).

Inspired by Waldemar's patch [1].

Assumes ARCv3 defconfigs from [2] are already in place, otherwise
a subtly rework will be required.

[1] https://lists.buildroot.org/pipermail/buildroot/2023-December/681898.html
[2] https://lists.buildroot.org/pipermail/buildroot/2024-January/682466.html

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Inspired-by: Waldemar Brodkorb <wbx@openadk.org>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/synopsys/nsim/arc700.props    |  17 ++++
 board/synopsys/nsim/hs4x.props      |  18 +++++
 board/synopsys/nsim/readme.txt      | 117 ++++++++++++++++++----------
 configs/snps_archs38_haps_defconfig |   3 +-
 4 files changed, 111 insertions(+), 44 deletions(-)
 create mode 100644 board/synopsys/nsim/arc700.props
 create mode 100644 board/synopsys/nsim/hs4x.props

diff --git a/board/synopsys/nsim/arc700.props b/board/synopsys/nsim/arc700.props
new file mode 100644
index 0000000000..c923bdb3da
--- /dev/null
+++ b/board/synopsys/nsim/arc700.props
@@ -0,0 +1,17 @@
+nsim_mem-dev=uart0,kind=dwuart,base=0xf0000000,irq=24
+icache=32768,64,2,0
+dcache=32768,64,4,0
+nsim_mmu=3
+nsim_isa_family=a700
+nsim_isa_atomic_option=1
+nsim_isa_dpfp=none
+nsim_isa_shift_option=2
+nsim_isa_swap_option=1
+nsim_isa_bitscan_option=1
+nsim_isa_sat=1
+nsim_isa_mpy32=1
+nsim_isa_enable_timer_0=1
+nsim_isa_enable_timer_1=1
+isa_counters=1
+nsim_isa_pct_counters=8
+nsim_isa_pct_size=48
diff --git a/board/synopsys/nsim/hs4x.props b/board/synopsys/nsim/hs4x.props
new file mode 100644
index 0000000000..46470d9c9e
--- /dev/null
+++ b/board/synopsys/nsim/hs4x.props
@@ -0,0 +1,18 @@
+nsim_isa_family=av2hs
+nsim_isa_core=1
+nsim_isa_atomic_option=1
+nsim_isa_ll64_option=1
+nsim_isa_mpy_option=9
+nsim_isa_div_rem_option=2
+nsim_isa_sat=1
+nsim_isa_code_density_option=2
+nsim_isa_enable_timer_0=1
+nsim_isa_enable_timer_1=1
+nsim_isa_rtc_option=1
+icache=65536,64,4,0
+dcache=65536,64,2,0
+mmu_version=4
+mmu_pagesize=8192
+nsim_mem-dev=uart0,kind=dwuart,base=0xf0000000,irq=24
+nsim_isa_number_of_interrupts=32
+nsim_isa_number_of_external_interrupts=32
diff --git a/board/synopsys/nsim/readme.txt b/board/synopsys/nsim/readme.txt
index e43a70038f..5fbf07d3f3 100644
--- a/board/synopsys/nsim/readme.txt
+++ b/board/synopsys/nsim/readme.txt
@@ -1,46 +1,77 @@
-How to build it
-===============
-
-Configure build for the selected nSIM target. For instance, for
-ARC700 nSIM target use the following defauilt configuration:
-$ make snps_arc700_nsim_defconfig
-
-Optionally modify the configuration:
-$ make menuconfig
-
-Build:
-$ make
-
-How to use it
-=============
-
-Resulting image can be booted using ARC nSIM instruction set simulator.
-Free version of nSIM is available for download:
-- https://www.synopsys.com/cgi-bin/dwarcnsim/req1.cgi
-It provides nsimdrv binary for Linux that can be used stand-alone
-or with GDB.
-
-To run ARC700 image use the following command:
-$ nsimdrv \
-	-prop=nsim_mem-dev=uart0,kind=dwuart,base=0xf0000000,irq=24 \
-	-prop=icache=32768,64,2,0 \
-	-prop=dcache=32768,64,4,0 \
-	-prop=nsim_isa_enable_timer_0=1 \
-	-prop=nsim_isa_enable_timer_1=1 \
-	-prop=nsim_isa_host_timer=1 \
-	-prop=nsim_mmu=3 \
-	-prop=nsim_isa_family=a700 \
-	-prop=nsim_isa_atomic_option=1 \
-	-prop=nsim_isa_dpfp=none \
-	-prop=nsim_isa_shift_option=2 \
-	-prop=nsim_isa_swap_option=1 \
-	-prop=nsim_isa_bitscan_option=1 \
-	-prop=nsim_isa_sat=1 \
-	-prop=nsim_isa_mpy32=1 \
-	-prop=isa_counters=1 \
-	-prop=nsim_isa_pct_counters=8 \
-	-prop=nsim_isa_pct_size=48 \
-	output/images/vmlinux
+Synopsys ARC processors capable of running the Linux kernel could be
+modelled in software simulation or on a FPGA prototyping system.
+
+And while there're tools for cycle-accurate simulation, most of them are
+proprietary and so rarely avaialble for the open source community, but also
+by their nature they are painfully slow - booting Linux on such platfroms
+may easily take days depending on the size of the Linux kernel image,
+enabled kernel features etc.
+
+As opposed to cycle-accurate models there're so-called instruction set
+simulators, which only model functionality observed by the software running
+on the processor, but not all the internal states of the CPU. Those are
+way faster compared to their cycle-accurate siblings and so it's not only
+possible to boot the kernel, one could easily run complex and huge software
+packages like full-scale Linux distributions, modern web-browsers, even
+3D games (with use of the host's GPU as SW rendering of 3D is slow even on
+real prcessors implemented in silicon).
+
+Speaking of such fast instruction set simulators for ARC processors,
+there're 2 major options:
+
+1. nSIM - it's a proprietary simulator from Synopsys which may model
+   all possible configurations of ARC processors and so provides
+   a lot of flexibility to the user. And there's a Free version of it
+   which was made available specifically to enable open source community
+   to run major open source projects for ARC cores such as
+   embedded Linux builds, Zephyr RTOS and the likes.
+
+   Free version of nSIM is available for download:
+   - https://www.synopsys.com/cgi-bin/dwarcnsim/req1.cgi
+   It provides nsimdrv binary for Linux that can be used stand-alone
+   or with GDB.
+
+2. QEMU - it's a widely used open source simulator by now avaialble for most
+   of known CPU architectures. QEMU doesn't model yet all ARC processors
+   and their miriads of options and extensions, but it supports well
+   features required to run Linux-based images.
+
+   QEMU port for ARC is now in the process of upstreaming and so for a time
+   being needs to be built from Synopsys fork on GitHub, see:
+   https://github.com/foss-for-synopsys-dwc-arc-processors/qemu.
+
+   It could be built as easy as:
+   ------------------------>8-----------------------
+   git clone https://github.com/foss-for-synopsys-dwc-arc-processors/qemu
+   cd qemu
+   ./configure --target-list=arc-softmmu,arc64-softmmu
+   make
+   ------------------------>8-----------------------
+
+3. Except for simulators it's clearly possible to run Linux-based images
+   on the FPGA prototyping system. It runs even faster than aforementioned
+   simulators, but not everyone has a luxury of accessing such a setup.
+
+But what's especially nice and convenient that we may run exactly the same image
+on all 3 platforms listed above: nSIM, QEMU & HAPS FPGA system. That allows to
+cross-test platforms against each other, separate feature development (done on
+a functional simulator) from performance profiling (on FPGA) as well as do many
+other funny things.
+
+Below there're instructions on how to build and run Linux images on all
+current ARC processor families capable of runnign Linux.
+
+Build & run image on ARC 700:
+ * Build:       make snps_arc700_nsim_defconfig && make
+ * Run in nSIM: nsimdrv -propsfile=board/synopsys/nsim/arc700.props output/images/vmlinux
+
+Build & run image on ARC HS38:
+ * Build:       make snps_archs38_haps_defconfig && make
+ * Run in nSIM: nsimdrv -propsfile=board/synopsys/nsim/hs4x.props output/images/vmlinux
+ * Run in QEMU: qemu-system-arc -M virt,ram_start=0x80000000 -cpu archs -m 2G -display none \
+                        -nographic -monitor none -kernel output/images/vmlinux \
+                        -netdev user,id=net0 -device virtio-net-device,netdev=net0 \
+                        -device virtio-rng-pci
 
 Build & run image on ARC HS58:
  * Build:       make snps_arc32_defconfig && make
diff --git a/configs/snps_archs38_haps_defconfig b/configs/snps_archs38_haps_defconfig
index 02e020bb47..c2ec480806 100644
--- a/configs/snps_archs38_haps_defconfig
+++ b/configs/snps_archs38_haps_defconfig
@@ -6,6 +6,7 @@ BR2_archs38=y
 BR2_TARGET_GENERIC_HOSTNAME="zebu_hs"
 BR2_TARGET_GENERIC_ISSUE="Welcome to the HAPS Development Platform"
 BR2_TARGET_ROOTFS_INITRAMFS=y
+BR2_SYSTEM_DHCP="eth0"
 
 # Linux headers same as kernel, a 5.16 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
@@ -14,5 +15,5 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16"
-BR2_LINUX_KERNEL_DEFCONFIG="haps_hs_smp"
+BR2_LINUX_KERNEL_DEFCONFIG="haps_hs"
 BR2_LINUX_KERNEL_VMLINUX=y
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
