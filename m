Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313A9CF256B
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 15:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDBDD60848;
	Sat, 12 Oct 2024 15:04:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tmgeFV0Q_Yr1; Sat, 12 Oct 2024 15:04:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B42D611C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B42D611C9;
	Sat, 12 Oct 2024 15:04:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 38FAC1BF47E
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7061981E9E
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:02:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u62xesXGAivR for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 15:02:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83B2281F9E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83B2281F9E
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 15:02:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8003785E1E; Sat, 12 Oct 2024 15:02:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 17:00:16 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: f3dae29d0344645c5cacdf0ecf4a9958788a55ff
X-Git-Newrev: ee3155d7799a3d81dd296ecaa2614030ac8fce6e
X-Patchwork-Hint: ignore
Message-Id: <20241012150253.8003785E1E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/systemd: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee3155d7799a3d81dd296ecaa2614030ac8fce6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 09964bc5c0f8b329cda6383a1297029354269da9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 345f08590e..d9545e9db0 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -99,7 +99,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 
 	  Notice that systemd selects the fsck wrapper from util-linux
 	  but no particular fsck.<fstype> is selected. You must choose
-	  the apropriate ones (e.g. e2fsck, from the e2fsprogs
+	  the appropriate ones (e.g. e2fsck, from the e2fsprogs
 	  package) according to the system configuration.
 
 	  https://freedesktop.org/wiki/Software/systemd/
@@ -212,7 +212,7 @@ config BR2_PACKAGE_SYSTEMD_PSTORE
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
