Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84BCEC4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:59:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CB1C61029
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:59:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4CB1C61029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 272DE4021A;
	Thu, 19 Aug 2021 20:59:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d6TIUP7kPTDC; Thu, 19 Aug 2021 20:59:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B31E74021E;
	Thu, 19 Aug 2021 20:59:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D182A1BF215
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD7F640176
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:59:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ivHT0fyUa37Z for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 20:59:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D4FA4011D
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 20:59:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C5DA18D5FA; Thu, 19 Aug 2021 20:58:17 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 22:58:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 835ea5b94cde2b297da88a1653cf517fcb1b0db9
X-Git-Newrev: b61c93645da26a2b6a674881e61c5d72297fc74a
X-Patchwork-Hint: ignore
Message-Id: <20210819205817.C5DA18D5FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_101915
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

commit: https://git.buildroot.net/buildroot/commit/?id=b61c93645da26a2b6a674881e61c5d72297fc74a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lmbench package fails to build for the Microblaze architecture with
optimization enabled with gcc = 11.1.0:
http://autobuild.buildroot.net/results/ae1/ae1e4d61ed367c6cb64442c60d98882cc7985346/

It's been reported upstream:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101915

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 01d93517bd..fba1589e38 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -190,6 +190,13 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_101952
 	bool
 	default y if BR2_sh4
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101915
+# ICE: in extract_insn, at recog.c:2294 on microblaze.
+# This bug still exists in gcc = 11.1.0
+config BR2_TOOLCHAIN_HAS_GCC_BUG_101915
+	bool
+	default y if BR2_microblaze
+
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
