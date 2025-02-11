Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFDE4C0219E
	for <buildroot@archiver.kernel.org>; Tue, 11 Feb 2025 17:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73D1660F3A;
	Tue, 11 Feb 2025 17:01:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jash82Y0ugUY; Tue, 11 Feb 2025 17:01:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B7A260F23
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B7A260F23;
	Tue, 11 Feb 2025 17:01:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A13B8194
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 17:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7AD33411BF
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 17:01:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yzo2b8fFRmDF for <buildroot@buildroot.org>;
 Tue, 11 Feb 2025 17:01:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57F044116B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57F044116B
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 17:01:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 456BC8752D; Tue, 11 Feb 2025 17:01:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 11 Feb 2025 17:58:53 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 2f23cd86805e0a1fca12ff410183802365d407af
X-Git-Newrev: a102446634d94bab4b6f1f59be818f4c4454415b
X-Patchwork-Hint: ignore
Message-Id: <20250211170132.456BC8752D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/zstd: drop
 useless check-package disable
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

commit: https://git.buildroot.net/buildroot/commit/?id=a102446634d94bab4b6f1f59be818f4c4454415b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
(cherry picked from commit ad25dd6159217e6c9eb77f827fe2824a210a6c38)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zstd/zstd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index e25202fd63..39c02d64f6 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -69,7 +69,7 @@ else
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
