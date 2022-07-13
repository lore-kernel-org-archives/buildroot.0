Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4BD0C433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Jul 2022 08:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56BA14159B;
	Wed, 13 Jul 2022 08:59:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56BA14159B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g61_ctEGaOqF; Wed, 13 Jul 2022 08:59:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5575F4158C;
	Wed, 13 Jul 2022 08:59:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5575F4158C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C1CD1BF20F
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 08:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23E53423AA
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 08:59:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23E53423AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HR03UL1uOXMD for <buildroot@lists.busybox.net>;
 Wed, 13 Jul 2022 08:59:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C972423A4
 for <buildroot@buildroot.org>; Wed, 13 Jul 2022 08:59:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C972423A4
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5F71983854; Wed, 13 Jul 2022 08:46:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Jul 2022 10:59:45 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 97f4b9eefad54ee60cfee2890992504a5e9939f2
X-Git-Newrev: 453ee1af2d0bc721459d54bff6e7bcfdc9274a47
X-Patchwork-Hint: ignore
Message-Id: <20220713084636.5F71983854@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/logrotate:
 security bump to version 3.20.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=453ee1af2d0bc721459d54bff6e7bcfdc9274a47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
(cherry picked from commit d6e7d92d822b5e8e7067e33bf69972f884a90355)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
