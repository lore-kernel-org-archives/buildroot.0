Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245A0E95A79
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 10:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEBFE407D6;
	Tue, 30 Dec 2025 10:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B70FcKg9cZeu; Tue, 30 Dec 2025 10:57:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F230407EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767092269;
	bh=dVMhSnATrQxB1Q4lTSpgWgNDQEmv4wKBWXinKNSEhvQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ahLbThomUuA962l8APxHgoqDJz0SQO8JE5Ldfn+aQHAxtQJTJnYPPohDgFuKiYSpw
	 XpOy6QsL8sibzdfPUD4JqFo4yoQ11AfadwM0mx+c26VdoDC09cZREDWXp5AyBkc4+C
	 7WE5QCz68pbhkLjbLS7Y2HifkCQLUJqGEGMIUXkRguuDQYKU2ZPQAam6oPPUoJjFyH
	 9UNHrlEHUC2C2fHsH4gfaWCcHgQuOP0+EDASZMErsKFluIV1kJPGNAVerMPdtG8BOC
	 Y9EHnGBCWwFOqFjikU+DQBvUfB/Ld/0EpjvbV47ju/zVJZm5ms+i4trJgzCOTb9nfM
	 jqn7AGZeiAGAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F230407EA;
	Tue, 30 Dec 2025 10:57:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AFE3177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47C89811C1
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9A5yKsLyRzLa for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 10:57:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 312C78127D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 312C78127D
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:57:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2393387BD2; Tue, 30 Dec 2025 10:57:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 11:54:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2a2184f317faa41049cba4095fde42e87628091e
X-Git-Newrev: 9383a3a72667523c691b7898691bd168bab87839
X-Patchwork-Hint: ignore
Message-Id: <20251230105735.2393387BD2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glibc: remove stale IGNORE_CVES
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

commit: https://git.buildroot.net/buildroot/commit/?id=9383a3a72667523c691b7898691bd168bab87839
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit [1] the CVEs are no longer matched to CPEs with
versions using '-'.

These IGNORE_CVES entries introduced in [2] are then no longer matched to
the glibc package.

For more information, see the explanation in commit [1].

[1] 35f376d88e support/scripts/cve.py: fix CPE matching
[2] adaae82c58 package/glibc: ignore CVEs not considered as security issues by upstream

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
