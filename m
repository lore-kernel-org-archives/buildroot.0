Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EEE1EB64DD
	for <buildroot@archiver.kernel.org>; Wed,  5 Jul 2023 06:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4C8F415EC;
	Wed,  5 Jul 2023 06:22:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4C8F415EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V4kgEGOLnNny; Wed,  5 Jul 2023 06:22:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58138408E9;
	Wed,  5 Jul 2023 06:22:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58138408E9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8D6351BF842
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 06:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66A4740517
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 06:22:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66A4740517
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4TeeeUyQcq80 for <buildroot@lists.busybox.net>;
 Wed,  5 Jul 2023 06:22:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F67A400D9
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F67A400D9
 for <buildroot@buildroot.org>; Wed,  5 Jul 2023 06:22:11 +0000 (UTC)
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout02.mail.de (Postfix) with ESMTP id 3F8F2A06EF;
 Wed,  5 Jul 2023 08:22:09 +0200 (CEST)
Received: from smtp04.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix03.mail.de (Postfix) with ESMTP id 1CDD48006A;
 Wed,  5 Jul 2023 08:22:09 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp04.mail.de (Postfix) with ESMTPSA id E4177C00A9;
 Wed,  5 Jul 2023 08:22:06 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed,  5 Jul 2023 08:21:41 +0200
Message-Id: <20230705062142.10968-2-kilian.zinnecker@mail.de>
In-Reply-To: <c30c93e29177a1dc15446eff427c7ca8@umbiko.net>
References: <c30c93e29177a1dc15446eff427c7ca8@umbiko.net>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 2754
X-purgate-ID: 154282::1688538128-9F7E8C09-B65C55DF/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1688538129;
 bh=TiFZYKSeeHsb6lzU73QISiXnXSCoE5gmvNGGLm0TNe4=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=Bn1qmaHg4nwuBxAqjZMkBVeLRcL0T0WYBUOX4Xi+aiGT0X2ye98VD8zbfpX7vzHKf
 1Pv32Ai/cI9Zk/CFuAO2CO7x0AEsKaATv3ldHDCXaItE8+pyfPQ1ViG3roqJlh0LpW
 HhEIfsusBFDHRxhlmmQRnj6DL33uv12EzRl2r7Zt4CQzBBuwBO+wsxquBAU9pF4FfK
 e8rZ02LXnXK283FCTGRtraUvph3kTKOIdPAWW+C0IXhMIDLQuYrtHkB4/85eGa/8TF
 8e3lrnfyXxCwYXyGpET1cdhh7EIoQecLXP9BOgHwYogPtFQIjDQYbb+xpHJ3tyWUxG
 +PzEoqfbQzarw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=Bn1qmaHg
Subject: [Buildroot] [PATCH v3 2/3] configs: add rock5b/rock5b_defconfig
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
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
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
 configs/rock5b_defconfig          | 37 +++++++++++++++++++++++++++++++
 3 files changed, 40 insertions(+)
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
index 0000000000..8107bbd0a6
--- /dev/null
+++ b/configs/rock5b_defconfig
@@ -0,0 +1,37 @@
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
+BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN=y
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="BL31=bl31.bin ROCKCHIP_TPL=ddr.bin"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_DTC=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
