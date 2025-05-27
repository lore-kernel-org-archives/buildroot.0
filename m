Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7190C5B543
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6FE340BC4;
	Wed,  4 Jun 2025 18:28:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DMgDfiRirIC3; Wed,  4 Jun 2025 18:28:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8D2E40BEC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8D2E40BEC;
	Wed,  4 Jun 2025 18:28:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F8511A6
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A38A83B72
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:27:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RkdrZ6iNCNnL for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:27:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA09983B61
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA09983B61
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:27:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C4894876FB; Wed,  4 Jun 2025 18:27:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 May 2025 18:25:34 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 1c9fedcecebd2286315a30793e1f1322e96342e3
X-Git-Newrev: 75296a4f31f44f42061552b71a2895a035992995
X-Patchwork-Hint: ignore
Message-Id: <20250604182757.C4894876FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/exim: drop stale
 ignore CVE entry
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

commit: https://git.buildroot.net/buildroot/commit/?id=75296a4f31f44f42061552b71a2895a035992995
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The CVE-2022-3620 entry is not reported as affecting our exim package
by pkg-stats. Currently it's because the NVD entry is
incorrect (incorrect exim version), but we sent a bug report [1] to
the NVD database so that it gets updated. Once updated, pkg-stats
still won't report the CVE as affecting us because the issue has been
fixed in exim 4.97, and we're using a newer version.

[1] https://lore.kernel.org/buildroot/20250517183000.40b28b4d@windsurf/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 463e21fdcbadc0d99341225f9e5d774c2a447180)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/exim/exim.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 9ecae0d038..bee3a79808 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -16,9 +16,6 @@ EXIM_DEPENDENCIES = host-berkeleydb host-pcre2 pcre2 berkeleydb host-pkgconf
 # 0006-Fix-regex-n-use-after-free.-Bug-2915.patch
 EXIM_IGNORE_CVES += CVE-2022-3559
 
-# built without dmarc support
-EXIM_IGNORE_CVES += CVE-2022-3620
-
 # Modify a variable value. It must already exist in the file, either
 # commented or not.
 define exim-config-change # variable-name, variable-value
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
