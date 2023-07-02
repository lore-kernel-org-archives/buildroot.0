Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFC0EB64D9
	for <buildroot@archiver.kernel.org>; Sun,  2 Jul 2023 12:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB8E141527;
	Sun,  2 Jul 2023 12:46:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB8E141527
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1G8zDk9nFeWW; Sun,  2 Jul 2023 12:46:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E89F41528;
	Sun,  2 Jul 2023 12:46:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E89F41528
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EFAA31BF48C
 for <buildroot@lists.busybox.net>; Sun,  2 Jul 2023 12:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D603740165
 for <buildroot@lists.busybox.net>; Sun,  2 Jul 2023 12:46:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D603740165
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ukm8alLOe06x for <buildroot@lists.busybox.net>;
 Sun,  2 Jul 2023 12:45:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6372E4012B
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6372E4012B
 for <buildroot@buildroot.org>; Sun,  2 Jul 2023 12:45:58 +0000 (UTC)
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout01.mail.de (Postfix) with ESMTP id 0C3A7A05BA;
 Sun,  2 Jul 2023 14:45:57 +0200 (CEST)
Received: from smtp03.mail.de (smtp03.bt.mail.de [10.0.121.213])
 by postfix03.mail.de (Postfix) with ESMTP id E3229800C3;
 Sun,  2 Jul 2023 14:45:56 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp03.mail.de (Postfix) with ESMTPSA id AF36CA0472;
 Sun,  2 Jul 2023 14:45:56 +0200 (CEST)
To: Andreas Ziegler <br015@umbiko.net>
Date: Sun, 02 Jul 2023 14:45:55 +0200
Message-ID: <12237337.O9o76ZdvQC@kilian-aisec>
In-Reply-To: <c623c8d67b9f9af6423b719d812c6e1f@umbiko.net>
References: <mailman.173.1688221173.139798.buildroot@buildroot.org>
 <c623c8d67b9f9af6423b719d812c6e1f@umbiko.net>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 6182
X-purgate-ID: 154282::1688301956-C3715647-0EB4DB70/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1688301956;
 bh=NpB3l314Y7rY2LsU9n85QYs6uUjMZ1hmv2745z/jka8=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=G6TEIGzSt7Asa+kjaLfNSczT7MYgzwov+8MntZZ8lBZr8UmV9oSednIfNTQLGvAka
 W/Js+8y/G7ZnVtrNdhTTr+TZ1H6Glt1gCZalll7HaB2EYOqqWTj2HXejHlrOZQxsAO
 i7PAfIYtE6yvZ0p1o5qgO4vgRVIVT1jqjKtY6y1qZ9bqpdeCN+3b1ymfuXKWkOGWvW
 XR4AHbMJG+i5CJdQPx2+l7horeAzolmbs2Lvugk7SFMGSX1fU/ePLDXOGWdC4g7AUg
 0ZrCoMGDZ1akJ+zv2gyk6zvFyhFqcdzLe1jqrcRKJb/GDzi0cj9D5+3OZgf5C+09u7
 kisMMuwXgF0Ng==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=G6TEIGzS
Subject: Re: [Buildroot] [PATCH 1/3] package: add rockchip-rkbin package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Andreas,

thanks for your feedback! I had a look at u-boot's documentation about 
Rockchip's support (https://source.denx.de/u-boot/u-boot/-/blob/master/doc/
board/rockchip/rockchip.rst):

Only boards with rk3588 SoC (e.g., Rock 5b) and boards with rk3568 SoC 
currently need Rockchip binary blobs from the rkbin repository. However, I 
don't see any defconfig in buildroot for any of the rk3568 based boards, listed 
in u-boot's documentation. Hence, I think that it currently does not make any 
sense to have a potential choice for other Rockchip SoCs. Hence, as you 
suggested, I removed the two variables and introduced two variables to select 
the actual binary names, as they may differ if someone uses another commit id 
for the rkbin git repository. See the new version of the rockchip-rkbin 
Config.in and rockchip-rkbin.mk, and the new defconfig.

On the occasion: What is the common practice, if someone does rework on a 
patch? Shall I then send it as email response (like I do now)? Or should I 
better send a "new" email and add a version to the subject line, e.g., 
"[Buildroot] [Patch v2 1/3] package: add rockchip-rkbin package"?

