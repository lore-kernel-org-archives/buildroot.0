Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABF8C3DA60
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 21:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C81CC40C15;
	Wed, 17 Jul 2024 21:17:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jMUiJoIUHUf9; Wed, 17 Jul 2024 21:17:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C06C40C0E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C06C40C0E;
	Wed, 17 Jul 2024 21:17:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CFF8F1BF385
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 21:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDFE860B1E
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 21:17:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5NUJ9zWxk5dB for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 21:17:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13CE360B14
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13CE360B14
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 21:17:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F2BE586D81; Wed, 17 Jul 2024 21:17:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Jul 2024 23:11:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 68967524427d8a53dd6458fe408960d1383980f1
X-Git-Newrev: e84f74dadbde5d7840f8a98ca83680267aac1625
X-Patchwork-Hint: ignore
Message-Id: <20240717211734.F2BE586D81@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/raspberrypi2: install Raspberry Pi
 2 rev 1.2 device-tree blob
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
Content-Type: multipart/mixed; boundary="===============3926100952840840545=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3926100952840840545==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e84f74dadbde5d7840f8a98ca83680267aac1625
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This installs Raspberry Pi 2 Model B rev 1.2 device-tree blob.

Note: Raspberry Pi 2 Model B vev 1.2 switched to BCM2837[1][2].

[1]: https://www.raspberrypi.com/documentation/computers/raspberry-pi.html#flagship-series
[2]: https://www.raspberrypi.com/documentation/computers/processors.html#bcm2837

Signed-off-by: Gaël PORTAY <gael.portay@rtone.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/raspberrypi/readme.txt   | 1 +
 configs/raspberrypi2_defconfig | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index cbd9a57a63..0499fe0d51 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -95,6 +95,7 @@ After building, you should obtain this tree:
     +-- bcm2708-rpi-zero-w.dtb      [1]
     +-- bcm2710-rpi-zero-2-w.dtb    [1]
     +-- bcm2709-rpi-2-b.dtb         [1]
+    +-- bcm2710-rpi-2-b.dtb         [1]
     +-- bcm2710-rpi-3-b.dtb         [1]
     +-- bcm2710-rpi-3-b-plus.dtb    [1]
     +-- bcm2710-rpi-cm3.dtb         [1]
diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index 05870cc6e1..75310fdb28 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -21,7 +21,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2709-rpi-2-b"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2709-rpi-2-b broadcom/bcm2710-rpi-2-b"
 
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 

--===============3926100952840840545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3926100952840840545==--
