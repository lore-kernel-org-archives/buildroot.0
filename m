Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F775C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 09:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07851409B1;
	Sun, 18 Sep 2022 09:38:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07851409B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lXU1PJ4G_VcF; Sun, 18 Sep 2022 09:38:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C216840918;
	Sun, 18 Sep 2022 09:38:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C216840918
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 040B31BF328
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 09:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4BAB81443
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 09:35:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4BAB81443
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WhTyt2c_iNgb for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 09:35:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4463F843E1
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 09:35:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4463F843E1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33E9484BC9; Sun, 18 Sep 2022 09:35:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 11:00:50 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 4824553c09c9a4459ff2610eb8351ddea4853953
X-Git-Newrev: 8c969c3d0e63cae62331fd7352776ab95ef20323
X-Patchwork-Hint: ignore
Message-Id: <20220918093506.33E9484BC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/gcc: fix
 check-package warnings in patches
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

commit: https://git.buildroot.net/buildroot/commit/?id=8c969c3d0e63cae62331fd7352776ab95ef20323
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

package/gcc/11.3.0/0005-rs6000-Improve-.machine.patch:4: generate your patches with 'git format-patch -N'
package/gcc/11.3.0/0006-rs6000-Do-not-use-rs6000_cpu-for-.machine-ppc-and-pp.patch:4: generate your patches with 'git format-patch -N'

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 4124d47b0b517c13d55e3ec738070f3cd24d1ac8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
