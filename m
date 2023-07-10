Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C608EB64DA
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 19:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A214140B5D;
	Mon, 10 Jul 2023 19:24:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A214140B5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vtbPkz_w1aEa; Mon, 10 Jul 2023 19:24:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E94CD40291;
	Mon, 10 Jul 2023 19:24:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E94CD40291
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 63A0C1BF3A1
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 19:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D43440B5D
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 19:24:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D43440B5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dE8tQ4JEhew7 for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 19:24:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F97F40291
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 19:24:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F97F40291
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C92486CD1; Mon, 10 Jul 2023 19:24:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 10 Jul 2023 21:23:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 70ff5377f233ff936d31956b4c2747280d25d289
X-Git-Newrev: 794b9e993273fbaa4e814f9a4b3e62c633d8d117
X-Patchwork-Hint: ignore
Message-Id: <20230710192400.6C92486CD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/imx-seco: add the
 imx8dxl b0 revsision ahab image
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

commit: https://git.buildroot.net/buildroot/commit/?id=794b9e993273fbaa4e814f9a4b3e62c633d8d117
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the selection of the ahab container images for the imx8dxl
asics. The initial support assumed these were imx8 but this is
actually the imx8x architecture as well. This was fixed when run on
the first tests against the imx8dxl SoCs.

Files from upstream:
    mx8dxla0-ahab-container.img
    mx8dxla1-ahab-container.img
    mx8dxlb0-ahab-container.img

The B0 revision should be considered the latest

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/imx-seco/Config.in | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-seco/Config.in b/package/freescale-imx/imx-seco/Config.in
index 867ffe1bb0..41f8444651 100644
--- a/package/freescale-imx/imx-seco/Config.in
+++ b/package/freescale-imx/imx-seco/Config.in
@@ -22,11 +22,15 @@ choice
 
 config BR2_PACKAGE_IMX_SECO_MX8DXLA0
 	bool "imx-seco-mx8dxla0"
-	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
+	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
 
 config BR2_PACKAGE_IMX_SECO_MX8DXLA1
 	bool "imx-seco-mx8dxla1"
-	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
+	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
+
+config BR2_PACKAGE_IMX_SECO_MX8DXLB0
+	bool "imx-seco-mx8dxlb0"
+	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
 
 config BR2_PACKAGE_IMX_SECO_MX8QMB0
 	bool "imx-seco-mx8qmb0"
@@ -46,6 +50,7 @@ config BR2_PACKAGE_IMX_SECO_AHAB_CONTAINER_IMAGE
 	string
 	default "mx8dxla0-ahab-container.img" if BR2_PACKAGE_IMX_SECO_MX8DXLA0
 	default "mx8dxla1-ahab-container.img" if BR2_PACKAGE_IMX_SECO_MX8DXLA1
+	default "mx8dxlb0-ahab-container.img" if BR2_PACKAGE_IMX_SECO_MX8DXLB0
 	default "mx8qmb0-ahab-container.img" if BR2_PACKAGE_IMX_SECO_MX8QMB0
 	default "mx8qxb0-ahab-container.img" if BR2_PACKAGE_IMX_SECO_MX8QXB0
 	default "mx8qxc0-ahab-container.img" if BR2_PACKAGE_IMX_SECO_MX8QXC0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
