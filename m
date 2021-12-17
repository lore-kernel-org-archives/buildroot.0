Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C12C433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 21:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41BCB40C3F;
	Fri, 17 Dec 2021 21:58:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pMx9DMW1YRb6; Fri, 17 Dec 2021 21:58:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10A4A40C26;
	Fri, 17 Dec 2021 21:58:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 703B31C1162
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DB8E6116E
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:58:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FPr75mpOoWpK for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 21:58:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EE476116A
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 21:58:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4EE90811FF; Fri, 17 Dec 2021 21:53:08 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 22:58:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 82c1a437929acaeeb7f0cc198d5e5fa4b7862d5b
X-Git-Newrev: b235a2cffc183296eba034f6b800e683c80ff11d
X-Patchwork-Hint: ignore
Message-Id: <20211217215308.4EE90811FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/afboot-stm32: upgrade version
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b235a2cffc183296eba034f6b800e683c80ff11d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Newer versions of the kernel generate device trees that are not
storable in a single 16kB sector. In these cases the kernel load address
must be changed.
The commit 2e499dcff3ef ("Add possibility to use custom kernel load address")
adds the possibility to override the default (0x08008000) kernel load
address.

This also required changes to the stm32f429_disco_defconfig and
stm32f469_disco_xip_defconfig configurations. Patching is no longer
needed.

Also update whitespaces in hash file (2 spaces).

Signed-off-by: Dario Binacchi <dariobin@libero.it>
Acked-by: Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...m32f469i-disco-change-kernel-load-address.patch | 26 ----------------------
 boot/afboot-stm32/Config.in                        | 20 +++++++++++++++++
 boot/afboot-stm32/afboot-stm32.hash                |  2 +-
 boot/afboot-stm32/afboot-stm32.mk                  |  8 ++++---
 configs/stm32f429_disco_defconfig                  |  1 +
 configs/stm32f469_disco_xip_defconfig              |  2 +-
 6 files changed, 28 insertions(+), 31 deletions(-)

diff --git a/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0001-stm32f469i-disco-change-kernel-load-address.patch b/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0001-stm32f469i-disco-change-kernel-load-address.patch
deleted file mode 100644
index 1f8d929bfb..0000000000
--- a/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0001-stm32f469i-disco-change-kernel-load-address.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From d87969f72671cab5a88ba6e2418e43d0fa267d6f Mon Sep 17 00:00:00 2001
-From: Dario Binacchi <dariobin@libero.it>
-Date: Sat, 13 Nov 2021 15:46:32 +0100
-Subject: [PATCH] stm32f469i-disco: change kernel load address
-
-Signed-off-by: Dario Binacchi <dariobin@libero.it>
----
- stm32f469i-disco.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/stm32f469i-disco.c b/stm32f469i-disco.c
-index 2da1f4b..3aacb12 100644
---- a/stm32f469i-disco.c
-+++ b/stm32f469i-disco.c
-@@ -85,7 +85,7 @@ static void fmc_wait_busy(void)
- 
- void start_kernel(void)
- {
--	void (*kernel)(uint32_t reserved, uint32_t mach, uint32_t dt) = (void (*)(uint32_t, uint32_t, uint32_t))(0x08008000 | 1);
-+	void (*kernel)(uint32_t reserved, uint32_t mach, uint32_t dt) = (void (*)(uint32_t, uint32_t, uint32_t))(0x0800C000 | 1);
- 
- 	kernel(0, ~0UL, 0x08004000);
- }
--- 
-2.17.1
-
diff --git a/boot/afboot-stm32/Config.in b/boot/afboot-stm32/Config.in
index 309b9e0491..23372705ad 100644
--- a/boot/afboot-stm32/Config.in
+++ b/boot/afboot-stm32/Config.in
@@ -5,3 +5,23 @@ config BR2_TARGET_AFBOOT_STM32
 	  afboot-stm32 is a very small bootloader for STM32 platforms
 
 	  https://github.com/mcoquelin-stm32/afboot-stm32
