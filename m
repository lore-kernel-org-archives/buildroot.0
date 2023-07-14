Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E25EB64DA
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 06:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9195A8401B;
	Fri, 14 Jul 2023 06:44:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9195A8401B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qV0lT979DXZN; Fri, 14 Jul 2023 06:44:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9ABCC83AD2;
	Fri, 14 Jul 2023 06:44:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9ABCC83AD2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 965711BF419
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 06:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E26C41FEE
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 06:44:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E26C41FEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jE9GEmJ0vGqk for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 06:44:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F128E41FA0
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F128E41FA0
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 06:44:29 +0000 (UTC)
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout01.mail.de (Postfix) with ESMTP id 4467BA0382;
 Fri, 14 Jul 2023 08:44:28 +0200 (CEST)
Received: from smtp03.mail.de (smtp03.bt.mail.de [10.0.121.213])
 by postfix03.mail.de (Postfix) with ESMTP id 17E6C80219;
 Fri, 14 Jul 2023 08:44:28 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp03.mail.de (Postfix) with ESMTPSA id ABC66A0253;
 Fri, 14 Jul 2023 08:44:27 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri, 14 Jul 2023 08:44:12 +0200
Message-Id: <20230714064413.11433-3-kilian.zinnecker@mail.de>
In-Reply-To: <20230714064413.11433-1-kilian.zinnecker@mail.de>
References: <20230714064413.11433-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 3125
X-purgate-ID: 154282::1689317067-4D7F8647-4219EC39/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1689317068;
 bh=rPd+VkEYoGi0qGnbmR9xSZzCueO7t2DTUCKzHzAlAvY=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=v5Soy/97rDIMvurMr5tboA63LMvnGJ5raIzdd9e69i/9nHVMm+rW+Xx0kU3kgvw0J
 n/wW5ftMjaHSO0dHpDfedG6RbodLAuPHVWUkr2dClZvRtAUNMubQBuzSxX2zpSxkDq
 slbl7yUEf8h3d10+970eqiiR03IOV/YLMqczXXO2bbjK+Hm6nu0N4likAJqGfew6Ot
 UQ4VwqFSdJb09Hxqa5LL5qKKU4GFyAJrJXxQp9Fx6HHRB6tNc/Z/Iv7eSW4rmTPGDp
 RpZMond3absScYNu5iE6nv8U0xZIudXXjCXptxqwRc8n6gZ5+aYAe1fD8eQl9IU+NO
 MAIkUIavDKWLg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=v5Soy/97
Subject: [Buildroot] [PATCH v6 2/3] configs: add rock5b/rock5b_defconfig
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Andreas Ziegler <br015@umbiko.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds the defconfig file needed to build u-boot, kernel
and rootfs for the Rock 5B. In addition it adds a kernel config
fragment file, which activates the needed ethernet driver support.

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
---
 DEVELOPERS                        |  2 ++
 board/radxa/rock5b/linux.fragment |  1 +
 configs/rock5b_defconfig          | 44 +++++++++++++++++++++++++++++++
 3 files changed, 47 insertions(+)
 create mode 100644 board/radxa/rock5b/linux.fragment
 create mode 100644 configs/rock5b_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index f6f474967a..715a35aa16 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1792,6 +1792,8 @@ F:	package/libcamera/
 
 N:	Kilian Zinnecker <kilian.zinnecker@mail.de>
 F:	package/rockchip-rkbin/
+F:	configs/rock5b_defconfig
+F:	board/radxa/rock5b/
 
 N:	Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
 F:	package/wqy-zenhei/
diff --git a/board/radxa/rock5b/linux.fragment b/board/radxa/rock5b/linux.fragment
new file mode 100644
index 0000000000..811d42a79b
--- /dev/null
+++ b/board/radxa/rock5b/linux.fragment
@@ -0,0 +1 @@
+CONFIG_R8169=y
diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
new file mode 100644
index 0000000000..4a07dd5ebc
--- /dev/null
+++ b/configs/rock5b_defconfig
@@ -0,0 +1,44 @@
+BR2_aarch64=y
+BR2_cortex_a76_a55=y
+BR2_KERNEL_HEADERS_5_10=y
+BR2_TARGET_GENERIC_HOSTNAME="rock5b"
+BR2_TARGET_GENERIC_ISSUE="Welcome to the rock5b board"
+BR2_SYSTEM_DHCP="eth0"
+BR2_USE_WCHAR
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/radxa/kernel.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="52f51a2b5ba178f331af62260d2da86d7472c14b"
+BR2_LINUX_KERNEL_DEFCONFIG="rockchip_linux"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3588-rock-5b"
+BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/radxa/rock5b/linux.fragment"
+BR2_PACKAGE_AVAHI=y
+BR2_PACKAGE_AVAHI_DAEMON=y
+BR2_PACKAGE_OPENSSH=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.07"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock5b-rk3588"
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
+BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_DTC=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_ROCKCHIP_RKBIN=y
+BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION=y
+BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION_VALUE="78cbbc4f9c36b77a620132ad38d2c6823b4b25fe"
+BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILE=y
+BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME="bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.11.bin"
+BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILE=y
+BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME="bin/rk35/rk3588_bl31_v1.38.elf"
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
