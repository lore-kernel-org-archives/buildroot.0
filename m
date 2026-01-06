Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984A8D0D14F
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B2C240AC8;
	Wed,  7 Jan 2026 17:47:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P1CKavK3C7kA; Wed,  7 Jan 2026 17:47:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9623540AC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808062;
	bh=RMoXHrXAUSd5JdX+Ud1ZmJpbuwLegRdyhDKdIJuXXKM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gU6HKpQzYfxDt0tqjBN4lp8LTAjTBTGMFPcMHTyv7L19javay4TG7Io9a8ASWrens
	 GEwhppZZpqoqqdesw8AwJ/mDBazVVv8kS2RmThZlAPyQo0GApWAu3glQ9sGG2cnNWH
	 mjpPgOaDeiIp+QwhZ7GeXHD9lOxrczZDFY49WQhp9kd5+tjpSwmbTSyLu631GqI7d1
	 GfQvvyWv91ipD8itTMavS1oaNwEx03kl5g7vCSq9neBXsmiAyEnbIjYIK+Gpj/bIGn
	 T+AH4Utt+QuKpyJ2obLtfq+E6xsYx7YCqtkuHMp81xYZMps8o07sV5qsLZH0HN71FC
	 PDe4Nv0kMkMWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9623540AC9;
	Wed,  7 Jan 2026 17:47:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 04ED125B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5877F80C3E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nSk5eAdAIReD for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7FAA80A68
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7FAA80A68
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A5CA5883AA; Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:18:17 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: fe6204462a1e2524818ca69332380f528b553914
X-Git-Newrev: 3e4dac4c478a2f4bed3c7bf35b09d99d9b428f6b
X-Patchwork-Hint: ignore
Message-Id: <20260107174642.A5CA5883AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libsndfile: add
 CVE trailer in patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=3e4dac4c478a2f4bed3c7bf35b09d99d9b428f6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3efa0091a433ed88ebc9d25630fbf8291808f0c2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
