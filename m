Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC26C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 330834EC88;
	Mon, 20 Feb 2023 22:31:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 330834EC88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WLSC-zqOz-Tf; Mon, 20 Feb 2023 22:31:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2D124F0FB;
	Mon, 20 Feb 2023 22:31:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2D124F0FB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4061B1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2621A4015F
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2621A4015F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BKGCFeh1S2E0 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3C26416C3
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3C26416C3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E2DB486494; Mon, 20 Feb 2023 20:52:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Dec 2022 15:53:20 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2a2db09451371d317ee119d742a62817d5f41c5f
X-Git-Newrev: 286628bcc2d1931807c4648ef4359873bb3ee559
X-Patchwork-Hint: ignore
Message-Id: <20230220205212.E2DB486494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/lichee_rv: new
 defconfig
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=286628bcc2d1931807c4648ef4359873bb3ee559
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Lichee RV - Nezha CM is a compute module with modular design, equipped
with Allwinner D1 chip (based on T-Head XuanTie C906 core), 512MB DDR3
RAM.
Board support is based on the nezha defconfig already available in
buildroot.

https://wiki.sipeed.com/hardware/en/lichee/RV/RV.html
https://linux-sunxi.org/Sipeed_Lichee_RV

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Reviewed-by: Indrek Kruusa <indrek.kruusa@gmail.com>
Tested-by: Indrek Kruusa <indrek.kruusa@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  2 ++
 board/sipeed/lichee_rv/genimage.cfg                | 19 +++++++++++++
 .../lichee_rv/overlay/boot/extlinux/extlinux.conf  |  4 +++
 board/sipeed/lichee_rv/readme.txt                  | 26 +++++++++++++++++
 configs/sipeed_lichee_rv_defconfig                 | 33 ++++++++++++++++++++++
 5 files changed, 84 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b52a065dbc..2f27ddb110 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -157,6 +157,8 @@ N:	Andrey Yurovsky <yurovsky@gmail.com>
 F:	package/rauc/
 
 N:	Angelo Compagnucci <angelo.compagnucci@gmail.com>
+F:	board/sipeed/lichee_rv/
+F:	configs/sipeed_lichee_rv*
 F:	package/apparmor/
 F:	package/corkscrew/
 F:	package/cups/
diff --git a/board/sipeed/lichee_rv/genimage.cfg b/board/sipeed/lichee_rv/genimage.cfg
new file mode 100644
index 0000000000..d5df41203d
--- /dev/null
+++ b/board/sipeed/lichee_rv/genimage.cfg
@@ -0,0 +1,19 @@
+# Minimal SD card image for the sipeed Lichee RV
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		in-partition-table = false
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8K
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		bootable = "true"
+		offset = 1M
+	}
+}
diff --git a/board/sipeed/lichee_rv/overlay/boot/extlinux/extlinux.conf b/board/sipeed/lichee_rv/overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..91b2298628
--- /dev/null
+++ b/board/sipeed/lichee_rv/overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label linux
+  kernel /boot/Image
+  # use devicetree from u-boot
+  append console=ttyS0,115200 root=/dev/mmcblk0p1 ro rootwait
diff --git a/board/sipeed/lichee_rv/readme.txt b/board/sipeed/lichee_rv/readme.txt
new file mode 100644
index 0000000000..24e8141851
--- /dev/null
+++ b/board/sipeed/lichee_rv/readme.txt
@@ -0,0 +1,26 @@
+Lichee RV
+===============
+
+Lichee RV - Nezha CM is a compute module with modular design, equipped
+with Allwinner D1 chip (based on T-Head XuanTie C906 core), 512MB DDR3 RAM.
+It can boot from TF card or SD-NAND, uses two sets of M.2 b key 67 pin
+connectors to route all IO, making it convient for wide use and easy to replace.
+
+How to build
+============
+
+$ make sipeed_lichee_rv_defconfig
+$ make
+
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+
+Connect a TTL UART to the debug connector, insert the microSD card and
+plug in a USB-C cable to the PWR connector to boot the system.
diff --git a/configs/sipeed_lichee_rv_defconfig b/configs/sipeed_lichee_rv_defconfig
new file mode 100644
index 0000000000..f9782f870b
--- /dev/null
+++ b/configs/sipeed_lichee_rv_defconfig
@@ -0,0 +1,33 @@
+BR2_riscv=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0=y
+BR2_ROOTFS_OVERLAY="board/sipeed/lichee_rv/overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sipeed/lichee_rv/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,linux,ca67838d84af4c9f85d06311c9e98e1adf46308f)/linux-ca67838d84af4c9f85d06311c9e98e1adf46308f.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="nezha"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun20i-d1-lichee-rv"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_OPENSBI=y
+BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
+BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.1"
+BR2_TARGET_OPENSBI_PLAT="generic"
+# BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,u-boot,528ae9bc6c55edd3ffe642734b4132a8246ea777)/uboot-528ae9bc6c55edd3ffe642734b4132a8246ea777.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="lichee_rv_dock"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+BR2_PACKAGE_HOST_GENIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
