Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B240AC4167B
	for <buildroot@archiver.kernel.org>; Thu,  7 Dec 2023 12:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6103482F57;
	Thu,  7 Dec 2023 12:07:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6103482F57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ysCO1X1qIzAU; Thu,  7 Dec 2023 12:07:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96DC08350A;
	Thu,  7 Dec 2023 12:07:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96DC08350A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F6C91BF990
 for <buildroot@lists.busybox.net>; Thu,  7 Dec 2023 12:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2489183B10
 for <buildroot@lists.busybox.net>; Thu,  7 Dec 2023 12:07:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2489183B10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h8Uy22xdgdYY for <buildroot@lists.busybox.net>;
 Thu,  7 Dec 2023 12:07:09 +0000 (UTC)
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D32D683B5E
 for <buildroot@buildroot.org>; Thu,  7 Dec 2023 12:07:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D32D683B5E
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id BD9lrT5vVoaCcBD9mrp35y; Thu, 07 Dec 2023 13:07:06 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu,  7 Dec 2023 13:07:04 +0100
Message-Id: <20231207120704.47607-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231207120704.47607-1-giulio.benetti@benettiengineering.com>
References: <20231207120704.47607-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMQwCJzQOrYZip9PzVpwDOffeaR9nWDSUmDYjx8XTdxSX7CFr9JfjxACjpB5pY8nlzezldwV5WIUBauSfN9Eq6umokppfk/dokc3lEnQ47rXL0ujiyNp
 pVMPKazJ9GRoeuWsaQQVDQORh8wnPs4dDP+SYYbQ3XM+AAbxN2vntJV24SKb+Ae/Ukh9z8O/QXQCIR82ImgsmGbUmGjI/REvxcAmvfVkwI3Z0todXHJyzXK7
 fzzZIRu9p4xLgH9edCoaiG1Cr0AjaGL9Q01CWXJyW3AGzN4r9ZbZRSvsRlxnqo8jLiqBT6F2ItFqqo/Js9fFOo+Ed/4Q4635nk4uC1YIb0Wue5CzN5FHW9lx
 7adaNXah
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1701950826; bh=iFAgvtmks24tBloDOMG//LQBzzS48uzVbgMQFJ0p9BU=;
 h=From:To:Subject:Date:MIME-Version;
 b=C+hb1IYU+5BsE3pbbzuwcci3FGDfKWUOf/trcJTM/kW8Y1dyubxc8v8XU7AjjYFIH
 PG0RStGdJVtcteiejOQySksd7PDAfEBSi+8QgPYIur5yfYkqsPKI/o66H+6BB1xiIS
 ty9gs6XbGonhzy1vXJqbil/Oalg6bTw/zhNTCm0sCqPIE7IeJWGS8UzuYggJ3b6Dws
 Y9lPTt6S3rNWw81+dmrtFwvNdy9e3euc66NAkqtG+zO35b4nAmnsdxeDdjAlA8b7BX
 mn6r0mxII9tCrQkzexBzzmKJa+dG3Hoxsdvm3etKep61ygm/JGz0SW4HX/D1wm75Qw
 9vrqgKJMrbJFw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=C+hb1IYU
Subject: [Buildroot] [PATCH] configs/freescale_imx6ullevk_defconfig: bump
 Linux and U-Boot to lf-6.1.36-2.1.0
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
Cc: Fabio Estevam <festevam@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Let's also enable NXP firmware package to let latest SDMA firmware to be
loaded. To achieve this we also need to enable dynamic eudev to let it
to load the firmware.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/freescale/imx6ullevk/linux_sdma.fragment |  1 +
 configs/freescale_imx6ullevk_defconfig         | 11 ++++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)
 create mode 100644 board/freescale/imx6ullevk/linux_sdma.fragment

diff --git a/board/freescale/imx6ullevk/linux_sdma.fragment b/board/freescale/imx6ullevk/linux_sdma.fragment
new file mode 100644
index 0000000000..6f1c8b4313
--- /dev/null
+++ b/board/freescale/imx6ullevk/linux_sdma.fragment
@@ -0,0 +1 @@
+CONFIG_IMX_SDMA=m
diff --git a/configs/freescale_imx6ullevk_defconfig b/configs/freescale_imx6ullevk_defconfig
index db4fa69f71..fd4254edbf 100644
--- a/configs/freescale_imx6ullevk_defconfig
+++ b/configs/freescale_imx6ullevk_defconfig
@@ -1,21 +1,26 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-5.15.71-2.2.0)/linux-imx-lf-5.15.71-2.2.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.1.36-2.1.0)/linux-imx-lf-6.1.36-2.1.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/freescale/imx6ullevk/linux_sdma.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ull-14x14-evk"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL=y
+BR2_PACKAGE_FIRMWARE_IMX=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6ull_14x14_evk"
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-5.15.71-2.2.0)/uboot-imx-lf-5.15.71-2.2.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.1.36-2.1.0)/uboot-imx-lf-6.1.36-2.1.0.tar.gz"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMX=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
