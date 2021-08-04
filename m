Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D29ECC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:46:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BF7160F22
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:46:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5BF7160F22
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3862883D11;
	Wed,  4 Aug 2021 20:46:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3rXyYKmGfHhJ; Wed,  4 Aug 2021 20:46:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F5A083CBC;
	Wed,  4 Aug 2021 20:46:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 85A471BF5DC
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8216783CBC
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:46:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vpne05pvvFmn for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 20:46:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF6BC83C5F
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 20:46:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B52558B794; Wed,  4 Aug 2021 20:46:17 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 22:40:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5227649cb63fb26d62ef17d78a6df69eab9bef18
X-Git-Newrev: 967219ee7f48a77a36a1298be9667b8b3b66a3dc
X-Patchwork-Hint: ignore
Message-Id: <20210804204617.B52558B794@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pdbg: Fix alignment error on
 autobuilder
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

commit: https://git.buildroot.net/buildroot/commit/?id=967219ee7f48a77a36a1298be9667b8b3b66a3dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The autobuilder fails when building for sh because of an alignment issue
in assembly that includes an external data file.

Fixes:
 http://autobuild.buildroot.net/results/457b88c4ba85edb42b3a36cce48bf90712f590bf/

This fix has been submitted upstream.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pdbg/0001-template-Fix-alignment.patch | 39 ++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/pdbg/0001-template-Fix-alignment.patch b/package/pdbg/0001-template-Fix-alignment.patch
new file mode 100644
index 0000000000..e95d8344e2
--- /dev/null
+++ b/package/pdbg/0001-template-Fix-alignment.patch
@@ -0,0 +1,39 @@
+From 0080d0a64da274207bc341491f87863952bb6e3b Mon Sep 17 00:00:00 2001
+From: Joel Stanley <joel@jms.id.au>
+Date: Tue, 3 Aug 2021 17:28:17 +0930
+Subject: [PATCH] template: Fix alignment
+
+The assembler complains about unaliged data:
+
+ ./template.S: Assembler messages:
+ ./template.S:21: Error: misaligned data
+
+If the included data is not an aligned size, the the symbols following
+will be unaligned.
+
+We lost the alignment directive in commit 5f3deee1289e ("template: new
+libfdt requires 8-byte aligned fdt"), so add it back as it was before
+that commit.
+
+Reported by the buildroot autobuilder.
+
+Signed-off-by: Joel Stanley <joel@jms.id.au>
+---
+ template.S | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/template.S b/template.S
+index ecf9bba0656d..df8c064d6bc0 100644
+--- a/template.S
++++ b/template.S
+@@ -17,6 +17,7 @@
+ SYM_START(SYMBOL_PREFIX):
+ .incbin FILENAME
+ SYM_END(SYMBOL_PREFIX):
++.align 4
+ SYM_SIZE(SYMBOL_PREFIX):
+ 	.long	SYM_END(SYMBOL_PREFIX) - SYM_START(SYMBOL_PREFIX)
+ .globl SYM_START(SYMBOL_PREFIX)
+-- 
+2.32.0
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
