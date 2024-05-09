Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7893CC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 15:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFF8183D77;
	Thu,  9 May 2024 15:16:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 34DB1tGZOlJi; Thu,  9 May 2024 15:16:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9CFC83DA4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9CFC83DA4;
	Thu,  9 May 2024 15:16:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 24FA11BF39C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19B0383D83
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:16:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id snMo_TbCLHZX for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 15:16:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35DD183D77
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35DD183D77
 for <buildroot@buildroot.org>; Thu,  9 May 2024 15:16:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DBD4F86BE8; Thu,  9 May 2024 15:16:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 17:15:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d24fd1b140a2ddd71d0cc420dafb8d5d2e579ddd
X-Git-Newrev: 5d977ec1d46f66e11b624efb310baef359937c83
X-Patchwork-Hint: ignore
Message-Id: <20240509151615.DBD4F86BE8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: improve help text
 for Realtek 88xx Bluetooth firmware
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
Content-Type: multipart/mixed; boundary="===============5711223744731678884=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5711223744731678884==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5d977ec1d46f66e11b624efb310baef359937c83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace description of specific module names with generic help string
because the implementation switched to globbing to collect all rtl88*
blobs.

Signed-off-by: Gero Schwäricke <gero.schwaericke@posteo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index ce0b88ad6c..7e19d14b1e 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -107,7 +107,7 @@ config BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX_BT
 config BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX_BT
 	bool "Realtek 88xx Bluetooth"
 	help
-	  Realtek 8821a/8821c/8822b/8822cs/8822cu/8852au
+	  Firmware files for Realtek Bluetooth modules 88xx.
 
 config BR2_PACKAGE_LINUX_FIRMWARE_TI_CC2560
 	bool "TI CC2560"

--===============5711223744731678884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5711223744731678884==--
