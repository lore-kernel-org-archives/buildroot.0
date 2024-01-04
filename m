Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5EE9C47073
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 19:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 710FC613C7;
	Thu,  4 Jan 2024 19:06:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 710FC613C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pdT0xVh12gjn; Thu,  4 Jan 2024 19:05:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 534F3613BE;
	Thu,  4 Jan 2024 19:05:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 534F3613BE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7D8801BF356
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 19:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56E9241E28
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 19:05:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56E9241E28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0lGjbd92ZSru for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 19:05:48 +0000 (UTC)
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com
 [148.163.156.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A3C0F41C2D
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 19:05:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3C0F41C2D
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
 by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 404IbA85032742; Thu, 4 Jan 2024 11:05:46 -0800
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3ve14grke0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jan 2024 11:05:46 -0800 (PST)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits)
 client-signature RSA-PSS (2048 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 062B64052B;
 Thu,  4 Jan 2024 19:05:46 +0000 (UTC)
Received: from us01arcgnu3.internal.synopsys.com
 (us01arcgnu3.internal.synopsys.com [10.194.34.166])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id BF972A0085;
 Thu,  4 Jan 2024 19:05:45 +0000 (UTC)
X-SNPS-Relay: synopsys.com
To: buildroot@buildroot.org
Date: Thu,  4 Jan 2024 11:05:28 -0800
Message-Id: <20240104190529.1521901-3-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240104190529.1521901-1-abrodkin@synopsys.com>
References: <20240104190529.1521901-1-abrodkin@synopsys.com>
MIME-Version: 1.0
X-Proofpoint-GUID: QcGUc62IGBYf7M9tXD1nWxTaLd2U-e90
X-Proofpoint-ORIG-GUID: QcGUc62IGBYf7M9tXD1nWxTaLd2U-e90
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 mlxscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401040149
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=pfptdkimsnps; bh=8wOO
 31wOKD5hptGTkZxR+g++j8fSpbxlNiPpUGZViDQ=; b=FOkFAl8YVI54JXwZb/Y4
 IrC9ojfTEzjCgGvB6rL5gb/xWJZLWwN1CvhdY1K29OiwPas0YaqoGwCKMp0MJ7Ii
 uZKMmGy4X3B4+0zpfOwBqpQGF7LJb6V4XkYC1ktFctyBCErKb7FGsQlguv0AqvxU
 gupGSMViTiGpDha6ULygMdS6aZpSiVynu4oCCT6/l8SNnfUA7PexR0bMutEKkbbu
 hEL82/+Tjx+RiMSoJyn8ln73BozRRGbLuN8zPIXolm8aQXHzxu6iFFbDpl2C0925
 m0mgRxlp3COQDh8BKmGc8ZL7IwRjqwzNyaFfl92t29ZyqI5xkZ2sezpgTm6Hv/nF
 1A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1704395146; bh=OZn5ScBDxcdPQ4Oi1GCoA56rK9/39Y6VdS/9XRp3szk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D+868rhCKsTjZhQkdWzYkXdm+PiWWQ0EGvsTcKW/QyvoHXcafLSutCkiWmPoLmZHs
 JdOWA06GOetqbv4d/aAofbUm30/zZHVazfD4m61cYQOljnhnr8JGc3hQCtkeTK3z8b
 4M0ZfMZ8CUrID+IzA7RdCDbo1qjDiwbVQePCYyRQ4fQyc+0fGNm12s269eVPvFEUhZ
 pSReODym3UGYUyBKrFYH3LFQDCJhK9l+YRG5SPJi5RHozTDoa5PFveLozQKQRIWs72
 OXDwvmgAVyFipe6SuiiIsqigFkjnERUMHZR131V6b4jw7fgK+/vjafppT82DI7jyes
 mcqFAPmBKekMA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=pfptdkimsnps header.b=FOkFAl8Y; 
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=mail header.b=D+868rhC
Subject: [Buildroot] [PATCH 2/3] ARC: Add defconfigs for ARC HS58 & HS68
 processors in simulators
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
Cc: geomatsi@gmail.com, artem.panfilov@nokia.com,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Shahab.Vahedi@synopsys.com,
 VVIsaev@gmail.com, vgupta@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

To simplify ramp-up with Linux on32-bit  ARC HS58 & 64-bit ARC HS68
processors we introduce 2 defconfigs with instructions on how to build
embedded Linux image for them and how to run resultoing image.

As with earlier images for simulated platforms it's possible to
use the same image with either proprietary Synopsys nSIM simulator,
QEMU or even with real FPGA-based prototyping platform called HAPS.

That not only convenient, but also helps to work on observed issues,
i.e. run the same image on so very different platforms and see if
earlier observed problem is still there. That way we may easily
verify various platforms against each other.

For example, if one image works on nSIM & FPGA but doesn't work
on QEMU, it's clear something needs to be fixed in QEMU.

But if exactly the same though unexpected behavior is observed on all
the platforms, we may say with quite some confidence, that we're dealing
with a pure software or tools issue.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Shahab Vahedi <shahab@synopsys.com>
Signed-off-by: Vladimir Isaev <VVIsaev@gmail.com>
Signed-off-by: Vineet Gupta <vgupta@kernel.org>
Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 board/synopsys/nsim/hs5x.props          | 30 +++++++++++++++++++++++++
 board/synopsys/nsim/hs6x.props          | 30 +++++++++++++++++++++++++
 board/synopsys/nsim/post-image-arcv3.sh |  4 ++++
 board/synopsys/nsim/readme.txt          | 16 +++++++++++++
 configs/snps_arc32_defconfig            | 29 ++++++++++++++++++++++++
 configs/snps_arc64_defconfig            | 26 +++++++++++++++++++++
 6 files changed, 135 insertions(+)
 create mode 100644 board/synopsys/nsim/hs5x.props
 create mode 100644 board/synopsys/nsim/hs6x.props
 create mode 100755 board/synopsys/nsim/post-image-arcv3.sh
 create mode 100644 configs/snps_arc32_defconfig
 create mode 100644 configs/snps_arc64_defconfig

diff --git a/board/synopsys/nsim/hs5x.props b/board/synopsys/nsim/hs5x.props
new file mode 100644
index 0000000000..1d8974650e
--- /dev/null
+++ b/board/synopsys/nsim/hs5x.props
@@ -0,0 +1,30 @@
+nsim_isa_family=av3hs
+nsim_isa_dc_hw_prefetch=1
+nsim_isa_dual_issue_option=1
+nsim_isa_atomic_option=2
+nsim_isa_m128_option=0
+nsim_isa_ll64_option=1
+nsim_isa_mpy_option=9
+nsim_isa_div_rem_option=2
+nsim_isa_enable_timer_0=1
+nsim_isa_enable_timer_1=1
+nsim_isa_rtc_option=1
+icache=16384,64,4
+dcache=16384,64,2
+mmu_version=16
+mmu_pagesize=4096
+mmu_address_space=32
+nsim_mem-dev=uart0,kind=dwuart,base=0xf0000000,irq=24
+nsim_isa_number_of_interrupts=32
+nsim_isa_number_of_external_interrupts=32
+nsim_isa_has_fp=1
+nsim_isa_fp_dds_option=1
+nsim_isa_fp_div_option=1
+nsim_isa_fp_dp_option=1
+nsim_isa_fp_hp_option=1
+nsim_isa_fp_vec_option=1
+nsim_isa_fp_wide_option=1
+nsim_isa_mpy64=1
+nsim_isa_div64_option=1
+nsim_isa_dsp_option=3
+nsim_isa_dsp_wide_option=1
diff --git a/board/synopsys/nsim/hs6x.props b/board/synopsys/nsim/hs6x.props
new file mode 100644
index 0000000000..e26cec0a64
--- /dev/null
+++ b/board/synopsys/nsim/hs6x.props
@@ -0,0 +1,30 @@
+nsim_fast=0
+nsim_isa_dual_issue_option=1
+nsim_isa_has_hw_pf=1
+nsim_isa_m128_option=1
+nsim_isa_has_hw_pf=1
+nsim_isa_vec64=1
+nsim_isa_family=arc64
+nsim_isa_enable_timer_0=1
+nsim_isa_enable_timer_1=1
+nsim_isa_rtc_option=1
+nsim_isa_addr_size=64
+nsim_isa_pc_size=64
+icache=16384,64,4,o
+dcache=16384,64,4,o
+mmu_version=16
+mmu_pagesize=4096
+mmu_address_space=48
+nsim_mem-dev=uart0,kind=dwuart,base=0xf0000000,irq=24
+nsim_isa_mpy_option=9
+nsim_isa_mpy64=1
+nsim_isa_div64_option=1
+nsim_isa_div_rem_option=2
+nsim_isa_atomic_option=2
+nsim_isa_has_fp=1
+nsim_isa_fp_dds_option=1
+nsim_isa_fp_div_option=1
+nsim_isa_fp_dp_option=1
+nsim_isa_fp_hp_option=1
+nsim_isa_fp_vec_option=1
+nsim_isa_fp_wide_option=1
diff --git a/board/synopsys/nsim/post-image-arcv3.sh b/board/synopsys/nsim/post-image-arcv3.sh
new file mode 100755
index 0000000000..dd5a634661
--- /dev/null
+++ b/board/synopsys/nsim/post-image-arcv3.sh
@@ -0,0 +1,4 @@
+#!/bin/sh
+
+# Install vmlinux with debug symbols
+install -m 0644 ${2}/vmlinux ${1}/
diff --git a/board/synopsys/nsim/readme.txt b/board/synopsys/nsim/readme.txt
index cc89cf87ac..e43a70038f 100644
--- a/board/synopsys/nsim/readme.txt
+++ b/board/synopsys/nsim/readme.txt
@@ -41,3 +41,19 @@ $ nsimdrv \
 	-prop=nsim_isa_pct_counters=8 \
 	-prop=nsim_isa_pct_size=48 \
 	output/images/vmlinux
+
+Build & run image on ARC HS58:
+ * Build:       make snps_arc32_defconfig && make
+ * Run in nSIM: nsimdrv -propsfile=board/synopsys/nsim/hs5x.props output/images/loader
+ * Run in QEMU: qemu-system-arc -M virt,ram_start=0 -cpu hs5x -m 2G -display none \
+                        -nographic -monitor none -kernel output/images/loader \
+                        -netdev user,id=net0 -device virtio-net-device,netdev=net0 \
+                        -device virtio-rng-pci
+
+Build & run image on ARC HS58:
+ * Build:       make snps_arc64_defconfig && make
+ * Run in nSIM: nsimdrv -propsfile=board/synopsys/nsim/hs6x.props output/images/loader
+ * Run in QEMU: qemu-system-arc64 -M virt,ram_start=0 -cpu hs6x -m 2G -display none \
+                        -nographic -monitor none -kernel output/images/loader \
+                        -netdev user,id=net0 -device virtio-net-device,netdev=net0 \
+                        -device virtio-rng-pci
diff --git a/configs/snps_arc32_defconfig b/configs/snps_arc32_defconfig
new file mode 100644
index 0000000000..e94b0fdfeb
--- /dev/null
+++ b/configs/snps_arc32_defconfig
@@ -0,0 +1,29 @@
+#Architecture
+BR2_arcle=y
+BR2_arc32=y
+
+# System
+BR2_SYSTEM_DHCP="eth0"
+BR2_TARGET_GENERIC_GETTY=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_INITRAMFS=y
+
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/synopsys/nsim/post-image-arcv3.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(LINUX_DIR)"
+
+# Toolchain
+BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
+
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/foss-for-synopsys-dwc-arc-processors/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="f6e9dab9d1dc1e8fa2acb75504bf5ff86b885b8e"
+BR2_LINUX_KERNEL_DEFCONFIG="haps_hs5x"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="loader"
diff --git a/configs/snps_arc64_defconfig b/configs/snps_arc64_defconfig
new file mode 100644
index 0000000000..7275b233eb
--- /dev/null
+++ b/configs/snps_arc64_defconfig
@@ -0,0 +1,26 @@
+#Architecture
+BR2_arcle=y
+BR2_arc64=y
+
+# System
+BR2_SYSTEM_DHCP="eth0"
+BR2_TARGET_GENERIC_GETTY=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_INITRAMFS=y
+
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/synopsys/nsim/post-image-arcv3.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(LINUX_DIR)"
+
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/foss-for-synopsys-dwc-arc-processors/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="f6e9dab9d1dc1e8fa2acb75504bf5ff86b885b8e"
+BR2_LINUX_KERNEL_DEFCONFIG="haps_arc64"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="loader"
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
