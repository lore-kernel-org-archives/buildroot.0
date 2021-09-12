Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC58CC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 08:53:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45AB161050
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 08:53:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 45AB161050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3B4B60BAC;
	Sun, 12 Sep 2021 08:53:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yCJ4-QdiJtJX; Sun, 12 Sep 2021 08:53:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4424B60B99;
	Sun, 12 Sep 2021 08:53:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 52FF61BF578
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 08:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42524405D2
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 08:53:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MQaBIL1ycsSR for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 08:53:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9911A4054E
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 08:53:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id A85D88A3C1; Sun, 12 Sep 2021 08:51:31 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 10:48:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0a8ad41f3bcfec1fc28ebc46968f58860aec413e
X-Git-Newrev: af99e7a5f386304967480fcf68e55131f26f9b4f
X-Patchwork-Hint: ignore
Message-Id: <20210912085131.A85D88A3C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: copy IMX firmware files to
 uboot package dir
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=af99e7a5f386304967480fcf68e55131f26f9b4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The mainline U-Boot can create an i.MX specific firmware image (e.g. flash.bin).
For this the i.MX firmware files (DDR, HDMI) must be in the toplevel directory.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
[yann.morin.1998@free.fr: simplify hook]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/uboot/Config.in | 11 +++++++++++
 boot/uboot/uboot.mk  | 17 +++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 0854fb13cc..8cc40cd9c5 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -239,6 +239,17 @@ config BR2_TARGET_UBOOT_NEEDS_OPENSBI
 	  and that the OpenSBI variable pointing to OpenSBI binary,
 	  is passed during the Buildroot build.
 
+config BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE
+	bool "U-Boot needs firmware-imx"
+	depends on BR2_PACKAGE_FIRMWARE_IMX
+	depends on BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW || \
+		BR2_PACKAGE_FIRMWARE_IMX_NEEDS_HDMI_FW
+	help
+	  Some i.MX8 platforms (such as i.MX8 M, i.MX 8M Mini, i.MX 8M Nano)
+	  encapsulate NXP specific firmware (DDR, HDMI) inside U-Boot.
+	  This option makes sure that the i.MX firmwares are copied into
+	  the U-Boot source directory.
+
 menu "U-Boot binary format"
 
 config BR2_TARGET_UBOOT_FORMAT_AIS
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 1a840d9cc1..184f822af4 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -180,6 +180,23 @@ UBOOT_DEPENDENCIES += opensbi
 UBOOT_MAKE_OPTS += OPENSBI=$(BINARIES_DIR)/fw_dynamic.bin
 endif
 
+# Mainline U-Boot versions can create the i.MX specific boot images
+# and need some NXP firmware blobs.
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE),y)
+UBOOT_DEPENDENCIES += firmware-imx
+UBOOT_IMX_FW_FILES = \
+	$(if $(BR2_PACKAGE_FIRMWARE_IMX_NEEDS_HDMI_FW),signed_hdmi_imx8m.bin) \
+	$(if $(BR2_PACKAGE_FIRMWARE_IMX_LPDDR4),lpddr4*.bin) \
+	$(if $(BR2_PACKAGE_FIRMWARE_IMX_DDR4),ddr4*.bin)
+
+define UBOOT_COPY_IMX_FW_FILES
+	$(foreach fw,$(UBOOT_IMX_FW_FILES),\
+		cp $(BINARIES_DIR)/$(fw) $(@D)/
+	)
+endef
+UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_IMX_DDR_FIRMWARE
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
 UBOOT_DEPENDENCIES += host-dtc
 endif
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
