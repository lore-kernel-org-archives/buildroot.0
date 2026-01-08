Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF39AD1D478
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 19:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66DA640A0B;
	Thu,  8 Jan 2026 19:55:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id squIkGjEjzkM; Thu,  8 Jan 2026 19:55:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8251640A0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767902119;
	bh=D0ynkH1bBbGhymvuCwuUFQJ9eG5FlMe5c1Kiumx0SK4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZRfaBmqj3sJIfqg2/w2OyW9hp3fF8OuJ4frflfBIAkCMlkkvqh/P7BVf7EKm781Pr
	 ZCRcDfow67q4qhS5WGQldowDqmwTVp7a6NroiUUd2QRMOhC2/ZVV6ej+R5lIHBXOqD
	 HD5KvRULsxte4WHncGmIR9zJYGn2drgF52vpwSLGsMnecFSTOM1/XWR9MkhiP5fcL2
	 e+CGdWvHspwQk0EDr7pPsKNMAlgMlH+iu09gatnxDtD96eKZed+EQKEPzqha1MEhZd
	 a6Mw43UEIojfbpQ85lVEUBkCNwqTcGKhPJxOMnsrWJJ1zwULbIX7Wes4eL+SQkOVjc
	 F1I5Sik0XKzBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8251640A0D;
	Thu,  8 Jan 2026 19:55:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 384847B1
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 19:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F2E840A0D
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 19:55:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O5bpauXRBWw3 for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 19:55:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 187D940A0B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 187D940A0B
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 19:55:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 022F588471; Thu,  8 Jan 2026 19:55:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Jan 2026 19:02:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a2621fd2804ab24dcb627f3b8c401c1fa7eec42f
X-Git-Newrev: 799d184e89bc52de9c1b0e241f60d9827a473128
X-Patchwork-Hint: ignore
Message-Id: <20260108195516.022F588471@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/stm32mp1*_dk*: bump Linux to
 6.12.63 and U-Boot to 2026.01
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=799d184e89bc52de9c1b0e241f60d9827a473128
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch bumps the Linux kernel to version 6.12.63 and U-Boot to
version 2026.01 for

- stm32mp135f_dk_defconfig
- stm32mp157a_dk1_defconfig
- stm32mp157c_dk2_defconfig

Tested on STM32MP157C-DK2 Discovery Board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash | 2 +-
 board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash | 2 +-
 configs/stm32mp135f_dk_defconfig                                    | 4 ++--
 configs/stm32mp157a_dk1_defconfig                                   | 4 ++--
 configs/stm32mp157c_dk2_defconfig                                   | 4 ++--
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
index 4ac46f027b..9339a304ab 100644
--- a/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
+++ b/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  663507accae673afcf4e210b4ae8d4352e61d926202e5da3f04bf71ca1d2c0b5  linux-6.12.53.tar.xz
+sha256  9502c5ffe4b894383c97abfccf74430a84732f04ee476b9c0d87635b29df7db3  linux-6.12.63.tar.xz
diff --git a/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash
index 98a5c53aaf..b6a925ea4e 100644
--- a/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b4f032848e56cc8f213ad59f9132c084dbbb632bc29176d024e58220e0efdf4a  u-boot-2025.10.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/stm32mp135f_dk_defconfig b/configs/stm32mp135f_dk_defconfig
index 94c6dad1f0..b7a58ac0e5 100644
--- a/configs/stm32mp135f_dk_defconfig
+++ b/configs/stm32mp135f_dk_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp135f-dk/overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.53"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.63"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp135f-dk/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -42,7 +42,7 @@ BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR="135F_DK"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp13"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
index 52338bba0b..e2139b167c 100644
--- a/configs/stm32mp157a_dk1_defconfig
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157a-dk1/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.53"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.63"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157a-dk1/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -32,7 +32,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index 34fdec8558..77bb5c66f4 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157c-dk2/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.53"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.63"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157c-dk2/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -32,7 +32,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
