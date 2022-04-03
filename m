Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10906C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 19:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E1DA41547;
	Sun,  3 Apr 2022 19:08:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id efNozvlvq0Jg; Sun,  3 Apr 2022 19:08:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B58B41516;
	Sun,  3 Apr 2022 19:08:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E05A41BF36B
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 19:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD3CF4055E
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 19:08:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BFow2IILVvR2 for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 19:08:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32D624048B
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 19:08:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C954786089; Sun,  3 Apr 2022 18:59:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Apr 2022 21:08:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fccc96f6aa673bacec62b9ec82f8c888cb0b5a31
X-Git-Newrev: 7130bcb44c4c5cd9fd83dba6da28617f6c77a615
X-Patchwork-Hint: ignore
Message-Id: <20220403185907.C954786089@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: Add Intel WiFi
 3945ABG/BG/4965AGN
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

commit: https://git.buildroot.net/buildroot/commit/?id=7130bcb44c4c5cd9fd83dba6da28617f6c77a615
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add Intel WiFi 3945ABG/BG and 4965AGN firmware. This firmware is
required for the iwl4965 and iwl3945 kernel driver.

Signed-off-by: Stefan Agner <stefan@agner.ch>
[yann.morin.1998@free.fr: fix driver names in help texts]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/linux-firmware/Config.in         | 12 ++++++++++++
 package/linux-firmware/linux-firmware.mk | 10 ++++++++++
 2 files changed, 22 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 4a44d4a2b6..a0dda5fb6f 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -199,6 +199,18 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3168
 	  Firmware files for the Intel Wifi 3168 devices supported by
 	  the iwlwifi kernel driver.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3945
+	bool "Intel iwlwifi 3945"
+	help
+	  Firmware files for the Intel Wifi 3945 devices supported by
+	  the iwl3965 kernel driver.
+
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_4965
+	bool "Intel iwlwifi 4965"
+	help
+	  Firmware files for the Intel Wifi 4965 devices supported by
+	  the iwl4945 kernel driver.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5000
 	bool "Intel iwlwifi 5000"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 2eec8a291a..0c725737d0 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -457,6 +457,16 @@ LINUX_FIRMWARE_FILES += iwlwifi-3168-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3945),y)
+LINUX_FIRMWARE_FILES += iwlwifi-3945-2.ucode
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+endif
+
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_4965),y)
+LINUX_FIRMWARE_FILES += iwlwifi-4965-2.ucode
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+endif
+
 # iwlwifi 5000. Multiple files are available (iwlwifi-5000-1.ucode,
 # iwlwifi-5000-2.ucode, iwlwifi-5000-5.ucode), corresponding to
 # different versions of the firmware API. For now, we only install the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
