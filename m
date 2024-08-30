Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3926CE6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E042884BED;
	Fri,  6 Sep 2024 20:07:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tk_iiicXXX5a; Fri,  6 Sep 2024 20:07:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF2EF84BFB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF2EF84BFB;
	Fri,  6 Sep 2024 20:07:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B6511BF983
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 20:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C25AD60727
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S6x9hwoJjDZt for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:59:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 005636111E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 005636111E
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EBFE686C5A; Fri,  6 Sep 2024 19:58:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 30 Aug 2024 18:57:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3b104b805521ab529cef20c79b919d910718f20e
X-Git-Newrev: b6d023bdc2bb8585e779c3a1a7fac75b93bc7d41
X-Patchwork-Hint: ignore
Message-Id: <20240906195857.EBFE686C5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/rock5b: add firmware for the
 RTL8125 NIC
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b6d023bdc2bb8585e779c3a1a7fac75b93bc7d41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the proper firmware to avoid the following warning + error during
boot:
r8169 0004:41:00.0: Direct firmware load for rtl_nic/rtl8125b-2.fw failed with error -2
r8169 0004:41:00.0: Unable to load firmware rtl_nic/rtl8125b-2.fw (-2)

Note that the NIC appears functional even without the proper firmware.
However, add the firmware anyway, since the error messages are distracting
and clutters dmesg.

Signed-off-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/rock5b_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index 0778e8afdf..899537c001 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -22,6 +22,8 @@ BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN=y
 BR2_PACKAGE_ROCKCHIP_RKBIN=y
 BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME="bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.12.bin"
 BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME="bin/rk35/rk3588_bl31_v1.40.elf"
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
