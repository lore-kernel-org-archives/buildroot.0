Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D39C3DA66
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 13:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDDFF605A7;
	Fri, 25 Aug 2023 13:14:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDDFF605A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M8BMazitzRvy; Fri, 25 Aug 2023 13:14:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21E5261486;
	Fri, 25 Aug 2023 13:14:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21E5261486
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6C63C1BF82F
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 13:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5306B40A57
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 13:13:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5306B40A57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nJy2zGuTg3GC for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 13:13:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8998A402E0
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 13:13:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8998A402E0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 78D118630A; Fri, 25 Aug 2023 13:13:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 23 Aug 2023 23:39:14 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 186732748c7dbf3623595ec66d60b32350ac053f
X-Git-Newrev: 1c9af7406429d9eb1b7eaf99b7cf031c7b913d63
X-Patchwork-Hint: ignore
Message-Id: <20230825131356.78D118630A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 package/freescale-imx/firmware-imx: ensure the linux firmware is installed
 first
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

commit: https://git.buildroot.net/buildroot/commit/?id=1c9af7406429d9eb1b7eaf99b7cf031c7b913d63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

There was some imx SDMA firmware in the base linux-firmware package at
one time, but the firmware-imx is updated with the latest versions
from NXP releases.

This just ensures a dependency is set so that the firmware-imx package
will always come later in case an overlap occurs again.

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
Reviewed-by: Gary Bisson <bisson.gary@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 70ff5377f233ff936d31956b4c2747280d25d289)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freescale-imx/firmware-imx/firmware-imx.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 99fe71a91c..4cceb67019 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -14,6 +14,10 @@ FIRMWARE_IMX_REDISTRIBUTE = NO
 
 FIRMWARE_IMX_INSTALL_IMAGES = YES
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE),y)
+FIRMWARE_IMX_DEPENDENCIES += linux-firmware
+endif
+
 define FIRMWARE_IMX_EXTRACT_CMDS
 	$(call NXP_EXTRACT_HELPER,$(FIRMWARE_IMX_DL_DIR)/$(FIRMWARE_IMX_SOURCE))
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
