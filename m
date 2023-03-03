Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3DCC64EC4
	for <buildroot@archiver.kernel.org>; Fri,  3 Mar 2023 12:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93AEA4118C;
	Fri,  3 Mar 2023 12:23:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93AEA4118C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZU2oS8C5NyWc; Fri,  3 Mar 2023 12:23:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8ED14411AB;
	Fri,  3 Mar 2023 12:23:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8ED14411AB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C96371BF239
 for <buildroot@lists.busybox.net>; Fri,  3 Mar 2023 12:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D8F54118D
 for <buildroot@lists.busybox.net>; Fri,  3 Mar 2023 12:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D8F54118D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aADYBH-cwfHk for <buildroot@lists.busybox.net>;
 Fri,  3 Mar 2023 12:23:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B511F4118B
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B511F4118B
 for <buildroot@buildroot.org>; Fri,  3 Mar 2023 12:23:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.98,230,1673884800"; d="scan'208";a="224726816"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Mar 2023 20:23:03 +0800
IronPort-SDR: fO9R1Tmxk3+20TFC+l7NO9Z4LDKwOYFO/KiT1PNAcrCkDS0xuXOslfePbcafC6OqKFwG3re88+
 ciD9nuwqyo32ZDtP3sF5RduUvG+EARPzjIdvV+6oo9n+8Y4YMUFBBDh7fphh82AQPezf/P7vFq
 yVkETZ8/GioeGvDryKTJzeNu4YQcAEe5zYho/GX356nESkTLRJdM2If9pvDXpI32IvlkihZJtf
 X5trXhqxRO2wigaJ77RsDlyD7Rs7f6rOyn2vjwBbV7J1puEbOsIYQLd0FXEC+thW8ZsemB4ULX
 v+M=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Mar 2023 03:39:47 -0800
IronPort-SDR: RAApmnpD397kYSs33sPIsz13zxvyeZnTjiq5raxORixwxGORv67hEdsTjmOWeks6Bf+rUfbvDp
 5eZIkZNjvOU2NhP0Gyk40mZaQaxA+6dx9/tQ4NexGJbiveJ1ocqLMPrAblGOKts7HzP5lk//uG
 pRRT4YEy0KAS8I3sxNoPw1XeqDqozzKlE+d8u2VgpyTNZgKXi33kwZAmKPpMpOafCqShdbwg5s
 HGzvYETp6klx7Ohoi8bvEJyKnobXfdTNO1ISp5ZYmjyKu6z8NQ0C9zd4Mpk1rI6GiDZYSv/eCV
 JJ8=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.lan) ([10.225.164.35])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 Mar 2023 04:23:02 -0800
To: buildroot@buildroot.org
Date: Fri,  3 Mar 2023 13:22:51 +0100
Message-Id: <20230303122251.3392998-4-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303122251.3392998-1-niklas.cassel@wdc.com>
References: <20230303122251.3392998-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1677846183; x=1709382183;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2zvSJKeT/kMiRvBsG02WpL6IDfz+8S4fxxoCMLW9u4U=;
 b=V0Nj766pdDvYBPkGUTW/4FUqc4xVSpoEcgOL81NYAtGtRzicqE4TNv/t
 mk2+UT1deoPlLMaLVMcO/OdJHJjgt0NNI5Ctr5RX9E32IT95NfIsnti3v
 KjM8NIDVO8oNASooamBEoCSEm5bnJwavE9PjGDiiGCBVJG7iBu6FLL/4t
 i5Egg9tjyRBNd/qUKLnQuybBXaZ/y0H8xU04aahKuSoPH9w2XFI1eD1Cj
 upCtghbRTQRHyAvuIGkteufxINXOriqAoM/3/Hcpms+wVrEJkf75KkXUq
 TaHyULpzqL9xfWJxdE8wkX14MJ5g5vOxY/5sh0bNmOM5b/Se7sToqAZ5T
 w==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=V0Nj766p
Subject: [Buildroot] [PATCH v2 3/3] support/testing: use the arch default
 kernel config in test_edk2.py
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <niklas.cassel@wdc.com>
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The kernel config board/qemu/aarch64-sbsa/linux.config has never been in
use by qemu_aarch64_sbsa_defconfig, neither via
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE, nor via
BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES.

test_edk2.py is using the kernel config
board/qemu/aarch64-sbsa/linux.config. However, storing a kernel config
that is not used by qemu_aarch64_sbsa_defconfig, in a directory that is
"owned" by qemu_aarch64_sbsa_defconfig, is bound to cause confusion.

If test_edk2.py really wants to use its own kernel config, that kernel
config should be defined in support/testing/tests/boot/test_edk2.py,
or should be stored somewhere under support/testing/tests/boot.

