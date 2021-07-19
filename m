Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FED8C432BE
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:13:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43C2960EE8
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 43C2960EE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E3A440631;
	Tue,  3 Aug 2021 22:13:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e5hrRL_w6JSu; Tue,  3 Aug 2021 22:13:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 782CA405FD;
	Tue,  3 Aug 2021 22:13:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B390F1BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6EA70404BC
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OI8OTI1ELaZ3 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6C9440567
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1B92A878D7; Tue,  3 Aug 2021 21:10:10 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 19 Jul 2021 23:28:23 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2f2395c171d5854137c48c23cdfc47fdcc2287a5
X-Git-Newrev: 54371c745c5727f2747fef95e62a07a0f3e803c0
X-Patchwork-Hint: ignore
Message-Id: <20210803211010.1B92A878D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/linux-firmware: add
 option for V4L cx231xx devices
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=54371c745c5727f2747fef95e62a07a0f3e803c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

V4L cx231xx devices need a firmware to be useful. So this patch adds
a submenu for V4L firmwares and an option for cx231xx devices.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/Config.in         | 10 ++++++++++
 package/linux-firmware/linux-firmware.mk |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 01d43f21dd..4376d44bda 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -518,4 +518,14 @@ config BR2_PACKAGE_LINUX_FIRMWARE_USB_SERIAL_TI
 
 endmenu
 
+menu "V4L Firmware"
+
+config BR2_PACKAGE_LINUX_FIRMWARE_CX231XX
+	bool "Conexant Cx23100/101/102 USB broadcast A/V decoder"
+	help
+	  Firmware files for Conexant Cx23100/101/102 USB broadcast
+	  A/V decoder needed by the Linux CX231XX driver.
+
+endmenu
+
 endif
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 9adab67bf1..90a38196fb 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -672,6 +672,12 @@ LINUX_FIRMWARE_FILES += ti_3410.fw ti_5052.fw \
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.moxa
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CX231XX),y)
+LINUX_FIRMWARE_FILES += v4l-cx231xx-avcore-01.fw
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 ifneq ($(LINUX_FIRMWARE_FILES)$(LINUX_FIRMWARE_DIRS),)
 
 define LINUX_FIRMWARE_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
