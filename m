Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6841FC3DA6E
	for <buildroot@archiver.kernel.org>; Sun, 31 Dec 2023 17:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20117404A0;
	Sun, 31 Dec 2023 17:36:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20117404A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x3tz7JBN9EEE; Sun, 31 Dec 2023 17:36:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F302540538;
	Sun, 31 Dec 2023 17:36:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F302540538
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8FFA41BF3EB
 for <buildroot@lists.busybox.net>; Sun, 31 Dec 2023 17:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 764D26073E
 for <buildroot@lists.busybox.net>; Sun, 31 Dec 2023 17:35:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 764D26073E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tquqSt3aO3W3 for <buildroot@lists.busybox.net>;
 Sun, 31 Dec 2023 17:35:20 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F99B606F5
 for <buildroot@buildroot.org>; Sun, 31 Dec 2023 17:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F99B606F5
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 0DAB2352101C; Sun, 31 Dec 2023 18:26:23 +0100 (CET)
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Date: Sun, 31 Dec 2023 18:25:36 +0100
Message-Id: <20231231172538.1279608-5-wbx@openadk.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231231172538.1279608-1-wbx@openadk.org>
References: <20231231172538.1279608-1-wbx@openadk.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1704043583; bh=uvVacXMYiEn4vP0EG3ugL1Ck+Jetr4RgemA4Sv5dFko=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mLiXIDqrqp6jGKvqgEUZYeA5r5fiy+rHvW8a0gBKduh5mnPVwPdQtnoq+cvf441Zs
 +Q7NW2PqU1IPORbLmVUdsP2HfzqcBtulLDVMTCmFH+E+LyskBTBANloFMpIsj9mnbf
 Sor+DuMvFW9UWJ9zNXNWTgfIs40FqMlRenNYH61QBDpPvXKwx0+7lj07gk6T7mmWox
 95y6aDE+1AHhhi6uOVHTDU3zy02Qx5wddxlLSIIiZikDNelHWpgd/itqoeEOZHsTxg
 aYhgNdYLiiRWKLwFEGDGPNU4ouufn0s5p9U7TBk3eRpH9LxIev9AqSwM4aq9upVbvn
 BzC5TVBzFhvPw==
Subject: [Buildroot] [PATCH 4/6] configs/qemu: add qemu_arc_defconfig
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
Cc: Romain Naour <romain.naour@gmail.com>,
 ARC Maintainers <arc-buildroot@synopsys.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 board/qemu/arc/linux.config | 32 ++++++++++++++++++++++++++++++++
 board/qemu/arc/readme.txt   |  8 ++++++++
 configs/qemu_arc_defconfig  | 30 ++++++++++++++++++++++++++++++
 3 files changed, 70 insertions(+)
 create mode 100644 board/qemu/arc/linux.config
 create mode 100644 board/qemu/arc/readme.txt
 create mode 100644 configs/qemu_arc_defconfig

diff --git a/board/qemu/arc/linux.config b/board/qemu/arc/linux.config
new file mode 100644
index 0000000000..40c7b950e8
--- /dev/null
+++ b/board/qemu/arc/linux.config
@@ -0,0 +1,32 @@
+CONFIG_ARC=y
+CONFIG_ISA_ARCV2=y
+CONFIG_ARC_CPU_HS=y
+CONFIG_MMU=y
+CONFIG_ARC_HAS_ACCL_REGS=y
+CONFIG_ARC_MMU_V4=y
+CONFIG_ARC_PAGE_SIZE_8K=y
+CONFIG_COMPAT_32BIT_TIME=y
+CONFIG_VIRTIO=y
+CONFIG_VIRTIO_NET=y
+CONFIG_VIRTIO_CONSOLE=y
+CONFIG_VIRTIO_MENU=y
+CONFIG_VIRTIO_MMIO=y
+CONFIG_ARC_BUILTIN_DTB_NAME="haps_hs"
+CONFIG_NETDEVICES=y
+CONFIG_NET_CORE=y
+CONFIG_ETHERNET=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_SERIAL_EARLYCON=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_NR_UARTS=4
+CONFIG_SERIAL_8250_RUNTIME_UARTS=4
+CONFIG_SERIAL_8250_DWLIB=y
+CONFIG_SERIAL_8250_DW=y
+CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_SERIAL_CORE=y
+CONFIG_SERIAL_CORE_CONSOLE=y
+CONFIG_TMPFS=y
diff --git a/board/qemu/arc/readme.txt b/board/qemu/arc/readme.txt
new file mode 100644
index 0000000000..93bb9c2152
--- /dev/null
+++ b/board/qemu/arc/readme.txt
@@ -0,0 +1,8 @@
+You need Qemu fork from here:
+https://github.com/foss-for-synopsys-dwc-arc-processors/qemu
+
+Run the emulation with:
+
+ qemu-system-arc -monitor none -serial stdio -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 -cpu archs -kernel output/images/vmlinux -nographic # qemu_arc_defconfig
+
+The login prompt will appear in the terminal that started Qemu.
diff --git a/configs/qemu_arc_defconfig b/configs/qemu_arc_defconfig
new file mode 100644
index 0000000000..d65e28a3d0
--- /dev/null
+++ b/configs/qemu_arc_defconfig
@@ -0,0 +1,30 @@
+# Architecture
+BR2_arc=y
+BR2_arcle=y
+BR2_archs38=y
+
+# System
+BR2_SYSTEM_DHCP="eth0"
+
+# Filesystem
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ROOTFS_INITRAMFS=y
+
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arc/linux.config"
+BR2_LINUX_KERNEL_VMLINUX=y
+
+# host-qemu for gitlab testing
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
