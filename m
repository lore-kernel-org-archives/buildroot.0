Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB4CEB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 16:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90D0341B8A;
	Mon, 26 Jun 2023 16:03:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90D0341B8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DyLPuGcls_Jz; Mon, 26 Jun 2023 16:03:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AF6E4049A;
	Mon, 26 Jun 2023 16:03:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AF6E4049A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 251231BF951
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 16:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F21316137C
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 16:01:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F21316137C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wBIIoMXCyn5F for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 16:01:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5648061324
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5648061324
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 16:01:21 +0000 (UTC)
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout02.mail.de (Postfix) with ESMTP id 3B3BCA0426;
 Mon, 26 Jun 2023 18:01:19 +0200 (CEST)
Received: from smtp04.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix01.mail.de (Postfix) with ESMTP id 237C5802C6;
 Mon, 26 Jun 2023 18:01:19 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp04.mail.de (Postfix) with ESMTPSA id A268FC0058;
 Mon, 26 Jun 2023 18:01:18 +0200 (CEST)
To: buildroot@buildroot.org, giulio.benetti@benettiengineering.com
Date: Mon, 26 Jun 2023 18:01:18 +0200
Message-ID: <2685852.mvXUDI8C0e@kilian-aisec>
In-Reply-To: <67b3c17a-25b9-1d6f-ee15-86340819c4a9@benettiengineering.com>
References: <12221308.O9o76ZdvQC@kilian-aisec>
 <5942184.lOV4Wx5bFT@kilian-aisec>
 <67b3c17a-25b9-1d6f-ee15-86340819c4a9@benettiengineering.com>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 4001
X-purgate-ID: 154282::1687795278-FCFFDC09-7123B36A/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1687795279;
 bh=65HdamAGUJfpwSBNX0o644qLpQDhahV9xdpdGUa/4yw=;
 h=From:To:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=Q27kJYaDzTNWBtSpAYJ0ex4fSDgs/vAzfEiJ0grkrXhWrgDT7gMPlNRNpZ4i9/9qw
 vFmNTkLXZrpy3q2lz+ijnfwoTns09NvC0RoIX7tNITOZFJyNEwXNlJ/JCDXT27yQ6w
 aUH/4UPbcjWtgqRMOhETBHviuIdU+zemL3EOoa07hRXnXUX1U/nOozIv3mfOAsjlVc
 MEvw0PGeeO/9794ES8kyTwmW2n31WCgvmheEKfTEsZ8E/CgaQrdt/jKQgviVNJk3A8
 tYvMPgKNAbMP1nNs39Jb5CEzm/VA9eaBaNd6425qyhgx8lX+w7+NTOguXnoFAGZLR6
 UcfOvVj+mNaeg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=Q27kJYaD
Subject: Re: [Buildroot] Interested in board support for Radxa Rock 5b
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

I am a little bit stuck at the moment. This is my defconfig so far:

BR2_aarch64=y
BR2_cortex_a76_a55=y
BR2_KERNEL_HEADERS_5_10=y
BR2_DL_DIR="$(BASE_DIR)/../../buildroot.dl"
BR2_TARGET_GENERIC_HOSTNAME="rock5b"
BR2_TARGET_GENERIC_ISSUE="Welcome to the rock5b board"
BR2_SYSTEM_DHCP="eth0"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/radxa/kernel.git"
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="52f51a2b5ba178f331af62260d2da86d7472c14b"
BR2_LINUX_KERNEL_DEFCONFIG="rockchip_linux"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3588-rock-5b"
BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=y
BR2_PACKAGE_AVAHI=y
BR2_PACKAGE_AVAHI_DAEMON=y
BR2_PACKAGE_OPENSSH=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
BR2_TARGET_UBOOT_CUSTOM_VERSION=y
BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.07-rc4"
BR2_PACKAGE_ROCKCHIP_RKBIN=y
BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock5b-rk3588"
BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_DTC=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y
BR2_PACKAGE_HOST_UBOOT_TOOLS=y


This already properly checks out the uboot version and the Rock 5B uboot 
defconfig.
Next I want to properly setup the package for the rkbin repository (containing 
the Rockchip blobs). I therefore created the folder package/rockchip-rkbin and 
added an entry to package/Config.in:

diff --git a/package/Config.in b/package/Config.in
index ad438667d2..ccdec3b49d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -580,6 +580,7 @@ endmenu
        source "package/read-edid/Config.in"
        source "package/rng-tools/Config.in"
        source "package/rockchip-mali/Config.in"
+       source "package/rockchip-rkbin/Config.in"
        source "package/rpi-userland/Config.in"
        source "package/rs485conf/Config.in"
        source "package/rtc-tools/Config.in"


I also added a package/rockchip-rkbin/Config.in:


config BR2_PACKAGE_ROCKCHIP_RKBIN
        bool "Rockchip RKBIN binary blobs"
        depends on BR2_arm || BR2_aarch64
        help
          Those packages provide binary blobs for the Rockchip RK
          SoCs.

if BR2_PACKAGE_ROCKCHIP_RKBIN
choice
        prompt "Rockchip RK platform"

config BR2_PACKAGE_ROCKCHIP_RK_PLATFORM_RK3588
        bool "rk3588"
endchoice

config BR2_PACKAGE_ROCKCHIP_RK_PLATFORM
        string
        default "RK3588" if BR2_PACKAGE_ROCKCHIP_RK_PLATFORM_RK3588
endif

However, I am struggling a bit with the makefile package/rockchip-rkbin/
rockchip-rkbin.mk. It currently has (uncomplete) contents:

################################################################################
#
# firmware-rk
#
################################################################################

FIRMWARE_RKBIN_VERSION = d6ccfe401ca84a98ca3b85c12b9554a1a43a166c
FIRMWARE_RKBIN_SITE = https://github.com/rockchip-linux/rkbin.git
FIRMWARE_RKBIN_SITE_METHOD = git

FIRMWARE_RKBIN_INSTALL_IMAGES = YES
FIRMWARE_RKBIN_INSTALL_STAGING = YES
FIRMWARE_RKBIN_INSTALL_TARGET = YES

$(eval $(generic-package))


Of course this is not yet sufficient. However, I am struggling with the makefile. 
As a first step, I only want buildroot to download the repository. However, if 
I execute "make rockchip-rkbin-dirclean" followed by "make rockchip-rkbin-
rebuild", it only creates an (almost) empty output/build/rockchip-rkbin 
folder, only containing stamp files. Also no rockchip-rkbin folder gets created 
in my buildroot.dl download folder. It looks like buildroot does not download 
the rockchip-linux/rkbin.git repository at all. Do you have a suggestion, what 
I might be doing wrong here? Do I have to implement some hooks in order for 
the git to be downloaded?

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
