Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391ECC433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 19:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE4BA409F7;
	Tue,  7 Jun 2022 19:18:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gCRFM1WOZfBM; Tue,  7 Jun 2022 19:18:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 907F9410C9;
	Tue,  7 Jun 2022 19:18:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2099E1BF9B5
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 793EF60E68
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:16:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 40CU0wAAq3LD for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 19:16:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2DD060EE0
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 19:16:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B6C6E869E1; Tue,  7 Jun 2022 19:04:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 21:15:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cecb262571a1754c0e88b7b6e6acece13db9c5d6
X-Git-Newrev: 1b298db82fa7b108053f08110d50f4650fcc74ac
X-Patchwork-Hint: ignore
Message-Id: <20220607190455.B6C6E869E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_riscv64_nommu_virt_defconfig:
 new defconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b298db82fa7b108053f08110d50f4650fcc74ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add RISC-V 64-bit nommu defconfig for QEMU virt machine with MMU
disabled.

Unlike qemu_riscv64_virt, qemu_riscv64_nommu_virt does not use OpenSBI,
since the kernel is running in machine mode (M-mode).

After the build is complete, you can start QEMU using the launcher
script:
$ output/images/start-qemu.sh

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                |  3 +++
 board/qemu/riscv64-virt/readme.txt        |  2 ++
 configs/qemu_riscv64_nommu_virt_defconfig | 37 +++++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c33959fa45..435fa28478 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2153,6 +2153,9 @@ N:	Nicolas Serafini <nicolas.serafini@ik.me>
 F:	package/exiv2/
 F:	package/ofono/
 
+N:	Niklas Cassel <niklas.cassel@wdc.com>
+F:	configs/qemu_riscv64_nommu_virt_defconfig
+
 N:	Nikolay Dimitrov <nikolay.dimitrov@retrohub.org>
 F:	board/embest/riotboard/
 F:	configs/riotboard_defconfig
diff --git a/board/qemu/riscv64-virt/readme.txt b/board/qemu/riscv64-virt/readme.txt
index 747a9ea674..9e4cfc8c55 100644
--- a/board/qemu/riscv64-virt/readme.txt
+++ b/board/qemu/riscv64-virt/readme.txt
@@ -2,4 +2,6 @@ Run Linux in emulation with:
 
   qemu-system-riscv64 -M virt -bios output/images/fw_jump.elf -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic # qemu_riscv64_virt_defconfig
 
+  qemu-system-riscv64 -M virt -bios none -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -nographic -cpu rv64,mmu=off # qemu_riscv64_nommu_virt_defconfig
+
 The login prompt will appear in the terminal that started Qemu.
diff --git a/configs/qemu_riscv64_nommu_virt_defconfig b/configs/qemu_riscv64_nommu_virt_defconfig
new file mode 100644
index 0000000000..bfee9e710a
--- /dev/null
+++ b/configs/qemu_riscv64_nommu_virt_defconfig
@@ -0,0 +1,37 @@
+# Architecture
+BR2_riscv=y
+BR2_RISCV_64=y
+
+# Patches
+BR2_GLOBAL_PATCH_DIR="board/riscv/nommu/patches"
+
+# Toolchain
+BR2_PACKAGE_HOST_ELF2FLT=y
+# BR2_USE_MMU is not set
+
+# Busybox with hush
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
+
+# System
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
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.18"
+BR2_LINUX_KERNEL_DEFCONFIG="nommu_virt"
+BR2_LINUX_KERNEL_IMAGE=y
+
+# Disable network scripts
+# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
+
+# host-qemu for gitlab testing
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
