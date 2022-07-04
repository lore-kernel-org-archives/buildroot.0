Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9862AC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 05:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 278C4410A2;
	Mon,  4 Jul 2022 05:44:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 278C4410A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2I_MoYKEBCWZ; Mon,  4 Jul 2022 05:44:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06F1A41061;
	Mon,  4 Jul 2022 05:44:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06F1A41061
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 814F91BF3C0
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 05:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AA4A40114
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 05:44:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AA4A40114
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HBTqI1y9EOJg for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 05:44:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5D00400F6
Received: from mail-sh.amlogic.com (mail-sh.amlogic.com [58.32.228.43])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E5D00400F6
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 05:44:06 +0000 (UTC)
Received: from droid01-cd.amlogic.com (10.98.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Mon, 4 Jul 2022
 13:44:02 +0800
From: Kelvin Zhang <kelvin.zhang@amlogic.com>
To: <buildroot@buildroot.org>
Date: Mon, 4 Jul 2022 13:39:11 +0800
Message-ID: <20220704053911.2840122-1-kelvin.zhang@amlogic.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.98.11.200]
Subject: [Buildroot] [PATCH 1/1] configs/meson-g12a-u212: new board
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
Cc: Kelvin Zhang <kelvin.zhang@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit adds a new defconfig for the Amlogic U212 board.

U212 is a reference board manufactured by Amlogic
with the following specifications:

  - Amlogic S905X2 Quad-Core ARM Cortex-A53 SoC
  - 2GB DDR3 SDRAM
  - 16GB eMMC
  - 10/100/1000 Ethernet MAC (10/100 Internal PHY)
  - 1x USB2 + 1x USB3
  - SDcard
  - Audio HAT Connector / SPDIF
  - HDMI 2.1
  - Infrared receiver
  - SDIO WiFi Module

Amlogic S905X2 SoC is designed for smart OTT/IP STB,
which belongs to Amlogic G12A SoC family.

More info about this chip:
https://www.amlogic.com/#Products/396/index.html

Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
---
 configs/meson-g12a-u212_defconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 configs/meson-g12a-u212_defconfig

diff --git a/configs/meson-g12a-u212_defconfig b/configs/meson-g12a-u212_defconfig
new file mode 100644
index 0000000000..a933b1f8f3
--- /dev/null
+++ b/configs/meson-g12a-u212_defconfig
@@ -0,0 +1,10 @@
+BR2_aarch64=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_GCC_ENABLE_LTO=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_XZ=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="amlogic/meson-g12a-u200"
+BR2_TARGET_ROOTFS_INITRAMFS=y
+BR2_TARGET_ROOTFS_TAR_XZ=y

base-commit: 23e1e04d5448e17da7ec0a65199740ad1cf923a0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
