Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90607C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 10:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D9EC421D3;
	Fri,  5 Jan 2024 10:56:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D9EC421D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hRfndgBiG6TC; Fri,  5 Jan 2024 10:56:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2A69421A1;
	Fri,  5 Jan 2024 10:56:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2A69421A1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5667F1BF378
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 10:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3018383D9A
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 10:55:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3018383D9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id prAPOAmIy5q7 for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 10:55:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8995383DA6
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 10:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8995383DA6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7609F843B3; Fri,  5 Jan 2024 10:55:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Jan 2024 11:40:38 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: dad5eb46da6165f095df920b9c7bf92009e73c5f
X-Git-Newrev: 14a8579cd0a6cf099d4ab12f2b097a7e2e15dbb5
X-Patchwork-Hint: ignore
Message-Id: <20240105105526.7609F843B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] support/testing:
 TestDtbocfg: bump kernel to 5.10.202
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

commit: https://git.buildroot.net/buildroot/commit/?id=14a8579cd0a6cf099d4ab12f2b097a7e2e15dbb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

The prebuilt kernel has been updated to 5.10.202, sync the kernel
built by TestDtbocfg.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0c0cd720c5d71c5a8508795761eb168a7b3832cc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_dtbocfg.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_dtbocfg.py b/support/testing/tests/package/test_dtbocfg.py
index d25b1692b4..56a1ed4820 100644
--- a/support/testing/tests/package/test_dtbocfg.py
+++ b/support/testing/tests/package/test_dtbocfg.py
@@ -8,7 +8,7 @@ class TestDtbocfg(infra.basetest.BRTest):
         """
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.202"
         BR2_LINUX_KERNEL_USE_DEFCONFIG=y
         BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
         BR2_PACKAGE_DTBOCFG=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
