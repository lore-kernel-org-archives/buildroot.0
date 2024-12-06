Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952FAE77179
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 22:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D36380E0C;
	Fri,  6 Dec 2024 22:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wp0eoICpZTzy; Fri,  6 Dec 2024 22:55:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56D3C80EAB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56D3C80EAB;
	Fri,  6 Dec 2024 22:55:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 87DE3ECA
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 22:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5786A80EB5
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 22:55:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lvlfiBMRN9QU for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 22:55:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CADB80EDB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CADB80EDB
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 22:55:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE94986B3B; Fri,  6 Dec 2024 22:55:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Dec 2024 23:33:18 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: cd0e1ef28d79cb14584927e515e93a8748bc4c9a
X-Git-Newrev: 284efa0c164997e8643f7e88f44587770ffa47d3
X-Patchwork-Hint: ignore
Message-Id: <20241206225524.EE94986B3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/rt-tests: fix
 _SITE download url
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=284efa0c164997e8643f7e88f44587770ffa47d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Upstream moved old versions in an "older" directory. The current version
in Buildroot was moved to this directory and fail to download.

This commit simply updates the _SITE url to reflect this change.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/8514189435

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 8e5a5a9bcc55c17f5a515b35f92d5df8023febaa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rt-tests/rt-tests.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index 419260db3c..e048ee94d0 100644
--- a/package/rt-tests/rt-tests.mk
+++ b/package/rt-tests/rt-tests.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RT_TESTS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/rt-tests
+RT_TESTS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/rt-tests/older
 RT_TESTS_SOURCE = rt-tests-$(RT_TESTS_VERSION).tar.xz
 RT_TESTS_VERSION = 2.7
 RT_TESTS_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
