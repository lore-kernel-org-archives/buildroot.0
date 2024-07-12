Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF289C3DA45
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 07:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 799C841478;
	Fri, 12 Jul 2024 07:16:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m-_W3Yuwa5-q; Fri, 12 Jul 2024 07:16:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A182B4149C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A182B4149C;
	Fri, 12 Jul 2024 07:16:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 29DA81BF48C
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 07:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA921607BC
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 07:15:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dVb1Addp4A8D for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 07:15:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 012E5607C2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 012E5607C2
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 07:15:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EDD57857A8; Fri, 12 Jul 2024 07:15:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 09:14:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a5c1a9980679c1c9ea8d1287082cf6359bbeb770
X-Git-Newrev: 90314fdfb0e63b1b49d86addddfc0c957feaa622
X-Patchwork-Hint: ignore
Message-Id: <20240712071536.EDD57857A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx: add i.MX 8ULP
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=90314fdfb0e63b1b49d86addddfc0c957feaa622
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

More details on the platform here:

https://www.ezurio.com/system-on-module/nxp-imx8/nitrogen8ulp-som

https://www.nxp.com/products/processors-and-microcontrollers/arm-processors/i-mx-applications-processors/i-mx-8-applications-processors/i-mx-8ulp-applications-processor-family:i.MX8ULP

There have been 3 silicon revisions of this processor (A0, A1, A2) and
A2 is the current production version.

Signed-off-by: Chris Dimich <cdimich2188@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/freescale-imx/Config.in                  | 31 ++++++++++++++++++++++--
 package/freescale-imx/firmware-ele-imx/Config.in |  3 +++
 package/freescale-imx/firmware-imx/Config.in     |  1 +
 3 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 3211592468..34ce1d1311 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -55,6 +55,9 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP
 	bool "imx8mp"
 
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULP
+	bool "imx8ulp"
+
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
 	bool "imx8x"
 
@@ -70,7 +73,28 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93
 endchoice
 
 choice
-	prompt "i.MX Silicon Revision"
+	prompt "i.MX 8ULP Silicon Revision"
+	default BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULPA2
+	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULP
+	help
+	  Some packages related to the selected i.MX platform need to
+	  know the silicon revision of the platform they will run on.
+
+	  Note - mismatches may result in a failure to boot!
+
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULPA0
+	bool "imx8ulpa0"
+
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULPA1
+	bool "imx8ulpa1"
+
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULPA2
+	bool "imx8ulpa2"
+
+endchoice
+
+choice
+	prompt "i.MX 93 Silicon Revision"
 	default BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93A1
 	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93
 	help
@@ -104,6 +128,7 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
 	default "IMX8MM" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
 	default "IMX8MN" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
 	default "IMX8MP" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP
+	default "IMX8ULP" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULP
 	default "IMX91" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91
 	default "IMX93" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93
 
@@ -130,12 +155,14 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULP || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL
 
 config BR2_PACKAGE_FREESCALE_IMX_HAS_ELE
 	bool
-	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91 || \
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULP || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91 || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93
 
 source "package/freescale-imx/imx-alsa-plugins/Config.in"
diff --git a/package/freescale-imx/firmware-ele-imx/Config.in b/package/freescale-imx/firmware-ele-imx/Config.in
index a99cbc3392..e8369f0102 100644
--- a/package/freescale-imx/firmware-ele-imx/Config.in
+++ b/package/freescale-imx/firmware-ele-imx/Config.in
@@ -15,6 +15,9 @@ if BR2_PACKAGE_FIRMWARE_ELE_IMX
 
 config BR2_PACKAGE_FIRMWARE_ELE_IMX_AHAB_CONTAINER_IMAGE
 	string
+	default "mx8ulpa0-ahab-container.img" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULPA0
+	default "mx8ulpa1-ahab-container.img" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULPA1
+	default "mx8ulpa2-ahab-container.img" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULPA2
 	default "mx93a0-ahab-container.img" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93A0
 	default "mx93a1-ahab-container.img" if \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91 || \
diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
index 63990947c8..4a9986448f 100644
--- a/package/freescale-imx/firmware-imx/Config.in
+++ b/package/freescale-imx/firmware-imx/Config.in
@@ -25,6 +25,7 @@ config BR2_PACKAGE_FIRMWARE_IMX_SDMA_FW_NAME
 	default "imx7d" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
 	default "imx7d" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
 	default "imx7d" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP
+	default "imx7d" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULP
 
 config BR2_PACKAGE_FIRMWARE_IMX_VPU_FW_NAME
 	string
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
