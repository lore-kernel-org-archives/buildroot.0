Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5B8C04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 07:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AFA36082A;
	Sat, 11 May 2024 07:46:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CEqcZfvtOOMS; Sat, 11 May 2024 07:46:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AA89614EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AA89614EA;
	Sat, 11 May 2024 07:46:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C1F9F1BF47E
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 07:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB2904014D
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 07:46:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1tEUTMsoz_Vj for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 07:46:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 900E2400F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 900E2400F9
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 900E2400F9
 for <buildroot@buildroot.org>; Sat, 11 May 2024 07:46:09 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 35908352828B; Sat, 11 May 2024 09:46:07 +0200 (CEST)
Date: Sat, 11 May 2024 09:46:07 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zj8iP0Dx8Q/TWeNM@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1715413567; bh=drkVsxmOrzPB7aQnrdHmnA7GbYGk+oiiLlXSam3nCgs=;
 h=Date:From:To:Subject:From;
 b=XX0h6u4l9Oh5NccaCr53SPleSXI+T8ETIFYytTbtK+Lv2t4L3HhBgLZWIEhfXiqtY
 CgJ0vKSt1qKVE6/FvmSPWUvl6Pzp76DrDtSwXVyMMP5NZVA1iDa95k04R8VqGVsmEP
 Hrj8zznwj7xmBpl2AFwtru4BEXaTLj6blFxQ2s2rP47I997Gh4IQRfh9ozimDE+H3M
 biotUBm/tHI4XRmwoczwixYoqndi/RubdDAH5Bthx36xl/1dBcgsXEk+VtNeZz87cH
 grfj6TZVk7DIE4qOK6qTxV5tQq7cHXmMSyCM8go7ngsXy5jHLfw6sy1oMat9F9fZMK
 cabBNdFCPYplg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=XX0h6u4l
Subject: [Buildroot] [PATCH] configs/qemu_riscv32_nommu_virt_defconfig: New
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
 DEVELOPERS                                 |  2 ++
 arch/Config.in.riscv                       |  3 +--
 board/qemu/riscv32-virt/linux-nommu.config | 21 +++++++++++++++
 board/qemu/riscv32-virt/readme.txt         |  2 ++
 configs/qemu_riscv32_nommu_virt_defconfig  | 30 ++++++++++++++++++++++
 package/Makefile.in                        |  4 +--
 6 files changed, 58 insertions(+), 4 deletions(-)
 create mode 100644 board/qemu/riscv32-virt/linux-nommu.config
 create mode 100644 configs/qemu_riscv32_nommu_virt_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index cb8a69a36a..3f14ce338b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3192,6 +3192,8 @@ N:	Wade Berrier <wberrier@gmail.com>
 F:	package/ngrep/
 
 N:	Waldemar Brodkorb <wbx@openadk.org>
+F:	board/qemu/riscv32-virt/
+F:	configs/qemu_riscv32_nommu_virt_defconfig
 F:	package/asterisk/
 F:	package/libjwt/
 F:	package/mksh/
diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
index d62e4ebc6c..3461f75800 100644
--- a/arch/Config.in.riscv
+++ b/arch/Config.in.riscv
@@ -51,7 +51,6 @@ choice
 
 config BR2_RISCV_32
 	bool "32-bit"
-	select BR2_USE_MMU
 
 config BR2_RISCV_64
 	bool "64-bit"
@@ -62,7 +61,7 @@ endchoice
 config BR2_RISCV_USE_MMU
 	bool "MMU support"
 	default y
-	depends on BR2_RISCV_64
+	depends on BR2_RISCV_64 || BR2_RISCV_32
 	select BR2_USE_MMU
 	help
 	  Enable this option if your RISC-V core has a MMU (Memory
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
index 0000000000..4225a1b3b9
--- /dev/null
+++ b/configs/qemu_riscv32_nommu_virt_defconfig
@@ -0,0 +1,30 @@
+# Architecture
+BR2_riscv=y
+BR2_RISCV_32=y
+# BR2_RISCV_USE_MMU is not set
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
diff --git a/package/Makefile.in b/package/Makefile.in
index 3e276d23d6..2d9908b199 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -43,7 +43,7 @@ GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
 
 # FLAT binary format needs uclinux, except RISC-V 64-bits which needs
 # the regular linux name.
-ifeq ($(BR2_BINFMT_FLAT):$(BR2_RISCV_64),y:)
+ifeq ($(BR2_BINFMT_FLAT):$(BR2_riscv),y:)
 TARGET_OS = uclinux
 else
 TARGET_OS = linux
@@ -181,7 +181,7 @@ TARGET_CXXFLAGS += -fno-dwarf2-cfi-asm
 endif
 
 ifeq ($(BR2_BINFMT_FLAT),y)
-ifeq ($(BR2_RISCV_64),y)
+ifeq ($(BR2_riscv),y)
 TARGET_CFLAGS += -fPIC
 endif
 ifeq ($(BR2_BINFMT_FLAT_ONE),y)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
