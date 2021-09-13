Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20841C433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 17:48:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF8AC60EB4
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 17:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF8AC60EB4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E5B040275;
	Mon, 13 Sep 2021 17:48:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KMLhrBTCxGw1; Mon, 13 Sep 2021 17:48:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 637B54023C;
	Mon, 13 Sep 2021 17:48:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 09F471BF97E
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 17:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09B6D4013F
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 17:47:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pNwdob1QOQ73 for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 17:47:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAAED40004
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 17:47:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BF6FE8A58D; Mon, 13 Sep 2021 17:45:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 19:24:54 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: aca0577bdeebc9d635b4fbe2ce461af2c154e191
X-Git-Newrev: 20df88372e8f127b9e93df05fd98383b5c166734
X-Patchwork-Hint: ignore
Message-Id: <20210913174527.BF6FE8A58D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] toolchain: reorder gcc
 bugs by number
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

commit: https://git.buildroot.net/buildroot/commit/?id=20df88372e8f127b9e93df05fd98383b5c166734
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Reorder gcc bugs by number

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b1e8594f0926c7867b0efbff5fafa411e54c2782)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/Config.in | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index c0cfd1a548..af21959eff 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -186,13 +186,6 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_101737
 	bool
 	default y if BR2_sh4
 
-# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101952
-# ICE: on SH4: unaligned opcodes detected in executable segment.
-# This bug still exists in gcc = 11.1.0
-config BR2_TOOLCHAIN_HAS_GCC_BUG_101952
-	bool
-	default y if BR2_sh4
-
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101915
 # ICE: in extract_insn, at recog.c:2294 on microblaze.
 # This bug still exists in gcc = 11.1.0
@@ -207,6 +200,13 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_101916
 	bool
 	default y if BR2_sh4
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101952
+# ICE: on SH4: unaligned opcodes detected in executable segment.
+# This bug still exists in gcc = 11.1.0
+config BR2_TOOLCHAIN_HAS_GCC_BUG_101952
+	bool
+	default y if BR2_sh4
+
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
