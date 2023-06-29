Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC96EB64D9
	for <buildroot@archiver.kernel.org>; Thu, 29 Jun 2023 05:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DB6660E7C;
	Thu, 29 Jun 2023 05:31:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DB6660E7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EpIZyfCG1UlY; Thu, 29 Jun 2023 05:31:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8041C60E5B;
	Thu, 29 Jun 2023 05:31:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8041C60E5B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C69661BF3A0
 for <buildroot@lists.busybox.net>; Thu, 29 Jun 2023 05:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DE7C8143E
 for <buildroot@lists.busybox.net>; Thu, 29 Jun 2023 05:31:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DE7C8143E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lIJ7K-BWigB0 for <buildroot@lists.busybox.net>;
 Thu, 29 Jun 2023 05:31:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C90DA81DE8
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C90DA81DE8
 for <buildroot@buildroot.org>; Thu, 29 Jun 2023 05:31:38 +0000 (UTC)
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
Received: by mail.gandi.net (Postfix) with ESMTPSA id 570231C0002;
 Thu, 29 Jun 2023 05:31:36 +0000 (UTC)
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: buildroot@buildroot.org
Date: Thu, 29 Jun 2023 07:31:30 +0200
Message-Id: <20230629053130.3976-4-jeanmichel.hautbois@yoseli.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230629053130.3976-1-jeanmichel.hautbois@yoseli.org>
References: <20230629053130.3976-1-jeanmichel.hautbois@yoseli.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1688016697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P9trVuDnV10z2SJ6MT0EoyfDtdseD7BLvp/NYsLBDmg=;
 b=kl3hpUaD+0XYsf1DI9b3WCxFyiZZloAGw/3NFBYmDGTG2RTkzZNUaY1jhYcjnz5VTyzQnt
 0kxgufQWLcmiYUmgzakT75+AAeLHrX7g+0DZ3AxwU1sSiLKHph3olsLjLHUdVniUxFBCwa
 g6Kmhu48pDg2XDu2tMq1348+pfRNjAYGYCnE5I6R4VNywcFMWZfRUgOz4yFk08NGtirI18
 bAUUD/gPg+0q7JNj3BTS27xJaAmg/9bO2WS+bhuOSsZHuOsNkEw5Ey0kgyIsuU3Io9QWvy
 xVR9knVMGjJ9FlrGImcrsig2TnG/yoxA1eSxJ5fXfYXK61q+HXtFYX4nSqKFaw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=kl3hpUaD
Subject: [Buildroot] [PATCH 3/3] configs: add support for the 54418 qemu
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This file is a copy of the qemu_m68k_mcf5208_defconfig as there is not
so much difference to expect except the CPU value.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
 configs/qemu_m68k_mcf54418_defconfig | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 configs/qemu_m68k_mcf54418_defconfig

diff --git a/configs/qemu_m68k_mcf54418_defconfig b/configs/qemu_m68k_mcf54418_defconfig
new file mode 100644
index 0000000000..91326e1f3c
--- /dev/null
+++ b/configs/qemu_m68k_mcf54418_defconfig
@@ -0,0 +1,19 @@
+BR2_m68k=y
+BR2_m68k_cf54418=y
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
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
