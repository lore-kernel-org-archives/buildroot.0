Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D2D4C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:36:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C31D60EB7
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C31D60EB7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0069982D96;
	Sun,  8 Aug 2021 19:36:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pOCL8BTMzmCk; Sun,  8 Aug 2021 19:35:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6417D82CA3;
	Sun,  8 Aug 2021 19:35:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C723C1BF97E
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7502600D4
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:34:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P9ZNouuiC7ie for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 19:34:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50160600C4
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 19:34:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 09A6B8D275; Sun,  8 Aug 2021 19:33:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 21:01:58 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: fe3d8c5f6018bd8e74e3d6f59fe96f9ef7efb408
X-Git-Newrev: 129c4ecdc3c89eb486caec4943d2221d6b90e1ca
X-Patchwork-Hint: ignore
Message-Id: <20210808193342.09A6B8D275@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] toolchain: introduce
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

commit: https://git.buildroot.net/buildroot/commit/?id=129c4ecdc3c89eb486caec4943d2221d6b90e1ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

pixman package fails to build for the SH4 architecture with optimization
enabled with gcc up to 11.1.0:
http://autobuild.buildroot.net/results/b20/b20869bbb48edb1f0a847ea9e2e1a0462d6350be/

It's been reported upstream:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101737

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 4b22106fb5e199aa26f148b0b159aecb7da7f7e0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 5c4af50b8e..9dafa173ad 100644
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
