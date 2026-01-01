Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19C4EEB579
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 15:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C4F18153D;
	Thu,  1 Jan 2026 15:53:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BE9nEffoKcVJ; Thu,  1 Jan 2026 15:53:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFDF381521
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767282811;
	bh=nQE6gYJ7YPIVqwTKsDjq9Act0Tm8UK90KXXs0TYjp64=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I7PGTUc131o/8QTHF+IRcwPeOAnYRjo8Yb6SLvSJpl3WIpXbmRqHkq1cLZxNdnck5
	 80zMLyEXCrh/EtnQcveZMxaHfiWyfKWpdUAiL3oNqU21WvqPxaM9/0B/NaJ8Ous7Y8
	 2SubI5cmdweP287pqCtiDa4jjZ+bUOEVhIMVAH5UPVyJZYc5u0zKmismNNpLglm4iE
	 vNPLDGQBaDPcjWbx4UANfS5EbvHcLsPOyU6iRt3XhBZWrCJCLQdCU+eUaRBlrp0jMH
	 mp82aW2nfNvhfaxTYxRmZ1O8gkKN2ShBUNQPGkLnMSgjFy9KLhNqkuoIAbOhxV2d/y
	 7fHwl0CZyxkNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFDF381521;
	Thu,  1 Jan 2026 15:53:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CCDFB206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE1B460B46
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:53:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Vn2rbPmKAJ6 for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 15:53:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0888D60B43
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0888D60B43
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:53:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED52A87DDE; Thu,  1 Jan 2026 15:53:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 16:53:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ced81d0b4bcd9bc6b84cdb12fcac8c8c172625b
X-Git-Newrev: eef0aa9f9711a2fc3a1ac5d615807228eb0b52c1
X-Patchwork-Hint: ignore
Message-Id: <20260101155327.ED52A87DDE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/esp-hosted: drop
 BR2_PACKAGE_ESP_HOSTED_TARGET_ESP32 choice
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=eef0aa9f9711a2fc3a1ac5d615807228eb0b52c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As pointed in this PR[0] ESP_SLAVE and CONFIG_TARGET_* became useless after
commit [1] so let's drop the SoC Target choice. The SoC ID is automatically
retrieved via SDIO commands, so no need to specify it.

[0]: https://github.com/espressif/esp-hosted/pull/668
[1]: https://github.com/espressif/esp-hosted/commit/b544b01e201bdef20c680a6902c1495e46dde1ff

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/esp-hosted/Config.in     | 14 --------------
 package/esp-hosted/esp-hosted.mk |  6 ------
 2 files changed, 20 deletions(-)

diff --git a/package/esp-hosted/Config.in b/package/esp-hosted/Config.in
index 5abab73b57..42e1afa8c5 100644
--- a/package/esp-hosted/Config.in
+++ b/package/esp-hosted/Config.in
@@ -28,18 +28,4 @@ config BR2_PACKAGE_ESP_HOSTED_SPI
 
 endchoice
 
-choice
-	prompt "Target"
-	default BR2_PACKAGE_ESP_HOSTED_TARGET_ESP32
-	help
-	  Select which SoC Target driver is used for
-
-config BR2_PACKAGE_ESP_HOSTED_TARGET_ESP32
-	bool "ESP32"
-
-config BR2_PACKAGE_ESP_HOSTED_TARGET_ESP32C6
-	bool "ESP32C6"
-
-endchoice
-
 endif
diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
index 01a05135b1..15603b9679 100644
--- a/package/esp-hosted/esp-hosted.mk
+++ b/package/esp-hosted/esp-hosted.mk
@@ -29,11 +29,5 @@ else
 ESP_HOSTED_MODULE_MAKE_OPTS = target=sdio
 endif
 
-ifeq ($(BR2_PACKAGE_ESP_HOSTED_TARGET_ESP32),y)
-ESP_HOSTED_MODULE_MAKE_OPTS += ESP_SLAVE=CONFIG_TARGET_ESP32=y
-else
-ESP_HOSTED_MODULE_MAKE_OPTS += ESP_SLAVE=CONFIG_TARGET_ESP32C6=y
-endif
-
 $(eval $(kernel-module))
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
