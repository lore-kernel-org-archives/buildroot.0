Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6E7C6FA9D
	for <buildroot@archiver.kernel.org>; Wed,  1 Mar 2023 16:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9A47819F3;
	Wed,  1 Mar 2023 16:06:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9A47819F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YunfLViDVffW; Wed,  1 Mar 2023 16:06:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2E2981FB1;
	Wed,  1 Mar 2023 16:06:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2E2981FB1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D8131BF599
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 16:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2726661051
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 16:05:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2726661051
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EQ0BR7UWzaIV for <buildroot@lists.busybox.net>;
 Wed,  1 Mar 2023 16:05:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D41C61033
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D41C61033
 for <buildroot@buildroot.org>; Wed,  1 Mar 2023 16:05:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.98,225,1673884800"; d="scan'208";a="336518261"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 01 Mar 2023 23:58:21 +0800
IronPort-SDR: 5XCniPYqFHo3Z4uYaBMxp1Z9ZttYEWH4IZOazljgzdxf2qCMeJRVr3rrun73RefMSgF9yNPZqH
 1qAkutEnhTchjQRXWooWpn/tJHAEBlW5jalCsvApqxA/dLCTIMTRSUret+enROLnbsg244SiK1
 XqfapXmavzppfpRZPl4Pn3XUAET/E9bL8fI+fUMBDBGKfenduh7I+9I/LdRChZZsWHh+EwjmFq
 3F1n6Y8NxNZdemVhJ5hRaF6y9hrlBjkXQm7G+ZR7CdNYeU3ewrBG52VJudDkog/UIeClbYzRuY
 4Ug=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Mar 2023 07:09:26 -0800
IronPort-SDR: lb1OYDINoD1yHZI5vZYc3KjUqGEFxGOX9ezZMOX2R90xUtFfd8toGvGCHvyYTL0rvTNaFoPxap
 D6ixecUFPXNeWCcSBl5X3m5u6HcZHKUTdvX5YCJtVe4V1Bb8ujq+jR476ba+HsgAyXVLoWyOI5
 xPHtCpmJ9vBckL4JepVSiXsF3pfLhWp2ejjD8vHrQevh1L4vlnfW17G5Z82qzNkHkH6uoZl/dS
 LXtyUJn0DMDL2sWwcGEnoIwUSTowwSRF27SYJsCR0UaBjzx5b1HoUVoQ+Aoln3qKRjDcEme6/J
 be8=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.lan) ([10.225.164.27])
 by uls-op-cesaip01.wdc.com with ESMTP; 01 Mar 2023 07:58:20 -0800
To: buildroot@buildroot.org
Date: Wed,  1 Mar 2023 16:58:10 +0100
Message-Id: <20230301155810.3222459-4-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301155810.3222459-1-niklas.cassel@wdc.com>
References: <20230301155810.3222459-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1677686727; x=1709222727;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3+Z92Lw96GgYI0GbofmMOvSPsuUG6uAkIhjPcDIhR9A=;
 b=Sa/0cDvWSsuEPWHL0UIfR7QfGRkfNM6SvZH0l2BSc9ZYty3fDuttXDZM
 /+3OJ95LI//qnr7yjRCPukjdelZlbhDHOH5uAVkn18h5SZJdBgvITx1UB
 Zhw8Zv0j0SPcBGB5BoAc+in5ViW/Oy4p4fSF39QYvjZrFyfj8f5nLtUXM
 7rkjZCDaav7QqQw3oypnUFNmKji/Hl7265aMgQrRLIsV19p411TM1DBHV
 0UTKbTkhcsMtLyUpCMQ2uGszjPyB7tvS8sdhmwbEiqiPqMs6b3OWlSxoh
 /9B2/Gt+Z4i9UbsBFPbSYn6c2P4zoPOqL2AVtrmYT6nihQakB3FEhrA49
 A==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=Sa/0cDvW
Subject: [Buildroot] [PATCH 3/3] board/qemu/aarch64-sbsa: drop unused kernel
 config file
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

The config file board/qemu/aarch64-sbsa/linux.config has
never been in use by configs/qemu_aarch64_sbsa_defconfig,
neither via BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE, nor via
BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES.

Thus the config file is and has always been unused.
Remove it such that no one might get the silly idea that
it is actually used for something.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 board/qemu/aarch64-sbsa/linux.config | 68 ----------------------------
 1 file changed, 68 deletions(-)
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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
