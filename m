Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888A6C04FFE
	for <buildroot@archiver.kernel.org>; Wed, 15 May 2024 01:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D31B60623;
	Wed, 15 May 2024 01:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id baU03O6qMFFY; Wed, 15 May 2024 01:09:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2909A6069B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2909A6069B;
	Wed, 15 May 2024 01:09:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 843921BF2CD
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 01:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with UTF8SMTP id 4D92681412
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 01:09:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id 1j81k__XWJZa for <buildroot@lists.busybox.net>;
 Wed, 15 May 2024 01:09:01 +0000 (UTC)
X-Greylist: delayed 854 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 15 May 2024 01:08:54 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 108348144D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 108348144D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=203.205.221.155;
 helo=out203-205-221-155.mail.qq.com; envelope-from=wangdong115@foxmail.com;
 receiver=<UNKNOWN> 
Received: from out203-205-221-155.mail.qq.com (out203-205-221-155.mail.qq.com
 [203.205.221.155])
 by smtp1.osuosl.org (Postfix) with UTF8SMTPS id 108348144D
 for <buildroot@buildroot.org>; Wed, 15 May 2024 01:08:54 +0000 (UTC)
Received: from DW-Mibook.lan ([115.171.27.113])
 by newxmesmtplogicsvrszb9-1.qq.com (NewEsmtp) with SMTP
 id D5A0F8E9; Wed, 15 May 2024 08:53:26 +0800
X-QQ-mid: xmsmtpt1715734406taw81i8gy
Message-ID: <tencent_7E39529BBE1BB50CB4AA2A429702629C0808@qq.com>
X-QQ-XMAILINFO: OZZSS56D9fAjwDSI3bLgGmt5WbOTs4EztEwUfPQfCkwRhVrSAbSOi304yVy1gr
 CJ4Y8L9uq1jlJo+EB1juZ8P2bP4A39B2ZHsvJJcmYtTZ1GigwaayVtPYQXpmABXYaewPS8ZDX8dW
 QIEhgnikOxrg7/6i6pnZyPqWGsIj7K9I6KQCN0TAc/eff6acYrkTZsRYALrE282pVXD1sZ9CxNQ2
 P+fPBsjvkavNNoIxauwcSUFY6X4N1TcuM6rw4nrTXzb0Yb1CSKO1TXno9IXcz5eib7MMMws5GwlF
 XfdbdOwfQ4v/OY8k9PUvtx3jTqtDrbKHNlZpo/NIEnULi29vrJlFkCABeP4eqkk07M9Y6RA0oVv/
 2GAdqcdEUPsbKuio8txK3pKlqwLrP8nIoS5kPp0gIm/qpnmOeYSMrcCcgyTtTqDWQ1lxyclNkdOF
 x/8SgKOYL5ER2pP1+UuN9yAL62O41kuxjUdqS0c907rC91mmLuAQaGfSTgxsxEr8IGxI6SvREdri
 aULX2obgbfnqucmT1auWcDLhkHNNhSahM0xg4uWvuceFwOGM5txa6j3uXTDy61uwgJy1kXmi4Qj+
 67TJHBjbXr86FWnc0hfttovwOumgCSVIo734PR+RcMg67ggZM3d2d6kyM/t2QwyNzua/zYjO9sGf
 Vce7Whg5dK7uqXgCy9OH5h1yA8NjmwQhulb2wa7aaX34F5EKQGwir2VaFH0NuQzGUJMiZQX8VlG8
 etRyMViIg9/NTHRDSUmFaOGWU1oSlFKJuOSctrGWLHRfkZP5Qrlx+YjcM23mj59a3jxImxDd7SiN
 /aRPEfYLIMKTV7Nr5lwQQT0e4oxLGXUaXqH9FEabyAGjnZsdNtBzhGxbm7HIS2d6Uhwy9J+6e9e/
 Qn5hqXfrPUy1p7CWYpK96/phmY9oWNc+0AOcaSzATQP77O1G6bxL+/j9aEdlUgy456JWBzJuzYln
 8QkeY4Pmt9dYKD6E/7WxTt5tduCCl5sUeIcDf9Mp9UVy5Ubs6xl9c0NQY5mfCAJIBj50CRaTDvC0
 vYGW+KSZvAH61zVobCjXaMnuR/XaSZ4UKfXgbwQCuqCn+FEBTT+TSI6DBDNcltFBU7OUnqpw==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
From: Dong Wang <wangdong115@foxmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 May 2024 08:52:31 +0800
X-OQ-MSGID: <20240515005231.970148-1-wangdong115@foxmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=foxmail.com; s=s201512; t=1715735329;
 bh=spGT9JrCrNmSO8YXS520inPkJHVU1cmlBFOVM67OESE=;
 h=From:To:Cc:Subject:Date;
 b=i8CIFM20w/3QcVBxHzmq6vCZkAn+n+wlc+Lyx2FgjPpIvwsRh/zvkhfGJo9jsMcXW
 JzLL5Wm28KAbO3ASMYCcJircVuXUFanlbU8KSmfQBdLVllT8RotxoQTeJy3CAqsaMv
 X0zrfj6NTiRR12VrvSKfypDlda+gfWAHknacuXC8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=foxmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256
 header.s=s201512 header.b=i8CIFM20
