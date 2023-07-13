Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B520C001B0
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 21:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9948B40B29;
	Thu, 13 Jul 2023 21:11:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9948B40B29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rjTrgtwoEbvx; Thu, 13 Jul 2023 21:11:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFE4F4044A;
	Thu, 13 Jul 2023 21:11:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFE4F4044A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8190B1BF383
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 21:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 687BA40B29
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 21:11:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 687BA40B29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cUiXf9vQM_tt for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 21:11:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5D2C404CA
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 21:11:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5D2C404CA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 93C0987000; Thu, 13 Jul 2023 21:11:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Jul 2023 23:01:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe7d5e9695f057ad0e0fa9ff2a45c3150591665b
X-Git-Newrev: 320cba89512b36b26c7e9447e0f726cc9add8fb3
X-Patchwork-Hint: ignore
Message-Id: <20230713211113.93C0987000@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: Add Broadcom BNX2
 firmware
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

commit: https://git.buildroot.net/buildroot/commit/?id=320cba89512b36b26c7e9447e0f726cc9add8fb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/Config.in         | 7 ++++++-
 package/linux-firmware/linux-firmware.mk | 6 ++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 4b415a7da2..72a5bcddcd 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -449,8 +449,13 @@ config BR2_PACKAGE_LINUX_FIRMWARE_BROADCOM_TIGON3
 	  Firmware files for Broadcom Tigon3 ethernet cards
 	  (tigon)
 
-config BR2_PACKAGE_LINUX_FIRMWARE_BNX2X
+config BR2_PACKAGE_LINUX_FIRMWARE_BNX2
 	bool "Broadcom NetXtremeII"
+	help
+	  Firmware files for Broadcom NetXtreme ethernet cards (bnx2)
+
+config BR2_PACKAGE_LINUX_FIRMWARE_BNX2X
+	bool "Broadcom NetXtremeII 10Gb"
 	help
 	  Firmware files for Broadcom NetXtreme 10Gb ethernet cards
 	  (bnx2x)
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 393f82774d..1819ae71f0 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -527,6 +527,12 @@ LINUX_FIRMWARE_FILES += tigon/*
 # which is installed unconditionally
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BNX2),y)
+LINUX_FIRMWARE_FILES += bnx2/*
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BNX2X),y)
 LINUX_FIRMWARE_FILES += bnx2x/*
 # No license file; the license is in the file WHENCE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
