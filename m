Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B39EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 690A54207B;
	Fri, 13 Feb 2026 19:38:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A6XV3tetQ_E0; Fri, 13 Feb 2026 19:38:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DAEA42083
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011509;
	bh=USnseCUYMUdaFhUzQ2k42neHWXQUH105BGPgJ8CWgqM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hg17Y3BA1NzxYq/Uzibzfe5wfV9ZPTEYL64uf4FnWmShUySQ1vzbS/pdviHnPtFaB
	 6Tr6/VXv9OXDXdXw5gJJS1fXmFeKdBp2pMN/cgRp0XVaMIEYf498mkepnTUqUlVfJ/
	 0n6nqWbSWDvE71kX828SS/GEILCHWAVMIXGDiRAplB/bcsUO0VBhrVbT2RItfdJrvP
	 /FQAqgHrsC8i+Q+RY5e49LPBOBfOaeZulBJ4szbNYbpVreb8juey5xZdNyIb4vwMc9
	 WZf7URb6jbHk57jQFr/Dce+7ZvNNCG/8QqvNsadXUj6BYTasS5BpiyNIw+UfDt99J1
	 RJkAmLGqXF9Zg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DAEA42083;
	Fri, 13 Feb 2026 19:38:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 50920EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E552F412C8
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aPFwq2PY_x4R for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F33BE40407
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F33BE40407
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E85C28137C; Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:30:36 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 0108c0f43b218a7aa73b09006552dc6c2a60f87a
X-Git-Newrev: 0184df5bb9074f3dfc12a02e760acdf36a9f7603
X-Patchwork-Hint: ignore
Message-Id: <20260213193701.E85C28137C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] arm-trusted-firmware: Add
 support for custom license files
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0184df5bb9074f3dfc12a02e760acdf36a9f7603
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

The ATF package was not providing any license file when a custom
Linux version was selected.

Fix this by adding a Kconfig option to specify the license file,
with a default value set to the commonly used license paths.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
[Arnout: use a single Kconfig option with conditional prompt]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 77670c33d24b7766bf3d7a090510e2863180d286)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
