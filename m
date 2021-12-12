Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B98DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 12:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEB5460E68;
	Sun, 12 Dec 2021 12:38:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vwSftBcW-Yq9; Sun, 12 Dec 2021 12:38:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 337C561C14;
	Sun, 12 Dec 2021 12:38:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 83CB01BF373
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 716DC40530
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:37:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=libero.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T7LdsWWW94JJ for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 12:37:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from libero.it (smtp-34.italiaonline.it [213.209.10.34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F286E4049E
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 12:37:57 +0000 (UTC)
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it ([82.50.51.121])
 by smtp-34.iol.local with ESMTPA
 id wO70mmmvtUpmcwO71mGvIA; Sun, 12 Dec 2021 13:37:56 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
 t=1639312676; bh=IW9EeQzyBTgchyDfZUTA8vUDs0IKLlvYScnrT0DXJgg=;
 h=From;
 b=kE/zya+4Pn+4xJaUAXq5BYuGqyF1XkO5hkF2xn9ocmUeqpP0i4MhqkrjZtQT9SHYk
 u7Rr2ToQylgrX1lU922Il7+4Wv62AhcjIfCrqgfCNCNfJ/HgoxE+xYH5yXRivNRYtO
 3TdXNxHqYrebrPqyjbhQ+Snb0hySJz9BHtSra6/k3q6Hjn7EBF5ykLRjq8DsFXAyIj
 hSwroYMWBp5izeGqCBl9A/49bMuJwO6bqYiL8gmEyoXpLibZMGrwLL3FjFGRcBCm2/
 B+xY/omC3OPgMEt9RhVVk4sr/Cs5Ps7Z8M6IcL3P3ec4DRpht33bJKxs8WdCflEVCp
 jhh2KZSgddeTg==
X-CNFS-Analysis: v=2.4 cv=VsDmv86n c=1 sm=1 tr=0 ts=61b5ed24 cx=a_exe
 a=xtCFBUu/Ze6RtP+zVSd77w==:117 a=xtCFBUu/Ze6RtP+zVSd77w==:17 a=NEAV23lmAAAA:8
 a=TdwfhV22bwzyGTalfRQA:9
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 13:37:51 +0100
Message-Id: <20211212123753.11848-3-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211212123753.11848-1-dariobin@libero.it>
References: <20211212123753.11848-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfKixHdCVfg1yXkUfpqAcm4vHnj76uMg8Bub6cNs6jR+QGIJRU1bnRu1T9kxu3JfGWVBLhU6pfRK/Thq0MYJKnTraeOik/XOIuObjAxbAKJ/L22LrBtd0
 x/zvsySwfC7F82qInPpMGTOu9vMCT40XzmL7M1rxJBpBpBJPHCgHcX1ygHPzO7sxwlK6H5i4HSRdovnnWdH3VuSdrFZMMkFH2b0sstuHXmSjZ6EkLyorbyoM
 qBKWVH8zJtHl8XFEjtjjVf23HjgOIm/mve7tkrHWE5izIs6q7pEhPEcEETv5wkXiT6QIfxQC4abzqebpKFaP32KvT7va6LUydr02DYq6lKIBzLxK62Lm57qN
 Sghh3py9fcLIWFwHmGpnpEvq9JlnBA==
Subject: [Buildroot] [RESEND PATCH v2,
 2/4] boot/afboot-stm32: upgrade version
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
From: Dario Binacchi via buildroot <buildroot@buildroot.org>
Reply-To: Dario Binacchi <dariobin@libero.it>
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 Lee Jones <lee.jones@linaro.org>, Dario Binacchi <dariobin@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Newer versions of the kernel generate device trees that are not
storable in a single 16kB sector. In these cases the kernel load address
must be changed.
The commit 2e499dcff3ef ("Add possibility to use custom kernel load address")
adds the possibility to override the default (0x08008000) kernel load
address.

This also required changes to the stm32f429_disco_defconfig and
stm32f469_disco_xip_defconfig configurations.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
---
 ...69i-disco-change-kernel-load-address.patch | 26 ---------------
 boot/afboot-stm32/Config.in                   | 32 +++++++++++++++++++
 boot/afboot-stm32/afboot-stm32.hash           |  2 +-
 boot/afboot-stm32/afboot-stm32.mk             | 18 ++++++++---
 configs/stm32f429_disco_defconfig             |  1 +
 configs/stm32f469_disco_xip_defconfig         |  3 +-
 6 files changed, 50 insertions(+), 32 deletions(-)
 delete mode 100644 board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0001-stm32f469i-disco-change-kernel-load-address.patch

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
index 309b9e0491..71f4c7e382 100644
--- a/boot/afboot-stm32/Config.in
+++ b/boot/afboot-stm32/Config.in
@@ -5,3 +5,35 @@ config BR2_TARGET_AFBOOT_STM32
 	  afboot-stm32 is a very small bootloader for STM32 platforms
 
 	  https://github.com/mcoquelin-stm32/afboot-stm32
+
+if BR2_TARGET_AFBOOT_STM32
+
+choice
+	prompt "Board type"
+	help
+	  Select the proper stm32 board type.
+
+config BR2_TARGET_AFBOOT_STM32_F429_DISCO
+	bool "stm32f429-disco"
+
+config BR2_TARGET_AFBOOT_STM32_F469_DISCO
+	bool "stm32f469-disco"
+
+endchoice
+
+config BR2_TARGET_AFBOOT_STM32_KERNEL_ADDR
+	hex "Kernel load address"
+	default "0x08008000"
+	help
+	  This is the physical address in your flash memory the kernel will
+	  be linked for and stored to. This address is dependent on your own
+	  flash usage.
+
+config BR2_TARGET_AFBOOT_STM32_DTB_ADDR
+	hex "Device-tree load address"
+	default "0x08004000"
+	help
+	  This is the physical address in your flash memory the device-tree
+	  will be stored to. This address is dependent on your own flash usage.
+
+endif
diff --git a/boot/afboot-stm32/afboot-stm32.hash b/boot/afboot-stm32/afboot-stm32.hash
index 75f47295f6..80b9b6a106 100644
--- a/boot/afboot-stm32/afboot-stm32.hash
+++ b/boot/afboot-stm32/afboot-stm32.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 9b37b661bd3091ceb5d8dc5a56a2dfc02ae9ebc0c63dad3c4289c9d6b3d3ec89  afboot-stm32-0.2.tar.gz
+sha256  132f9817e615131856892cbe3df1502cdcd0700a12a48aa6bae8acfd5f093b42  afboot-stm32-3566acd582e5536fb60864281788a30f5527df2d-br1.tar.gz
diff --git a/boot/afboot-stm32/afboot-stm32.mk b/boot/afboot-stm32/afboot-stm32.mk
index 0fb4735285..80074a3c35 100644
--- a/boot/afboot-stm32/afboot-stm32.mk
+++ b/boot/afboot-stm32/afboot-stm32.mk
@@ -4,17 +4,27 @@
 #
 ################################################################################
 
-AFBOOT_STM32_VERSION = 0.2
-AFBOOT_STM32_SITE = $(call github,mcoquelin-stm32,afboot-stm32,v$(AFBOOT_STM32_VERSION))
+AFBOOT_STM32_VERSION = 3566acd582e5536fb60864281788a30f5527df2d
+AFBOOT_STM32_SITE = https://github.com/mcoquelin-stm32/afboot-stm32.git
+AFBOOT_STM32_SITE_METHOD = git
 AFBOOT_STM32_INSTALL_IMAGES = YES
 AFBOOT_STM32_INSTALL_TARGET = NO
 
+ifeq ($(BR2_TARGET_AFBOOT_STM32_F429_DISCO),y)
+AFBOOT_STM32_BOARD=stm32f429i-disco
+else
+AFBOOT_STM32_BOARD=stm32f469i-disco
+endif
+
 define AFBOOT_STM32_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CROSS_COMPILE=$(TARGET_CROSS) all
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CROSS_COMPILE=$(TARGET_CROSS) \
+		$(AFBOOT_STM32_BOARD) \
+		KERNEL_ADDR=$(BR2_TARGET_AFBOOT_STM32_KERNEL_ADDR) \
+		DTB_ADDR=$(BR2_TARGET_AFBOOT_STM32_DTB_ADDR)
 endef
 
 define AFBOOT_STM32_INSTALL_IMAGES_CMDS
-	$(INSTALL) -m 0755 -t $(BINARIES_DIR) -D $(@D)/stm32*.bin
+	$(INSTALL) -m 0755 -t $(BINARIES_DIR) -D $(@D)/$(AFBOOT_STM32_BOARD).bin
 endef
 
 $(eval $(generic-package))
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
index e8b2cf3d21..4c49ffcc7a 100644
--- a/configs/stm32f469_disco_xip_defconfig
+++ b/configs/stm32f469_disco_xip_defconfig
@@ -1,6 +1,5 @@
 BR2_arm=y
 BR2_cortex_m4=y
-BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f469-disco/patches"
 # BR2_UCLIBC_INSTALL_UTILS is not set
 BR2_GCC_ENABLE_LTO=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
@@ -16,4 +15,6 @@ BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 BR2_TARGET_ROOTFS_INITRAMFS=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_AFBOOT_STM32=y
+BR2_TARGET_AFBOOT_STM32_F469_DISCO=y
+BR2_TARGET_AFBOOT_STM32_KERNEL_ADDR=0x0800C000
 BR2_PACKAGE_HOST_OPENOCD=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
