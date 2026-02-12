Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B844BEF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 884BB41E3B;
	Fri, 13 Feb 2026 19:35:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a95Mh10u1YQ2; Fri, 13 Feb 2026 19:35:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A26CE41E3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011341;
	bh=Qa0yyAhCPCgT5KOB7jGyiVc9AoyB0GVZqYAMBlS05zg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=G0c0APmUQsehPLM5I/NSpkSMeYVos/Tdk9bjUpuIyaKF5ZHuK7i02+RYlYV18C5zC
	 Pw9VGHGRZ57qB9vVxHSZCfQALEh8ZtnVZrYayya43mpn5aLwO1yKv2AN6FqjjurW+K
	 sUI/dNqhKU7LfTrzmewjrdJkqTnv1STR+NFVrcqxu2K5y8dEH4ulFXu53zYRn4/5yk
	 MscDQBiEDUG4h3nfpabQQBY9qPuWyPOVxfKHriiSXVadYoZN8zPIRVvICRO7DJD1kN
	 NuWoqBWb5vcRxkBtiFjoqp5GNY8khoYKHB79UELlh4BYHWzAjGnyjHar7P8ZUNTDmo
	 3HcC6WaOwSqew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A26CE41E3E;
	Fri, 13 Feb 2026 19:35:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DEC0283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 299E841E3B
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ydUqWYGHcnM0 for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 223F841E32
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 223F841E32
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 17B5581EB5; Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:28:02 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5fae877bc1b7fd12cdf84486f20e22d3c2f0d363
X-Git-Newrev: bc944f1937a77d271749897263a43cbd0da590a3
X-Patchwork-Hint: ignore
Message-Id: <20260213193527.17B5581EB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] barebox: Add support for
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bc944f1937a77d271749897263a43cbd0da590a3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The Barebox package was not providing any license file when a custom
Linux version was selected.

Fix this by adding a Kconfig option to specify the license file,
with a default value set to the commonly used license paths.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
[Arnout: use a single Kconfig option with conditional prompt]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 76dee8aadc31dfa3fea03d18b3b0c2ac1c08c5d6)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 boot/barebox/Config.in  | 8 ++++++++
 boot/barebox/barebox.mk | 4 +---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 0bd3386795..21a8dbd125 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -45,6 +45,14 @@ config BR2_TARGET_BAREBOX_VERSION
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
 
+config BR2_TARGET_BAREBOX_LICENSE_FILES
+	string "Barebox license files" if BR2_TARGET_BAREBOX_CUSTOM_TARBALL || \
+		BR2_TARGET_BAREBOX_CUSTOM_GIT
+	default "COPYING"
+	help
+	  A space-separated list of license files related to the Barebox
+	  package.
+
 config BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR
 	string "custom patch dir"
 	help
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 929ed48ada..cbd6f9313c 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -39,9 +39,7 @@ $(1)_DL_SUBDIR = barebox
 
 $(1)_DEPENDENCIES = host-lzop
 $(1)_LICENSE = GPL-2.0 with exceptions
-ifeq ($(BR2_TARGET_BAREBOX_LATEST_VERSION),y)
-$(1)_LICENSE_FILES = COPYING
-endif
+$(1)_LICENSE_FILES = $$(call qstrip,$$(BR2_TARGET_BAREBOX_LICENSE_FILES))
 
 ifeq ($(BR2_TARGET_BAREBOX_NEEDS_OPENSSL),y)
 BAREBOX_DEPENDENCIES += host-openssl host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
