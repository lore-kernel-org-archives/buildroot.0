Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B07C43334
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 17:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B960B83689;
	Tue, 14 Jun 2022 17:00:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZUrjyHw6Bu_M; Tue, 14 Jun 2022 17:00:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8DA583367;
	Tue, 14 Jun 2022 17:00:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F0DF01BF37A
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E93C260AF4
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:58:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tm0uZvIFK02C for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 16:58:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38D3A60B02
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 16:58:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6533D8705E; Tue, 14 Jun 2022 16:45:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Jun 2022 17:59:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dd1c8879c503a093b807ea8ab04c31f685e7b340
X-Git-Newrev: d6e7d92d822b5e8e7067e33bf69972f884a90355
X-Patchwork-Hint: ignore
Message-Id: <20220614164552.6533D8705E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/logrotate: security bump to
 version 3.20.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=d6e7d92d822b5e8e7067e33bf69972f884a90355
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2022-1348: A vulnerability was found in logrotate in how the
state file is created. The state file is used to prevent parallel
executions of multiple instances of logrotate by acquiring and releasing
a file lock. When the state file does not exist, it is created with
world-readable permission, allowing an unprivileged user to lock the
state file, stopping any rotation. This flaw affects logrotate versions
before 3.20.

https://github.com/logrotate/logrotate/blob/3.20.1/ChangeLog.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/logrotate/logrotate.hash | 2 +-
 package/logrotate/logrotate.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/logrotate/logrotate.hash b/package/logrotate/logrotate.hash
index 2af46d60b7..9c8e73f738 100644
--- a/package/logrotate/logrotate.hash
+++ b/package/logrotate/logrotate.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256  841f81bf09d0014e4a2e11af166bb33fcd8429cc0c2d4a7d3d9ceb3858cfccc5  logrotate-3.18.0.tar.xz
+sha256  742f6d6e18eceffa49a4bacd933686d3e42931cfccfb694d7f6369b704e5d094  logrotate-3.20.1.tar.xz
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index 4d1344c2cd..453dbe477a 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LOGROTATE_VERSION = 3.18.0
-LOGROTATE_SOURCE = logrotate-3.18.0.tar.xz
+LOGROTATE_VERSION = 3.20.1
+LOGROTATE_SOURCE = logrotate-$(LOGROTATE_VERSION).tar.xz
 LOGROTATE_SITE = https://github.com/logrotate/logrotate/releases/download/$(LOGROTATE_VERSION)
 LOGROTATE_LICENSE = GPL-2.0+
 LOGROTATE_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
