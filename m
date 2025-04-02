Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863E0C36018
	for <buildroot@archiver.kernel.org>; Wed,  2 Apr 2025 19:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 468564115F;
	Wed,  2 Apr 2025 19:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XotUoGO77etf; Wed,  2 Apr 2025 19:28:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7874241137
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7874241137;
	Wed,  2 Apr 2025 19:28:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BD11123
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 19:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CEB483F35
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 19:27:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ytfvMpehFmLY for <buildroot@buildroot.org>;
 Wed,  2 Apr 2025 19:27:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE57A83F32
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE57A83F32
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 19:27:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF5A883AEF; Wed,  2 Apr 2025 19:27:57 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 2 Apr 2025 21:27:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7b88938eac47aa05f591a63c687aef6f646b92c
X-Git-Newrev: 68d0da4ba76fe016d0683fbe92b3def67c769745
X-Patchwork-Hint: ignore
Message-Id: <20250402192757.AF5A883AEF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: add option for
 Intel NPU firmware
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

commit: https://git.buildroot.net/buildroot/commit/?id=68d0da4ba76fe016d0683fbe92b3def67c769745
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an option to install the firmware files for Intel Neural Processing
Unit (NPU) device.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/linux-firmware/Config.in         | 13 +++++++++++++
 package/linux-firmware/linux-firmware.mk |  5 +++++
 2 files changed, 18 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 2daeeb53b4..83da3676db 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -732,4 +732,17 @@ config BR2_PACKAGE_LINUX_FIRMWARE_RP2
 
 endmenu
 
+menu "NPU Firmware"
+
+config BR2_PACKAGE_LINUX_FIRMWARE_INTEL_NPU
+	bool "Intel NPU firmware"
+	help
+	  Firmware files for Intel NPU device. Intel NPU device is an
+	  AI inference accelerator integrated with Intel client CPUs.
+	  The full device name is Neural Processing Unit, but the
+	  Linux kernel driver uses the older name Versatile Processing
+	  Unit (VPU).
+
+endmenu
+
 endif
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 0c0a2d5c4e..e5e1b32dfd 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -932,6 +932,11 @@ ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RP2),y)
 LINUX_FIRMWARE_FILES += rp2.fw
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_INTEL_NPU),y)
+LINUX_FIRMWARE_FILES += intel/vpu/vpu_*.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.intel_vpu
+endif
+
 ifneq ($(LINUX_FIRMWARE_FILES)$(LINUX_FIRMWARE_DIRS),)
 
 define LINUX_FIRMWARE_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
