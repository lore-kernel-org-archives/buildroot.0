Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9AAFCC068
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E70B3613E2;
	Fri,  6 Mar 2026 19:51:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HLg1temFnR3A; Fri,  6 Mar 2026 19:51:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20633613E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826671;
	bh=Bs9v7+jXjVjUXvla3FBhcASX9QQK75TgdPpylAO4PkY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XFPViwU15QhM8L/GVmxkmYHmXfihG+J/jAuI3ZWsEpTFEZhXFucBEv3It/75ouMXE
	 rte1jfaw5kM6Yx6gs8hkD4OcdFwbp0WxPkYyj1oEJ64xkqWJ23nAA5nFITjA/kmuaj
	 aOwARDOvuSje4tFqeVUy76u3JI121DyqJ7XhFVvKqYkTB1m1EAFbk0890/NbMbUd9v
	 on0gq3sn8JZR6k9U9aPdc+CjQd63kaE2lszu9sel6VYaiOmegungEEbo2jI5/iGt8F
	 sbTO+KgbN9rXjQOCG/Y/TeqVlz8wBUp1/rlfy+hPB4Ked3Uh8wIblDxJt0YNMnvVRS
	 8LrD5/ZHvbGww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20633613E5;
	Fri,  6 Mar 2026 19:51:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10E2625B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 544DD613E0
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xYEKIowyhRVj for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:50:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD9F0613E2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD9F0613E2
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D305480090; Fri,  6 Mar 2026 19:50:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 14:07:06 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: c54eaa36514896e8f84d9e41474d3fc7698d4f86
X-Git-Newrev: 424114859c9346160d8ed62075c04500be3bc23a
X-Patchwork-Hint: ignore
Message-Id: <20260306195050.D305480090@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/flashbench: fix
 download URL
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/424114859c9346160d8ed62075c04500be3bc23a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

The original source is offline, switch to forked repo and use the same
tree as before to only fix the download error.

Fixes:
https://autobuild.buildroot.net/results/eec/eecf2cbaafd8a170b5f5c6c24df552280a530204/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 49cabda8fb09c665f80cc45b505923b7a4a3bd60)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/flashbench/Config.in       | 2 +-
 package/flashbench/flashbench.hash | 2 +-
 package/flashbench/flashbench.mk   | 3 +--
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/flashbench/Config.in b/package/flashbench/Config.in
index a50f482ac3..8f64275745 100644
--- a/package/flashbench/Config.in
+++ b/package/flashbench/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_FLASHBENCH
 	  SD cards and other media for the Linaro flash memory
 	  survey.
 
-	  https://git.linaro.org/people/arnd.bergmann/flashbench.git
+	  https://github.com/bradfa/flashbench
diff --git a/package/flashbench/flashbench.hash b/package/flashbench/flashbench.hash
index 274d890f2d..8b087c2a10 100644
--- a/package/flashbench/flashbench.hash
+++ b/package/flashbench/flashbench.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b5f95d2d057270adbce0f1a784b6a88db339b67326b6ca92474edd99f9fd4774  flashbench-2e30b1968a66147412f21002ea844122a0d5e2f0-git4.tar.gz
+sha256  408a2642700b7f8daf4356a49948b921137ad15bb6e0fd05b1cb8dc700c154dc  flashbench-2e30b1968a66147412f21002ea844122a0d5e2f0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/flashbench/flashbench.mk b/package/flashbench/flashbench.mk
index f5791c3e95..28ce7f7dd1 100644
--- a/package/flashbench/flashbench.mk
+++ b/package/flashbench/flashbench.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 FLASHBENCH_VERSION = 2e30b1968a66147412f21002ea844122a0d5e2f0
-FLASHBENCH_SITE = https://git.linaro.org/people/arnd/flashbench.git
-FLASHBENCH_SITE_METHOD = git
+FLASHBENCH_SITE = $(call github,bradfa,flashbench,$(FLASHBENCH_VERSION))
 FLASHBENCH_LICENSE = GPL-2.0
 FLASHBENCH_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
