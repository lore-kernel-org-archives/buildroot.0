Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2AFCC3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 22:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 932E4406CE;
	Wed,  7 Aug 2024 22:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YGlGWWr4FUuy; Wed,  7 Aug 2024 22:07:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B77AD40725
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B77AD40725;
	Wed,  7 Aug 2024 22:07:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 28EED1BF982
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 22:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21DDB406A7
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 22:07:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q1IzLwZ1lSso for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 22:07:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14D1B406A2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14D1B406A2
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 22:07:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0167284700; Wed,  7 Aug 2024 22:07:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Aug 2024 23:36:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c50759cd1677e1739078239a1e86fb1d62e33e8
X-Git-Newrev: 7f2cfcc8f41ddcab5b573c31f8fa99b9c32ff16f
X-Patchwork-Hint: ignore
Message-Id: <20240807220742.0167284700@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/arm-trusted-firmware: bump lts-v2.8
 to v2.8.20
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

commit: https://git.buildroot.net/buildroot/commit/?id=7f2cfcc8f41ddcab5b573c31f8fa99b9c32ff16f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

bump the lts-v2.8.x branch to v2.8.20. Our patch still applies.

Signed-off-by: Bryan Brattlof <bb@ti.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/arm-trusted-firmware/Config.in                                     | 2 +-
 boot/arm-trusted-firmware/arm-trusted-firmware.hash                     | 2 +-
 .../0001-build-tools-avoid-unnecessary-link.patch                       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 60ecf419bc..870db48c80 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -48,7 +48,7 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_VERSION
 	string
 	default "v2.11"		if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
-	default "lts-v2.8.13"	if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_8_VERSION
+	default "lts-v2.8.20"	if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_8_VERSION
 	default "custom"	if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL
 	default BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION \
 				if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.hash b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
index 8095eb29d2..37819ed160 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,4 +1,4 @@
 # Locally calculated
 sha256  c0f23ccc71c49989e9ad238acf334473c17b7c88f79a20c829c3d443e3794a22  arm-trusted-firmware-v2.11-git4.tar.gz
-sha256  695ae232fef6da931157e032b520f145b2c4cbe675d92b6a12222a332e960e89  arm-trusted-firmware-lts-v2.8.13-git4.tar.gz
+sha256  a90617cc2c1791c98d36b9e3d9a7f3f77029897e00c4279ff4ef559b769e9d7b  arm-trusted-firmware-lts-v2.8.20-git4.tar.gz
 sha256  03d5088ff4fbfe989f3c807117356191c263cf27d62ee6916bde8532611728ed  docs/license.rst
diff --git a/boot/arm-trusted-firmware/lts-v2.8.13/0001-build-tools-avoid-unnecessary-link.patch b/boot/arm-trusted-firmware/lts-v2.8.20/0001-build-tools-avoid-unnecessary-link.patch
similarity index 100%
rename from boot/arm-trusted-firmware/lts-v2.8.13/0001-build-tools-avoid-unnecessary-link.patch
rename to boot/arm-trusted-firmware/lts-v2.8.20/0001-build-tools-avoid-unnecessary-link.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
