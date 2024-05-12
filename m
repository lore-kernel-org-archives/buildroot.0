Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F02F6C10F1A
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 10:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1B2840C94;
	Sun, 12 May 2024 10:21:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KEyyE7_-tW1V; Sun, 12 May 2024 10:21:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EA8D4117A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EA8D4117A;
	Sun, 12 May 2024 10:21:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C24521BF290
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE0AF420DF
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:20:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O630RB6x9_kO for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 10:20:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73EE34210A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73EE34210A
 for <buildroot@buildroot.org>; Sun, 12 May 2024 10:20:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C5CBC8709A; Sun, 12 May 2024 10:20:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 12:20:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e32d404f6c4fb5fce2a65996efac53281f97ce5c
X-Git-Newrev: 7b6384bfd43a5cd5af959e65424704a4b92ceff1
X-Patchwork-Hint: ignore
Message-Id: <20240512102052.C5CBC8709A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_riscv32_nommu_virt: new
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7b6384bfd43a5cd5af959e65424704a4b92ceff1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new defconfig for Qemu RISCV32 w/o MMU.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  2 ++
 board/qemu/riscv32-virt/linux-nommu.config         | 21 +++++++++++++
 .../patches/linux-headers/linux-headers.hash       |  2 ++
 board/qemu/riscv32-virt/patches/linux/linux.hash   |  2 ++
 board/qemu/riscv32-virt/readme.txt                 |  2 ++
 configs/qemu_riscv32_nommu_virt_defconfig          | 34 ++++++++++++++++++++++
 6 files changed, 63 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5a52550c27..d653648718 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3201,6 +3201,8 @@ N:	Wade Berrier <wberrier@gmail.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
