Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624DAE7DF13
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 17:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BCA0822A2;
	Mon,  2 Feb 2026 17:44:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j8Wb0xrJtkD5; Mon,  2 Feb 2026 17:44:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22962822A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770054250;
	bh=H8+aoS7ec6tAi4Z6m6tx2wLWVzfABmN6magrd/9YHi0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bhXdpZQoGb8jFJQ2KZBq8mcVlQT493JIz22Ye6+9JhCf4cF3kwW5kEc973origCar
	 WjwNMWlKZKliQhOY4wevgMQeym8YhinhB2qogYK5mTwWzkShFO/cop5b+9DoaTOeXn
	 xdAOYnEe2VX7qnpQgnQOAEKoeAgT2IUJRLQZ6VxsEbTTlbpQyGTA7Bq9kSBXIxIELY
	 9RHRqVRKR2fjrd/81reSAoiSIfWlBSljIP/tgkBitiWWxn1Gn3HCrUXxo0ubDFdbTA
	 2YwbSj+PVq/cX6Nsr/RbrgQo4JUo4dVBspIj4Zifo8sUUI1qlLnHXKJPhjxu2rkhyl
	 3b1veOLMaLrvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22962822A4;
	Mon,  2 Feb 2026 17:44:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 96A3470E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 729436077D
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:44:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Hns7KgTxSER for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 17:44:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFA0F60662
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFA0F60662
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:44:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9863784C96; Mon,  2 Feb 2026 17:44:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 18:43:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 50958bcdac6775be5d0c36bb867bbac7a7eb2e49
X-Git-Newrev: a4d5b20462602aa89a7e6a5587cb187f71e31d5e
X-Patchwork-Hint: ignore
Message-Id: <20260202174403.9863784C96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] uboot: Add support for custom license files
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

commit: https://git.buildroot.net/buildroot/commit/?id=a4d5b20462602aa89a7e6a5587cb187f71e31d5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The U-Boot package was not providing any license file when a custom
Linux version was selected.

Fix this by adding a Kconfig option to specify the license file,
with a default value set to the commonly used license paths.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
[Arnout: use a single Kconfig option with conditional prompt]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 boot/uboot/Config.in | 8 ++++++++
 boot/uboot/uboot.mk  | 4 +---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 29f3f40b1b..47ce24ee76 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -92,6 +92,14 @@ config BR2_TARGET_UBOOT_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION \
 		if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG || BR2_TARGET_UBOOT_CUSTOM_SVN
 
+config BR2_TARGET_UBOOT_LICENSE_FILES
+	string "U-boot license files" if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG || \
+		BR2_TARGET_UBOOT_CUSTOM_SVN || BR2_TARGET_UBOOT_CUSTOM_TARBALL
+	default "Licenses/gpl-2.0.txt"
+	help
+	  A space-separated list of license files related to U-Boot
+	  package.
+
 config BR2_TARGET_UBOOT_PATCH
 	string "Custom U-Boot patches"
 	default BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR if BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR != ""  # legacy
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 936b8fd266..6ddbb9e438 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -8,9 +8,7 @@ UBOOT_VERSION = $(call qstrip,$(BR2_TARGET_UBOOT_VERSION))
 UBOOT_BOARD_NAME = $(call qstrip,$(BR2_TARGET_UBOOT_BOARDNAME))
 
 UBOOT_LICENSE = GPL-2.0+
-ifeq ($(BR2_TARGET_UBOOT_LATEST_VERSION),y)
-UBOOT_LICENSE_FILES = Licenses/gpl-2.0.txt
-endif
+UBOOT_LICENSE_FILES = $(call qstrip,$(BR2_TARGET_UBOOT_LICENSE_FILES))
 UBOOT_CPE_ID_VENDOR = denx
 UBOOT_CPE_ID_PRODUCT = u-boot
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
