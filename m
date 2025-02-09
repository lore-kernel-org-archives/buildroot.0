Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EFAC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AECBB85CAA;
	Fri, 28 Feb 2025 17:17:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SWodEWPfU_i2; Fri, 28 Feb 2025 17:17:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B929685CA8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B929685CA8;
	Fri, 28 Feb 2025 17:17:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1998E711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73E2A441C0
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lWMqCaWvBA4F for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EF1642D47
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EF1642D47
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 502E087C10; Fri, 28 Feb 2025 16:30:38 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 9 Feb 2025 21:56:48 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 670c9786512655f62ca50833917a8616a1bd5829
X-Git-Newrev: ad25dd6159217e6c9eb77f827fe2824a210a6c38
X-Patchwork-Hint: ignore
Message-Id: <20250228163038.502E087C10@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/zstd: drop useless
 check-package disable
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ad25dd6159217e6c9eb77f827fe2824a210a6c38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit 52154e52069d (package/zstd: build multithreaded library if
supported) added an override of a previously defined variable, so an
explicit check-package exception was added in 0f0e913f10ca
(package/zstd: rework build and install). Eventually, in 253a951c4fe7
(package/zstd: fix build without threads) the variable override was
removed.

However, the check-package exception was left out during the rework in
253a951c4fe7, so it now excludes nothing.

Drop this exception now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/zstd/zstd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index 575bb2c838..bf04b4793c 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -72,7 +72,7 @@ else
 ZSTD_OPTS += HAVE_THREAD=0
 ZSTD_BUILD_LIBS_THREAD_SUFFIX = -nomt
 endif
-# check-package disable OverriddenVariable - override intended
+
 ZSTD_BUILD_LIBS = \
 	$(addsuffix -release, \
 		$(addsuffix $(ZSTD_BUILD_LIBS_THREAD_SUFFIX), \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
