Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC61C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5009F82681;
	Mon, 20 Feb 2023 23:15:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5009F82681
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HeoNzZ1phTi6; Mon, 20 Feb 2023 23:15:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FB5E82538;
	Mon, 20 Feb 2023 23:15:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FB5E82538
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0D3011BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39FF9612DC
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39FF9612DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZqlFd-KAFfYd for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5888E612D0
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5888E612D0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41C348648F; Mon, 20 Feb 2023 20:52:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 22 Dec 2022 11:47:26 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3f79611b3037cf505f00cc67011626deb4d8f5b8
X-Git-Newrev: 0627cb0e8a9e19d1ac19c1a72302b25ab7b938dc
X-Patchwork-Hint: ignore
Message-Id: <20230220205214.41C348648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/testing: remove
 leftover kernel config fragment
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

commit: https://git.buildroot.net/buildroot/commit/?id=0627cb0e8a9e19d1ac19c1a72302b25ab7b938dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit 86d32208b62a (support/testing/tests/init/test_systemd.py: use
downloaded kernel) stopped building a custom kernel for the systemd
tests, but forgot to drop the associated kernel config fragment.

That fragment is now not used in any test case, so we can drop it.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/conf/binfmt-misc-kernel-fragment.config | 2 --
 1 file changed, 2 deletions(-)

diff --git a/support/testing/conf/binfmt-misc-kernel-fragment.config b/support/testing/conf/binfmt-misc-kernel-fragment.config
deleted file mode 100644
index 7c992ff71b..0000000000
--- a/support/testing/conf/binfmt-misc-kernel-fragment.config
+++ /dev/null
@@ -1,2 +0,0 @@
-# Needed for binfmt_misc service: "Arbitrary Executable File Formats File System"
-CONFIG_BINFMT_MISC=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
