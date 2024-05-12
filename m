Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE30C10F1A
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 07:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A0CA40BDB;
	Sun, 12 May 2024 07:09:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8rt_HegBx-rf; Sun, 12 May 2024 07:09:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59D5E40BDC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59D5E40BDC;
	Sun, 12 May 2024 07:09:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8DD131BF473
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 07:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AD3F81FDF
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 07:09:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ScGEL6OyC0k2 for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 07:09:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A370281FD9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A370281FD9
 for <buildroot@buildroot.org>; Sun, 12 May 2024 07:09:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9270987042; Sun, 12 May 2024 07:09:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 09:08:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e87474eae5c8aa3e0281714e660234f8a9daada
X-Git-Newrev: 29205bb267278591a6ff6ad54e351dec1b34d2aa
X-Patchwork-Hint: ignore
Message-Id: <20240512070930.9270987042@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_riscv64_nomu_virt: enable
 networking
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

commit: https://git.buildroot.net/buildroot/commit/?id=29205bb267278591a6ff6ad54e351dec1b34d2aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable networking for better user experience.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/qemu/riscv64-virt/linux-nommu.config | 22 ++++++++++++++++++++++
 board/qemu/riscv64-virt/readme.txt         |  2 +-
 configs/qemu_riscv64_nommu_virt_defconfig  |  7 +++----
 3 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/board/qemu/riscv64-virt/linux-nommu.config b/board/qemu/riscv64-virt/linux-nommu.config
new file mode 100644
index 0000000000..9adf494260
--- /dev/null
+++ b/board/qemu/riscv64-virt/linux-nommu.config
@@ -0,0 +1,22 @@
+CONFIG_ARCH_RV64I=y
+CONFIG_64BIT=y
+CONFIG_BLK_DEV_INITRD=y
+# CONFIG_MMU is not set
+CONFIG_SOC_VIRT=y
+CONFIG_NONPORTABLE=y
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
diff --git a/board/qemu/riscv64-virt/readme.txt b/board/qemu/riscv64-virt/readme.txt
index 9e4cfc8c55..f1c7bf41b5 100644
--- a/board/qemu/riscv64-virt/readme.txt
+++ b/board/qemu/riscv64-virt/readme.txt
@@ -2,6 +2,6 @@ Run Linux in emulation with:
 
   qemu-system-riscv64 -M virt -bios output/images/fw_jump.elf -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic # qemu_riscv64_virt_defconfig
 
-  qemu-system-riscv64 -M virt -bios none -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -nographic -cpu rv64,mmu=off # qemu_riscv64_nommu_virt_defconfig
+  qemu-system-riscv64 -M virt -bios none -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -nographic -cpu rv64,mmu=off -netdev user,id=net0 -device virtio-net-device,netdev=net0 # qemu_riscv64_nommu_virt_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
diff --git a/configs/qemu_riscv64_nommu_virt_defconfig b/configs/qemu_riscv64_nommu_virt_defconfig
index 34dd1c88ba..f6f1fa1c5b 100644
--- a/configs/qemu_riscv64_nommu_virt_defconfig
+++ b/configs/qemu_riscv64_nommu_virt_defconfig
@@ -7,6 +7,7 @@ BR2_RISCV_64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # System
+BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY=y
 
 # Filesystem
@@ -20,12 +21,10 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
-BR2_LINUX_KERNEL_DEFCONFIG="nommu_virt"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/riscv64-virt/linux-nommu.config"
 BR2_LINUX_KERNEL_IMAGE=y
 
-# Disable network scripts
-# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
-
 # host-qemu for gitlab testing
 BR2_PACKAGE_HOST_QEMU=y
 BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
