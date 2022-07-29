Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1F2C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 19:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 314DB846F5;
	Fri, 29 Jul 2022 19:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 314DB846F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gYECasBsAWVW; Fri, 29 Jul 2022 19:52:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DBF78469C;
	Fri, 29 Jul 2022 19:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DBF78469C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 819E21C11A5
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 19:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68C6E8469C
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 19:52:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68C6E8469C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KLVs_J2TYLrN for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 19:52:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA082845C4
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 19:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA082845C4
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 566C086941; Fri, 29 Jul 2022 19:38:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 Jul 2022 21:52:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5df2f9ff1cc15f3d71514b7c5ff6bd6380f57fd0
X-Git-Newrev: 1e1d45a9bcb38e37d1b27388b267a790b56eb642
X-Patchwork-Hint: ignore
Message-Id: <20220729193849.566C086941@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/Config.in: update gcc bug 99410
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1e1d45a9bcb38e37d1b27388b267a790b56eb642
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Gcc bug 99410 reappeared while building with gcc 11.x and while
testing it also shows up with gcc 12.x, so let's enable this bug for
all gcc versions except gcc 8.x.

Fixes:

  http://autobuild.buildroot.net/results/64e54ef5ba3a3dee391b788315615d57a1dd9fa2/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index ed3f6c6645..6071342d01 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -186,12 +186,12 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_93847
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99410
 # Error: branch offset out of range on Nios II. This bug
-# no longer exists in gcc 8.x but reappeared on gcc 9.x and has been
-# fixed on gcc 11.x.
+# no longer exists in gcc 8.x but reappeared on gcc 9.x and still exists
+# on gcc 12.x
 config BR2_TOOLCHAIN_HAS_GCC_BUG_99410
 	bool
 	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
-	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_9 && !BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	depends on BR2_nios2
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101737
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
