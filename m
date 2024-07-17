Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862F6C3DA5D
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 21:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4330740EEB;
	Wed, 17 Jul 2024 21:17:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lhg4PnE0MPkX; Wed, 17 Jul 2024 21:17:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0627040C0E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0627040C0E;
	Wed, 17 Jul 2024 21:17:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F13B1BF385
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 21:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0530F40C6F
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 21:17:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xWfOWcH82iTU for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 21:17:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 657ED40CA1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 657ED40CA1
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 21:17:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5F56C86D81; Wed, 17 Jul 2024 21:17:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Jul 2024 23:17:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f93f0d6a1451584db31689589868c5367dbcb7a7
X-Git-Newrev: 13ac570c9f7d1b29c5ffcc351d104a63c2557e36
X-Patchwork-Hint: ignore
Message-Id: <20240717211735.5F56C86D81@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/raspberrypi5: install BCM2712D0
 device-tree blob
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
Content-Type: multipart/mixed; boundary="===============4579755439605476147=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4579755439605476147==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=13ac570c9f7d1b29c5ffcc351d104a63c2557e36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This installs the new Raspberry Pi 5 BCM2712D0 device-tree blob[1].

[1]: https://github.com/raspberrypi/linux/commit/0328374ae09c7856e06a63af0c065822474a2985

Signed-off-by: Gaël PORTAY <gael.portay@rtone.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/raspberrypi/readme.txt   | 1 +
 configs/raspberrypi5_defconfig | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 24b7f619a3..81cd81a7f3 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -104,6 +104,7 @@ After building, you should obtain this tree:
     +-- bcm2711-rpi-cm4.dtb         [1]
     +-- bcm2711-rpi-cm4s.dtb        [1]
     +-- bcm2712-rpi-5-b.dtb         [1]
+    +-- bcm2712d0-rpi-5-b.dtb       [1]
     +-- boot.vfat
     +-- rootfs.ext4
     +-- rpi-firmware/
diff --git a/configs/raspberrypi5_defconfig b/configs/raspberrypi5_defconfig
index 3c88ce46cd..67026e0d6d 100644
--- a/configs/raspberrypi5_defconfig
+++ b/configs/raspberrypi5_defconfig
@@ -17,7 +17,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="bcm2712"
 
 # Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2712-rpi-5-b"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2712-rpi-5-b broadcom/bcm2712d0-rpi-5-b"
 
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 

--===============4579755439605476147==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4579755439605476147==--