Since test_edk2.py is already reusing some scripts stored in
board/qemu/aarch64-sbsa (which is "owned" by qemu_aarch64_sbsa_defconfig),
the most sensible thing is to let test_edk2.py use the same kernel config
as qemu_aarch64_sbsa_defconfig (which is the arch default kernel config).

Therefore, use the arch default kernel config in test_edk2.py and drop the
out of place kernel config.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 board/qemu/aarch64-sbsa/linux.config    | 68 -------------------------
 support/testing/tests/boot/test_edk2.py |  7 +--
 2 files changed, 4 insertions(+), 71 deletions(-)
 delete mode 100644 board/qemu/aarch64-sbsa/linux.config

diff --git a/board/qemu/aarch64-sbsa/linux.config b/board/qemu/aarch64-sbsa/linux.config
deleted file mode 100644
index a60cce02ec..0000000000
--- a/board/qemu/aarch64-sbsa/linux.config
+++ /dev/null
@@ -1,68 +0,0 @@
-CONFIG_SYSVIPC=y
-CONFIG_POSIX_MQUEUE=y
-CONFIG_NO_HZ_IDLE=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_TASKSTATS=y
-CONFIG_SCHED_AUTOGROUP=y
-CONFIG_PROFILING=y
-CONFIG_ARCH_VEXPRESS=y
-CONFIG_COMPAT=y
-CONFIG_FW_CFG_SYSFS=y
-CONFIG_FW_CFG_SYSFS_CMDLINE=y
-CONFIG_ACPI=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_BLK_DEV_BSGLIB=y
-CONFIG_BINFMT_MISC=y
-CONFIG_TRANSPARENT_HUGEPAGE=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_PACKET_DIAG=y
-CONFIG_UNIX=y
-CONFIG_NET_KEY=y
-CONFIG_INET=y
-CONFIG_IP_MULTICAST=y
-CONFIG_IP_ADVANCED_ROUTER=y
-CONFIG_BRIDGE=m
-CONFIG_NET_SCHED=y
-CONFIG_VSOCKETS=y
-CONFIG_PCI=y
-CONFIG_PCI_HOST_GENERIC=y
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
-CONFIG_VIRTIO_BLK=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_CHR_DEV_SG=y
-CONFIG_SCSI_CONSTANTS=y
-CONFIG_SCSI_LOGGING=y
-CONFIG_SCSI_SCAN_ASYNC=y
-CONFIG_SCSI_VIRTIO=y
-CONFIG_ATA=y
-CONFIG_SATA_AHCI_PLATFORM=y
-CONFIG_NETDEVICES=y
-CONFIG_DUMMY=y
-CONFIG_MACVLAN=y
-CONFIG_VIRTIO_NET=y
-CONFIG_NLMON=y
-CONFIG_SERIAL_AMBA_PL011=y
-CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
-CONFIG_VIRTIO_CONSOLE=y
-CONFIG_HW_RANDOM=y
-CONFIG_HW_RANDOM_VIRTIO=y
-CONFIG_TCG_TPM=y
-CONFIG_TCG_TIS=y
-CONFIG_DRM=y
-CONFIG_DRM_VIRTIO_GPU=y
-CONFIG_RTC_CLASS=y
-CONFIG_RTC_DRV_PL031=y
-CONFIG_VIRTIO_PCI=y
-CONFIG_VIRTIO_MMIO=y
-CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
-CONFIG_MAILBOX=y
-CONFIG_PL320_MBOX=y
-CONFIG_ARM_SMMU_V3=y
-CONFIG_EXT4_FS=y
-CONFIG_FUSE_FS=y
-CONFIG_VIRTIO_FS=y
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
diff --git a/support/testing/tests/boot/test_edk2.py b/support/testing/tests/boot/test_edk2.py
index c1be8fad95..efc4fc9ebb 100644
--- a/support/testing/tests/boot/test_edk2.py
+++ b/support/testing/tests/boot/test_edk2.py
@@ -12,13 +12,14 @@ class TestEdk2(infra.basetest.BRTest):
         BR2_TARGET_ROOTFS_EXT2=y
         BR2_TARGET_ROOTFS_EXT2_4=y
         # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
         BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/aarch64-sbsa/assemble-flash-images support/scripts/genimage.sh"
         BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/qemu/aarch64-sbsa/genimage.cfg"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.34"
-        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-sbsa/linux.config"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
+        BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
         BR2_TARGET_EDK2=y
         BR2_TARGET_EDK2_PLATFORM_QEMU_SBSA=y
         BR2_TARGET_GRUB2=y
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
