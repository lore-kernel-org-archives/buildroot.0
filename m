Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E7FEB64DC
	for <buildroot@archiver.kernel.org>; Fri, 30 Jun 2023 21:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A238941F2F;
	Fri, 30 Jun 2023 21:27:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A238941F2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TiF2CKEl2VZV; Fri, 30 Jun 2023 21:27:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CF6741F63;
	Fri, 30 Jun 2023 21:27:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CF6741F63
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3F6DB1BF844
 for <buildroot@lists.busybox.net>; Fri, 30 Jun 2023 21:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2441A41F63
 for <buildroot@lists.busybox.net>; Fri, 30 Jun 2023 21:27:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2441A41F63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m3JUvvdNdNKP for <buildroot@lists.busybox.net>;
 Fri, 30 Jun 2023 21:27:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D93D8417B2
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D93D8417B2
 for <buildroot@buildroot.org>; Fri, 30 Jun 2023 21:27:06 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout02.mail.de (Postfix) with ESMTP id 2DF05A0398
 for <buildroot@buildroot.org>; Fri, 30 Jun 2023 23:27:05 +0200 (CEST)
Received: from smtp04.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix02.mail.de (Postfix) with ESMTP id 14A6CA03C2;
 Fri, 30 Jun 2023 23:27:05 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp04.mail.de (Postfix) with ESMTPSA id BDAC8C002F;
 Fri, 30 Jun 2023 23:27:04 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri, 30 Jun 2023 23:26:53 +0200
Message-Id: <20230630212654.699657-2-kilian.zinnecker@mail.de>
In-Reply-To: <20230630212654.699657-1-kilian.zinnecker@mail.de>
References: <20230630212654.699657-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 2347
X-purgate-ID: 154282::1688160424-FFFFBC09-0BC8096A/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1688160425;
 bh=JCMKqOFfKKbx46WbrcG2yGWkFCWAX1MmO7rUtTHhEsY=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=LKP6+0ob7/mqq34NYtaI7roJXbfcB9ZMJkBd0HIx08zkosT1qyBsTlqYnCHqqR5fn
 hMhHJI6gn2TkBcboiKB+us7SNRtFWL0Veg8ZfVAMBldWusIDn8y9QF/arle3jxRYjt
 xiyC7YNszzDhNwd+8cjQkaUeGJDsiy5+4PSmRE+7+XCDfMjJHFhSCEnEicUJtPTh8c
 aUBzp7vUtc2vKEcolzHA3L17l9nXG2HDRJPXKjX9RjoqogkIR/rAvrc1TX1CV0dFyh
 bEo9QReWVmGMjAOgmWBt2OvuQAJdlx9W587vQ4fjeF7a2Pun3LDatIm46zSX6Feh9z
 M6VM/q3E+wKRw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=LKP6+0ob
Subject: [Buildroot] [PATCH 2/3] configs: add defconfig for Radxa Rock 5B
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
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds the config files needed to build u-boot, kernel and
rootfs for the Rock 5B.

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
---
 board/radxa/rock5b/linux.fragment |  1 +
 configs/rock5b_defconfig          | 38 +++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 board/radxa/rock5b/linux.fragment
 create mode 100644 configs/rock5b_defconfig

diff --git a/board/radxa/rock5b/linux.fragment b/board/radxa/rock5b/linux.fragment
new file mode 100644
index 0000000000..811d42a79b
--- /dev/null
+++ b/board/radxa/rock5b/linux.fragment
@@ -0,0 +1 @@
+CONFIG_R8169=y
diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
new file mode 100644
index 0000000000..157d81b163
--- /dev/null
+++ b/configs/rock5b_defconfig
@@ -0,0 +1,38 @@
+BR2_aarch64=y
+BR2_cortex_a76_a55=y
+BR2_KERNEL_HEADERS_5_10=y
+BR2_TARGET_GENERIC_HOSTNAME="rock5b"
+BR2_TARGET_GENERIC_ISSUE="Rock 5b"
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
+BR2_PACKAGE_ROCKCHIP_RKBIN=y
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock5b-rk3588"
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="BL31=$(BINARIES_DIR)/rk3588_bl31_v1.38.elf ROCKCHIP_TPL=$(BINARIES_DIR)/rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.11.bin"
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_DTC=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
