Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7335C3DA62
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 21:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D80040E9D;
	Wed, 17 Jul 2024 21:17:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0N5sUEPRk9qj; Wed, 17 Jul 2024 21:17:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C1C040EA9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C1C040EA9;
	Wed, 17 Jul 2024 21:17:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4AA751BF385
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 21:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45A6860B14
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 21:17:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uQFU6wkqAdho for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 21:17:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E831360AD0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E831360AD0
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 21:17:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DED4186D80; Wed, 17 Jul 2024 21:17:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Jul 2024 23:11:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c51f9881d6737ba63ae4ce6f1ea436eeec364e09
X-Git-Newrev: 68967524427d8a53dd6458fe408960d1383980f1
X-Patchwork-Hint: ignore
Message-Id: <20240717211734.DED4186D80@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/raspberrypi: install Raspberry Pi
 rev 1.0 device-tree blob
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
Content-Type: multipart/mixed; boundary="===============2745178370831423718=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2745178370831423718==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=68967524427d8a53dd6458fe408960d1383980f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This installs Raspberry Pi Model B rev 1.0 device-tree blob.

Signed-off-by: Gaël PORTAY <gael.portay@rtone.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/raspberrypi/readme.txt  | 1 +
 configs/raspberrypi_defconfig | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index aa6421ea01..cbd9a57a63 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -87,6 +87,7 @@ Result of the build
 After building, you should obtain this tree:
 
     output/images/
+    +-- bcm2708-rpi-b-rev1.dtb      [1]
     +-- bcm2708-rpi-b.dtb           [1]
     +-- bcm2708-rpi-b-plus.dtb      [1]
     +-- bcm2708-rpi-cm.dtb          [1]
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 03c81ebf39..c6b296e1af 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -20,7 +20,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 
 # Build the DTBs for A/B, A+/B+ and compute module from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2708-rpi-b broadcom/bcm2708-rpi-b-plus broadcom/bcm2708-rpi-cm"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2708-rpi-b-rev1 broadcom/bcm2708-rpi-b broadcom/bcm2708-rpi-b-plus broadcom/bcm2708-rpi-cm"
 
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 

--===============2745178370831423718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2745178370831423718==--
