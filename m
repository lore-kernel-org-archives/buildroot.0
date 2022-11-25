Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6F9C47089
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 12:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B5054057C;
	Mon,  5 Dec 2022 12:07:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B5054057C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gWQ47Ywycy00; Mon,  5 Dec 2022 12:07:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 656274052D;
	Mon,  5 Dec 2022 12:07:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 656274052D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 423581BF8C7
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 039FC416B6
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 039FC416B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BUATtpfDZRai for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26D62415D6
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26D62415D6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21DBC85BA3; Mon,  5 Dec 2022 11:26:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 25 Nov 2022 23:18:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b49d8c03da2dc25aa28f14a3db1d38298221c7c3
X-Git-Newrev: d76a277a0e0a0f9703f0e0c2b0e313db9a834d7d
X-Patchwork-Hint: ignore
Message-Id: <20221205112612.21DBC85BA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/ls1028ardb: add video with Cadence
 DP firmware
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
