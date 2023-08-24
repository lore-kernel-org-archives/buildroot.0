Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DA1C6FA8F
	for <buildroot@archiver.kernel.org>; Thu, 24 Aug 2023 21:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB7C841908;
	Thu, 24 Aug 2023 21:29:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB7C841908
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qbUBK8WJpWmx; Thu, 24 Aug 2023 21:29:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B12F41BEB;
	Thu, 24 Aug 2023 21:29:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B12F41BEB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8221E1BF84C
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 21:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BEB5833CD
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 21:29:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BEB5833CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 60S7IWlezyeJ for <buildroot@lists.busybox.net>;
 Thu, 24 Aug 2023 21:29:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 345DC8321B
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 21:29:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 345DC8321B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1FBBF86290; Thu, 24 Aug 2023 21:29:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Aug 2023 23:28:44 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 93c7b55c778e3dd4d84945918e5d97d5f56256c5
X-Git-Newrev: bdb15addcbf862182f82f70c2ff76124ba3538de
X-Patchwork-Hint: ignore
Message-Id: <20230824212904.1FBBF86290@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/qemu_{arm,
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
Content-Type: multipart/mixed; boundary="===============7842143159578031047=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7842143159578031047==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=bdb15addcbf862182f82f70c2ff76124ba3538de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump qemu_arm_ebbr_defconfig and qemu_aarch64_ebbr_defconfig in sync:

- Bump Linux to v6.4.3
- Bump U-Boot to 2023.07.02
- Bump TF-A to v2.9

While at it, tune the documentation:

- Increase the amount of memory in the example commands to help run the
  largest OS distributions.
- Update the link to the IR Guide to point at the latest version.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/qemu/aarch64-ebbr/readme.txt  | 6 +++---
 board/qemu/arm-ebbr/readme.txt      | 2 +-
 configs/qemu_aarch64_ebbr_defconfig | 8 ++++----
 configs/qemu_arm_ebbr_defconfig     | 8 ++++----
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/board/qemu/aarch64-ebbr/readme.txt b/board/qemu/aarch64-ebbr/readme.txt
index a2027dad44..76d566045d 100644
--- a/board/qemu/aarch64-ebbr/readme.txt
+++ b/board/qemu/aarch64-ebbr/readme.txt
@@ -33,7 +33,7 @@ Run the emulation with:
       -device virtio-net-device,netdev=eth0 \
       -device virtio-rng-device,rng=rng0 \
       -drive file=output/images/disk.img,if=none,format=raw,id=hd0 \
-      -m 1024 \
+      -m 2048 \
       -netdev user,id=eth0 \
       -no-acpi \
       -nographic \
@@ -72,7 +72,7 @@ Then run the OS installer iso image on emulation with:
       -device virtio-rng-device,rng=rng0 \
       -drive file=<iso>,if=none,format=raw,readonly=on,id=hd0 \
       -drive file=disk.qcow2,if=none,id=hd1 \
-      -m 1024 \
+      -m 2048 \
       -netdev user,id=eth0 \
       -no-acpi \
       -nographic \
@@ -100,4 +100,4 @@ Firmware update is currently not supported.
 [1]: https://github.com/ARM-software/ebbr
 [2]: https://developer.arm.com/Architectures/Arm%20SystemReady%20IR
 [3]: https://github.com/ARM-software/arm-systemready/tree/main/IR/prebuilt_images
-[4]: https://developer.arm.com/documentation/DUI1101/1-1/?lang=en
+[4]: https://developer.arm.com/documentation/DUI1101/latest/
diff --git a/board/qemu/arm-ebbr/readme.txt b/board/qemu/arm-ebbr/readme.txt
index 085e723fe6..dc2b0647a2 100644
--- a/board/qemu/arm-ebbr/readme.txt
+++ b/board/qemu/arm-ebbr/readme.txt
@@ -68,4 +68,4 @@ Firmware update is currently not supported.
 [1]: https://github.com/ARM-software/ebbr
 [2]: https://developer.arm.com/Architectures/Arm%20SystemReady%20IR
 [3]: https://github.com/ARM-software/arm-systemready/tree/main/IR/prebuilt_images
-[4]: https://developer.arm.com/documentation/DUI1101/1-1/?lang=en
+[4]: https://developer.arm.com/documentation/DUI1101/latest/
diff --git a/configs/qemu_aarch64_ebbr_defconfig b/configs/qemu_aarch64_ebbr_defconfig
index c858572bbf..7807814aff 100644
--- a/configs/qemu_aarch64_ebbr_defconfig
+++ b/configs/qemu_aarch64_ebbr_defconfig
@@ -6,12 +6,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/aarch64-ebbr/p
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/aarch64-ebbr/genimage.cfg"
 
 # Linux headers
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.4.3"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
@@ -27,7 +27,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
 # Firmware and bootloader
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.7"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
@@ -39,7 +39,7 @@ BR2_TARGET_OPTEE_OS_PLATFORM="vexpress-qemu_armv8a"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.07.02"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="qemu_arm64"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/qemu/aarch64-ebbr/u-boot.fragment"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
diff --git a/configs/qemu_arm_ebbr_defconfig b/configs/qemu_arm_ebbr_defconfig
index d6a92a1d68..cfeea623ff 100644
--- a/configs/qemu_arm_ebbr_defconfig
+++ b/configs/qemu_arm_ebbr_defconfig
@@ -7,12 +7,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/arm-ebbr/post-
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/arm-ebbr/genimage.cfg"
 
 # Linux headers
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.4.3"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-ebbr/linux.fragment"
 
@@ -28,7 +28,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
 # Firmware and bootloader
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.7"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
@@ -42,7 +42,7 @@ BR2_TARGET_OPTEE_OS_PLATFORM="vexpress-qemu_virt"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.07.02"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="qemu_arm"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/qemu/arm-ebbr/u-boot.fragment"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y

--===============7842143159578031047==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7842143159578031047==--
