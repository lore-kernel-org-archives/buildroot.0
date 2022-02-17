Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B778C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 16:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BFA96F72B;
	Thu, 17 Feb 2022 16:36:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G0_7Cu3oT3uR; Thu, 17 Feb 2022 16:36:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87EFC6F70B;
	Thu, 17 Feb 2022 16:36:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1250D1C113E
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 16:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 005BA42595
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 16:36:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VdwlZjtSUQOT for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 16:36:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45B8B42594
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 16:36:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A6DD6836E4; Thu, 17 Feb 2022 16:28:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 17:23:21 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 59f0bb204f8b6b5873f758ca3f9d00cf029c8b08
X-Git-Newrev: 9d63e24e6a933e98670b486d623e0fa84f7d7fe5
X-Patchwork-Hint: ignore
Message-Id: <20220217162844.A6DD6836E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] toolchain: update gcc bug
 99410
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

commit: https://git.buildroot.net/buildroot/commit/?id=9d63e24e6a933e98670b486d623e0fa84f7d7fe5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Gcc bug 99410 reappeared in gcc 10.x while building belle-sip, but it's
fixed on gcc 11.x, so let's update bug conditions.

Fixes:
http://autobuild.buildroot.net/results/846597f3573d3b0d52e80627a9577d14b9348547/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 88f79aead8fa750bc0e93ef8798751a4b463e9d9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 140d07ca38..f63aec6735 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -191,11 +191,11 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_93847
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99410
 # Error: branch offset out of range on Nios II. This bug
 # no longer exists in gcc 8.x but reappeared on gcc 9.x and has been
-# fixed on gcc 10.x.
+# fixed on gcc 11.x.
 config BR2_TOOLCHAIN_HAS_GCC_BUG_99140
 	bool
 	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
-	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_9 && !BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_10 && !BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	depends on BR2_nios2
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101737
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
