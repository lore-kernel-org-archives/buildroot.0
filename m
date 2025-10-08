Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29904CAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  8 Oct 2025 16:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D120840BF1;
	Wed,  8 Oct 2025 16:56:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hBQ99AW9QtLB; Wed,  8 Oct 2025 16:56:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F146840BF2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F146840BF2;
	Wed,  8 Oct 2025 16:56:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F1824226
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 16:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBFE0816D8
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 16:55:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vm0FtZ6k-L5F for <buildroot@buildroot.org>;
 Wed,  8 Oct 2025 16:55:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DADB3816DE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DADB3816DE
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 16:55:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9C4086ACF; Wed,  8 Oct 2025 16:55:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Oct 2025 18:51:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d90d3ae8a667bd34d1af989267e3e3e5f3332a28
X-Git-Newrev: 054b49a26fe594e808ab0bf5f28629f9ca0f02ce
X-Patchwork-Hint: ignore
Message-Id: <20251008165558.C9C4086ACF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: Add option to
 install cadence MHDP8546 DPI/DP bridge firmware
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

commit: https://git.buildroot.net/buildroot/commit/?id=054b49a26fe594e808ab0bf5f28629f9ca0f02ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cadence MHDP8546 DPTX IP used in TI J721E SoC needs the firmware to
work.

Signed-off-by: Andy Yan <andyshrk@163.com>
[Julien: move Config.in entry from "Wifi" to "Video" section]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/linux-firmware/Config.in           | 5 +++++
 package/linux-firmware/linux-firmware.hash | 1 +
 package/linux-firmware/linux-firmware.mk   | 5 +++++
 3 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 9e01831ed1..4a6eaa9428 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -33,6 +33,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_AMDGPU
 	help
 	  Firmware files for AMD GPU video cards.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_CDNS_MHDP8546
+	bool "Cadence MHDP8546"
+	help
+	  Firmware file for the Cadence MHDP8546 DPI/DP bridge.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_CNM_WAVE521C_K3_CODEC
 	bool "Chips&Media Wave 521C codec IP for K3"
 	help
diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 66e7a47275..3824467072 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -15,6 +15,7 @@ sha256  515bf4c9d620a87458e4447fe01a0e9bc384d1c3e0037cc4c3d2037b1ff25525  ath12k
 sha256  bf1cb89140fe7e138fec229b26fa45d2fb46f416ab559916c6e56c0224df2e8e  LICENCE.bnx2
 sha256  691f2b5e3e94e06aa89450c99ff08c83336c77fe4ad64a609b1cddea4bf98727  LICENCE.bnx2x
 sha256  b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d  LICENCE.broadcom_bcm43xx
+sha256  5b97965d9a820a747fa1ab6339290cea0e6ce86b001e6620c4de4c0df532ed2f  LICENCE.cadence
 sha256  a5777f9e80aca0603b0648454de996168b1c530322550ccda94d6d78bcf6c061  LICENCE.chelsio_firmware
 sha256  88236d5ae45b7abc96c2ab4c6952af88758e24b17412dd173746ee1c559b3c6f  LICENCE.cnm
 sha256  ae0db6cc4db33941148df0f67de53e76a77b1b5a46b3165edb7040aa2750015f  LICENCE.cypress
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 67d56e4f58..287f896c87 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -954,6 +954,11 @@ LINUX_FIRMWARE_FILES += ti_3410.fw ti_5052.fw \
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.moxa
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CDNS_MHDP8546),y)
+LINUX_FIRMWARE_FILES += cadence/mhdp8546.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.cadence
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CX231XX),y)
 LINUX_FIRMWARE_FILES += v4l-cx231xx-avcore-01.fw
 # No license file; the license is in the file WHENCE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
