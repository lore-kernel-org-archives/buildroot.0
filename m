Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601ADC3DA60
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 21:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24ED540ECC;
	Wed, 17 Jul 2024 21:17:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4x9bq4YY49UM; Wed, 17 Jul 2024 21:17:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD00C40EC3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD00C40EC3;
	Wed, 17 Jul 2024 21:17:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 19E331BF980
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 21:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E84840C0E
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 21:17:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rtHEEpb4DjzP for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 21:17:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4155B40C6F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4155B40C6F
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 21:17:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B71D86D81; Wed, 17 Jul 2024 21:17:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Jul 2024 23:13:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 51090999ca3c817237b35022ce245a89562236c5
X-Git-Newrev: b872f0c72493a8e28f31c13d3dd167411b780179
X-Patchwork-Hint: ignore
Message-Id: <20240717211735.3B71D86D81@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/raspberrypi4*: install Raspberry
 Pi 400 device-tree blob
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
Content-Type: multipart/mixed; boundary="===============0712224993986321580=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0712224993986321580==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b872f0c72493a8e28f31c13d3dd167411b780179
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This installs the device-tree blob for the Raspberry Pi 400.

Signed-off-by: Gaël PORTAY <gael.portay@rtone.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/raspberrypi/readme.txt      | 1 +
 configs/raspberrypi4_64_defconfig | 2 +-
 configs/raspberrypi4_defconfig    | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 78c551579a..485a8d8827 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -100,6 +100,7 @@ After building, you should obtain this tree:
     +-- bcm2710-rpi-3-b-plus.dtb    [1]
     +-- bcm2710-rpi-cm3.dtb         [1]
     +-- bcm2711-rpi-4-b.dtb         [1]
+    +-- bcm2711-rpi-400.dtb         [1]
     +-- bcm2711-rpi-cm4.dtb         [1]
     +-- bcm2712-rpi-5-b.dtb         [1]
     +-- boot.vfat
diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
index 5c6698fb37..7ac0ad49cc 100644
--- a/configs/raspberrypi4_64_defconfig
+++ b/configs/raspberrypi4_64_defconfig
@@ -20,7 +20,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 
 # Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-4-b"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-4-b broadcom/bcm2711-rpi-400"
 
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
diff --git a/configs/raspberrypi4_defconfig b/configs/raspberrypi4_defconfig
index c14b77eacd..241f78f2c1 100644
--- a/configs/raspberrypi4_defconfig
+++ b/configs/raspberrypi4_defconfig
@@ -20,7 +20,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 
 # Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-4-b"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-4-b broadcom/bcm2711-rpi-400"
 
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 

--===============0712224993986321580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0712224993986321580==--
