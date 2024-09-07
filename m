Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB32EB64CA
	for <buildroot@archiver.kernel.org>; Sat,  7 Sep 2024 16:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85B4C403CC;
	Sat,  7 Sep 2024 16:50:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QCSd7j04VMVo; Sat,  7 Sep 2024 16:50:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28A974033A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28A974033A;
	Sat,  7 Sep 2024 16:50:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B1121BF4DD
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 16:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5791B403C8
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 16:50:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MNgmSR4Qo7MU for <buildroot@lists.busybox.net>;
 Sat,  7 Sep 2024 16:50:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33ADC403C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33ADC403C0
 for <buildroot@buildroot.org>; Sat,  7 Sep 2024 16:50:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2AFF486DC3; Sat,  7 Sep 2024 16:50:35 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 7 Sep 2024 18:49:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3daa037528c38b91caf616cb47992da7730f4343
X-Git-Newrev: 03fa337577ea7ee1e0f5190e23855eab45a8a585
X-Patchwork-Hint: ignore
Message-Id: <20240907165035.2AFF486DC3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: Add option for
 Rocketport 2 firmware
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=03fa337577ea7ee1e0f5190e23855eab45a8a585
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an option to install the firmware file required by the Linux rp2
driver.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
[yann.morin.1998@free.fr: fix indentation in help text]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/linux-firmware/Config.in         | 10 ++++++++++
 package/linux-firmware/linux-firmware.mk |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 651ca45087..4a17ceaf0b 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -706,4 +706,14 @@ config BR2_PACKAGE_LINUX_FIRMWARE_ARM_MALI_CSF
 
 endmenu
 
+menu "Serial adapters firmware"
+
+config BR2_PACKAGE_LINUX_FIRMWARE_RP2
+	bool "Comtrol RocketPort EXPRESS/INFINITY firmware"
+	help
+	  Firmware files for the Comtrol RocketPort EXPRESS/INFINITY
+	  needed by the Linux rp2 kernel driver.
+
+endmenu
+
 endif
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index e40eab8dc8..ae10e160b9 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -910,6 +910,10 @@ LINUX_FIRMWARE_FILES += arm/mali/arch*/mali_csffw.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mali_csffw
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RP2),y)
+LINUX_FIRMWARE_FILES += rp2.fw
+endif
+
 ifneq ($(LINUX_FIRMWARE_FILES)$(LINUX_FIRMWARE_DIRS),)
 
 define LINUX_FIRMWARE_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
