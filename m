Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB74C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:34:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DDC860FDC
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4DDC860FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 215696149B;
	Thu, 26 Aug 2021 22:34:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kYDRldsRwGZg; Thu, 26 Aug 2021 22:34:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96E27614B9;
	Thu, 26 Aug 2021 22:34:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 090761BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7495440780
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YfVv07mQMw61 for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16B84407D4
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6B73C8DC52; Thu, 26 Aug 2021 22:01:33 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 24 Aug 2021 23:50:47 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ddf37c819133d699e749ca401b8ce6fdf485a55e
X-Git-Newrev: fe4e06d3176b01834fda92d25ae7ece65f3550e0
X-Patchwork-Hint: ignore
Message-Id: <20210826220133.6B73C8DC52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] toolchain: improve conditions
 for gcc bug 99140
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=fe4e06d3176b01834fda92d25ae7ece65f3550e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Gcc bug 99140 has been fixed on gcc 8.x but reappeared on gcc 9.x while
it's been fixed on gcc 10.x+. So let's update
BR2_TOOLCHAIN_HAS_GCC_BUG_99140 accordingly.

Fixes:
http://autobuild.buildroot.net/results/c55/c55f50a8d657695f0d5492c32efa666254cd7f99/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 1d0469a13e..c0cfd1a548 100644
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
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
