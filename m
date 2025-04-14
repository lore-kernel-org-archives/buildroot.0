Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9AFC369B2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 18:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64E2960E18;
	Mon, 14 Apr 2025 18:19:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PhiH3lW0VvVz; Mon, 14 Apr 2025 18:19:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40D9660BD9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40D9660BD9;
	Mon, 14 Apr 2025 18:19:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A1169205
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 18:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9143540494
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 18:19:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EQc-7cMPL43e for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 18:19:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B517340154
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B517340154
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 18:19:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE4BD846A9; Mon, 14 Apr 2025 18:19:37 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 14 Apr 2025 20:15:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3cfc8e7c6ffe2fbdfd729eeca3d15725278805ff
X-Git-Newrev: 68468e5e7f5ab2e9237e377bbcd3c70a8b8f1489
X-Patchwork-Hint: ignore
Message-Id: <20250414181937.AE4BD846A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: add support for
 amd-ucode
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

commit: https://git.buildroot.net/buildroot/commit/?id=68468e5e7f5ab2e9237e377bbcd3c70a8b8f1489
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This "amd-ucode" directory has been present in linux-firmware since
version 20190312.

Signed-off-by: Christian Stewart <christian@aperture.us>
[Julien: add comment about version in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/linux-firmware/Config.in           | 9 +++++++++
 package/linux-firmware/linux-firmware.hash | 1 +
 package/linux-firmware/linux-firmware.mk   | 5 +++++
 3 files changed, 15 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 83da3676db..34f3fb7691 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -17,6 +17,15 @@ config BR2_PACKAGE_LINUX_FIRMWARE_INTEL_SST_DSP
 
 endmenu # Audio
 
+menu "CPU Microcode"
+
+config BR2_PACKAGE_LINUX_FIRMWARE_AMD_UCODE
+	bool "amd-ucode"
+	help
+	  Firmware blobs for AMD CPUs (amd-ucode).
+
+endmenu # CPU Microcode
+
 menu "Video firmware"
 
 config BR2_PACKAGE_LINUX_FIRMWARE_AMDGPU
diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index df0888618c..eb86aec00b 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -3,6 +3,7 @@ sha256  b1083a36f19aea46f661dcfd4cd462d13933dcb4e7f0dc809525552dd5c3541d  linux-
 
 # Hash for license files
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
+sha256  27907ae1d74b94fd6f1159971158ed3199e472f129ea1ff748ea13aded2a59d5  LICENSE.amd-ucode
 sha256  572872598565dc3513470de971a32bf9db301f47afeef3636345eadae33b2eee  LICENSE.amdgpu
 sha256  2d6062d63b91eb750bf741498691604f75184b9fee97608ec537cd09bd6a42b4  LICENCE.Marvell
 sha256  802b7014b26c606cf6248ae8b0ab1ce6d2d1b0db236d38dd269e676cd70710f2  LICENCE.atheros_firmware
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 3d6c2b624c..cfce1707d7 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -15,6 +15,11 @@ LINUX_FIRMWARE_FILES += intel/fw_sst_0f28.bin-48kHz_i2s_master
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.fw_sst_0f28
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_AMD_UCODE),y)
+LINUX_FIRMWARE_DIRS += amd-ucode
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.amd-ucode
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_AMDGPU),y)
 LINUX_FIRMWARE_DIRS += amdgpu
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.amdgpu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
