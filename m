Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71AB0C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 12:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2228B4049E;
	Sun, 12 Dec 2021 12:38:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y4andfSZDX5j; Sun, 12 Dec 2021 12:38:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0644240530;
	Sun, 12 Dec 2021 12:38:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B237F1BF973
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 793F160E7B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:38:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=libero.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yEjYgxzB_yji for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 12:37:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from libero.it (smtp-34-i2.italiaonline.it [213.209.12.34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 19B3D60E7A
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 12:37:58 +0000 (UTC)
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it ([82.50.51.121])
 by smtp-34.iol.local with ESMTPA
 id wO70mmmvtUpmcwO72mGvIL; Sun, 12 Dec 2021 13:37:56 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
 t=1639312676; bh=yUj3eBjzbRQULusoWNTVFJDOp4Dn3S4eXuQ3ptw+ODQ=;
 h=From;
 b=lRO/Aaf5eA2B7mQzbBo6IGW8XiyIu/xMKR2d0pOdW/pZey0kKyCinIDqaCP6NJDQ1
 YTRdwjLRXOZ9mya1XH2dh8HzkcreJRlrQtAUkiNBG8obcC4Idy5J1pCV0gA2iSjvqV
 EHWcGNP1G7nBo4/9kKM/69FHI5ykO0Rtxs5Uh8wTuVujFJCl0wmZCTHz2DsGTeFHPY
 nEeYtb7OCwYntou6S3WADlLzXInoi+2Fv4hGyn6dlQM1yrcHE4P7NU1xnsAiLfBfyk
 jx8A+EK1SG2YSD1x3x5UcMq5RA3XLQsreyq5JoWaDcmaUcu/k5i9wDGCpRVGthGS7/
 nqTP+dr5yY+Zw==
X-CNFS-Analysis: v=2.4 cv=VsDmv86n c=1 sm=1 tr=0 ts=61b5ed24 cx=a_exe
 a=xtCFBUu/Ze6RtP+zVSd77w==:117 a=xtCFBUu/Ze6RtP+zVSd77w==:17
 a=pl1rPjcGXzItbPHqDv8A:9
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 13:37:53 +0100
Message-Id: <20211212123753.11848-5-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211212123753.11848-1-dariobin@libero.it>
References: <20211212123753.11848-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfKixHdCVfg1yXkUfpqAcm4vHnj76uMg8Bub6cNs6jR+QGIJRU1bnRu1T9kxu3JfGWVBLhU6pfRK/Thq0MYJKnTraeOik/XOIuObjAxbAKJ/L22LrBtd0
 x/zvsySwfC7F82qInPpMGTOu9vMCT40XzmL7M1rxJBpBpBJPHCgHcX1ygHPzO7sxwlK6H5i4HSRdovnnWdH3VuSdrFZMMkFH2b0sstuHXmSjZ6EkLyorbyoM
 qBKWVH8zJtHl8XFEjtjjVf23HjgOIm/mve7tkrHWE5izIs6q7pEhPEcEETv5wkXiT6QIfxQC4abzqebpKFaP32KvT7va6LUydr02DYq6lKIBzLxK62Lm57qN
 Sghh3py9fcLIWFwHmGpnpEvq9JlnBA==
Subject: [Buildroot] [RESEND PATCH v2,
 4/4] configs/stm32f4{2|6}9_*_defconfig: rename configurations
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

The name of the configurations are now more explicit. As a result, the
readme files have also been changed.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
---
 .../stm32f469-disco/{flash.sh => flash_sd.sh}                 | 0
 .../stm32f469-disco/{linux.fragment => linux-sd.fragment}     | 0
 board/stmicroelectronics/stm32f469-disco/readme.txt           | 4 ++--
 board/stmicroelectronics/stm32f469-disco/readme_xip.txt       | 2 +-
 ...tm32f429_disco_defconfig => stm32f429_disco_xip_defconfig} | 0
 ...stm32f469_disco_defconfig => stm32f469_disco_sd_defconfig} | 2 +-
 6 files changed, 4 insertions(+), 4 deletions(-)
 rename board/stmicroelectronics/stm32f469-disco/{flash.sh => flash_sd.sh} (100%)
 rename board/stmicroelectronics/stm32f469-disco/{linux.fragment => linux-sd.fragment} (100%)
 rename configs/{stm32f429_disco_defconfig => stm32f429_disco_xip_defconfig} (100%)
 rename configs/{stm32f469_disco_defconfig => stm32f469_disco_sd_defconfig} (97%)

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
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
