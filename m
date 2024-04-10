Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C720CD128A
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 17:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54017605FB;
	Wed, 10 Apr 2024 17:19:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4W8LKo0xSIWU; Wed, 10 Apr 2024 17:19:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 353A660E88
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 353A660E88;
	Wed, 10 Apr 2024 17:19:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 903981BF980
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 17:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A506402C5
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 17:19:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZHVBZf5O1qfb for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 17:19:09 +0000 (UTC)
Received-SPF: Pass (sender SPF authorized) identity=helo;
 client-ip=217.70.178.240; helo=mslow1.mail.gandi.net;
 envelope-from=jeanmichel.hautbois@yoseli.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6C724405E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C724405E5
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C724405E5
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 17:19:08 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::222])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 5C4BDC0178
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 17:12:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A1A0640006;
 Wed, 10 Apr 2024 17:12:20 +0000 (UTC)
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: buildroot@buildroot.org
Date: Wed, 10 Apr 2024 19:12:10 +0200
Message-Id: <20240410171211.1633127-3-jeanmichel.hautbois@yoseli.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240410171211.1633127-1-jeanmichel.hautbois@yoseli.org>
References: <20240410171211.1633127-1-jeanmichel.hautbois@yoseli.org>
MIME-Version: 1.0
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1712769141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a3MKoBy3E0JHY6zT6yADTiEm9w8Ys12Jh3Mw7F9oBI8=;
 b=TOGgOIOgfmDiYETeaeYPT1dnpGb0jMYGgTAPnJtwMOwzQp8K9C2iaX7wKqN1ZrBX9r0toO
 AoZfPjtLnXfrlCelByH3lD57+86opn1YAVOaEIHSuMHNrfTK9YkNxqwxVCjPZjiVnpaEcm
 nsoukiE1buqIhGHx/tHZk4xg7y81BPiOvuW0f3TQHrkD+na+bPAqORe8sQ1Y0IyvE/2z7l
 mqioIr11K1oqYgBp1yOpCGBS6gTsbhlW7tKORyr4/rMBGpB20MAHfy3MGvPFO6GeDyRFlM
 D7AN/yz8ERdRKzlgx7EIGpzCYIp7m2Ooz8YSBdHpZKQjBPYA+0Xvq7qSGdwmpQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=TOGgOIOg
Subject: [Buildroot] [PATCH v2 2/3] board: add the qemu board support for
 mcf54418
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Coldfire MCF54418 needs a board to give the proper linux defconfig
to buildroot. Add it based on a simplified Linux stmark2_defconfig file.
While at it, add a the needed config to run qemu, using a copy of the
qemu_m68k_mcf5208_defconfig as there is not so much difference to expect
except the CPU value.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
 board/qemu/m68k-mcf54418/linux.config | 23 +++++++++++++++++++++++
 configs/qemu_m68k_mcf5441x_defconfig  | 19 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 board/qemu/m68k-mcf54418/linux.config
 create mode 100644 configs/qemu_m68k_mcf5441x_defconfig

diff --git a/board/qemu/m68k-mcf54418/linux.config b/board/qemu/m68k-mcf54418/linux.config
new file mode 100644
index 0000000000..e950052061
--- /dev/null
+++ b/board/qemu/m68k-mcf54418/linux.config
@@ -0,0 +1,23 @@
+CONFIG_COLDFIRE=y
+CONFIG_M5441x=y
+CONFIG_CLOCK_FREQ=240000000
+CONFIG_STMARK2=y
+CONFIG_UBOOT=y
+CONFIG_RAMBASE=0x40000000
+CONFIG_RAMSIZE=0x8000000
+CONFIG_VECTORBASE=0x40000000
+CONFIG_KERNELBASE=0x40001000
+# CONFIG_BLK_DEV_BSG is not set
+CONFIG_BINFMT_FLAT=y
+CONFIG_SERIAL_MCF=y
+CONFIG_SERIAL_MCF_BAUDRATE=115200
+CONFIG_SERIAL_MCF_CONSOLE=y
+CONFIG_BOOTPARAM=y
+CONFIG_BOOTPARAM_STRING="console=ttyS0,115200"
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_NETDEVICES=y
+CONFIG_NET_VENDOR_FREESCALE=y
+CONFIG_FEC=y
diff --git a/configs/qemu_m68k_mcf5441x_defconfig b/configs/qemu_m68k_mcf5441x_defconfig
new file mode 100644
index 0000000000..6b550feb8b
--- /dev/null
+++ b/configs/qemu_m68k_mcf5441x_defconfig
@@ -0,0 +1,19 @@
+BR2_m68k=y
+BR2_m68k_cf5441x=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PTHREADS=y
+BR2_STATIC_LIBS=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-mcf54418/linux.config"
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
+BR2_TARGET_ROOTFS_INITRAMFS=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
