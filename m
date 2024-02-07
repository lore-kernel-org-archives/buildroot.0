Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44AF5C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 19:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D919A420A3;
	Wed,  7 Feb 2024 19:47:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nMnRh6_vSuyN; Wed,  7 Feb 2024 19:47:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADF6742082
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADF6742082;
	Wed,  7 Feb 2024 19:47:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 96B691BF350
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 19:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90C2142082
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 19:47:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nPOYLOcqzylI for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 19:47:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 795A04207C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 795A04207C
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 19:47:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 652EC876BC; Wed,  7 Feb 2024 19:47:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 20:46:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 026338f66bdb2d9436898bd968a3f22995851b92
X-Git-Newrev: f003675119c9ca503afa19c04074e81c49538baf
X-Patchwork-Hint: ignore
Message-Id: <20240207194713.652EC876BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/avnet_rzboard_v2l: new defconfig
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
Content-Type: multipart/mixed; boundary="===============5983604521395678517=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5983604521395678517==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f003675119c9ca503afa19c04074e81c49538baf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds support for the AVNET RZBoard V2L.

The board support creates a bootable sd card image. The board is
shipped with a u-boot inside its eMMC. The board support uses this
u-boot and does not build and deploy a u-boot onto the sd card.

Instead the sd card only contains a uEnv.txt, a kernel image and the
rootfs.

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                            |  2 +
 board/avnet/rzboard_v2l/genimage.cfg  | 29 ++++++++++++++
 board/avnet/rzboard_v2l/post-image.sh |  5 +++
 board/avnet/rzboard_v2l/readme.txt    | 71 +++++++++++++++++++++++++++++++++++
 board/avnet/rzboard_v2l/uEnv.txt      |  3 ++
 configs/avnet_rzboard_v2l_defconfig   | 20 ++++++++++
 6 files changed, 130 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8e65a93122..1c6c84b05b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1889,8 +1889,10 @@ N:	Kieran Bingham <kieran.bingham@ideasonboard.com>
 F:	package/libcamera/
 
 N:	Kilian Zinnecker <kilian.zinnecker@mail.de>
+F:	board/avnet/rzboard_v2l/
 F:	board/radxa/rock5b/
 F:	configs/rock5b_defconfig
+F:	configs/avnet_rzboard_v2l_defconfig
 F:	package/rockchip-rkbin/
 
 N:	Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
diff --git a/board/avnet/rzboard_v2l/genimage.cfg b/board/avnet/rzboard_v2l/genimage.cfg
new file mode 100644
index 0000000000..94f35cb360
--- /dev/null
+++ b/board/avnet/rzboard_v2l/genimage.cfg
@@ -0,0 +1,29 @@
+# SD card image for RZBoard V2L
+
+image boot.vfat {
+	vfat {
+		files = {
+			"Image",
+			"rzboard.dtb",
+			"uEnv.txt"
+		}
+	}
+	size = 24M
+}
+
+image sdcard.img {
+	hdimage {
+		partition-table-type = "hybrid"
+	}
+
+	partition boot {
+		partition-type = "0xC"
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+	}
+}
diff --git a/board/avnet/rzboard_v2l/post-image.sh b/board/avnet/rzboard_v2l/post-image.sh
new file mode 100755
index 0000000000..25bef8f793
--- /dev/null
+++ b/board/avnet/rzboard_v2l/post-image.sh
@@ -0,0 +1,5 @@
+#!/usr/bin/env bash
+set -e
+
+cp board/avnet/rzboard_v2l/uEnv.txt "${BINARIES_DIR}"
+support/scripts/genimage.sh -c board/avnet/rzboard_v2l/genimage.cfg
diff --git a/board/avnet/rzboard_v2l/readme.txt b/board/avnet/rzboard_v2l/readme.txt
new file mode 100644
index 0000000000..24b5680874
--- /dev/null
+++ b/board/avnet/rzboard_v2l/readme.txt
@@ -0,0 +1,71 @@
+RZBoard V2L
+===========
+
+https://www.avnet.com/wps/portal/us/products/avnet-boards/avnet-board-families/rzboard-v2l/
+
+This board support creates a bootable sd card image for the AVNET RZBoard V2L.
+This board is shipped with a u-boot inside its eMMC. This board support uses
+that u-boot and only puts uEnv.txt, kernel image and rootfs onto the sd card.
+
+Build:
+======
+
+  $ make rzboard_v2l_defconfig
+  $ make
+
+Files created in output directory
+=================================
+
+output/images
+.
+├── Image
+├── boot.vfat
+├── rootfs.ext2
+├── rootfs.ext4
+├── rootfs.tar
+├── rzboard.dtb
+├── sdcard.img
+└── uEnv.txt
+
+Creating bootable SD card:
+==========================
+
+Simply invoke (as root)
+
+sudo dd if=output/images/sdcard.img of=/dev/sdX && sync
+
+Where X is your SD card device.
+
+Booting:
+========
+
+Configure board for sd card boot:
+---------------------------------
+Set the 'BOOT1' switch (next to the audio jack) to '1' (away from 'ON') in
+order to let the board boot kernel and rootfs from SD card.
+
+Serial console:
+---------------
+The RZBoard V2L has a 4-pin header "J19" right next to the micro USB. Its
+layout can be seen in the Quick-Start Guide, or the Hardware User Guide,
+obtainable from:
+https://www.avnet.com/wps/portal/us/products/avnet-boards/avnet-board-families/rzboard-v2l/
+
+The uart pins are as follows (from left to right - orientation according to the
+board's labeling):
+
+pin 1: n/a  (most away from the board's corner)
+pin 2: tx
+pin 3: rx
+pin 4: gnd  (nearest to the board's corner)
+
+Baudrate for this board is 115200.
+
+Power-Up:
+---------
+Plug in a suitable USB-C power supply and press the button 'S1' (next to the
+USB-C port) for 2 seconds until the LED goes on.
+
+Login:
+------
+Enter 'root' as login user, and the prompt is ready.
diff --git a/board/avnet/rzboard_v2l/uEnv.txt b/board/avnet/rzboard_v2l/uEnv.txt
new file mode 100644
index 0000000000..28b8acb8c6
--- /dev/null
+++ b/board/avnet/rzboard_v2l/uEnv.txt
@@ -0,0 +1,3 @@
+bootcmd=booti ${kernel_addr_r} - ${fdt_addr_r}
+uenvcmd=fatload mmc 0:1 ${kernel_addr_r} Image; fatload mmc 0:1 ${fdt_addr_r} rzboard.dtb
+bootargs=root=/dev/mmcblk0p2 rw rootfstype=ext4 earlyprintk console=ttyS0,115200 rootwait earlycon clk_ignore_unused debug
diff --git a/configs/avnet_rzboard_v2l_defconfig b/configs/avnet_rzboard_v2l_defconfig
new file mode 100644
index 0000000000..285aef39bc
--- /dev/null
+++ b/configs/avnet_rzboard_v2l_defconfig
@@ -0,0 +1,20 @@
+BR2_aarch64=y
+BR2_cortex_a55=y
+BR2_KERNEL_HEADERS_5_10=y
+BR2_TARGET_GENERIC_HOSTNAME="rzboard_v2l"
+BR2_TARGET_GENERIC_ISSUE="Welcome to the AVNET RZBoard V2L"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/avnet/rzboard_v2l/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Avnet/renesas-linux-cip.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="c197622df526c82ae9e3674e06b4092dac33eafa"
+BR2_LINUX_KERNEL_DEFCONFIG="rzboard"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="renesas/rzboard"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y

--===============5983604521395678517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5983604521395678517==--
