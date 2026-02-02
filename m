Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D58AE7DF13
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 17:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71471822AA;
	Mon,  2 Feb 2026 17:44:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZXXmqDlHSLPw; Mon,  2 Feb 2026 17:44:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B354822C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770054256;
	bh=3AnEo93xxR+dC1SkkqPqDW9NckZg61SLYJfjkJKBjjs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=M3+UhNUxFSWapj8aTIZDI4c4hWOomtmDSAdJ9Kw56hYA2UNhgmEWdghkuxztixYMO
	 YDmUPxcz4G3puSZKouHOQR1sc/xuHS4ANbevqtaFnNaVS9l3R64ZXqMlJpgo7nXL5r
	 f9Agdlzb3vClquLVlGvnmjMFJn36NMRvj8TMWAcG8mThhqvzfy93dwaCgvxUUITCU5
	 47up3KJL6mBSLGOJMZZKS+Z1fK0bsWug5J/lX8+7soZ7mq95k/cvS0IGI3KJOyHpxd
	 Gop25M71s/NWfne/+g9dp70JDzPNCoha+W9j0axqdC43xyUjzOQe5TYkddyWmqMf8e
	 OoVr3O+84EUHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B354822C0;
	Mon,  2 Feb 2026 17:44:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A88DC23E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB99340344
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:44:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GyrD1xLfdvo2 for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 17:44:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D10604034E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D10604034E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:44:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3A6F8645E; Mon,  2 Feb 2026 17:44:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 18:43:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 76dee8aadc31dfa3fea03d18b3b0c2ac1c08c5d6
X-Git-Newrev: 77670c33d24b7766bf3d7a090510e2863180d286
X-Patchwork-Hint: ignore
Message-Id: <20260202174403.C3A6F8645E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arm-trusted-firmware: Add support for
 custom license files
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=77670c33d24b7766bf3d7a090510e2863180d286
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ATF package was not providing any license file when a custom
Linux version was selected.

Fix this by adding a Kconfig option to specify the license file,
with a default value set to the commonly used license paths.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
[Arnout: use a single Kconfig option with conditional prompt]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 boot/arm-trusted-firmware/Config.in               | 8 ++++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 9 +++------
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 72684e5974..5eee2362ea 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -80,6 +80,14 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION
 
 endif
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LICENSE_FILES
+	string "ATF license files" if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT || \
+		BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL
+	default "docs/license.rst"
+	help
+	  A space-separated list of license files related to the ATF
+	  package.
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM
 	string "ATF platform"
 	help
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index f5b1e5030e..bb113741d6 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -18,14 +18,11 @@ else
 # Handle stable official ATF versions
 ARM_TRUSTED_FIRMWARE_SITE = https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git
 ARM_TRUSTED_FIRMWARE_SITE_METHOD = git
-# The licensing of custom or from-git versions is unknown.
-# This is valid only for the latest (i.e. known) version.
-ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_8_VERSION)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_12_VERSION),y)
-ARM_TRUSTED_FIRMWARE_LICENSE = BSD-3-Clause
-ARM_TRUSTED_FIRMWARE_LICENSE_FILES = docs/license.rst
-endif
 endif
 
+ARM_TRUSTED_FIRMWARE_LICENSE = BSD-3-Clause
+ARM_TRUSTED_FIRMWARE_LICENSE_FILES = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LICENSE_FILES))
+
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE):$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT),y:y)
 BR_NO_CHECK_HASH_FOR += $(ARM_TRUSTED_FIRMWARE_SOURCE)
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
