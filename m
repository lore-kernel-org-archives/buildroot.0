Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D4EEF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7A8640C07;
	Fri, 13 Feb 2026 19:36:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id efgXf19C2xct; Fri, 13 Feb 2026 19:36:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F05241ED0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011391;
	bh=CFYb9H3w/+phu1gfTZxmyskIhGr8sHLQcM9RKsfHn6E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mTNW1oM646IdQucOwIJ1YWzXpBH8wxoYFGmg5GlVGD9ZhI0OgKkztJZQtyU8gPZep
	 u7iFalS+UAj0Cs4gpp/VlaPGv6A8X/Cd0mO40dVWuAbFd6Bkwe9VGDotZQFs/Ds7JZ
	 9ETiBV4gy4h1Nso0XCosb7mOlPEfA1a7WIR0a0os0vefCYmnGMitpwo7s3amllcjV6
	 ToHRe4r8rz6fdjQyuuIvdLmqfTkg24tnXJAId6TEzCDpo6E63xQB4g6eBXG7ZPs/iB
	 I8wIJD5MmcudfpJJD1EGWz0rsn4d+CQGtm4CEWlXAfHJVlDBjEnrZg0KUkTKp/L+Uc
	 +FyYi+ANX/Umw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F05241ED0;
	Fri, 13 Feb 2026 19:36:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 14DA0EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87A2784553
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WGPvyY1rpKHf for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36CCF8451E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36CCF8451E
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2BE5283B01; Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:30:45 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: cceae105f084abb520489182a1165243640ac87a
X-Git-Newrev: 6cb62442c9bfd699885bcf80d8cb233bcd9fdf18
X-Patchwork-Hint: ignore
Message-Id: <20260213193527.2BE5283B01@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] at91bootstrap3: Add
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6cb62442c9bfd699885bcf80d8cb233bcd9fdf18
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The AT91Bootstrap3 package was not providing any license file when a custom
Linux version was selected.

Fix this by adding a Kconfig option to specify the license file,
with a default value set to the commonly used license paths.

Note that version 3.X of at91bootstrap didn't have an open source
license and no license file either. Keep that behavior.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
[Arnout: use a single Kconfig option with conditional prompt]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit d9999aeec913bbf8dedf96d8dabf07591838a0aa)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 boot/at91bootstrap3/Config.in         | 10 ++++++++++
 boot/at91bootstrap3/at91bootstrap3.mk |  3 ++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
index b3e18fce7c..85cf66824d 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -66,6 +66,16 @@ config BR2_TARGET_AT91BOOTSTRAP3_VERSION
 		if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT || BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_SVN
 	default "custom"	if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
 
+config BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES
+	string "AT91Bootstrap3 license files" if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT || \
+		BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_SVN || \
+		BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
+	default "" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X
+	default "LICENSES/MIT.txt"
+	help
+	  A space-separated list of license files related to the
+	  AT91Bootstrap3 kernel package.
+
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_PATCH_DIR
 	string "custom patch dir"
 	help
diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index 4bbe7cc718..2ed34f3de4 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -25,11 +25,12 @@ endif
 
 ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION),y)
 AT91BOOTSTRAP3_LICENSE = MIT
-AT91BOOTSTRAP3_LICENSE_FILES = LICENSES/MIT.txt
 else ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X),y)
 AT91BOOTSTRAP3_LICENSE = Atmel License
 endif
 
+AT91BOOTSTRAP3_LICENSE_FILES = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES))
+
 AT91BOOTSTRAP3_CPE_ID_VENDOR = linux4sam
 AT91BOOTSTRAP3_CPE_ID_PRODUCT = at91bootstrap
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
