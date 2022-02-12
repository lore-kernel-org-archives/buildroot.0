Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D049C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 20:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB3E260A82;
	Sat, 12 Feb 2022 20:45:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9PCON9yQ4OHj; Sat, 12 Feb 2022 20:45:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BB9D60A70;
	Sat, 12 Feb 2022 20:45:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 43C141BF577
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 20:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 329FA4025A
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 20:45:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nd2OsLcq-rXa for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 20:45:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C419401D8
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 20:45:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D6F9682470; Sat, 12 Feb 2022 20:38:19 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 21:45:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6c00a319ac6bd1b1f113abe988f8d62e76984323
X-Git-Newrev: b538b43c7665f54e3d1e47cfd7bbe824cd6d7544
X-Patchwork-Hint: ignore
Message-Id: <20220212203819.D6F9682470@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx: Add installation of
 easrc-imx8mn.bin firmware
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

commit: https://git.buildroot.net/buildroot/commit/?id=b538b43c7665f54e3d1e47cfd7bbe824cd6d7544
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The easrc firmware is used for audio resampling. The firmware for now
exists only for imx8mn device

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/freescale-imx/firmware-imx/Config.in       |  4 ++++
 package/freescale-imx/firmware-imx/firmware-imx.mk | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
index df266fb28e..06c4d8036c 100644
--- a/package/freescale-imx/firmware-imx/Config.in
+++ b/package/freescale-imx/firmware-imx/Config.in
@@ -39,6 +39,10 @@ config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_HDMI_FW
 	bool
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
 
+config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_EASRC_FW
+	bool
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
+
 config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_EPDC_FW
 	bool
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 3acd053d0f..211a43c4ca 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -113,6 +113,17 @@ define FIRMWARE_IMX_INSTALL_IMAGE_HDMI_FW
 endef
 endif
 
+#
+# EASRC firmware
+#
+
+ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_NEEDS_EASRC_FW),y)
+define FIRMWARE_IMX_INSTALL_TARGET_EASRC_FW
+	mkdir -p $(TARGET_DIR)/lib/firmware/imx
+	cp -r $(@D)/firmware/easrc $(TARGET_DIR)/lib/firmware/imx
+endef
+endif
+
 #
 # EPDC firmware
 #
@@ -160,6 +171,7 @@ define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
 endef
 
 define FIRMWARE_IMX_INSTALL_TARGET_CMDS
+	$(FIRMWARE_IMX_INSTALL_TARGET_EASRC_FW)
 	$(FIRMWARE_IMX_INSTALL_TARGET_EPDC_FW)
 	$(FIRMWARE_IMX_INSTALL_TARGET_SDMA_FW)
 	$(FIRMWARE_IMX_INSTALL_TARGET_VPU_FW)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
