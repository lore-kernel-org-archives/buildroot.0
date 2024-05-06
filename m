Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B02C25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7F0A608FB;
	Mon,  6 May 2024 20:43:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r20UbyDJOquO; Mon,  6 May 2024 20:43:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B85BA608FE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B85BA608FE;
	Mon,  6 May 2024 20:43:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DDCA31BF947
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7C0A40217
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:43:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uesdhGLIM7_k for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:43:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 000F340108
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 000F340108
 for <buildroot@buildroot.org>; Mon,  6 May 2024 20:43:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E0D218692F; Mon,  6 May 2024 20:43:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 May 2024 22:42:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 26f5efd7cd1f4074c5e8dcc77199ad78e6033fec
X-Git-Newrev: 9b25246e9b731f167454ba4f8182eed1926f50a6
X-Patchwork-Hint: ignore
Message-Id: <20240506204325.E0D218692F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: Add Intel AtomISP
 v2 firmwares
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

commit: https://git.buildroot.net/buildroot/commit/?id=9b25246e9b731f167454ba4f8182eed1926f50a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Many of Intel based tablets (and all phones that were designed with
Intel SoCs) have Intel AtomISP v2 engine. Add an entry for recently
added firmwares for them.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/Config.in         | 6 ++++++
 package/linux-firmware/linux-firmware.mk | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 920c0a2ef1..ce0b88ad6c 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -637,6 +637,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_CX23885
 	  Firmware files for Conexant Cx23885/7/8 PCIe broadcast
 	  A/V decoder needed by the Linux CX23885 driver.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_INTEL_ATOMISP
+	bool "Intel AtomISP v2"
+	help
+	  Firmware files for Intel AtomISP v2 (also know as IPU2)
+	  needed by the Linux AtomISP v2 driver.
+
 endmenu
 
 endif
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 0821816246..84c96d2216 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -846,6 +846,12 @@ LINUX_FIRMWARE_FILES += v4l-cx23885-avcore-01.fw
 # which is installed unconditionally
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_INTEL_ATOMISP),y)
+LINUX_FIRMWARE_FILES += intel/ipu/shisp_2400b0_v21.bin
+LINUX_FIRMWARE_FILES += intel/ipu/shisp_2401a0_v21.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ivsc
+endif
+
 ifneq ($(LINUX_FIRMWARE_FILES)$(LINUX_FIRMWARE_DIRS),)
 
 define LINUX_FIRMWARE_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
