Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA5BD2F32D
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A818C83168;
	Tue, 13 Jan 2026 19:41:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hANYNaI57jD4; Tue, 13 Jan 2026 19:41:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0ED9583E36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333261;
	bh=pkhbwl5TfiGyGmBLflmiYPdZRR0o6b7pc1MGzpPOJPw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TKSbXtUI0FyAwWe8Ysh4xSCwBbIVwKWLeaQ0AteQVRztTjWcSEJNlKVsc8kFGrwRh
	 Bxd6kbIUlO+fBQi5slg3PrejFt5nLPSEcp28M7okIRkEZWAKzR+Eie7DnZGq0A6Ljl
	 PCxx8Mu1r5OJBfIMMN23dHEXNhQ6TafEt/ZQjeo4/9h1CCDAG6VPs9cZd3w+Tmz1YU
	 BdZrG0r5qUgl7dUv4J5nuUE97Z7iRz1dzHtdLXKNSPag1Z7n4S4b3EtBeGqeHpXtPu
	 EMcz7aQ/FbsDJEMJlgNf6uERlxeI5sXhelSBEh5Wu8BtI3p6FlgnT1DSWERhgUh5y7
	 R48FefmZz8jjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0ED9583E36;
	Tue, 13 Jan 2026 19:41:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 47C081C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BEB4B406E9
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VYqO4EoTMlVR for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79CBF40373
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79CBF40373
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 77E288267D; Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:04:13 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 50dcf7107f0d8b330a435a1f9dd10f1177245cec
X-Git-Newrev: 6f5c8638c1200df34cdc465102557628a5df439a
X-Patchwork-Hint: ignore
Message-Id: <20260113194032.77E288267D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/glibc: remove
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

commit: https://git.buildroot.net/buildroot/commit/?id=6f5c8638c1200df34cdc465102557628a5df439a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Since Buildroot commit [1] the CVEs are no longer matched to CPEs with
versions using '-'.

These IGNORE_CVES entries introduced in [2] are then no longer matched to
the glibc package.

For more information, see the explanation in commit [1].

[1] 35f376d88e support/scripts/cve.py: fix CPE matching
[2] adaae82c58 package/glibc: ignore CVEs not considered as security issues by upstream

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9383a3a72667523c691b7898691bd168bab87839)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/glibc/glibc.mk | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index a7727cbad8..924274a7d6 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -34,19 +34,10 @@ GLIBC_IGNORE_CVES += CVE-2025-5702
 # Fixed by glibc-2.41-64-g1e16d0096d80a6e12d5bfa8e0aafdd13c47efd65
 GLIBC_IGNORE_CVES += CVE-2025-8058
 
-# All these CVEs are considered as not being security issues by
+# This CVE is considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
-#  https://security-tracker.debian.org/tracker/CVE-2019-1010022
-#  https://security-tracker.debian.org/tracker/CVE-2019-1010023
-#  https://security-tracker.debian.org/tracker/CVE-2019-1010024
-#  https://security-tracker.debian.org/tracker/CVE-2019-1010025
-GLIBC_IGNORE_CVES += \
-	CVE-2010-4756 \
-	CVE-2019-1010022 \
-	CVE-2019-1010023 \
-	CVE-2019-1010024 \
-	CVE-2019-1010025
+GLIBC_IGNORE_CVES += CVE-2010-4756
 
 # glibc is part of the toolchain so disable the toolchain dependency
 GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
