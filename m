Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8A0C52D6F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 22:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C252406A2;
	Wed,  7 Aug 2024 22:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p7rCmL9fXg6j; Wed,  7 Aug 2024 22:07:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE70B40775
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE70B40775;
	Wed,  7 Aug 2024 22:07:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B6DA1BF983
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 22:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2483A400D1
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 22:07:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQgnnNn8ftVa for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 22:07:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FA3540A99
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FA3540A99
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 22:07:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E8AE84705; Wed,  7 Aug 2024 22:07:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Aug 2024 23:47:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7f2cfcc8f41ddcab5b573c31f8fa99b9c32ff16f
X-Git-Newrev: c48c3cf48223f2abda7da58bf206eac87c89b08b
X-Patchwork-Hint: ignore
Message-Id: <20240807220742.0E8AE84705@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/arm-trusted-firmware: add lts-v2.10.x
 selection
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

commit: https://git.buildroot.net/buildroot/commit/?id=c48c3cf48223f2abda7da58bf206eac87c89b08b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is a new lts-v2.10.x branch. Add it to the selection

Signed-off-by: Bryan Brattlof <bb@ti.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/arm-trusted-firmware/Config.in                 | 6 ++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.hash | 1 +
 2 files changed, 7 insertions(+)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 870db48c80..02a6db795a 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -16,6 +16,11 @@ choice
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
 	bool "v2.11"
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION
+	bool "latest lts-v2.10.x"
+	help
+	  Select the latest LTS v2.10.x version available
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_8_VERSION
 	bool "latest lts-v2.8.x"
 	help
@@ -48,6 +53,7 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_VERSION
 	string
 	default "v2.11"		if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
+	default "lts-v2.10.5"	if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION
 	default "lts-v2.8.20"	if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_8_VERSION
 	default "custom"	if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL
 	default BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION \
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.hash b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
index 37819ed160..4e446eaff5 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,4 +1,5 @@
 # Locally calculated
 sha256  c0f23ccc71c49989e9ad238acf334473c17b7c88f79a20c829c3d443e3794a22  arm-trusted-firmware-v2.11-git4.tar.gz
+sha256  62af6f1f2e9406d761ace03025f6bf22a0670578b1d0b76092dc1db455746dad  arm-trusted-firmware-lts-v2.10.5-git4.tar.gz
 sha256  a90617cc2c1791c98d36b9e3d9a7f3f77029897e00c4279ff4ef559b769e9d7b  arm-trusted-firmware-lts-v2.8.20-git4.tar.gz
 sha256  03d5088ff4fbfe989f3c807117356191c263cf27d62ee6916bde8532611728ed  docs/license.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
