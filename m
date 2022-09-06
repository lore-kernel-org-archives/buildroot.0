Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D759ECAAA1
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 19:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAA1961155;
	Tue,  6 Sep 2022 19:56:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAA1961155
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ngi7rDgFLY0e; Tue,  6 Sep 2022 19:56:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBB0560C24;
	Tue,  6 Sep 2022 19:56:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBB0560C24
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8A4DE1BF57C
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 19:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7167741634
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 19:56:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7167741634
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rgMnMaUifPwW for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 19:56:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CF28415FF
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 19:56:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CF28415FF
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6A77D821CC; Tue,  6 Sep 2022 19:41:01 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 6 Sep 2022 21:55:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4765efb22231e377866bc6456971886d970f9d7a
X-Git-Newrev: 4124d47b0b517c13d55e3ec738070f3cd24d1ac8
X-Patchwork-Hint: ignore
Message-Id: <20220906194101.6A77D821CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: fix check-package warnings in
 patches
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

commit: https://git.buildroot.net/buildroot/commit/?id=4124d47b0b517c13d55e3ec738070f3cd24d1ac8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

package/gcc/11.3.0/0005-rs6000-Improve-.machine.patch:4: generate your patches with 'git format-patch -N'
package/gcc/11.3.0/0006-rs6000-Do-not-use-rs6000_cpu-for-.machine-ppc-and-pp.patch:4: generate your patches with 'git format-patch -N'

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/gcc/11.3.0/0005-rs6000-Improve-.machine.patch                   | 2 +-
 .../0006-rs6000-Do-not-use-rs6000_cpu-for-.machine-ppc-and-pp.patch     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gcc/11.3.0/0005-rs6000-Improve-.machine.patch b/package/gcc/11.3.0/0005-rs6000-Improve-.machine.patch
index 6107900736..82a667ab7b 100644
--- a/package/gcc/11.3.0/0005-rs6000-Improve-.machine.patch
+++ b/package/gcc/11.3.0/0005-rs6000-Improve-.machine.patch
@@ -1,7 +1,7 @@
 From ca2c3a7d3db7a699c358d3408f820396dd536fc8 Mon Sep 17 00:00:00 2001
 From: Segher Boessenkool <segher@kernel.crashing.org>
 Date: Tue, 1 Mar 2022 17:04:29 +0000
-Subject: [PATCH 5/6] rs6000: Improve .machine
+Subject: [PATCH] rs6000: Improve .machine
 
 This adds more correct .machine for most older CPUs.  It should be
 conservative in the sense that everything we handled before we handle at
diff --git a/package/gcc/11.3.0/0006-rs6000-Do-not-use-rs6000_cpu-for-.machine-ppc-and-pp.patch b/package/gcc/11.3.0/0006-rs6000-Do-not-use-rs6000_cpu-for-.machine-ppc-and-pp.patch
index d2335cd689..43fed4c19f 100644
--- a/package/gcc/11.3.0/0006-rs6000-Do-not-use-rs6000_cpu-for-.machine-ppc-and-pp.patch
+++ b/package/gcc/11.3.0/0006-rs6000-Do-not-use-rs6000_cpu-for-.machine-ppc-and-pp.patch
@@ -1,7 +1,7 @@
 From 6de33ed642f119f1e2543095dd56e4a94f97c27f Mon Sep 17 00:00:00 2001
 From: Segher Boessenkool <segher@kernel.crashing.org>
 Date: Fri, 11 Mar 2022 21:15:18 +0000
-Subject: [PATCH 6/6] rs6000: Do not use rs6000_cpu for .machine ppc and ppc64
+Subject: [PATCH] rs6000: Do not use rs6000_cpu for .machine ppc and ppc64
  (PR104829)
 
 Fixes: 77eccbf39ed5
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
