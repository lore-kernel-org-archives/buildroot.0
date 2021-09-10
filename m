Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B5EC433FE
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 20:28:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58B1361153
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 20:28:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 58B1361153
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 230708497C;
	Fri, 10 Sep 2021 20:28:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cfdh-D8RQN0d; Fri, 10 Sep 2021 20:28:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8761183EB0;
	Fri, 10 Sep 2021 20:28:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EBB291BF580
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 20:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB8E9402A4
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 20:28:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TBj_MEZ0mjrf for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 20:28:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49BBF4026D
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 20:28:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id DC3B488E7A; Fri, 10 Sep 2021 20:27:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 10 Sep 2021 22:28:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8bea006e6b113de507392dc377df01c881728f73
X-Git-Newrev: b1e8594f0926c7867b0efbff5fafa411e54c2782
X-Patchwork-Hint: ignore
Message-Id: <20210910202705.DC3B488E7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain: reorder gcc bugs by number
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

commit: https://git.buildroot.net/buildroot/commit/?id=b1e8594f0926c7867b0efbff5fafa411e54c2782
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reorder gcc bugs by number

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
