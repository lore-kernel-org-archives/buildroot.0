Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6C7C3DA45
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 07:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB023414A4;
	Fri, 12 Jul 2024 07:16:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e09WtRDMRDy6; Fri, 12 Jul 2024 07:16:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB4A7414C6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB4A7414C6;
	Fri, 12 Jul 2024 07:16:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2F75B1BF48C
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 07:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DA56411CD
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 07:15:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3u0UM_t6TYcY for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 07:15:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AA1740C15
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AA1740C15
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 07:15:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 076CA857A9; Fri, 12 Jul 2024 07:15:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 09:14:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 90314fdfb0e63b1b49d86addddfc0c957feaa622
X-Git-Newrev: 9a7c709012f9db0f4dcaee02d611e8d1427226a3
X-Patchwork-Hint: ignore
Message-Id: <20240712071537.076CA857A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/firmware-upower: new
 package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9a7c709012f9db0f4dcaee02d611e8d1427226a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package provides NXP i.MX uPower firmware present on i.MX 8ULP SoC.
This version comes from the NXP 6.1.55-2.2.0 release.

Signed-off-by: Chris Dimich <cdimich2188@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/freescale-imx/Config.in                    |  5 ++++
 package/freescale-imx/firmware-upower/Config.in    | 22 ++++++++++++++++++
 .../firmware-upower/firmware-upower.hash           |  4 ++++
 .../firmware-upower/firmware-upower.mk             | 27 ++++++++++++++++++++++
 4 files changed, 58 insertions(+)

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 34ce1d1311..6d196a052d 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -165,6 +165,10 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_ELE
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91 || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93
 
+config BR2_PACKAGE_FREESCALE_IMX_HAS_UPOWER
+	bool
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULP
+
 source "package/freescale-imx/imx-alsa-plugins/Config.in"
 source "package/freescale-imx/imx-codec/Config.in"
 source "package/freescale-imx/imx-kobs/Config.in"
@@ -177,6 +181,7 @@ source "package/freescale-imx/imx-vpu-hantro/Config.in"
 source "package/freescale-imx/imx-vpuwrap/Config.in"
 source "package/freescale-imx/firmware-ele-imx/Config.in"
 source "package/freescale-imx/firmware-imx/Config.in"
+source "package/freescale-imx/firmware-upower/Config.in"
 source "package/freescale-imx/imx-sc-firmware/Config.in"
 source "package/freescale-imx/imx-seco/Config.in"
 source "package/freescale-imx/imx-vpu-hantro-daemon/Config.in"
diff --git a/package/freescale-imx/firmware-upower/Config.in b/package/freescale-imx/firmware-upower/Config.in
new file mode 100644
index 0000000000..ca7486d2b7
--- /dev/null
+++ b/package/freescale-imx/firmware-upower/Config.in
@@ -0,0 +1,22 @@
+comment "firmware-upower needs an i.MX platform with uPower"
+	depends on !BR2_PACKAGE_FREESCALE_IMX_HAS_UPOWER
+
+config BR2_PACKAGE_FIRMWARE_UPOWER
+	bool "firmware-upower"
+	depends on BR2_PACKAGE_FREESCALE_IMX_HAS_UPOWER
+	help
+	  NXP i.MX uPower firmware present on i.MX 8ULP SoC.
+
+	  This library is provided by NXP as-is and doesn't have an
+	  upstream.
+
+if BR2_PACKAGE_FIRMWARE_UPOWER
+
+config BR2_PACKAGE_FIRMWARE_UPOWER_UPOWER_FIRMWARE_NAME
+	string
+	default "upower_a0.bin" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULPA0
+	default "upower_a1.bin" if \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULPA1 || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULPA2
+
+endif # BR2_PACKAGE_FIRMWARE_UPOWER
diff --git a/package/freescale-imx/firmware-upower/firmware-upower.hash b/package/freescale-imx/firmware-upower/firmware-upower.hash
new file mode 100644
index 0000000000..dc5938ad16
--- /dev/null
+++ b/package/freescale-imx/firmware-upower/firmware-upower.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  1df3a03d69feb38a450ee63abc7713d78cf6339988476e4c9f95ebbf63790f66  firmware-upower-1.3.1.bin
+sha256  de37a0bcbf1717b910c1a53ea6eab853c404e61e8143bb6c081d39f532571e54  COPYING
+sha256  b158adaac5e2d1c7fa6e739ff168ab498957e3303070f1c0b0e66d9a8f02a354  EULA
diff --git a/package/freescale-imx/firmware-upower/firmware-upower.mk b/package/freescale-imx/firmware-upower/firmware-upower.mk
new file mode 100644
index 0000000000..dfdf75510c
--- /dev/null
+++ b/package/freescale-imx/firmware-upower/firmware-upower.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# firmware-ele-imx
+#
+################################################################################
+
+FIRMWARE_UPOWER_VERSION = 1.3.1
+FIRMWARE_UPOWER_SITE = $(FREESCALE_IMX_SITE)
+FIRMWARE_UPOWER_SOURCE = firmware-upower-$(FIRMWARE_UPOWER_VERSION).bin
+
+FIRMWARE_UPOWER_LICENSE = NXP Semiconductor Software License Agreement
+FIRMWARE_UPOWER_LICENSE_FILES = COPYING EULA
+FIRMWARE_UPOWER_REDISTRIBUTE = NO
+
+FIRMWARE_UPOWER_INSTALL_IMAGES = YES
+
+define FIRMWARE_UPOWER_EXTRACT_CMDS
+	$(call NXP_EXTRACT_HELPER,$(FIRMWARE_UPOWER_DL_DIR)/$(FIRMWARE_UPOWER_SOURCE))
+endef
+
+FIRMWARE_UPOWER_UPOWER_FIRMWARE_NAME = $(call qstrip,$(BR2_PACKAGE_FIRMWARE_UPOWER_UPOWER_FIRMWARE_NAME))
+
+define FIRMWARE_UPOWER_INSTALL_IMAGES_CMDS
+	cp $(@D)/$(FIRMWARE_UPOWER_UPOWER_FIRMWARE_NAME) $(BINARIES_DIR)/upower.bin
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
