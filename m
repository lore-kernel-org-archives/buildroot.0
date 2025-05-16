Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D80C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 19:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB798608BE;
	Fri, 16 May 2025 19:25:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id efMH7_1Obx5Q; Fri, 16 May 2025 19:25:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0639E612FC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0639E612FC;
	Fri, 16 May 2025 19:25:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F3C91F5
 for <buildroot@buildroot.org>; Fri, 16 May 2025 19:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50BF6612FC
 for <buildroot@buildroot.org>; Fri, 16 May 2025 19:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ry7XLslBRwl3 for <buildroot@buildroot.org>;
 Fri, 16 May 2025 19:25:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CFAB60A95
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CFAB60A95
 for <buildroot@buildroot.org>; Fri, 16 May 2025 19:25:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D74686D6E; Fri, 16 May 2025 19:25:40 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 21:24:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0645c83cd6a6d2caf1fdc62cbed81023fb509a2a
X-Git-Newrev: 1ce2484a8b11e51e0ecaa23c9ee9e6f1c7702b10
X-Patchwork-Hint: ignore
Message-Id: <20250516192540.8D74686D6E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/firmware-ele-imx:
 add support for i.MX 91 A0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1ce2484a8b11e51e0ecaa23c9ee9e6f1c7702b10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit [1] introduced the firmware-ele-imx package and was
using the "mx93a1-ahab-container.img" firmware image for i.MX91.

For i.MX91, it is in fact the firmware file "mx91a0-ahab-container.img"
which needs to be used.

This commit adds this special case.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/69d127fe29dc8ca0321588ed19f14f644ff7e910

Signed-off-by: Juan Pablo MONTERO CASTRO <juanpablo.monterocastro@nxp.com>
[Julien: split original commit 2/3]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freescale-imx/firmware-ele-imx/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/firmware-ele-imx/Config.in b/package/freescale-imx/firmware-ele-imx/Config.in
index e8369f0102..d8a55ed219 100644
--- a/package/freescale-imx/firmware-ele-imx/Config.in
+++ b/package/freescale-imx/firmware-ele-imx/Config.in
@@ -19,8 +19,7 @@ config BR2_PACKAGE_FIRMWARE_ELE_IMX_AHAB_CONTAINER_IMAGE
 	default "mx8ulpa1-ahab-container.img" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULPA1
 	default "mx8ulpa2-ahab-container.img" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULPA2
 	default "mx93a0-ahab-container.img" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93A0
-	default "mx93a1-ahab-container.img" if \
-		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91 || \
-		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93A1
+	default "mx93a1-ahab-container.img" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93A1
+	default "mx91a0-ahab-container.img" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91A0
 
 endif # BR2_PACKAGE_FIRMWARE_ELE_IMX
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
