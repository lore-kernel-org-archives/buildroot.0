Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C082CD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A030821DB;
	Fri,  5 Jun 2026 12:40:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tGkcI0m1KXBf; Fri,  5 Jun 2026 12:40:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 880B0821D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663225;
	bh=Z7L44okS4s8SWY6Uyt3XNw9SICqSPHPRIshGYeBKx+Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TPoCAiWspydql5Rarlu/9mKQ1TGlr6yA2v7/S6Aiactf0+R4w76eLB1HyO2vXgxws
	 yPKa0sRPjLDOdhT8XargkpDo7j+LZYMrcD3Em4VFwy3aoSShfq+zbIveWRWyuW5U18
	 NMnwD5FWQI4xfk3yKxdSBwJFWdwKJ8k+ixPCZjT+MO35V0znNKyyif62+TOA2BIf3/
	 kUwXliIfoyWWLQV6G6ByAzkR8PetMHGZCRGjKRsx9j5ju8+13Qc37oM535NADf0bGK
	 BcDfc4FD7vkuIAnXJqiDgtuecsS7cexLDzpW99uDqYjucLurHuXjCMEyZS2x4chMBr
	 TEAQfF2rAW23g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 880B0821D7;
	Fri,  5 Jun 2026 12:40:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 03B0F388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AB4B82036
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fUqxd3X3cMCo for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D01981FE0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D01981FE0
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A738F87B2F; Fri,  5 Jun 2026 12:38:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:04:04 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 22803c9d617bd046af86d1ac71638a5bf90c0c6c
X-Git-Newrev: 5a29ec02f617b6fcefbf8d71aedb5f68b7e0c9be
X-Patchwork-Hint: ignore
Message-Id: <20260605123837.A738F87B2F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x]
 package/util-linux/util-linux-libs: add AUTORECONF
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5a29ec02f617b6fcefbf8d71aedb5f68b7e0c9be
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Commit dd4161c39d97c7a651625dca18fa2aaab9298fa6 ("package/util-linux:
optionally add libpthread to uuid.pc") added patches to util-linux and
util-linux-libs that require autoreconf, but forgot to add autoreconf
for util-linux-libs, which this new commit fixes.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b45e479b9658fdcc6b8ee5e6ea4034d5f452c37f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/util-linux/util-linux-libs/util-linux-libs.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/util-linux/util-linux-libs/util-linux-libs.mk b/package/util-linux/util-linux-libs/util-linux-libs.mk
index 9340d5ae4f..6716a656d2 100644
--- a/package/util-linux/util-linux-libs/util-linux-libs.mk
+++ b/package/util-linux/util-linux-libs/util-linux-libs.mk
@@ -21,6 +21,9 @@ UTIL_LINUX_LIBS_LICENSE_FILES = README.licensing \
 	Documentation/licenses/COPYING.BSD-3-Clause \
 	Documentation/licenses/COPYING.LGPL-2.1-or-later
 
+# 0002-autotools-optionally-add-libpthread-to-uuid.pc.patch
+UTIL_LINUX_LIBS_AUTORECONF = YES
+
 UTIL_LINUX_LIBS_INSTALL_STAGING = YES
 UTIL_LINUX_LIBS_DEPENDENCIES = \
 	host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
