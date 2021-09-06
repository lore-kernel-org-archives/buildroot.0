Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE07FC433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 19:11:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87D7561050
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 19:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 87D7561050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A7104049F;
	Mon,  6 Sep 2021 19:11:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9DPvxK3cYm0l; Mon,  6 Sep 2021 19:11:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24CCF404A0;
	Mon,  6 Sep 2021 19:11:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 10DF01BF34C
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 19:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5CF3404A5
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 19:10:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2w2Bw1MUsrGM for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 19:10:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D88164049F
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 19:10:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E1BD988726; Mon,  6 Sep 2021 19:09:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Sep 2021 21:06:55 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 62f6b53c19ebd0b9764f01a9bea76d18d3e27f57
X-Git-Newrev: a4aac511b54b4c24fff3944b0143d29905ba6dd2
X-Patchwork-Hint: ignore
Message-Id: <20210906190918.E1BD988726@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] toolchain: improve
 conditions for gcc bug 99140
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a4aac511b54b4c24fff3944b0143d29905ba6dd2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Gcc bug 99140 has been fixed on gcc 8.x but reappeared on gcc 9.x while
it's been fixed on gcc 10.x+. So let's update
BR2_TOOLCHAIN_HAS_GCC_BUG_99140 accordingly.

Fixes:
http://autobuild.buildroot.net/results/c55/c55f50a8d657695f0d5492c32efa666254cd7f99/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fe4e06d3176b01834fda92d25ae7ece65f3550e0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 60328c8aa5..2c9fdb09a1 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -171,10 +171,13 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_93847
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99410
 # Error: branch offset out of range on Nios II. This bug
-# no longer exists in gcc >= 8.x.
+# no longer exists in gcc 8.x but reappeared on gcc 9.x and has been
+# fixed on gcc 10.x.
 config BR2_TOOLCHAIN_HAS_GCC_BUG_99140
 	bool
-	default y if BR2_nios2 && !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_9 && !BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	depends on BR2_nios2
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101737
 # ICE: SH4 -Os causes internal compiler error. This bug
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
