Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501B1C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA9D84FEAC;
	Fri, 28 Feb 2025 16:49:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aIwaqnR4QoS4; Fri, 28 Feb 2025 16:49:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93F384F2BD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93F384F2BD;
	Fri, 28 Feb 2025 16:49:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 094F81DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B55CF42E77
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PkYB0abdDSVy for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E15AA42666
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E15AA42666
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D5A24876C0; Fri, 28 Feb 2025 16:29:54 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 30 Dec 2024 19:03:34 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c9e46575928a332ca04a16bfd77e23b44592072a
X-Git-Newrev: f942a236e4eefad8f044bd1727a0b5c76b33e421
X-Patchwork-Hint: ignore
Message-Id: <20250228162954.D5A24876C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/qemu_riscv{32,
 64}_virt: bump OpenSBI to v1.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f942a236e4eefad8f044bd1727a0b5c76b33e421
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patchs bumps the OpenSBI of qemu_riscv{32,64}_virt to 1.6. The
qemu commands in the readmes are adjusted to use OpenSBI's fw_jump.bin
instead of fw_jump.elf, as the later causes ROM overlapping issues if
OpenSBI 1.6 is used. See:
https://github.com/riscv-software-src/opensbi/issues/372

This commit also updates the opensbi.hash file.

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
[Julien: update opensbi.hash]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/qemu/patches/opensbi/opensbi.hash | 2 +-
 board/qemu/riscv32-virt/readme.txt      | 2 +-
 board/qemu/riscv64-virt/readme.txt      | 2 +-
 configs/qemu_riscv32_virt_defconfig     | 2 +-
 configs/qemu_riscv64_virt_defconfig     | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/qemu/patches/opensbi/opensbi.hash b/board/qemu/patches/opensbi/opensbi.hash
index 1408f547b8..d7893a1dee 100644
--- a/board/qemu/patches/opensbi/opensbi.hash
+++ b/board/qemu/patches/opensbi/opensbi.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  8fcbce598a73acc2c7f7d5607d46b9d5107d3ecbede8f68f42631dcfc25ef2b2  opensbi-1.2.tar.gz
+sha256  d11702103f177a2914e94eec57ce5ed820296d874f6b6525c4482e55d71a3667  opensbi-1.6.tar.gz
diff --git a/board/qemu/riscv32-virt/readme.txt b/board/qemu/riscv32-virt/readme.txt
index b4336e9357..cda8870c96 100644
--- a/board/qemu/riscv32-virt/readme.txt
+++ b/board/qemu/riscv32-virt/readme.txt
@@ -1,6 +1,6 @@
 Run Linux in emulation with:
 
-  qemu-system-riscv32 -M virt -bios output/images/fw_jump.elf -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic # qemu_riscv32_virt_defconfig
+  qemu-system-riscv32 -M virt -bios output/images/fw_jump.bin -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic # qemu_riscv32_virt_defconfig
 
   qemu-system-riscv32 -M virt -bios none -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0,if=none -device virtio-blk-device,drive=hd0 -nographic -cpu rv32,mmu=off -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 # qemu_riscv32_nommu_virt_defconfig
 
diff --git a/board/qemu/riscv64-virt/readme.txt b/board/qemu/riscv64-virt/readme.txt
index f9e920a88b..fc6bfffb5d 100644
--- a/board/qemu/riscv64-virt/readme.txt
+++ b/board/qemu/riscv64-virt/readme.txt
@@ -1,6 +1,6 @@
 Run Linux in emulation with:
 
-  qemu-system-riscv64 -M virt -bios output/images/fw_jump.elf -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic # qemu_riscv64_virt_defconfig
+  qemu-system-riscv64 -M virt -bios output/images/fw_jump.bin -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic # qemu_riscv64_virt_defconfig
 
   qemu-system-riscv64 -M virt -bios none -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0,if=none -device virtio-blk-device,drive=hd0 -nographic -cpu rv64,mmu=off -netdev user,id=net0 -device virtio-net-device,netdev=net0 # qemu_riscv64_nommu_virt_defconfig
 
diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
index 6064dd66c3..83ea0e91d9 100644
--- a/configs/qemu_riscv32_virt_defconfig
+++ b/configs/qemu_riscv32_virt_defconfig
@@ -13,7 +13,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="rv32"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
+BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.6"
 BR2_TARGET_OPENSBI_PLAT="generic"
 BR2_PACKAGE_HOST_QEMU=y
 BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
index 575e367af8..d9f715198a 100644
--- a/configs/qemu_riscv64_virt_defconfig
+++ b/configs/qemu_riscv64_virt_defconfig
@@ -12,7 +12,7 @@ BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
+BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.6"
 BR2_TARGET_OPENSBI_PLAT="generic"
 BR2_PACKAGE_HOST_QEMU=y
 BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
