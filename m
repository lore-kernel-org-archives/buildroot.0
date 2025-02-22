Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4F7C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6094480F18;
	Fri, 28 Feb 2025 17:23:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y5O2K2LR_U5C; Fri, 28 Feb 2025 17:23:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A864859BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A864859BB;
	Fri, 28 Feb 2025 17:23:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 181EA68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A6E447A73
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Is9BPadcfSEl for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:32:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4451B47745
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4451B47745
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3FDE887C6E; Fri, 28 Feb 2025 16:30:46 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 22 Feb 2025 18:16:10 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d0711b892d09723cda3a3a017c8a1d62c51b81af
X-Git-Newrev: 811993924351dbd122a8da1b012069f5b7115ae9
X-Patchwork-Hint: ignore
Message-Id: <20250228163046.3FDE887C6E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/linux-firmware: add
 option for Chelsio T6
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=811993924351dbd122a8da1b012069f5b7115ae9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add an option to install the Chelsio T6 firmware files used by the cxgb4
driver.

Signed-off-by: iliana etaoin <iliana@buttslol.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/linux-firmware/Config.in         | 6 ++++++
 package/linux-firmware/linux-firmware.mk | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 4630252c5e..af36b8a6b1 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -570,6 +570,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T5
 	  Firmware files for Chelsio T5 1Gb and 10Gb ethernet cards
 	  (cxgb4)
 
+config BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T6
+	bool "Chelsio T6"
+	help
+	  Firmware files for Chelsio T6 1/10/25/40/50/100 Gb ethernet
+	  cards (cxgb4)
+
 config BR2_PACKAGE_LINUX_FIRMWARE_INTEL_E100
 	bool "Intel e100 825xx"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index e73d688592..fac5733ad4 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -647,6 +647,11 @@ LINUX_FIRMWARE_FILES += cxgb4/t5fw*.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T6),y)
+LINUX_FIRMWARE_FILES += cxgb4/t6fw*.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_INTEL_E100),y)
 LINUX_FIRMWARE_FILES += e100/*.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.e100
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