Subject: [Buildroot] [PATCH] configs/friendlyarm_nanopi_neo_defconfig: new
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
Cc: Dong Wang <wangdong115@foxmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds a new defconfig for the NanoPi NEO board made by
FriendlyARM. This board is based on the Allwinner H3 SoC.

See: https://wiki.friendlyelec.com/wiki/index.php/NanoPi_NEO

.

This patch uses the mainline kernel and u-boot for the board.

The configurations are based on the previously dropped defconfig
maintained by Yann E. MORIN <yann.morin.1998@free.fr>.

Signed-off-by: Dong Wang <wangdong115@foxmail.com>
---
 DEVELOPERS                                |  4 +++
 board/friendlyarm/nanopi-neo/boot.cmd     |  5 +++
 board/friendlyarm/nanopi-neo/genimage.cfg | 36 +++++++++++++++++++
 board/friendlyarm/nanopi-neo/readme.txt   | 41 +++++++++++++++++++++
 configs/friendlyarm_nanopi_neo_defconfig  | 44 +++++++++++++++++++++++
 5 files changed, 130 insertions(+)
 create mode 100644 board/friendlyarm/nanopi-neo/boot.cmd
 create mode 100644 board/friendlyarm/nanopi-neo/genimage.cfg
 create mode 100644 board/friendlyarm/nanopi-neo/readme.txt
 create mode 100644 configs/friendlyarm_nanopi_neo_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index a9deddb343..13439b9892 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -858,6 +858,10 @@ F:	package/logsurfer/
 N:	Dominik Michael Rauh <dmrauh@posteo.de>
 F:	package/gdal/
 
+N:	Dong Wang <wangdong115@foxmail.com>
+F:	board/friendlyarm/nanopi-neo
+F:	configs/friendlyarm_nanopi_neo_defconfig
+
 N:	Doug Kehn <rdkehn@gmail.com>
 F:	package/nss-pam-ldapd/
 F:	package/sp-oops-extract/
diff --git a/board/friendlyarm/nanopi-neo/boot.cmd b/board/friendlyarm/nanopi-neo/boot.cmd
new file mode 100644
index 0000000000..8c199ed480
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo/boot.cmd
@@ -0,0 +1,5 @@
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait panic=10
+
+load mmc 0:1 ${fdt_addr_r} ${fdtfile}
+load mmc 0:1 ${kernel_addr_r} zImage
+bootz ${kernel_addr_r} - ${fdt_addr_r}
diff --git a/board/friendlyarm/nanopi-neo/genimage.cfg b/board/friendlyarm/nanopi-neo/genimage.cfg
new file mode 100644
index 0000000000..4cfd8c8fc2
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo/genimage.cfg
@@ -0,0 +1,36 @@
+# Minimal SD card image for the NanoPi NEO.
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"sun8i-h3-nanopi-neo.dtb",
+			"boot.scr"
+		}
+	}
+
+	size = 16M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		in-partition-table = false
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8K
+		size = 1000K # 1MB - 8KB(offset) - 16KB(GPT)
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 512M
+	}
+}
diff --git a/board/friendlyarm/nanopi-neo/readme.txt b/board/friendlyarm/nanopi-neo/readme.txt
new file mode 100644
index 0000000000..cfe7714a41
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo/readme.txt
@@ -0,0 +1,41 @@
+Nanopi NEO
+
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the NanoPi NEO. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+FriendlyARM Nanopi NEO link:
+https://wiki.friendlyelec.com/wiki/index.php/NanoPi_NEO
+
+How to build
+============
+
+    $ make friendlyarm_nanopi_neo_defconfig
+    $ make
+
+Note: you will need access to the internet to download the required
+sources.
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
+  $ sudo sync
+
+Insert the micro SD card in your Nanopi NEO and power it up. The console
+is on the debug TTL UART, 115200 8N1.
+
+Ethernet
+==========
+
+  # udhcpc -i eth0
+
+Enjoy!
diff --git a/configs/friendlyarm_nanopi_neo_defconfig b/configs/friendlyarm_nanopi_neo_defconfig
new file mode 100644
index 0000000000..a725553258
--- /dev/null
+++ b/configs/friendlyarm_nanopi_neo_defconfig
@@ -0,0 +1,44 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_VFPV4=y
+
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+
+# System
+BR2_TARGET_GENERIC_HOSTNAME="nanopi-neo"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the NanoPi NEO"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.30"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun8i-h3-nanopi-neo"
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-neo/genimage.cfg"
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_neo"
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+
+# Host utilities
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/friendlyarm/nanopi-neo/boot.cmd"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
