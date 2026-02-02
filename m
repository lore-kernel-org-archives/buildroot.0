Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB32E7DF13
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 17:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F096F402B7;
	Mon,  2 Feb 2026 17:44:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U4RBeyKRPZ1L; Mon,  2 Feb 2026 17:44:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BFA240A6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770054259;
	bh=U8BFIaM4VdsfjkZCHamibPNbeoegA5CnNzrlXSfmVUw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jzcU7hj9YObpRE/ycIfmuRgiRm8dXB8rGPqNl03f5wcwS1MrDob1St27R0Eticwv4
	 ARSj+XzelUFeqAsIb/nNEfs2FeUsweCIyvN2qZwJGzHlh4HS5sd7pS1grTumY4/xpV
	 trytTP0Mx3PKhUYq1aJd0tyAFuu4bIW47L3zgyYS0kFtypw6QbBK/tkuQpn3Lvir4v
	 In4E+ztzf9wiP+LpUNhBBD/T07++7Z7le1wviv2FMjrgSOiNq+ViE/1j2ohEI1KJKp
	 eJEfNhKKC9/u+PveFm66zMd5yPeG9NaEc3HdqW0MFQsyCmyrHpahW5QLLpXFmihmM7
	 v8/eDwhZrC2HQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BFA240A6D;
	Mon,  2 Feb 2026 17:44:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A4FD23E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A22D3605EC
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:44:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A13D92Ay5soT for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 17:44:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CED0F6076C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CED0F6076C
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:44:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B91328645B; Mon,  2 Feb 2026 17:44:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 18:43:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 399cc39621673c6b81c15c8d768ed1081648364f
X-Git-Newrev: 76dee8aadc31dfa3fea03d18b3b0c2ac1c08c5d6
X-Patchwork-Hint: ignore
Message-Id: <20260202174403.B91328645B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] barebox: Add support for custom license
 files
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

commit: https://git.buildroot.net/buildroot/commit/?id=76dee8aadc31dfa3fea03d18b3b0c2ac1c08c5d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Barebox package was not providing any license file when a custom
Linux version was selected.

Fix this by adding a Kconfig option to specify the license file,
with a default value set to the commonly used license paths.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
[Arnout: use a single Kconfig option with conditional prompt]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 boot/barebox/Config.in  | 8 ++++++++
 boot/barebox/barebox.mk | 4 +---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index c3cb0b3332..6ee97ffe02 100644
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
