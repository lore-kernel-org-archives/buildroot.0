Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E006C52D7C
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 20:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A77D780CD0;
	Mon, 19 Aug 2024 20:25:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id odPlXOn6SXRY; Mon, 19 Aug 2024 20:25:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF2A080CFC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF2A080CFC;
	Mon, 19 Aug 2024 20:25:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB4381BF3C9
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 20:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B59B140491
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 20:25:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yaYicsrSuyS9 for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 20:25:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC1EB40471
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC1EB40471
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 20:25:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A793D860C8; Mon, 19 Aug 2024 20:25:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Aug 2024 13:53:20 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fecf69525e21306fa8337b114dfd21504d410a2d
X-Git-Newrev: b5a0f58640047738adb2bce8daef6c53ef36677f
X-Patchwork-Hint: ignore
Message-Id: <20240819202551.A793D860C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/bcc: bump version to
 0.31.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b5a0f58640047738adb2bce8daef6c53ef36677f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For a change log since 0.29.1, see:
https://github.com/iovisor/bcc/blob/v0.31.0/debian/changelog

This commit also changes BCC_SITE_METHOD to "git". This is because the
upstream source archive name does not contain the version. It is
always named "bcc-src-with-submodule.tar.gz" in all releases. If using
the https _SITE_METHOD, bumping the version will not download the new
version if the directory BR2_DL_DIR contains an old one, with the same
name. Since the upstream repository uses git submodules, this commit
also adds "BCC_GIT_SUBMODULES = YES".

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bcc/bcc.hash | 2 +-
 package/bcc/bcc.mk   | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/bcc/bcc.hash b/package/bcc/bcc.hash
index b37e125b1a..7ed164eda0 100644
--- a/package/bcc/bcc.hash
+++ b/package/bcc/bcc.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  321575fa94f3274040379dd2d4535217f45099f4240b58a4dfc171aa8c78402f  bcc-src-with-submodule.tar.gz
+sha256  5641b1db0b9ec60a6afd67b4607c790f49e580c207638bb4ebcea2805c6f373b  bcc-v0.31.0-git4.tar.gz
 sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE.txt
diff --git a/package/bcc/bcc.mk b/package/bcc/bcc.mk
index e496c4b344..d5d72aa9c0 100644
--- a/package/bcc/bcc.mk
+++ b/package/bcc/bcc.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-BCC_VERSION = 0.29.1
-BCC_SITE = https://github.com/iovisor/bcc/releases/download/v$(BCC_VERSION)
-BCC_SOURCE = bcc-src-with-submodule.tar.gz
+BCC_VERSION = v0.31.0
+BCC_SITE = https://github.com/iovisor/bcc
+BCC_SITE_METHOD = git
+BCC_GIT_SUBMODULES = YES
 BCC_LICENSE = Apache-2.0
 BCC_LICENSE_FILES = LICENSE.txt
 BCC_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
