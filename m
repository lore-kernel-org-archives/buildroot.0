Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E5CC4332F
	for <buildroot@archiver.kernel.org>; Fri, 25 Nov 2022 22:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D01EC81E09;
	Fri, 25 Nov 2022 22:19:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D01EC81E09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T790gknEnXrm; Fri, 25 Nov 2022 22:19:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DAF081CC3;
	Fri, 25 Nov 2022 22:19:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DAF081CC3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7A3C01BF3D0
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 22:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 551D941758
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 22:18:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 551D941758
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tknd1vIWme5r for <buildroot@lists.busybox.net>;
 Fri, 25 Nov 2022 22:18:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45B1541753
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 22:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45B1541753
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 32C54846FC; Fri, 25 Nov 2022 22:18:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 25 Nov 2022 23:18:27 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b49d8c03da2dc25aa28f14a3db1d38298221c7c3
X-Git-Newrev: d76a277a0e0a0f9703f0e0c2b0e313db9a834d7d
X-Patchwork-Hint: ignore
Message-Id: <20221125221857.32C54846FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/ls1028ardb: add video
 with Cadence DP firmware
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

commit: https://git.buildroot.net/buildroot/commit/?id=d76a277a0e0a0f9703f0e0c2b0e313db9a834d7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/freescale/ls1028ardb/readme.txt                            | 9 +++++++++
 .../ls1028ardb/rootfs_overlay/boot/extlinux/extlinux.conf        | 2 +-
 configs/ls1028ardb_defconfig                                     | 3 +++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/board/freescale/ls1028ardb/readme.txt b/board/freescale/ls1028ardb/readme.txt
index 93396a4199..2dd2e2d84b 100644
--- a/board/freescale/ls1028ardb/readme.txt
+++ b/board/freescale/ls1028ardb/readme.txt
@@ -58,3 +58,12 @@ To boot your newly created system:
 - put a DB9F cable into the UART1 Port and connect using a terminal
   emulator at 115200 bps, 8n1;
 - power on the board.
+
+The Cadence DP (Display Port) firmware must loaded from uboot with the following commands:
+
+  => ext2load mmc 0 0x80000000 /boot/ls1028a-dp-fw.bin
+  102464 bytes read in 24 ms (4.1 MiB/s)
+  => hdp load 0x80000000 0x2000
+  Loading hdp firmware from 0x0000000080000000 offset 0x0000000000002000
+  Loading hdp firmware Complete
+  => boot
diff --git a/board/freescale/ls1028ardb/rootfs_overlay/boot/extlinux/extlinux.conf b/board/freescale/ls1028ardb/rootfs_overlay/boot/extlinux/extlinux.conf
index c08ddde10d..bd6c7c95c3 100644
--- a/board/freescale/ls1028ardb/rootfs_overlay/boot/extlinux/extlinux.conf
+++ b/board/freescale/ls1028ardb/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -1,4 +1,4 @@
 label ls1028ardb-buildroot
   kernel /boot/Image
   devicetree /boot/fsl-ls1028a-rdb.dtb
-  append root=/dev/mmcblk0p1 rootwait
+  append root=/dev/mmcblk0p1 rootwait video=1920x1080-32@60 cma=256M
diff --git a/configs/ls1028ardb_defconfig b/configs/ls1028ardb_defconfig
index 22b9eb426a..1bc84f7b80 100644
--- a/configs/ls1028ardb_defconfig
+++ b/configs/ls1028ardb_defconfig
@@ -26,6 +26,9 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-ls1028a-rdb"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
+# Target package
+BR2_PACKAGE_QORIQ_CADENCE_DP_FIRMWARE=y
+
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
