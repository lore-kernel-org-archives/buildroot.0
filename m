Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF2AD3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 21:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BA72406AD;
	Sun, 28 Dec 2025 21:00:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kctlIDBI_e25; Sun, 28 Dec 2025 21:00:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85943406B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766955634;
	bh=9MgiUjZBLXAGZ+YNrCAw9VobiZuX3CZXMC9020ExWnY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QX9XpO2747Ee8myuZLSwvOEKn5eYVl5DQus3TY6kRKk/whUEej9CowUVFTlL4HJoA
	 mL8wIjNSpxbikGK1iBIvfBl+9vYhjSP8GAcKWri6HGjapr6Tw7xATs6LG6Ps7WlClu
	 b6QTFhDLS0cyRoLA2dVaNXNAMLMDxxTOezjnXzIuO4GyCtNUSi7BFRIh4u9sUlsq0+
	 OpgQzOgadVsVssutZuYvqgCu9ZvVjBQ314O3/LQArcT1dmwV0AWhp476zLnk+CqDeH
	 wpITqGEFCmKKgfsJuCPWe3YbbFghB0X9e2WZrF0AA/A7wf9as9s8OSvdU0vlmS9BWG
	 NnA44T62qFE4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85943406B2;
	Sun, 28 Dec 2025 21:00:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 396E7D8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29E33405DA
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iwcYdCr41CIi for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 21:00:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83275405E2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83275405E2
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:00:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 81C9681DBA; Sun, 28 Dec 2025 21:00:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 22:00:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 51a3cb5db4b4c1be51e7572028555b5a53055752
X-Git-Newrev: 3efa0091a433ed88ebc9d25630fbf8291808f0c2
X-Patchwork-Hint: ignore
Message-Id: <20251228210024.81C9681DBA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsndfile: add CVE trailer in
 patch
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3efa0091a433ed88ebc9d25630fbf8291808f0c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0014-src-ogg-better-error-checking-for-vorbis.-Fixes-1035.patch      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libsndfile/0014-src-ogg-better-error-checking-for-vorbis.-Fixes-1035.patch b/package/libsndfile/0014-src-ogg-better-error-checking-for-vorbis.-Fixes-1035.patch
index dd9f157811..cb73d370bf 100644
--- a/package/libsndfile/0014-src-ogg-better-error-checking-for-vorbis.-Fixes-1035.patch
+++ b/package/libsndfile/0014-src-ogg-better-error-checking-for-vorbis.-Fixes-1035.patch
@@ -3,6 +3,7 @@ From: Arthur Taylor <art@ified.ca>
 Date: Fri, 15 Nov 2024 19:46:53 -0800
 Subject: [PATCH] src/ogg: better error checking for vorbis. Fixes #1035
 
+CVE: CVE-2024-50612
 Upstream: https://github.com/libsndfile/libsndfile/commit/4755f5bd7854611d92ad0f1295587b439f9950ba
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