Also, is there a way to add a flag to the Config.in of uboot, which makes a 
"depends on rockchip-rkbin" if the BR2_TARGET_UBOOT_BOARD_DEFCONFIG equals 
"rock5b-rk3588", "evb-rk3588", or "neu6a-io-rk3588"? Or is it beneficial to a 
an option like BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN?

Best regards,
Kilian


============


From 2acbcb5d0e1fc92fc388fa99cb25923e5497b17d Mon Sep 17 00:00:00 2001
From: Kilian Zinnecker <kilian.zinnecker@mail.de>
Date: Sun, 2 Jul 2023 14:41:41 +0200
Subject: [PATCH] Add rockchip-rkbin package and defconfig

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
---
 configs/rock5b_defconfig                 | 41 ++++++++++++++++++++++++
 package/Config.in                        |  1 +
 package/rockchip-rkbin/Config.in         | 18 +++++++++++
 package/rockchip-rkbin/rockchip-rkbin.mk | 19 +++++++++++
 4 files changed, 79 insertions(+)
 create mode 100644 configs/rock5b_defconfig
 create mode 100644 package/rockchip-rkbin/Config.in
 create mode 100644 package/rockchip-rkbin/rockchip-rkbin.mk

diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
new file mode 100644
index 0000000000..3c814bf356
--- /dev/null
+++ b/configs/rock5b_defconfig
@@ -0,0 +1,41 @@
+BR2_aarch64=y
+BR2_cortex_a76_a55=y
+BR2_KERNEL_HEADERS_5_10=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/radxa/rock5b/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS=""
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
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="BL31=$(BINARIES_DIR)/rk3588_bl31_v1.38.elf 
ROCKCHIP_TPL=$(BINARIES_DIR)/rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.11.bin"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/radxa/rock5b/uboot.fragment"
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_DTC=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
diff --git a/package/Config.in b/package/Config.in
index bff090a661..80221d0406 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -581,6 +581,7 @@ endmenu
 	source "package/read-edid/Config.in"
 	source "package/rng-tools/Config.in"
 	source "package/rockchip-mali/Config.in"
+	source "package/rockchip-rkbin/Config.in"
 	source "package/rpi-userland/Config.in"
 	source "package/rs485conf/Config.in"
 	source "package/rtc-tools/Config.in"
diff --git a/package/rockchip-rkbin/Config.in b/package/rockchip-rkbin/Config.in
new file mode 100644
index 0000000000..4005fd25ce
--- /dev/null
+++ b/package/rockchip-rkbin/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_ROCKCHIP_RKBIN
+	bool "Rockchip RKBIN binary blobs"
+	depends on BR2_arm || BR2_aarch64
+	help
+	  This package provides binary blobs, currently needed by
+	  u-boot for the Rockchip RK3588 SoC.
+
+if BR2_PACKAGE_ROCKCHIP_RKBIN
+
+config BR2_PACKAGE_ROCKCHIP_RKBIN_RK3588_DDRFW
+	string
+	default "rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.11.bin"
+
+config BR2_PACKAGE_ROCKCHIP_RKBIN_RK3588_EL3FW
+	string
+	default "rk3588_bl31_v1.38.elf"
+
+endif
diff --git a/package/rockchip-rkbin/rockchip-rkbin.mk b/package/rockchip-rkbin/
rockchip-rkbin.mk
new file mode 100644
index 0000000000..a173dedad5
--- /dev/null
+++ b/package/rockchip-rkbin/rockchip-rkbin.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# rockchip-rkbin
+#
+################################################################################
+
+
+ROCKCHIP_RKBIN_VERSION = d6ccfe401ca84a98ca3b85c12b9554a1a43a166c
+ROCKCHIP_RKBIN_SITE = https://github.com/rockchip-linux/rkbin.git
+ROCKCHIP_RKBIN_SITE_METHOD = git
+
+ROCKCHIP_RKBIN_INSTALL_STAGING = YES
+
+define ROCKCHIP_RKBIN_INSTALL_STAGING_CMDS
+	cp $(@D)/bin/rk35/$(BR2_PACKAGE_ROCKCHIP_RKBIN_RK3588_DDRFW) $
(BINARIES_DIR)/
+	cp $(@D)/bin/rk35/$(BR2_PACKAGE_ROCKCHIP_RKBIN_RK3588_EL3FW) $
(BINARIES_DIR)/
+endef
+
+$(eval $(generic-package))
--
2.34.1




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
