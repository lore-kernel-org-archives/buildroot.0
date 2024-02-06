Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27137C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA4E440237;
	Tue,  6 Feb 2024 10:40:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA4E440237
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fWn-8xUSmzQa; Tue,  6 Feb 2024 10:40:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F075E41F26;
	Tue,  6 Feb 2024 10:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F075E41F26
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 571361BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CB5A40176
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CB5A40176
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T9YzYt_oHB6n for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:40:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D165E400FE
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:40:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D165E400FE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC4C486FA5; Tue,  6 Feb 2024 10:40:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 11:39:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd181c4de18d7049fa99ba977288dfe19474e121
X-Git-Newrev: 73813c56c8bb3e781376f333125a13048be690b9
X-Patchwork-Hint: ignore
Message-Id: <20240206104004.BC4C486FA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_{arm,
 aarch64}_ebbr: bump Linux, U-Boot and TF-A
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
Content-Type: multipart/mixed; boundary="===============8499058000518598904=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8499058000518598904==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=73813c56c8bb3e781376f333125a13048be690b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump qemu_arm_ebbr_defconfig and qemu_aarch64_ebbr_defconfig in sync:

- Bump Linux to v6.6.11
- Bump U-Boot to 2024.01
- Bump TF-A to v2.10

While at it, adapt Qemu command line arguments to avoid a warning when
disabling ACPI.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/qemu/aarch64-ebbr/readme.txt  | 6 ++----
 board/qemu/arm-ebbr/readme.txt      | 3 +--
 configs/qemu_aarch64_ebbr_defconfig | 8 ++++----
 configs/qemu_arm_ebbr_defconfig     | 8 ++++----
 4 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/board/qemu/aarch64-ebbr/readme.txt b/board/qemu/aarch64-ebbr/readme.txt
index 76d566045d..15353a8f68 100644
--- a/board/qemu/aarch64-ebbr/readme.txt
+++ b/board/qemu/aarch64-ebbr/readme.txt
@@ -26,7 +26,7 @@ Running under Qemu
 Run the emulation with:
 
   qemu-system-aarch64 \
-      -M virt,secure=on \
+      -M virt,secure=on,acpi=off \
       -bios output/images/flash.bin \
       -cpu cortex-a53 \
       -device virtio-blk-device,drive=hd0 \
@@ -35,7 +35,6 @@ Run the emulation with:
       -drive file=output/images/disk.img,if=none,format=raw,id=hd0 \
       -m 2048 \
       -netdev user,id=eth0 \
-      -no-acpi \
       -nographic \
       -object rng-random,filename=/dev/urandom,id=rng0 \
       -rtc base=utc,clock=host \
@@ -63,7 +62,7 @@ image first with:
 Then run the OS installer iso image on emulation with:
 
   qemu-system-aarch64 \
-      -M virt,secure=on \
+      -M virt,secure=on,acpi=off \
       -bios output/images/flash.bin \
       -cpu cortex-a53 \
       -device virtio-blk-device,drive=hd1 \
@@ -74,7 +73,6 @@ Then run the OS installer iso image on emulation with:
       -drive file=disk.qcow2,if=none,id=hd1 \
       -m 2048 \
       -netdev user,id=eth0 \
-      -no-acpi \
       -nographic \
       -object rng-random,filename=/dev/urandom,id=rng0 \
       -rtc base=utc,clock=host \
diff --git a/board/qemu/arm-ebbr/readme.txt b/board/qemu/arm-ebbr/readme.txt
index dc2b0647a2..19e114579f 100644
--- a/board/qemu/arm-ebbr/readme.txt
+++ b/board/qemu/arm-ebbr/readme.txt
@@ -26,7 +26,7 @@ Running under Qemu
 Run the emulation with:
 
   qemu-system-arm \
-      -M virt,secure=on \
+      -M virt,secure=on,acpi=off \
       -bios output/images/flash.bin \
       -cpu cortex-a15 \
       -device virtio-blk-device,drive=hd0 \
@@ -35,7 +35,6 @@ Run the emulation with:
       -drive file=output/images/disk.img,if=none,format=raw,id=hd0 \
       -m 1024 \
       -netdev user,id=eth0 \
-      -no-acpi \
       -nographic \
       -object rng-random,filename=/dev/urandom,id=rng0 \
       -rtc base=utc,clock=host \
diff --git a/configs/qemu_aarch64_ebbr_defconfig b/configs/qemu_aarch64_ebbr_defconfig
index 7807814aff..75a892f798 100644
--- a/configs/qemu_aarch64_ebbr_defconfig
+++ b/configs/qemu_aarch64_ebbr_defconfig
@@ -6,12 +6,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/aarch64-ebbr/p
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/aarch64-ebbr/genimage.cfg"
 
 # Linux headers
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.4.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.11"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
@@ -27,7 +27,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
 # Firmware and bootloader
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.10"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
@@ -39,7 +39,7 @@ BR2_TARGET_OPTEE_OS_PLATFORM="vexpress-qemu_armv8a"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.07.02"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="qemu_arm64"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/qemu/aarch64-ebbr/u-boot.fragment"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
diff --git a/configs/qemu_arm_ebbr_defconfig b/configs/qemu_arm_ebbr_defconfig
index cfeea623ff..a0520edcf4 100644
--- a/configs/qemu_arm_ebbr_defconfig
+++ b/configs/qemu_arm_ebbr_defconfig
@@ -7,12 +7,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/arm-ebbr/post-
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/arm-ebbr/genimage.cfg"
 
 # Linux headers
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.4.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.11"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-ebbr/linux.fragment"
 
@@ -28,7 +28,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
 # Firmware and bootloader
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.10"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
@@ -42,7 +42,7 @@ BR2_TARGET_OPTEE_OS_PLATFORM="vexpress-qemu_virt"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.07.02"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="qemu_arm"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/qemu/arm-ebbr/u-boot.fragment"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y

--===============8499058000518598904==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8499058000518598904==--
