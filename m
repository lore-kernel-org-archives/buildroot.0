Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7762EC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:55:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 288F860F02
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:55:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 288F860F02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEB5360AC4;
	Thu,  5 Aug 2021 19:55:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rtwA36hAFCZR; Thu,  5 Aug 2021 19:55:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3404860A93;
	Thu,  5 Aug 2021 19:55:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 68E751BF361
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AE824020C
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:49:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JEMwNMkY8p_g for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:49:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EE184022E
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:49:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C17BD85C25; Thu,  5 Aug 2021 19:49:40 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 21:29:52 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d54341fc33b6c02d01d31e8ddb938556867308a9
X-Git-Newrev: 4b22106fb5e199aa26f148b0b159aecb7da7f7e0
X-Patchwork-Hint: ignore
Message-Id: <20210805194940.C17BD85C25@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_101737
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b22106fb5e199aa26f148b0b159aecb7da7f7e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

pixman package fails to build for the SH4 architecture with optimization
enabled with gcc up to 11.1.0:
http://autobuild.buildroot.net/results/b20/b20869bbb48edb1f0a847ea9e2e1a0462d6350be/

It's been reported upstream:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101737

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 toolchain/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 03375e0c52..d5f1176178 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -176,6 +176,13 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_99140
 	bool
 	default y if BR2_nios2 && !BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101737
+# ICE: SH4 -Os causes internal compiler error. This bug
+# still exists in gcc = 11.1.0
+config BR2_TOOLCHAIN_HAS_GCC_BUG_101737
+	bool
+	default y if BR2_sh4
+
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