+
+if BR2_TARGET_AFBOOT_STM32
+
+config BR2_TARGET_AFBOOT_STM32_KERNEL_ADDR
+	hex "Kernel load address"
+	default "0x08008000"
+	help
+	  This is the physical address in your flash memory the kernel
+	  will be linked for and stored to. This address is dependent on
+	  your own flash usage.
+
+config BR2_TARGET_AFBOOT_STM32_DTB_ADDR
+	hex "Device-tree load address"
+	default "0x08004000"
+	help
+	  This is the physical address in your flash memory the
+	  device-tree will be stored to. This address is dependent on
+	  your own flash usage.
+
+endif
diff --git a/boot/afboot-stm32/afboot-stm32.hash b/boot/afboot-stm32/afboot-stm32.hash
index 75f47295f6..d22c96d413 100644
--- a/boot/afboot-stm32/afboot-stm32.hash
+++ b/boot/afboot-stm32/afboot-stm32.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 9b37b661bd3091ceb5d8dc5a56a2dfc02ae9ebc0c63dad3c4289c9d6b3d3ec89  afboot-stm32-0.2.tar.gz
+sha256  2caacd302ab3ed5b70b3b93a6aef04162abf779c758a5be547be3ab01b68ca10  afboot-stm32-3566acd582e5536fb60864281788a30f5527df2d.tar.gz
diff --git a/boot/afboot-stm32/afboot-stm32.mk b/boot/afboot-stm32/afboot-stm32.mk
index 0fb4735285..25ba13c8ca 100644
--- a/boot/afboot-stm32/afboot-stm32.mk
+++ b/boot/afboot-stm32/afboot-stm32.mk
@@ -4,13 +4,15 @@
 #
 ################################################################################
 
-AFBOOT_STM32_VERSION = 0.2
-AFBOOT_STM32_SITE = $(call github,mcoquelin-stm32,afboot-stm32,v$(AFBOOT_STM32_VERSION))
+AFBOOT_STM32_VERSION = 3566acd582e5536fb60864281788a30f5527df2d
+AFBOOT_STM32_SITE = $(call github,mcoquelin-stm32,afboot-stm32,$(AFBOOT_STM32_VERSION))
 AFBOOT_STM32_INSTALL_IMAGES = YES
 AFBOOT_STM32_INSTALL_TARGET = NO
 
 define AFBOOT_STM32_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CROSS_COMPILE=$(TARGET_CROSS) all
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CROSS_COMPILE=$(TARGET_CROSS) all \
+		KERNEL_ADDR=$(BR2_TARGET_AFBOOT_STM32_KERNEL_ADDR) \
+		DTB_ADDR=$(BR2_TARGET_AFBOOT_STM32_DTB_ADDR)
 endef
 
 define AFBOOT_STM32_INSTALL_IMAGES_CMDS
diff --git a/configs/stm32f429_disco_defconfig b/configs/stm32f429_disco_defconfig
index 2c0641a6c5..4007eb20a5 100644
--- a/configs/stm32f429_disco_defconfig
+++ b/configs/stm32f429_disco_defconfig
@@ -15,4 +15,5 @@ BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 BR2_TARGET_ROOTFS_INITRAMFS=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_AFBOOT_STM32=y
+BR2_TARGET_AFBOOT_STM32_KERNEL_ADDR=0x0800C000
 BR2_PACKAGE_HOST_OPENOCD=y
diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
index e8b2cf3d21..f3d333278a 100644
--- a/configs/stm32f469_disco_xip_defconfig
+++ b/configs/stm32f469_disco_xip_defconfig
@@ -1,6 +1,5 @@
 BR2_arm=y
 BR2_cortex_m4=y
-BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f469-disco/patches"
 # BR2_UCLIBC_INSTALL_UTILS is not set
 BR2_GCC_ENABLE_LTO=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
@@ -16,4 +15,5 @@ BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 BR2_TARGET_ROOTFS_INITRAMFS=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_AFBOOT_STM32=y
+BR2_TARGET_AFBOOT_STM32_KERNEL_ADDR=0x0800C000
 BR2_PACKAGE_HOST_OPENOCD=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
