Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8EFEB64DA
	for <buildroot@archiver.kernel.org>; Sat,  8 Jul 2023 22:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 721D260C1A;
	Sat,  8 Jul 2023 22:30:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 721D260C1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jyTpo1PWdcXp; Sat,  8 Jul 2023 22:30:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F19160DC6;
	Sat,  8 Jul 2023 22:30:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F19160DC6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4499D1BF3BE
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 22:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D22760AF2
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 22:29:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D22760AF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IbLDlzrArU1P for <buildroot@lists.busybox.net>;
 Sat,  8 Jul 2023 22:29:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81C2F60A9F
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 81C2F60A9F
 for <buildroot@buildroot.org>; Sat,  8 Jul 2023 22:29:36 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout01.mail.de (Postfix) with ESMTP id 95C7FA1784;
 Sun,  9 Jul 2023 00:29:34 +0200 (CEST)
Received: from smtp04.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix02.mail.de (Postfix) with ESMTP id 7A91CA03C3;
 Sun,  9 Jul 2023 00:29:34 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp04.mail.de (Postfix) with ESMTPSA id 1CBDFC003C;
 Sun,  9 Jul 2023 00:29:34 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sun,  9 Jul 2023 00:28:59 +0200
Message-Id: <20230708222900.8599-3-kilian.zinnecker@mail.de>
In-Reply-To: <20230708222900.8599-1-kilian.zinnecker@mail.de>
References: <20230708222900.8599-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 3126
X-purgate-ID: 154282::1688855374-D97FCC09-801B273B/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1688855374;
 bh=nZOuMJuJNx73txB3y7Vmykp/xivlAUeabb/FMKcaQ4E=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=Vzx5JVGmXxcBzMzLjdMJjnOen8V77uwDjqxhhiF1rHv5q1odWaRaZ5QrGnrtWNRmk
 QygAwrjEp7Nv6PQjYHA1kVqBB4+1DZnqcJKIMp879IJS3HtSLgeEmI2TWaOwJp/llH
 4MJ92Mai4D4u8Gr5PtSYdRxrG3VpcdGdxF2EqVacmtab+YRCZgjQc9oYtoizFmVthN
 EG7oHv9bkYerdD5KOXb039Su0xCrHQF5QDKJrSJR/sIMssCM4WQal5S+WxzKuaFREm
 OcpBEDb/dBhnVyfyd2ONHvb41Ox6aoB/nb9fRj6aeOM+mXnn81E/RB9A9D21eJburr
 wfTAypLXDx0yA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=Vzx5JVGm
Subject: [Buildroot] [PATCH v4 2/3] configs: add rock5b/rock5b_defconfig
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
Cc: Andreas Ziegler <br015@umbiko.net>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
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
 configs/rock5b_defconfig          | 43 +++++++++++++++++++++++++++++++
 3 files changed, 46 insertions(+)
 create mode 100644 board/radxa/rock5b/linux.fragment
 create mode 100644 configs/rock5b_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 8e603ff3f8..e626937183 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1778,6 +1778,8 @@ F:	package/libcamera/
 
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
index 0000000000..4bfe232b60
--- /dev/null
+++ b/configs/rock5b_defconfig
@@ -0,0 +1,43 @@
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
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.07-rc4"
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
