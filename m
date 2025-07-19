Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A248AC83F34
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 10:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 762F5811FD;
	Sat, 19 Jul 2025 10:49:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GDbIeGYu5sin; Sat, 19 Jul 2025 10:49:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53D24811BD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53D24811BD;
	Sat, 19 Jul 2025 10:49:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 28AE8117
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 10:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B31C3613DC
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 10:49:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yQWV68Y04V9v for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 10:49:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14FAB6142C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14FAB6142C
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 10:49:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E0A686785; Sat, 19 Jul 2025 10:49:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Jul 2025 12:44:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 32e71aab7679fc7794a063790ba40ce63541a9eb
X-Git-Newrev: 57b6f97959d2ea2ab3d1039d7977c8f10423f43f
X-Patchwork-Hint: ignore
Message-Id: <20250719104953.0E0A686785@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: add option for
 Chips&Media Wave 521C
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=57b6f97959d2ea2ab3d1039d7977c8f10423f43f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an option to install the firmware files for Chips&Media Wave 521C
video processor used in the TI K3 architecture.

This "cnm/wave521c_k3_codec_fw.bin" file has been present in linux-firmware
since version 20221109.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Reviewed-by: Bryan Brattlof <bb@ti.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/linux-firmware/Config.in           | 6 ++++++
 package/linux-firmware/linux-firmware.hash | 1 +
 package/linux-firmware/linux-firmware.mk   | 5 +++++
 3 files changed, 12 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 34f3fb7691..b02ee03f56 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -33,6 +33,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_AMDGPU
 	help
 	  Firmware files for AMD GPU video cards.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_CNM_WAVE521C_K3_CODEC
+	bool "Chips&Media Wave 521C codec IP for K3"
+	help
+	  Firmware files for the Chips&Media Wave521C decoder
+	  needed by the Linux TI j721s2-wave521c driver.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_I915
 	bool "Intel i915 video card firmware"
 	help
diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index c9c673f7e2..7381f0c03a 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -14,6 +14,7 @@ sha256  bf1cb89140fe7e138fec229b26fa45d2fb46f416ab559916c6e56c0224df2e8e  LICENC
 sha256  691f2b5e3e94e06aa89450c99ff08c83336c77fe4ad64a609b1cddea4bf98727  LICENCE.bnx2x
 sha256  b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d  LICENCE.broadcom_bcm43xx
 sha256  a5777f9e80aca0603b0648454de996168b1c530322550ccda94d6d78bcf6c061  LICENCE.chelsio_firmware
+sha256  88236d5ae45b7abc96c2ab4c6952af88758e24b17412dd173746ee1c559b3c6f  LICENCE.cnm
 sha256  ae0db6cc4db33941148df0f67de53e76a77b1b5a46b3165edb7040aa2750015f  LICENCE.cypress
 sha256  60fbc9cccb455e1a3306c97db942d6f24fa93664be61d54c497637e6d0e2ae83  LICENCE.fw_sst_0f28
 sha256  5181b0b51efc79d5acb2c9bb92042878fdbad97a92114d4ab5e32e2b5b52fce4  LICENCE.ibt_firmware
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 38212e12ac..02e04770d0 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -25,6 +25,11 @@ LINUX_FIRMWARE_DIRS += amdgpu
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.amdgpu
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CNM_WAVE521C_K3_CODEC),y)
+LINUX_FIRMWARE_FILES += cnm/wave521c_k3_codec_fw.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.cnm
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_I915),y)
 LINUX_FIRMWARE_DIRS += i915
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.i915
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
