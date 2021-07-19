Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A949AC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:54:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 589A561037
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:54:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 589A561037
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 352EB605D8;
	Tue,  3 Aug 2021 23:54:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XRGi6KDRmIvs; Tue,  3 Aug 2021 23:54:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73CFE60591;
	Tue,  3 Aug 2021 23:54:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 332691BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FE3E40F6F
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DHl29y__cdfu for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB85D40608
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2E5FE8766C; Tue,  3 Aug 2021 21:10:10 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 19 Jul 2021 23:32:36 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 63198aaa171a4da4587b3ea190809c0f509a1f56
X-Git-Newrev: 9936af92c47cf191befecb667f4a977104baad5d
X-Patchwork-Hint: ignore
Message-Id: <20210803211010.2E5FE8766C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/imx7d-sdb: add
 extlinux.conf support
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=9936af92c47cf191befecb667f4a977104baad5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

imx7d-sdb has been converted to use disto boot in U-Boot.

Add extlinux.conf support so that the board can boot correctly.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Reviewed-by: Pierre-Jean Texier <texier.pj2@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/freescale/imx7dsdb/rootfs_overlay/boot/extlinux/extlinux.conf | 4 ++++
 configs/imx7d-sdb_defconfig                                         | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/board/freescale/imx7dsdb/rootfs_overlay/boot/extlinux/extlinux.conf b/board/freescale/imx7dsdb/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..d538b5d643
--- /dev/null
+++ b/board/freescale/imx7dsdb/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+Label imx7d-sabresd-buildroot
+  kernel /boot/zImage
+  devicetree /boot/imx7d-sdb.dtb
+  append root=PARTUUID=${uuid} rootwait rw console=${console},${baudrate}
diff --git a/configs/imx7d-sdb_defconfig b/configs/imx7d-sdb_defconfig
index 1a3494b4af..0c34f6e6df 100644
--- a/configs/imx7d-sdb_defconfig
+++ b/configs/imx7d-sdb_defconfig
@@ -17,6 +17,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7d-sdb"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
 # U-Boot
 BR2_TARGET_UBOOT=y
@@ -26,6 +27,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.01"
 BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y
 
 # Filesystem
+BR2_ROOTFS_OVERLAY="board/freescale/imx7dsdb/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
