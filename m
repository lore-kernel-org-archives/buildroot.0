Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D8CC433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 21:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFC176118F;
	Fri, 17 Dec 2021 21:58:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p3S2dR11UEDt; Fri, 17 Dec 2021 21:58:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26B5D6116E;
	Fri, 17 Dec 2021 21:58:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 52FF31BF358
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41FC284DAA
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:58:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WkQR3s321hE3 for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 21:58:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F91684DA8
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 21:58:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 610A1811FB; Fri, 17 Dec 2021 21:53:08 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 22:58:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c85312affd2983bf2f4fa7e2827cccf889dc28a8
X-Git-Newrev: 494807e28dd4c7a0ad87224ac8d60910c8dabf43
X-Patchwork-Hint: ignore
Message-Id: <20211217215308.610A1811FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/stm32f4{2|6}9_*_defconfig: rename
 configurations
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

commit: https://git.buildroot.net/buildroot/commit/?id=494807e28dd4c7a0ad87224ac8d60910c8dabf43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rename the configuration to explicitly distinguish between sd and xip.
As a result, the readme files have also been changed.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
Acked-by: Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/stmicroelectronics/stm32f469-disco/{flash.sh => flash_sd.sh}    | 0
 .../stm32f469-disco/{linux.fragment => linux-sd.fragment}             | 0
 board/stmicroelectronics/stm32f469-disco/readme.txt                   | 4 ++--
 board/stmicroelectronics/stm32f469-disco/readme_xip.txt               | 2 +-
 configs/{stm32f429_disco_defconfig => stm32f429_disco_xip_defconfig}  | 0
 configs/{stm32f469_disco_defconfig => stm32f469_disco_sd_defconfig}   | 2 +-
 6 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/stmicroelectronics/stm32f469-disco/flash.sh b/board/stmicroelectronics/stm32f469-disco/flash_sd.sh
similarity index 100%
rename from board/stmicroelectronics/stm32f469-disco/flash.sh
rename to board/stmicroelectronics/stm32f469-disco/flash_sd.sh
diff --git a/board/stmicroelectronics/stm32f469-disco/linux.fragment b/board/stmicroelectronics/stm32f469-disco/linux-sd.fragment
similarity index 100%
rename from board/stmicroelectronics/stm32f469-disco/linux.fragment
rename to board/stmicroelectronics/stm32f469-disco/linux-sd.fragment
diff --git a/board/stmicroelectronics/stm32f469-disco/readme.txt b/board/stmicroelectronics/stm32f469-disco/readme.txt
index 4d178b40d6..99d26ccb66 100644
--- a/board/stmicroelectronics/stm32f469-disco/readme.txt
+++ b/board/stmicroelectronics/stm32f469-disco/readme.txt
@@ -7,13 +7,13 @@ configuration for the STM32F469 Discovery evaluation platform.
 Building
 --------
 
-  make stm32f469_disco_defconfig
+  make stm32f469_disco_sd_defconfig
   make
 
 Flashing
 --------
 
-  ./board/stmicroelectronics/stm32f469-disco/flash.sh output/
+  ./board/stmicroelectronics/stm32f469-disco/flash_sd.sh output/
 
 It will flash the U-boot bootloader.
 
diff --git a/board/stmicroelectronics/stm32f469-disco/readme_xip.txt b/board/stmicroelectronics/stm32f469-disco/readme_xip.txt
index 632d221ba1..7c20c2d015 100644
--- a/board/stmicroelectronics/stm32f469-disco/readme_xip.txt
+++ b/board/stmicroelectronics/stm32f469-disco/readme_xip.txt
@@ -19,6 +19,6 @@ Building
 Flashing
 --------
 
-  ./board/stmicroelectronics/stm32f469-disco/flash.sh output/
+  ./board/stmicroelectronics/stm32f469-disco/flash_xip.sh output/
 
 It will flash binary to internal flash memory.
diff --git a/configs/stm32f429_disco_defconfig b/configs/stm32f429_disco_xip_defconfig
similarity index 100%
rename from configs/stm32f429_disco_defconfig
rename to configs/stm32f429_disco_xip_defconfig
diff --git a/configs/stm32f469_disco_defconfig b/configs/stm32f469_disco_sd_defconfig
similarity index 97%
rename from configs/stm32f469_disco_defconfig
rename to configs/stm32f469_disco_sd_defconfig
index 438d32150c..5ad4068e5e 100644
--- a/configs/stm32f469_disco_defconfig
+++ b/configs/stm32f469_disco_sd_defconfig
@@ -8,7 +8,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.14.12"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0x00000000.config board/stmicroelectronics/stm32f469-disco/linux.fragment"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0x00000000.config board/stmicroelectronics/stm32f469-disco/linux-sd.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
