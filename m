Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3447BC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 15:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C80B383D74;
	Thu,  9 May 2024 15:16:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VfEeZE8bWW2t; Thu,  9 May 2024 15:16:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D07C583D77
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D07C583D77;
	Thu,  9 May 2024 15:16:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1FE151BF39C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15ED683D7B
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:16:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SjANa99DU9Gc for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 15:16:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD57B83D74
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD57B83D74
 for <buildroot@buildroot.org>; Thu,  9 May 2024 15:16:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CFA0D86BE7; Thu,  9 May 2024 15:16:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 17:13:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c37e98f486e1f9201d0ff91d9e8166849ae422ac
X-Git-Newrev: d24fd1b140a2ddd71d0cc420dafb8d5d2e579ddd
X-Patchwork-Hint: ignore
Message-Id: <20240509151615.CFA0D86BE7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: install all rtl88
 Bluetooth binary blobs
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
Content-Type: multipart/mixed; boundary="===============2839956101483433042=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2839956101483433042==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d24fd1b140a2ddd71d0cc420dafb8d5d2e579ddd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use generic pattern rtl88*.bin to install all binary blobs. The
difference with the current version of linux-firmware is that this
will additionally install the rtl_bt/rtl8852cu_fw_v2.bin file, which
is used by the drivers/bluetooth/btrtl.c Linux kernel driver since
Linux 6.6.

Signed-off-by: Gero Schwäricke <gero.schwaericke@posteo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/linux-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index e6227c2ab9..3e7cb64a94 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -90,7 +90,7 @@ endif
 # Realtek 88xx Bluetooth
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX_BT),y)
 LINUX_FIRMWARE_FILES += \
-	rtl_bt/rtl88*_fw.bin rtl_bt/rtl88*_config.bin
+	rtl_bt/rtl88*.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
 endif
 

--===============2839956101483433042==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2839956101483433042==--
