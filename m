Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE075C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 10:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C0EE40496;
	Sun,  6 Feb 2022 10:58:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0JBBKfVTQ4la; Sun,  6 Feb 2022 10:58:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80AC8401ED;
	Sun,  6 Feb 2022 10:58:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 71E501BF83B
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 607A140226
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:58:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pBRzWcpPdH9b for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 10:58:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2D2A40247
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 10:58:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7BA0581DF5; Sun,  6 Feb 2022 10:51:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Feb 2022 11:58:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 525ffc2bb17fa11fc128124d2d3a92d8698eaab8
X-Git-Newrev: 88f79aead8fa750bc0e93ef8798751a4b463e9d9
X-Patchwork-Hint: ignore
Message-Id: <20220206105128.7BA0581DF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain: update gcc bug 99410
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

commit: https://git.buildroot.net/buildroot/commit/?id=88f79aead8fa750bc0e93ef8798751a4b463e9d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Gcc bug 99410 reappeared in gcc 10.x while building belle-sip, but it's
fixed on gcc 11.x, so let's update bug conditions.

Fixes:
http://autobuild.buildroot.net/results/846597f3573d3b0d52e80627a9577d14b9348547/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index adc93ab725..53d2046379 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -185,11 +185,11 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_93847
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
