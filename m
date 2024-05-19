Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2557C25B75
	for <buildroot@archiver.kernel.org>; Sun, 19 May 2024 10:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC1CB40510;
	Sun, 19 May 2024 10:14:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IxZMUnMWGXDE; Sun, 19 May 2024 10:14:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B913C40550
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B913C40550;
	Sun, 19 May 2024 10:14:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4FB141C3CA6
 for <buildroot@lists.busybox.net>; Sun, 19 May 2024 10:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC07E605D5
 for <buildroot@lists.busybox.net>; Sun, 19 May 2024 10:14:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yt8Qtios8H7z for <buildroot@lists.busybox.net>;
 Sun, 19 May 2024 10:14:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B9862605F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9862605F1
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9862605F1
 for <buildroot@buildroot.org>; Sun, 19 May 2024 10:14:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76900C0002;
 Sun, 19 May 2024 10:14:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1s8dYO-00024x-2t;
 Sun, 19 May 2024 12:14:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 May 2024 12:13:54 +0200
Message-Id: <20240519101355.7792-4-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240519101355.7792-1-peter@korsgaard.com>
References: <20240519101355.7792-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 4/5] configs/orangepi_r1_defconfig: bump Linux
 kernel to 6.6.31
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

And update the dts path to match the updated location after commit
724ba6751532 ("ARM: dts: Move .dts files to vendor sub-directories").

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/orangepi_r1_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/orangepi_r1_defconfig b/configs/orangepi_r1_defconfig
index 318fa126a7..80f88a168f 100644
--- a/configs/orangepi_r1_defconfig
+++ b/configs/orangepi_r1_defconfig
@@ -1,16 +1,16 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_R1"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi R1"
 BR2_SYSTEM_DHCP="eth0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.217"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.31"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h2-plus-orangepi-r1"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun8i-h2-plus-orangepi-r1"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-r1/linux-extras.config"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
