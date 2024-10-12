Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74543CF2568
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 15:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49D7161115;
	Sat, 12 Oct 2024 15:09:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uc8jLN9X_y9f; Sat, 12 Oct 2024 15:09:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1737D606DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1737D606DC;
	Sat, 12 Oct 2024 15:09:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1176B1BF3F3
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D451C400D1
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:08:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mUjRnt96EqWV for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 15:08:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C193C4026E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C193C4026E
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 15:08:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCFDD80795; Sat, 12 Oct 2024 15:08:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 17:00:41 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: efd70c2c6ffc13fdc3fa08c766a5bb838556a67f
X-Git-Newrev: 0f7d0c47fd16819ff3aa48c503219235dbaa4126
X-Patchwork-Hint: ignore
Message-Id: <20241012150800.BCFDD80795@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/systemd: fix
 typos in help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f7d0c47fd16819ff3aa48c503219235dbaa4126
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 09964bc5c0f8b329cda6383a1297029354269da9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index aa5143d484..46550de74a 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -98,7 +98,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 
 	  Notice that systemd selects the fsck wrapper from util-linux
 	  but no particular fsck.<fstype> is selected. You must choose
-	  the apropriate ones (e.g. e2fsck, from the e2fsprogs
+	  the appropriate ones (e.g. e2fsck, from the e2fsprogs
 	  package) according to the system configuration.
 
 	  https://freedesktop.org/wiki/Software/systemd/
@@ -211,7 +211,7 @@ config BR2_PACKAGE_SYSTEMD_PSTORE
 	help
 	  When this features is enabled, additional tools and services
 	  are built to support archiving contents of the persistent
-	  storage filesytem.
+	  storage filesystem.
 
 	  https://www.freedesktop.org/software/systemd/man/systemd-pstore.html
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
