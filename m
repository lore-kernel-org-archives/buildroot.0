Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3980C04A6A
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 22:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79FF2417E8;
	Thu, 10 Aug 2023 22:10:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79FF2417E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x_h7uJOPGMFt; Thu, 10 Aug 2023 22:10:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8FA6417D3;
	Thu, 10 Aug 2023 22:10:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8FA6417D3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8D6C01BF83B
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 22:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 671B88211D
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 22:10:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 671B88211D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PJ_u1-fQ2jBM for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 22:10:25 +0000 (UTC)
Received: from smtpcmd14173.aruba.it (smtpcmd14173.aruba.it [62.149.156.173])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82E2B820C5
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 22:10:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82E2B820C5
Received: from localhost.localdomain ([95.47.160.93])
 by Aruba Outgoing Smtp  with ESMTPSA
 id UDrKq0SZSXI7yUDrKqsfgY; Fri, 11 Aug 2023 00:10:23 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 11 Aug 2023 00:10:20 +0200
Message-Id: <20230810221020.12181-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cc3dd6f5-9a38-70bb-7df5-ecebf9ca4bb6@benettiengineering.com>
References: <cc3dd6f5-9a38-70bb-7df5-ecebf9ca4bb6@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOeNQd2vMveJuvBWBpXOgyk51m0e+3xzlyiufNYBDqDO1CPmJnVgVvIBKAzfnAkhqlN6Mu4wojaoX7rfQcEbRLX8bqzbgiWgTnLTAhbOyCl0b+jhCZ/U
 +py7DT9VxV96KLyMpiZkCAcTcQjeO3xVJeHbLTpAlc6jBXJrw0pnCqyLk4l2kIuyElXOjOaxSXCIlBN+3+0b7m+5vWWNpb/uqLlQ7sG4OFAvyttX3X810NeE
 54vtr8Qu1m5Q/iEIOWHQxbBH8o4DmCzls3ouGOWDI3dhOYAkqxaylV/CHRHEkRdYf12stBVWbAaXtKwxuSYp7/e6gw1iTgkDanI7xQy8EiqsbmzTF027p4VJ
 +T91wgUY
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1691705423; bh=bQR1Crx1o5glYHQemcp2Jut8pYivFKPGVoVBqKeytxo=;
 h=From:To:Subject:Date:MIME-Version;
 b=HWX1W5lsNU9Lxyu9Hq5XrjmhmlfM61VpFXzQZm4HmQ+t8C5WXlIn/BP9ZM4l+SDRa
 KMdHKe8x7iryMO7ttFs9AV/bllFSpbxWh8rKYCXAEqikkcheusYJSVI3A2EoJEm1gq
 HaG4ZkSTnSqVFev6TUaZ5v51kI3cLgVtxhAl19ZL7nZwbAXPP0XjVeCJw+i9e1nJ72
 AMPQH47367qGVXJ64rYcHJLHm/ZGTh43HeyGTreiYFvhkExe1uieJuGVUNqwCysAck
 FUEb22FUJ66HX7Wozvh+D9DvyTlfOJO9+RH6nTw75ZUXDJdOtRJ78we13Vq30gMJvK
 aI/haFupstkZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=HWX1W5ls
Subject: [Buildroot] [PATCH v2] configs/asus_tinker_rk3288_defconfig: switch
 to zImage and bump Linux to 6.1.44, U-Boot to 2023.07
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

uImage is almost deprecated so let's switch to zImage. Let's also bump
Linux version to 6.1.44, U-Boot to 2023.07 and remove
BR2_TARGET_UBOOT_NEEDS_PYTHON3 since it's selected by
BR2_TARGET_UBOOT_NEEDS_PYLIBFDT.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* changed uImage to zImage in extlinux.conf
---
 board/asus/tinker/extlinux.conf      | 2 +-
 configs/asus_tinker_rk3288_defconfig | 7 ++-----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/board/asus/tinker/extlinux.conf b/board/asus/tinker/extlinux.conf
index bb96ddb893..be21e246ec 100644
--- a/board/asus/tinker/extlinux.conf
+++ b/board/asus/tinker/extlinux.conf
@@ -1,4 +1,4 @@
 label Tinker linux
-  kernel /boot/uImage
+  kernel /boot/zImage
   devicetree /boot/rk3288-tinker.dtb
   append console=ttyS2,115200n8 root=/dev/mmcblk0p1 rootwait
diff --git a/configs/asus_tinker_rk3288_defconfig b/configs/asus_tinker_rk3288_defconfig
index 40f4125880..b3e4502a45 100644
--- a/configs/asus_tinker_rk3288_defconfig
+++ b/configs/asus_tinker_rk3288_defconfig
@@ -10,10 +10,9 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="tinker-rk3288"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
@@ -23,10 +22,8 @@ BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin tpl/u-boot-tpl.bin"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
-BR2_LINUX_KERNEL_UIMAGE=y
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rk3288-tinker"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
