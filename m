Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FE8C87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 532AF80DA4;
	Thu,  7 Aug 2025 17:20:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id COsF5mtjBdkn; Thu,  7 Aug 2025 17:20:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6495C80D9D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6495C80D9D;
	Thu,  7 Aug 2025 17:20:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FBF731
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B68F4008E
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wGVlUphGSv78 for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:19:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54544400A9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54544400A9
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52C3181435; Thu,  7 Aug 2025 17:19:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 19:09:30 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: f8ec9b7f52bd2efb47a1331c933f2e7388e58179
X-Git-Newrev: cb33a98cda03801ec4c6528560896c801f661bdf
X-Patchwork-Hint: ignore
Message-Id: <20250807171916.52C3181435@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/gcc: drop stale
 hash
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cb33a98cda03801ec4c6528560896c801f661bdf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

The hash for the GCC 10.4.0 tarball should have been removed a long
time ago, when support for GCC 10.x has been removed.

Fixes: d37a8f3a2e2a387b102f2982d51aca78bcc09727 ("package/gcc: remove gcc 10.x")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 5fd75bfb02fefdf23d9fe284ff58ed28487edd8e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/gcc/gcc.hash | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index b7c53f8fbe..08e7b28700 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -1,7 +1,5 @@
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-8.4.0/sha512.sum
 sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b4804bc7fe78df335cb53bc83f1ac055baed40979ce4c2c3e46b70280  gcc-8.4.0.tar.xz
-# From https://gcc.gnu.org/pub/gcc/releases/gcc-10.4.0/sha512.sum
-sha512  440c08ca746da450d9a1b35e8fd2305cb27e7e6987cd9d0f7d375f3b1fc9e4b0bd7acb3cd7bf795e72fcbead59cdef5b6c152862f5d35cd9fbfe6902101ce648  gcc-10.4.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-12.4.0/sha512.sum
 sha512  5bd29402cad2deb5d9388d0236c7146414d77e5b8d5f1c6c941c7a1f47691c3389f08656d5f6e8e2d6717bf2c81f018d326f632fb468f42925b40bd217fc4853  gcc-12.4.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-13.3.0/sha512.sum
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
