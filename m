Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8628BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 16:37:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA8AA60F48
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 16:37:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DA8AA60F48
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8006F81971;
	Sun, 17 Oct 2021 16:37:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cTWieUP8aPf7; Sun, 17 Oct 2021 16:37:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB9338197D;
	Sun, 17 Oct 2021 16:37:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9751C1BF404
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 16:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9418260636
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 16:37:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=libero.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pgMkuEAS32MV for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 16:37:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from libero.it (smtp-32.italiaonline.it [213.209.10.32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BCC53605DE
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 16:37:45 +0000 (UTC)
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([79.24.103.190]) by smtp-32.iol.local with ESMTPA
 id c92DmY5ZpPvRTc92PmEzX6; Sun, 17 Oct 2021 18:29:29 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
 t=1634488169; bh=ElQ0JAmogRPCy3lwx5R+XEz27zTI6CgX/Ym9BKBQd7M=;
 h=From;
 b=cGcUXd5KNjfC5MK5D0oObmjYkhClumiV2IDIbm+OJn3EQwJAUmr7Md0k+q9/63sQ4
 3rhtm4psXt3gprrymKygP0/ll7FUsAUlZWDodML8RzeEXkIllr8r4AM9YJ4xD7VM+b
 0b21Mtb1/d1GHFQtgPyz5q80HKnP9PZhsRcDKKw4RsxU1axgIadvU2OLf3AIN+++kf
 tcmMP4Hvk7taN3brOvtalacpgyZjBe+gttzNmREsOiLRl0WACEeCZteUtzKB09B4UN
 rxKV32EAF9V8xre7D5Q3d5ZKEY2QyWmxNjb58nEF0SsKJ2OxlFiYzq+WisxJ4X7rec
 ocYee/kIPMkxQ==
X-CNFS-Analysis: v=2.4 cv=NqgUz+RJ c=1 sm=1 tr=0 ts=616c4f69 cx=a_exe
 a=YGFxGp/Nwp6jLtVyvvsm7Q==:117 a=YGFxGp/Nwp6jLtVyvvsm7Q==:17
 a=gch23Gmf8xbaTaiWlzQA:9
To: buildroot@buildroot.org
Date: Sun, 17 Oct 2021 18:28:38 +0200
Message-Id: <20211017162839.20278-2-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211017162839.20278-1-dariobin@libero.it>
References: <20211017162839.20278-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfF8sh5kGJ85xMgJ2x/omGGtjX+7vdzeVovDHo4Jg+ImjJekgZmAfjaVZOSU9vN+8H0o3Aeqoqag3T9SpMyyCLS00HghEx4KiLz/a3QDd01lm+2IIrucT
 5ZYhbaAHwp46RfyLT8OyKxqw6+UcumkyVGchdra4S3h4/xzjmL51er8Lgav7p4dr4tVJ9Nosl4QRARerytm/hptM2byQ4NVo+5Icctkyi6qqQPEM172POpEU
 VfTRTqAm737ukbg/VftAANblXVgbJnd2hSm2G22HakhnWcxJEXze7xRnaJc1NjfV7ZgN5241gvDh2WkhDZXfFinRsSmHVVBwY/loMpx3GHM=
Subject: [Buildroot] [PATCH 1/2] configs/stm32f469_disco: enable Linux DRM
 support
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
 Dario Binacchi <dariobin@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch [1], which is required for DRM to work properly, has been
merged into Linux version 5.14-rc3. There's a 5.14.12 now in stable, so
I took that one.

After Linux boots, /dev/fb0 will be accessible. You can control the
brightness of the display after enabling the framebuffer by running the
following commands:

~ # echo 0 0 > /sys/class/graphics/fb0/pan
~ # echo 255 >/sys/class/backlight/40016c00.dsi.0/brightness

The brightness ranges from 0 to 255, as you can see running the
command:

~ # cat /sys/class/backlight/40016c00.dsi.0/max_brightness

[1] 24b5b1978cd5 ("clk: stm32f4: fix post divisor setup for I2S/SAI PLLs")

Signed-off-by: Dario Binacchi <dariobin@libero.it>
---
 board/stmicroelectronics/stm32f469-disco/linux.fragment | 8 +++++++-
 configs/stm32f469_disco_defconfig                       | 4 ++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/board/stmicroelectronics/stm32f469-disco/linux.fragment b/board/stmicroelectronics/stm32f469-disco/linux.fragment
index 90f5e8a8ff..e5d39bf04a 100644
--- a/board/stmicroelectronics/stm32f469-disco/linux.fragment
+++ b/board/stmicroelectronics/stm32f469-disco/linux.fragment
@@ -1 +1,7 @@
-# CONFIG_XIP_KERNEL is not set
\ No newline at end of file
+# CONFIG_XIP_KERNEL is not set
+CONFIG_DRM=y
+CONFIG_DRM_STM=y
+CONFIG_DRM_STM_DSI=y
+CONFIG_DRM_PANEL_ORISETECH_OTM8009A=y
+CONFIG_FB=y
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
diff --git a/configs/stm32f469_disco_defconfig b/configs/stm32f469_disco_defconfig
index e538a664e2..438d32150c 100644
--- a/configs/stm32f469_disco_defconfig
+++ b/configs/stm32f469_disco_defconfig
@@ -1,12 +1,12 @@
 BR2_arm=y
 BR2_cortex_m4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh board/stmicroelectronics/stm32f469-disco/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f469-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.12.11"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.14.12"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0x00000000.config board/stmicroelectronics/stm32f469-disco/linux.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
