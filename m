Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6165C47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7079A43731;
	Wed, 10 Jan 2024 20:49:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7079A43731
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RakJlqMnoaZo; Wed, 10 Jan 2024 20:49:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7EB144379C;
	Wed, 10 Jan 2024 20:49:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7EB144379C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E284E1BF5B3
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA034436EF
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:49:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA034436EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AGsW058ggXxf for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:49:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB64E436D7
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:49:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB64E436D7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A998D85DB9; Wed, 10 Jan 2024 20:49:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 21:46:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3bd02f8f923aedb42fd08703f6d8f95db29001bb
X-Git-Newrev: 2bcfb2549bef46c59886c94def693b3c22a5deec
X-Patchwork-Hint: ignore
Message-Id: <20240110204909.A998D85DB9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/imxrt1050-evk: Use zImage instead
 of uImage
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

commit: https://git.buildroot.net/buildroot/commit/?id=2bcfb2549bef46c59886c94def693b3c22a5deec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

imxrt1050-evk was using uImage switch to using zImage
now.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/freescale/imxrt1050evk/genimage.cfg   | 2 +-
 board/freescale/imxrt1050evk/uboot.fragment | 2 +-
 configs/imxrt1050-evk_defconfig             | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/freescale/imxrt1050evk/genimage.cfg b/board/freescale/imxrt1050evk/genimage.cfg
index daa51bdbe0..64fc8452f8 100644
--- a/board/freescale/imxrt1050evk/genimage.cfg
+++ b/board/freescale/imxrt1050evk/genimage.cfg
@@ -1,7 +1,7 @@
 image boot.vfat {
 	vfat {
 		files = {
-			"uImage",
+			"zImage",
 			"imxrt1050-evk.dtb",
 		}
 	}
diff --git a/board/freescale/imxrt1050evk/uboot.fragment b/board/freescale/imxrt1050evk/uboot.fragment
index 1c5bb6af35..dd45ca4c29 100644
--- a/board/freescale/imxrt1050evk/uboot.fragment
+++ b/board/freescale/imxrt1050evk/uboot.fragment
@@ -1,2 +1,2 @@
 CONFIG_USE_BOOTCOMMAND=y
-CONFIG_BOOTCOMMAND="setenv bootargs console=ttyLP0 root=/dev/mmcblk0p2 rw earlycon rootwait;load mmc 0:1 0x80800000 imxrt1050-evk.dtb;load mmc 0:1 0x80000000 uImage;bootm 0x80000000 - 0x80800000"
+CONFIG_BOOTCOMMAND="setenv bootargs console=ttyLP0 root=/dev/mmcblk0p2 rw earlycon rootwait;load mmc 0:1 0x80800000 imxrt1050-evk.dtb;load mmc 0:1 0x80000000 zImage;bootz 0x80000000 - 0x80800000"
diff --git a/configs/imxrt1050-evk_defconfig b/configs/imxrt1050-evk_defconfig
index 3eb556df06..947abe5df2 100644
--- a/configs/imxrt1050-evk_defconfig
+++ b/configs/imxrt1050-evk_defconfig
@@ -14,7 +14,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.7"
 BR2_LINUX_KERNEL_DEFCONFIG="imxrt"
-BR2_LINUX_KERNEL_UIMAGE=y
+BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imxrt1050-evk"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
