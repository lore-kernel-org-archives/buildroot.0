Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50A0C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 793B04EEBB;
	Tue, 21 Feb 2023 00:21:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 793B04EEBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dlU0oKBXRARu; Tue, 21 Feb 2023 00:21:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41E214F2AA;
	Tue, 21 Feb 2023 00:21:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41E214F2AA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 572721BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3855C417D4
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3855C417D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6_w8spLE8__L for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 615A0417CC
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 615A0417CC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D7D78648F; Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 10:05:19 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 010de6d5c7e2ebafe08234e32818bc0db2ebc569
X-Git-Newrev: 588ccf38618e1d9401f6636c7565424d438a51b2
X-Patchwork-Hint: ignore
Message-Id: <20230220205251.5D7D78648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/beaglebone: bump
 U-Boot version to 2022.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=588ccf38618e1d9401f6636c7565424d438a51b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Starting from version 2021.10 only distro booting is supported, as
reported by commit ff8f277e9121 ("ti: am335x_evm: Switch to DISTRO_BOOT only").
The patch allows to update U-Boot to versions later than 2021.10.

Tested on beaglebone black.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/beaglebone/extlinux.conf | 4 ++++
 board/beaglebone/genimage.cfg  | 1 +
 board/beaglebone/post-build.sh | 2 ++
 configs/beaglebone_defconfig   | 2 +-
 4 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/board/beaglebone/extlinux.conf b/board/beaglebone/extlinux.conf
new file mode 100644
index 0000000000..13affcabd4
--- /dev/null
+++ b/board/beaglebone/extlinux.conf
@@ -0,0 +1,4 @@
+label beaglebone-buildroot
+  kernel /zImage
+  fdtdir /
+  append console=ttyS0,115200n8 root=/dev/mmcblk0p2 rw rootfstype=ext4 rootwait
diff --git a/board/beaglebone/genimage.cfg b/board/beaglebone/genimage.cfg
index 987d205075..4b026fda84 100644
--- a/board/beaglebone/genimage.cfg
+++ b/board/beaglebone/genimage.cfg
@@ -12,6 +12,7 @@ image boot.vfat {
 			"am335x-bonegreen.dtb",
 			"am335x-boneblack-wireless.dtb",
 			"am335x-bonegreen-wireless.dtb",
+			"extlinux"
 		}
 	}
 
diff --git a/board/beaglebone/post-build.sh b/board/beaglebone/post-build.sh
index ffdd19138c..b7afd92ffe 100755
--- a/board/beaglebone/post-build.sh
+++ b/board/beaglebone/post-build.sh
@@ -2,3 +2,5 @@
 BOARD_DIR="$(dirname $0)"
 
 cp $BOARD_DIR/uEnv.txt $BINARIES_DIR/uEnv.txt
+
+install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux/extlinux.conf
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 3ce5721265..d0aa5ad860 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -34,7 +34,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
