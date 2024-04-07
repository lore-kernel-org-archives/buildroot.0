Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B4BCD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 16:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C3D041571;
	Sun,  7 Apr 2024 16:05:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aaNOR_obgZKr; Sun,  7 Apr 2024 16:05:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70ED9415FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70ED9415FA;
	Sun,  7 Apr 2024 16:05:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 69BCB1BF326
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 16:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9230A414BF
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 16:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P8FSRYaY1zJr for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 16:05:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 696864148F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 696864148F
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 16:05:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5DB778467C; Sun,  7 Apr 2024 16:05:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 18:04:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dece32b6f3957320bcb689394164151dd8707f3b
X-Git-Newrev: eb4adf179090bc9ffae8647b0bf2ce38b2f2438a
X-Patchwork-Hint: ignore
Message-Id: <20240407160511.5DB778467C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: RTL_88XX_BT:
 install all firmware
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=eb4adf179090bc9ffae8647b0bf2ce38b2f2438a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of enumerating each binary, which is cumbersome and may miss
some of them, simply install all binaries starting with rtl88.

Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/linux-firmware/linux-firmware.mk | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 60e8861abe..7e1e5cf6f2 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -90,16 +90,7 @@ endif
 # Realtek 88xx Bluetooth
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX_BT),y)
 LINUX_FIRMWARE_FILES += \
-	rtl_bt/rtl8812ae_fw.bin rtl_bt/rtl8821a_fw.bin \
-	rtl_bt/rtl8821c_config.bin rtl_bt/rtl8821c_fw.bin \
-	rtl_bt/rtl8822b_config.bin rtl_bt/rtl8822b_fw.bin \
-	rtl_bt/rtl8822cs_config.bin rtl_bt/rtl8822cs_fw.bin \
-	rtl_bt/rtl8822cu_config.bin rtl_bt/rtl8822cu_fw.bin \
-	rtl_bt/rtl8851bu_fw.bin rtl_bt/rtl8851bu_config.bin \
-	rtl_bt/rtl8852au_fw.bin rtl_bt/rtl8852au_config.bin \
-	rtl_bt/rtl8852bu_fw.bin rtl_bt/rtl8852bu_config.bin \
-	rtl_bt/rtl8852cu_fw.bin rtl_bt/rtl8852cu_config.bin \
-	rtl_bt/rtl8852cu_fw_v2.bin
+	rtl_bt/rtl88*_fw.bin rtl_bt/rtl88*_config.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
