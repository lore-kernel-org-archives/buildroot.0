Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5959C7EE24
	for <buildroot@archiver.kernel.org>; Fri,  2 Jun 2023 20:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 737304287A;
	Fri,  2 Jun 2023 20:24:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 737304287A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oOrJCo7NMnco; Fri,  2 Jun 2023 20:24:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B70042874;
	Fri,  2 Jun 2023 20:24:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B70042874
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8C66A1BF32D
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 20:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AA2D4286A
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 20:24:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AA2D4286A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gejLZFR3uVn2 for <buildroot@lists.busybox.net>;
 Fri,  2 Jun 2023 20:24:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3510B4285A
 for <buildroot@buildroot.org>; Fri,  2 Jun 2023 20:24:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3510B4285A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2073D86BC9; Fri,  2 Jun 2023 20:24:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 2 Jun 2023 22:00:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d93c999a39344bb3b73a21490cc4e0122ef5923
X-Git-Newrev: be861867cfac5fb7cc2ce986d24f447b22568da0
X-Patchwork-Hint: ignore
Message-Id: <20230602202425.2073D86BC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] .checkpackageignore: update after gcc 11.x
 bump
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

commit: https://git.buildroot.net/buildroot/commit/?id=be861867cfac5fb7cc2ce986d24f447b22568da0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The bump to 11.4.0 in commit f1e3d02cd4d missed
0001-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch, so add it back
again to keep checkpackage happy.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.checkpackageignore b/.checkpackageignore
index ea5f6aafd3..401b24b5d6 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -518,6 +518,7 @@ package/gcc/10.4.0/0002-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch Upstr
 package/gcc/10.4.0/0003-or1k-Use-cmodel-large-when-building-crtstuff.patch Upstream
 package/gcc/10.4.0/0004-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch Upstream
 package/gcc/10.4.0/0005-disable-split-stack-for-non-thread-builds.patch Upstream
+package/gcc/11.4.0/0001-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch Upstream
 package/gcc/11.4.0/0004-disable-split-stack-for-non-thread-builds.patch Upstream
 package/gcc/12.3.0/0001-disable-split-stack-for-non-thread-builds.patch Upstream
 package/gcc/8.4.0/0001-xtensa-fix-PR-target-91880.patch Upstream
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
