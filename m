Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A632DC52D7D
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 08:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4F5240E18;
	Thu, 15 Aug 2024 08:13:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pPn6KhGpjlKV; Thu, 15 Aug 2024 08:13:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35E554024C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35E554024C;
	Thu, 15 Aug 2024 08:13:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1F2A61BF2B6
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 08:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0857C40714
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 08:13:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZtM-ivO2FqLu for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 08:13:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82CB040316
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82CB040316
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 08:13:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 69B1E85E03; Thu, 15 Aug 2024 08:13:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Aug 2024 09:48:56 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a0b8ca1c214c3e250c7c242121ff1e2c88644920
X-Git-Newrev: f21db2bd83bf3073a50b8bcd79af6e7aed6fb000
X-Patchwork-Hint: ignore
Message-Id: <20240815081313.69B1E85E03@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 board/stmicroelectronics/common/stm32mp157: rename folder
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

commit: https://git.buildroot.net/buildroot/commit/?id=f21db2bd83bf3073a50b8bcd79af6e7aed6fb000
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

STM32MP15x and STM32MP13 can use almost of the same configuration
regarding bootloaders and the Linux kernel. To make profit of the
commont folder, rename it to 'stm32mp1xx' and change dependencies
accordingly.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                                   | 2 +-
 DEVELOPERS                                                            | 2 +-
 .../common/{stm32mp157 => stm32mp1xx}/genimage.cfg.template           | 0
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash            | 0
 .../patches/linux-headers/linux-headers.hash                          | 0
 .../common/{stm32mp157 => stm32mp1xx}/patches/linux/linux.hash        | 0
 .../common/{stm32mp157 => stm32mp1xx}/patches/uboot/uboot.hash        | 0
 .../common/{stm32mp157 => stm32mp1xx}/post-image.sh                   | 2 +-
 configs/avenger96_defconfig                                           | 2 +-
 configs/stm32mp157a_dk1_defconfig                                     | 4 ++--
 configs/stm32mp157c_dk2_defconfig                                     | 4 ++--
 11 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index a44817578d..203cfb4a2c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -82,7 +82,7 @@ board/solidrun/clearfog/post-build.sh Shellcheck
 board/solidrun/macchiatobin/post-build-mainline.sh Shellcheck
 board/solidrun/macchiatobin/post-build.sh Shellcheck
 board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh Shellcheck
-board/stmicroelectronics/common/stm32mp157/post-image.sh Shellcheck
+board/stmicroelectronics/common/stm32mp1xx/post-image.sh Shellcheck
 board/stmicroelectronics/stm32f429-disco/flash.sh Shellcheck
 board/stmicroelectronics/stm32f469-disco/flash_sd.sh Shellcheck
 board/stmicroelectronics/stm32f469-disco/flash_xip.sh Shellcheck
diff --git a/DEVELOPERS b/DEVELOPERS
index 754f153b39..837d42bb4f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2240,7 +2240,7 @@ F:	configs/qemu_riscv32_virt_defconfig
 F:	configs/qemu_riscv64_virt_defconfig
 
 N:	Marleen Vos <marleen.vos@mind.be>
-F:	board/stmicroelectronics/common/stm32mp157/
+F:	board/stmicroelectronics/common/stm32mp1xx/
 F:	configs/avenger96_defconfig
 F:	configs/stm32mp157a_dk1_defconfig
 F:	configs/stm32mp157c_dk2_defconfig
diff --git a/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template b/board/stmicroelectronics/common/stm32mp1xx/genimage.cfg.template
similarity index 100%
rename from board/stmicroelectronics/common/stm32mp157/genimage.cfg.template
rename to board/stmicroelectronics/common/stm32mp1xx/genimage.cfg.template
diff --git a/board/stmicroelectronics/common/stm32mp157/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
similarity index 100%
rename from board/stmicroelectronics/common/stm32mp157/patches/arm-trusted-firmware/arm-trusted-firmware.hash
rename to board/stmicroelectronics/common/stm32mp1xx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
diff --git a/board/stmicroelectronics/common/stm32mp157/patches/linux-headers/linux-headers.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/linux-headers/linux-headers.hash
similarity index 100%
rename from board/stmicroelectronics/common/stm32mp157/patches/linux-headers/linux-headers.hash
rename to board/stmicroelectronics/common/stm32mp1xx/patches/linux-headers/linux-headers.hash
diff --git a/board/stmicroelectronics/common/stm32mp157/patches/linux/linux.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
similarity index 100%
rename from board/stmicroelectronics/common/stm32mp157/patches/linux/linux.hash
rename to board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
diff --git a/board/stmicroelectronics/common/stm32mp157/patches/uboot/uboot.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash
similarity index 100%
rename from board/stmicroelectronics/common/stm32mp157/patches/uboot/uboot.hash
rename to board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash
diff --git a/board/stmicroelectronics/common/stm32mp157/post-image.sh b/board/stmicroelectronics/common/stm32mp1xx/post-image.sh
similarity index 93%
rename from board/stmicroelectronics/common/stm32mp157/post-image.sh
rename to board/stmicroelectronics/common/stm32mp1xx/post-image.sh
index 0cf52f4564..77547832ab 100755
--- a/board/stmicroelectronics/common/stm32mp157/post-image.sh
+++ b/board/stmicroelectronics/common/stm32mp1xx/post-image.sh
@@ -22,7 +22,7 @@ main()
 	GENIMAGE_CFG="$(mktemp --suffix genimage.cfg)"
 
 	sed -e "s/%ATFBIN%/${ATFBIN}/" \
-		board/stmicroelectronics/common/stm32mp157/genimage.cfg.template > ${GENIMAGE_CFG}
+		board/stmicroelectronics/common/stm32mp1xx/genimage.cfg.template > ${GENIMAGE_CFG}
 
 	support/scripts/genimage.sh -c ${GENIMAGE_CFG}
 
diff --git a/configs/avenger96_defconfig b/configs/avenger96_defconfig
index 64cfb3c2b0..3b471109f7 100644
--- a/configs/avenger96_defconfig
+++ b/configs/avenger96_defconfig
@@ -7,7 +7,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # System configuration
 BR2_ROOTFS_OVERLAY="board/arrow/avenger96/overlay/"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
 
 # Kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
index 310e179cf7..e2dd48bb17 100644
--- a/configs/stm32mp157a_dk1_defconfig
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -6,10 +6,10 @@ BR2_cortex_a7=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_9=y
 
 # System configuration
-BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/common/stm32mp157/patches"
+BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/common/stm32mp1xx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157a-dk1/overlay/"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
 
 # Kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index 2a9c31df37..d6085583d3 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -6,10 +6,10 @@ BR2_cortex_a7=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_9=y
 
 # System configuration
-BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/common/stm32mp157/patches"
+BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/common/stm32mp1xx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157c-dk2/overlay/"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
 
 # Kernel
 BR2_LINUX_KERNEL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
