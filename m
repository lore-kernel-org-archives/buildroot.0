Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01D9D2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C576760C22;
	Tue, 13 Jan 2026 19:36:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LjVd0-m7VpIp; Tue, 13 Jan 2026 19:36:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D2DE60C1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333002;
	bh=npvEWj7EmP9NWPUF6bKc9cyo7pzIEgEY/9iH7xykPk0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AlNV54DfqFJPvSiAkFYx0mzRRMWQ72224faW54L7+CmRpRShF/iMgPZv9z0df2c9y
	 w4XNfzg4lypTJkB/iD3h4UfG1tN/h2TyQg786z/fS1CMRAovbwb+rVg79GWZjNxa3G
	 XhR1LdUIPfVsOjC1pBFC2DiKMFSe/t674hhQ0ImAEtagqBbihDuaUt1Elc0Po1KD6O
	 0bbAMoSq0aFD0xMHCezVQ7zNEsfNX9eoUHDEhlLqh20NcVKOtT+X9ennmLOSWupBrA
	 cGlF13b6NNsPkzWH1XB0yHBAx7Bx7YKZyczTeazxvGjWiKrv/Qtbj0PfvPx26uHI7D
	 mH2LnQuAhRiHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D2DE60C1A;
	Tue, 13 Jan 2026 19:36:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 07F791C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5C8E82C7C
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7BhAZBCOd2B4 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9D4482BF5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9D4482BF5
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C6F668854B; Tue, 13 Jan 2026 19:36:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:04:10 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3c88e7efaa06fb442320ed8b0187615b6651561c
X-Git-Newrev: ad4df54b844b4e94a633eb0a6490b632021ed87f
X-Patchwork-Hint: ignore
Message-Id: <20260113193617.C6F668854B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/glibc: remove
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

commit: https://git.buildroot.net/buildroot/commit/?id=ad4df54b844b4e94a633eb0a6490b632021ed87f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
index 4a41665f81..37752416ba 100644
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
