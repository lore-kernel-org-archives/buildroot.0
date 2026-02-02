Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE431E7DF11
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 17:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A712B40311;
	Mon,  2 Feb 2026 17:44:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vb4g_WMtYePl; Mon,  2 Feb 2026 17:44:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B84C040A18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770054252;
	bh=LzzYVJ7CKSZsd0GHGjj1pFfqcNGF9u2VgtaA5+wcN0M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iXykFOEbHylGvSXON9kt7DqnWPICVy0Lr1lZroCeMHsoq18POXIR5+n0mOSQIKsot
	 tC3UVvWtZJE1oiE24uLodhYdILO1rDyst0+GQrHkZJfnEO4lmL+a+wVuAC/KjAkzoS
	 Ms2JtKuwzQ9w6zcJWHGDMnVazrUQpjIellFW8m6CxOGey3xKFiTsLe+pJGXvl0xKbc
	 QO1SMDnkEAvbrzvs7Czt9zuiWXSNCZDf+RUqvLKsTzBIsjaLJcFrzcgoL6z8nykxw8
	 GBmcJFLuIv7gHdN0zdIo6gsfXLFHx0qP5qqlRiaHEnLrFx5N+1zOec891NHOKtIA7w
	 JDd3lGPQqDO5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B84C040A18;
	Mon,  2 Feb 2026 17:44:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B81623E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CE7260662
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:44:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9jAjDW5guZCR for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 17:44:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BC5A605EC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BC5A605EC
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:44:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8BC2B8645B; Mon,  2 Feb 2026 17:44:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 18:43:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a1a71be21e6c45383800824863b75cb08b029a8
X-Git-Newrev: 50958bcdac6775be5d0c36bb867bbac7a7eb2e49
X-Patchwork-Hint: ignore
Message-Id: <20260202174403.8BC2B8645B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: Add support for custom license files
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

commit: https://git.buildroot.net/buildroot/commit/?id=50958bcdac6775be5d0c36bb867bbac7a7eb2e49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Linux package was not providing any license file when a custom
Linux version was selected.

Fix this by adding a Kconfig option to specify the license file,
with a default value set to the commonly used license paths.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
[Arnout: use a single Kconfig option with conditional prompt]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 linux/Config.in | 8 ++++++++
 linux/linux.mk  | 8 ++------
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 0ce6035e41..ac5e6298aa 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -150,6 +150,14 @@ config BR2_LINUX_KERNEL_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION \
 		if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG || BR2_LINUX_KERNEL_CUSTOM_SVN
 
+config BR2_LINUX_KERNEL_LICENSE_FILES
+	string "Kernel license files" if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG || \
+		BR2_LINUX_KERNEL_CUSTOM_SVN || BR2_LINUX_KERNEL_CUSTOM_TARBALL
+	default "COPYING LICENSES/preferred/GPL-2.0 LICENSES/exceptions/Linux-syscall-note"
+	help
+	  A space-separated list of license files related to the Linux
+	  kernel package.
+
 #
 # Patch selection
 #
diff --git a/linux/linux.mk b/linux/linux.mk
index 0520394931..c61089bfe0 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -6,12 +6,8 @@
 
 LINUX_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
 LINUX_LICENSE = GPL-2.0
-ifeq ($(BR2_LINUX_KERNEL_LATEST_VERSION),y)
-LINUX_LICENSE_FILES = \
-	COPYING \
-	LICENSES/preferred/GPL-2.0 \
-	LICENSES/exceptions/Linux-syscall-note
-endif
+LINUX_LICENSE_FILES = $(call qstrip,$(BR2_LINUX_KERNEL_LICENSE_FILES))
+
 LINUX_CPE_ID_VENDOR = linux
 LINUX_CPE_ID_PRODUCT = linux_kernel
 LINUX_CPE_ID_PREFIX = cpe:2.3:o
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
