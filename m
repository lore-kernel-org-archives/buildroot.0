Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5307D2F32D
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7372182D12;
	Tue, 13 Jan 2026 19:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tER4aSCYKYt0; Tue, 13 Jan 2026 19:36:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9426482C5E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768332982;
	bh=3+0OTFt8xf6iFjznZdHuM6rItdU/H7zZ3yrXUtp5oaU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gfM6OWT/s19r9HIbjijTq2zycCWxtQnrCmZoauya69mcS8B6WOMq0078JtlASvNLl
	 xXEtL6Gd7TYe4SdbOrjlQLxlm7DICSGkMry6/3FkLFZUtOLAieMIQXQ84Btv/fcGuN
	 o9ySIUcA9fe3EmKMScCbG/i0BkPV/Zzy+jEEQgNopKTJHCm5exAK6BfDUL0luGkOaw
	 6GeM1WYkDIzUMdHoDoDhVSV08RS5nknOh5/uI2BcV69+lOsbUbNDmYTviu3u1zn9mF
	 ayLwMWhTtx7NJYKbsHr3lkm1eyi5XgyPkEtX3VhMtyIuRQwFtSXTP6QLF5PWKnSSAx
	 Rz8DfvKT0yMIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9426482C5E;
	Tue, 13 Jan 2026 19:36:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0514F1C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D72482C38
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qDRIvBt2-60F for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EDE682BED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8EDE682BED
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8CF45816B6; Tue, 13 Jan 2026 19:36:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:03:36 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e7918ae91a1ec2440b84f45d6b1620251d187aa3
X-Git-Newrev: 8b87f2597b0ab2c30af530b913397ca278741d84
X-Patchwork-Hint: ignore
Message-Id: <20260113193617.8CF45816B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/pixman: remove
 stale IGNORE_CVES
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

commit: https://git.buildroot.net/buildroot/commit/?id=8b87f2597b0ab2c30af530b913397ca278741d84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since Buildroot commit [1] the CVEs are no longer matched to CPEs with
versions using '-'.

The CVE-2023-37769 is then no longer matched to the pixman package.

For more information, see the explanation in commit [1].

[1] 35f376d88e support/scripts/cve.py: fix CPE matching

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5043af53edea237dab1d5334b263cc9245d44404)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pixman/pixman.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 0a6ecaa7dd..08ca9003bb 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -26,12 +26,6 @@ PIXMAN_CONF_OPTS = \
 	-Dlibpng=disabled \
 	-Dtests=disabled
 
-# Affects only tests, and we don't build tests.
-# See https://gitlab.freedesktop.org/pixman/pixman/-/issues/76, which says
-# "not sure why NVD keeps assigning CVEs like this. This is just a test
-# executable".
-PIXMAN_IGNORE_CVES += CVE-2023-37769
-
 ifeq ($(BR2_X86_CPU_HAS_MMX),y)
 PIXMAN_CONF_OPTS += -Dmmx=enabled
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
