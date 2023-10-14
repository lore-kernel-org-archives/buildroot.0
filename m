Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D31CDB465
	for <buildroot@archiver.kernel.org>; Sat, 14 Oct 2023 18:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7CFD81EA0;
	Sat, 14 Oct 2023 18:45:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7CFD81EA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sn-eMJQrOkjZ; Sat, 14 Oct 2023 18:45:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 628368197D;
	Sat, 14 Oct 2023 18:45:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 628368197D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2E7411BF2C1
 for <buildroot@lists.busybox.net>; Sat, 14 Oct 2023 18:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06C7141721
 for <buildroot@lists.busybox.net>; Sat, 14 Oct 2023 18:45:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06C7141721
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Qs1PmuiEKkx for <buildroot@lists.busybox.net>;
 Sat, 14 Oct 2023 18:45:26 +0000 (UTC)
Received: from smtpdh17-2.aruba.it (smtpdh17-2.aruba.it [62.149.155.117])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D81A14171B
 for <buildroot@buildroot.org>; Sat, 14 Oct 2023 18:45:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D81A14171B
Received: from localhost.localdomain ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPSA
 id rjdaq4W1N6PZFrjdaqdTIP; Sat, 14 Oct 2023 20:45:22 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 14 Oct 2023 20:45:20 +0200
Message-Id: <20231014184521.87527-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBOYgw31In71uC9urfXiipZfR1r06++4Ta4SZuF5CIPKn7pAjmMo5LqC3mZgVElafWe1mVmev+gafMgHoBl33b/JKVYXGIVWHXwcBlVh5dPWIzG46fVQ
 K3krTAnt6HZCaPvpDHvTPa4Gcf3Bcm+fSZscfZg1oTskkn00ue4Fqa2QdvCKidQ/PAaOP9gEIWjSzgmjyMu+SAgsmIVq1NHz9oyMJWysQHUq3RtsxcLbn6fZ
 c4eO3NRkywngQ9auGEtkGOBX+c6TfXIeLQpvMKVScCJ67l+/ZQ3j/9XOpQIvvHhQtPhNho/NPfTW3WsP0qyr7ilV1H4/7I39VYaCY6RRCdUGKlLIAnH0scrW
 1oOIswOC
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1697309122; bh=BlYk2hz4rfRycwxJyoqlw/R1zh43tG+ZQDg95LUe2BA=;
 h=From:To:Subject:Date:MIME-Version;
 b=OW4zw1k58KlC5+iW+Bx9faf20eNqllgmmguvR7+/Rjid+Gbu5GOSmBQW4Ko8HQzLL
 xtZp8TkX5WjN6yPoUKxjGgLCv+e0Lg2vxspYMOZQnZ8jHZkKN7G6KInnU89Lrfid2S
 5SoW+zPZZ2Jq70TEVR/b3p2GdylBfi82qn5X+ZyBS8SyFUXcaIpdhgQlCmllgbe+6e
 KJ9KoH06aH5GhprCiBmO0x6iLKG7vM96gB18q6gv9Fy+hwxpsdEoWkVtxTQQxjy3JP
 Jsn+oMXwvV9mKpcGqtkSmV77S/6r7IjGjjVUmBwccWf0dUPF5uVWGKTq2+If5dQsLj
 o1yt3TZ9MH5Tg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=OW4zw1k5
Subject: [Buildroot] [PATCH 1/2] configs/rockpro64_defconfig: bump ATF to
 2.9, U-Boot to 2023.07 and Linux to 6.5.7
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
 Suniel Mahesh <sunil@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Also, since wi ith Linux commit [1] it's been defined the mmc* order
making sd-card number to be 1 instead of 0. This prevent to boot from
mmc0 with Linux version 5.10+ so let's change mmcblk0p4 to mmcblk1p4 in
extlinux.conf in order to boot since we bump to Linux 6.5.7

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0011c6d182774fc781fb9e115ebe8baa356029ae

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/pine64/rockpro64/extlinux.conf |  2 +-
 configs/rockpro64_defconfig          | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/pine64/rockpro64/extlinux.conf b/board/pine64/rockpro64/extlinux.conf
index ea081a1f0b..83467ef43c 100644
--- a/board/pine64/rockpro64/extlinux.conf
+++ b/board/pine64/rockpro64/extlinux.conf
@@ -1,4 +1,4 @@
 label RK3399_ROCKPRO64 linux
   kernel /Image
   devicetree /rk3399-rockpro64.dtb
-  append earlycon=uart8250,mmio32,0xff1a0000 root=/dev/mmcblk0p4 rw rootwait
+  append earlycon=uart8250,mmio32,0xff1a0000 root=/dev/mmcblk1p4 rw rootwait
diff --git a/configs/rockpro64_defconfig b/configs/rockpro64_defconfig
index d39640f855..4704ac7206 100644
--- a/configs/rockpro64_defconfig
+++ b/configs/rockpro64_defconfig
@@ -2,13 +2,13 @@
 BR2_aarch64=y
 BR2_cortex_a72_a53=y
 
-# Linux headers same as kernel, a 5.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
+# Linux headers same as kernel, a 6.5 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_5=y
 
 # Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.7"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9.0"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3399"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
@@ -18,7 +18,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES=""
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rockpro64-rk3399"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
@@ -32,7 +32,7 @@ BR2_TARGET_UBOOT_SPL_NAME="idbloader.img"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.5.7"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-rockpro64"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
