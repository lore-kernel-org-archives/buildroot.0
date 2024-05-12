Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC76C10F1A
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 10:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9635F4213C;
	Sun, 12 May 2024 10:07:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PImQKZrxFdth; Sun, 12 May 2024 10:07:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54C624213D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54C624213D;
	Sun, 12 May 2024 10:07:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5E3A71BF27A
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5711F4213D
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GfTmEJjnzqYw for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 10:07:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7BC474213C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BC474213C
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7BC474213C
 for <buildroot@buildroot.org>; Sun, 12 May 2024 10:07:17 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 5C2EA35282A0; Sun, 12 May 2024 12:07:15 +0200 (CEST)
Date: Sun, 12 May 2024 12:07:15 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZkCU03+ru07pxr5d@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1715508435; bh=D6wYdc48qQbF7G6tQu32Pvxvj/2SPQze7E8qQrb/+2g=;
 h=Date:From:To:Subject:From;
 b=ulBqS21NamQBcH8P/3xKrIZk21Ww7wnKpp9SwrhIS6mL1dFrA789kZ3kF2Wuajq0I
 zH9wC/Di3pRL8qQHQ75HcuNbVV2BMnDjh3+mJw+/lSx1HjkKsDqdoPiQYA3u7UqWyy
 G+SKmSswh/tx0vzaFHQInxsvXpos7yR+jjL7NFvx7zIIKDcBKIQTK9FXJf4DdIbcnM
 14RjI4ALex1rIVSL/w0/LIPhnuCtQAmXBTfj5uyYZ4GiW7UOFAJcLh26BOuI6rsC1l
 Ni0Z4WKkQ8UwXZ5acn6+Wn6ZIJS6WNEdbJNmcKEfVFsb859CwMiaVvWKx0nSE/QyUC
 ZAL97c2ElrKBw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=ulBqS21N
Subject: [Buildroot] [PATCH 2/2] configs/qemu_riscv32_nommu_virt: new
 defconfig
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new defconfig for Qemu RISCV32 w/o MMU.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 DEVELOPERS                                    |  2 ++
 board/qemu/riscv32-virt/linux-nommu.config    | 21 ++++++++++++
 .../patches/linux-headers/linux-headers.hash  |  2 ++
 .../riscv32-virt/patches/linux/linux.hash     |  2 ++
 board/qemu/riscv32-virt/readme.txt            |  2 ++
 configs/qemu_riscv32_nommu_virt_defconfig     | 34 +++++++++++++++++++
 6 files changed, 63 insertions(+)
 create mode 100644 board/qemu/riscv32-virt/linux-nommu.config
 create mode 100644 board/qemu/riscv32-virt/patches/linux-headers/linux-headers.hash
 create mode 100644 board/qemu/riscv32-virt/patches/linux/linux.hash
 create mode 100644 configs/qemu_riscv32_nommu_virt_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 67ce43e9cc..2991c51455 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3198,6 +3198,8 @@ N:	Wade Berrier <wberrier@gmail.com>
 F:	package/ngrep/
 
 N:	Waldemar Brodkorb <wbx@openadk.org>
+F:	board/qemu/riscv32-virt/
+F:	configs/qemu_riscv32_nommu_virt_defconfig
 F:	package/asterisk/
 F:	package/libjwt/
 F:	package/mksh/
diff --git a/board/qemu/riscv32-virt/linux-nommu.config b/board/qemu/riscv32-virt/linux-nommu.config
new file mode 100644
index 0000000000..784b12f18a
--- /dev/null
+++ b/board/qemu/riscv32-virt/linux-nommu.config
@@ -0,0 +1,21 @@
+CONFIG_BLK_DEV_INITRD=y
+# CONFIG_MMU is not set
+CONFIG_SOC_VIRT=y
+CONFIG_NONPORTABLE=y
+CONFIG_ARCH_RV32I=y
+CONFIG_BINFMT_FLAT=y
+CONFIG_SLOB=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_NETDEVICES=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_VIRTIO_MMIO=y
+CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
+CONFIG_VIRTIO_NET=y
+CONFIG_EXT2_FS=y
+CONFIG_PRINTK_TIME=y
diff --git a/board/qemu/riscv32-virt/patches/linux-headers/linux-headers.hash b/board/qemu/riscv32-virt/patches/linux-headers/linux-headers.hash
new file mode 100644
index 0000000000..a6c777192c
--- /dev/null
+++ b/board/qemu/riscv32-virt/patches/linux-headers/linux-headers.hash
@@ -0,0 +1,2 @@
+# From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  4e43d8c5fba14f7c82597838011648056487b7550fd83276ad534559e8499b1d  linux-6.6.18.tar.xz
diff --git a/board/qemu/riscv32-virt/patches/linux/linux.hash b/board/qemu/riscv32-virt/patches/linux/linux.hash
new file mode 100644
index 0000000000..a6c777192c
--- /dev/null
+++ b/board/qemu/riscv32-virt/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  4e43d8c5fba14f7c82597838011648056487b7550fd83276ad534559e8499b1d  linux-6.6.18.tar.xz
diff --git a/board/qemu/riscv32-virt/readme.txt b/board/qemu/riscv32-virt/readme.txt
index 32b4333512..555924f949 100644
--- a/board/qemu/riscv32-virt/readme.txt
+++ b/board/qemu/riscv32-virt/readme.txt
@@ -2,4 +2,6 @@ Run Linux in emulation with:
 
   qemu-system-riscv32 -M virt -bios output/images/fw_jump.elf -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic # qemu_riscv32_virt_defconfig
 
+  qemu-system-riscv32 -M virt -bios none -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -nographic -cpu rv32,mmu=off -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 # qemu_riscv32_nommu_virt_defconfig
+
 The login prompt will appear in the terminal that started Qemu.
diff --git a/configs/qemu_riscv32_nommu_virt_defconfig b/configs/qemu_riscv32_nommu_virt_defconfig
new file mode 100644
index 0000000000..3634260899
--- /dev/null
+++ b/configs/qemu_riscv32_nommu_virt_defconfig
@@ -0,0 +1,34 @@
+# Architecture
+BR2_riscv=y
+BR2_RISCV_32=y
+# BR2_RISCV_USE_MMU is not set
+
+# Hashes
+BR2_GLOBAL_PATCH_DIR="board/qemu/riscv32-virt/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+
+# System
+BR2_SYSTEM_DHCP="eth0"
+BR2_TARGET_GENERIC_GETTY=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/riscv32-virt/linux-nommu.config"
+BR2_LINUX_KERNEL_IMAGE=y
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
