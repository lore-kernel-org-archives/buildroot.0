Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9569E83EF5
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 09:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CCA040CA9;
	Wed,  4 Feb 2026 09:14:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VbuihwrMMRvA; Wed,  4 Feb 2026 09:14:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B45840C08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770196486;
	bh=nvgNigl8eT8LAO1PakJGj9XapGtbRQYbv9zU73x/Oto=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=q1H3qqM0uapfRtxR0d54n3W5Ct770aA2i2T3oUjcCi2PFLqDg+0LvWGg9hoi1n1ri
	 x74Ib6TWdKQG+oARYUxvYKsho7NwvKbJARFHnqomK1SSZHrWKszqyrwykeTgwmu1Nw
	 9XLdTLY2RXXqRVRSyjMuHLxvHzpJqcQQd0k1XLd9fQXeMgyyVQPK5GZgQ+bCneYSFZ
	 DGx54nBASpVfgEL4nO9VKRAQkePtfjYq4bDB1X8D13o9Ep0zZyIDt54V8Bpb7BzYyN
	 AA88X2Igvce+L1zdGQ1EnrcQpPenUmI5h0SWsoOruffY6yvO4TtPST8EZ6wh8AH3Ds
	 5AEIH5EGPM91w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B45840C08;
	Wed,  4 Feb 2026 09:14:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0ED9CF4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E307140423
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:14:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id poIYRXLX-jp3 for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 09:14:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 066924021A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 066924021A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:14:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D7952867F2; Wed,  4 Feb 2026 09:14:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 10:13:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef9f0a07ed40970a7de4c608a5708ef6ceb75131
X-Git-Newrev: 105e4618c5f2745086baadd5c04dfe189484a604
X-Patchwork-Hint: ignore
Message-Id: <20260204091443.D7952867F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openobex: fix build with cmake 4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/105e4618c5f2745086baadd5c04dfe189484a604
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes:
https://autobuild.buildroot.net/results/258/2589f75f7415cd1a2fd7cf83c6166c900b03cce0/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openobex/0001-Fix-FTBFS-with-CMake-4.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/openobex/0001-Fix-FTBFS-with-CMake-4.patch b/package/openobex/0001-Fix-FTBFS-with-CMake-4.patch
new file mode 100644
index 0000000000..2b675e843f
--- /dev/null
+++ b/package/openobex/0001-Fix-FTBFS-with-CMake-4.patch
@@ -0,0 +1,29 @@
+From bfd33e3ebf1fe253542b9ea2b6e034c8ce30866d Mon Sep 17 00:00:00 2001
+From: Adrian Bunk <bunk@debian.org>
+Date: Sat, 17 Jan 2026 11:14:15 +0100
+Subject: [PATCH] Fix FTBFS with CMake 4
+
+Bug-Debian: https://bugs.debian.org/1113178
+
+Downloaded from https://sources.debian.org/src/libopenobex/1.7.2-2.3/debian/patches/cmake-4.patch
+
+Upstream: https://gitlab.com/openobex/mainline/-/merge_requests/3
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 813f900..b237f93 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required ( VERSION 3.1 FATAL_ERROR )
++cmake_minimum_required ( VERSION 3.5 FATAL_ERROR )
+ 
+ project ( openobex
+   LANGUAGES C
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
