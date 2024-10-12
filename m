Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839C9CF256B
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 15:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46A9D60679;
	Sat, 12 Oct 2024 15:20:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YWAFyeftvRu7; Sat, 12 Oct 2024 15:20:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7B7D60AEF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7B7D60AEF;
	Sat, 12 Oct 2024 15:20:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4BD9A1BF8A8
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47C8D4077E
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:20:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B_DFQEO_YAKU for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 15:20:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2054F406B9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2054F406B9
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 15:20:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1ACC585EEE; Sat, 12 Oct 2024 15:20:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 17:16:12 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 5b2e036af9a42eda6c08bf7919bb83c76c6335d1
X-Git-Newrev: 846af98bd13ca72542adc7795de0c100455b6bcf
X-Patchwork-Hint: ignore
Message-Id: <20241012152044.1ACC585EEE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/expat: security
 bump version to 2.6.3
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=846af98bd13ca72542adc7795de0c100455b6bcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Changelog:
https://github.com/libexpat/libexpat/blob/R_2_6_3/expat/Changes

Fixes CVE-2024-45490, CVE-2024-45491 & CVE-2024-45492.

Follow upstream switch of project repository to github:
https://sourceforge.net/p/expat/news/2022/01/project-moved-to-github/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0509885d8dc221978fd332f9768b427ed2775942)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/expat/Config.in  | 2 +-
 package/expat/expat.hash | 6 +-----
 package/expat/expat.mk   | 4 ++--
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/package/expat/Config.in b/package/expat/Config.in
index 758fb7d516..c227912b03 100644
--- a/package/expat/Config.in
+++ b/package/expat/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_EXPAT
 	help
 	  The Expat XML Parser.
 
-	  http://expat.sourceforge.net
+	  https://libexpat.github.io/
diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 63890b54df..e40b250ba0 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,7 +1,3 @@
-# From https://sourceforge.net/projects/expat/files/expat/2.6.2/
-md5  0cb75c8feb842c0794ba89666b762a2d  expat-2.6.1.tar.xz
-sha1  d9e5f953dcacda3c9e69b4886382c3d8847b81bd  expat-2.6.1.tar.xz
-
 # Locally calculated
-sha256  ee14b4c5d8908b1bec37ad937607eab183d4d9806a08adee472c3c3121d27364  expat-2.6.2.tar.xz
+sha256  274db254a6979bde5aad404763a704956940e465843f2a9bd9ed7af22e2c0efc  expat-2.6.3.tar.xz
 sha256  122f2c27000472a201d337b9b31f7eb2b52d091b02857061a8880371612d9534  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index c6b7fc8b44..f5c6175f28 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.6.2
-EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
+EXPAT_VERSION = 2.6.3
+EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
 EXPAT_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
