Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02214C433FE
	for <buildroot@archiver.kernel.org>; Fri, 11 Nov 2022 13:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A84640BE9;
	Fri, 11 Nov 2022 13:35:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A84640BE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FPMvImq7KRar; Fri, 11 Nov 2022 13:35:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8622A40BDE;
	Fri, 11 Nov 2022 13:35:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8622A40BDE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 090141BF860
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 13:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8D2E81F45
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 13:35:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8D2E81F45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7LpBT89Cj3qm for <buildroot@lists.busybox.net>;
 Fri, 11 Nov 2022 13:35:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC86B81F4C
 for <buildroot@buildroot.org>; Fri, 11 Nov 2022 13:35:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC86B81F4C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C705682C83; Fri, 11 Nov 2022 13:35:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 11 Nov 2022 14:34:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 593c64eaf9d2f03d1a0164c114caffa2f4546f5b
X-Git-Newrev: 5370ec74516495a4ac6c0bc9780b8e92a2f1e6b1
X-Patchwork-Hint: ignore
Message-Id: <20221111133521.C705682C83@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/roc_pc_rk3399: remove defconfig
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
Content-Type: multipart/mixed; boundary="===============5922939416661214084=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5922939416661214084==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5370ec74516495a4ac6c0bc9780b8e92a2f1e6b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This defconfig has been failing to build for several months, with
nobody stepping up to fix it. It's time to drop it.

See
https://lore.kernel.org/buildroot/20220806224338.0159e15c@windsurf/
for a notification on August 6, 2022 about the issues with this
defconfig.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3259671226

Cc: Suniel Mahesh <sunil@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                |  2 --
 board/firefly/roc-rk3399-pc/extlinux.conf |  4 ----
 board/firefly/roc-rk3399-pc/genimage.cfg  | 22 -----------------
 board/firefly/roc-rk3399-pc/post-build.sh |  5 ----
 board/firefly/roc-rk3399-pc/readme.txt    | 40 -------------------------------
 5 files changed, 73 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 81e6cd54ab..c282a867ce 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2728,13 +2728,11 @@ F:	package/hwloc/
 F:	package/powertop/
 
 N:	Suniel Mahesh <sunil@amarulasolutions.com>
-F:	board/firefly/
 F:	board/friendlyarm/nanopi-m4
 F:	board/pine64/rockpro64
 F:	board/radxa/rockpi-4
 F:	board/radxa/rockpi-n8
 F:	board/radxa/rockpi-n10
-F:	configs/roc_pc_rk3399_defconfig
 F:	configs/rock_pi_4_defconfig
 F:	configs/rock_pi_n8_defconfig
 F:	configs/rock_pi_n10_defconfig
diff --git a/board/firefly/roc-rk3399-pc/extlinux.conf b/board/firefly/roc-rk3399-pc/extlinux.conf
deleted file mode 100644
index 50a358fadc..0000000000
--- a/board/firefly/roc-rk3399-pc/extlinux.conf
+++ /dev/null
@@ -1,4 +0,0 @@
-label RK3399RocPC linux
-  kernel /boot/Image
-  devicetree /boot/rk3399-roc-pc.dtb
-  append earlycon=uart8250,mmio32,0xff1a0000 root=/dev/mmcblk0p1 rootwait
diff --git a/board/firefly/roc-rk3399-pc/genimage.cfg b/board/firefly/roc-rk3399-pc/genimage.cfg
deleted file mode 100644
index 966c869273..0000000000
--- a/board/firefly/roc-rk3399-pc/genimage.cfg
+++ /dev/null
@@ -1,22 +0,0 @@
-image sdcard.img {
-	hdimage {
-	}
-
-	partition u-boot-tpl-spl-dtb {
-		in-partition-table = "no"
-		image = "idbloader.img"
-		offset = 32K
-	}
-
-	partition u-boot-dtb {
-		in-partition-table = "no"
-		image = "u-boot.itb"
-		offset = 8M
-		size = 30M
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-	}
-}
diff --git a/board/firefly/roc-rk3399-pc/post-build.sh b/board/firefly/roc-rk3399-pc/post-build.sh
deleted file mode 100755
index 1f5ff6a611..0000000000
--- a/board/firefly/roc-rk3399-pc/post-build.sh
+++ /dev/null
@@ -1,5 +0,0 @@
-#!/bin/sh
-
-BOARD_DIR="$(dirname $0)"
-
-install -m 0644 -D $BOARD_DIR/extlinux.conf $TARGET_DIR/boot/extlinux/extlinux.conf
diff --git a/board/firefly/roc-rk3399-pc/readme.txt b/board/firefly/roc-rk3399-pc/readme.txt
deleted file mode 100644
index 8a6f1cdee6..0000000000
--- a/board/firefly/roc-rk3399-pc/readme.txt
+++ /dev/null
@@ -1,40 +0,0 @@
-Libre Computer Board ROC-RK3399-PC
-===================================
-
-Build:
-
-  $ make roc_pc_rk3399_defconfig
-  $ make
-
-Files created in output directory
-=================================
-
-output/images
-
-├── bl31.elf
-├── idbloader.img
-├── Image
-├── rk3399-roc-pc.dtb
-├── rootfs.ext2
-├── rootfs.ext4 -> rootfs.ext2
-├── rootfs.tar
-├── sdcard.img
-├── u-boot.bin
-└── u-boot.itb
-
-Creating bootable SD card:
-==========================
-
-Simply invoke (as root)
-
-sudo dd if=output/images/sdcard.img of=/dev/sdX && sync
-
-Where X is your SD card device
-
-Serial console
---------------
-
-Baudrate for this board is 1500000
-
-Wiki link:
-https://wiki.amarulasolutions.com/bsp/rockchip/rk3399/roc-rk3399-pc.html

--===============5922939416661214084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5922939416661214084==--
