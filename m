Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC97FCA0EFA
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 18:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 827D8616D9;
	Thu, 21 Aug 2025 18:57:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hE3piEmEkP81; Thu, 21 Aug 2025 18:57:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D873A6167C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D873A6167C;
	Thu, 21 Aug 2025 18:57:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 219031C7
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9B5B61442
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:56:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EXtGceNtAUuf for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 18:56:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BDB461367
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BDB461367
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:56:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4836287A05; Thu, 21 Aug 2025 18:56:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 10:38:33 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5a630e95ba3ab648b1172782cec5ecec41beeb30
X-Git-Newrev: 58323d7c27b8aaf184e0e1ae7b37501360c71493
X-Patchwork-Hint: ignore
Message-Id: <20250821185659.4836287A05@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/rt-tests: update
 _SITE URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=58323d7c27b8aaf184e0e1ae7b37501360c71493
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The previous version bump 8f52d4183e ("package/rt-tests: bump to
version 2.8") was using the latest release, so the URL was updated to
remove the "older" subdirectory.

The URL was:

  https://www.kernel.org/pub/linux/utils/rt-tests/rt-tests-2.8.tar.xz

On the 01/07/2025 a new rt-tests release was published (2.9), so the
2.8 archive was moved to "older" subdirectory and once again breaking
existing packaging downloads.

The "new" URL is now:

  https://www.kernel.org/pub/linux/utils/rt-tests/older/rt-tests-2.8.tar.xz

This situation was discussed upstream in [1].

[1] https://lore.kernel.org/linux-rt-users/20241228114346.6020d6b0@windsurf/

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/10984686708 (TestRtTests)

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
[Julien: add comment in commit log about link [1]]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e91d1068de81357d86d462fc07c4f97e142c74bc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/rt-tests/rt-tests.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index 3c6b6f2276..6c445fde91 100644
--- a/package/rt-tests/rt-tests.mk
+++ b/package/rt-tests/rt-tests.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RT_TESTS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/rt-tests
+RT_TESTS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/rt-tests/older
 RT_TESTS_SOURCE = rt-tests-$(RT_TESTS_VERSION).tar.xz
 RT_TESTS_VERSION = 2.8
 RT_TESTS_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
