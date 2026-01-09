Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAE3D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 912AE82CF9;
	Tue, 13 Jan 2026 19:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jTynbZCuzfoA; Tue, 13 Jan 2026 19:36:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A6D183218
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768332999;
	bh=Fwvp/CCQ5frRvvKr1VKXiOkXHZP2Q3AbJbrmDj86088=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U9tTsfD+PdCt9RB11tGll1qx3aVqoySP1Ix14s7T8Mz+4cUWEERc7zTqJccLew7r2
	 SuknJIvUse1RMiU5z3vu2YiT8CNgp2Z0M88wk1AWVfuxFQLZZJ2xGdEY5MvMptvKsd
	 s0Klw7FU78vJl0qTZpIAykypLi79uAB+U8mt9Qf3PqJOt2EZj6+QAD8mKnqQVDDxgs
	 DqI+4b/59QNugfJYmnp+w58A5UFYo6bKsdA6MG4Z6AvaIUspIlYY2ChT5CvGHB9Wqa
	 TZkmFk+sWmKPtF2WqsjtapaT+1LJautbO+SGriKltdVJC7Rm2pj1gvcnAqUcw4qZHX
	 mD2BGe0Dv6+gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A6D183218;
	Tue, 13 Jan 2026 19:36:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 147B2231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A01BC40562
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1DtHJuZvvTrr for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B869040447
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B869040447
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B6D4C87935; Tue, 13 Jan 2026 19:36:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:04:02 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 1b63d0ba08f961bc3f5c69f11ac4dc845ee60569
X-Git-Newrev: 3c88e7efaa06fb442320ed8b0187615b6651561c
X-Patchwork-Hint: ignore
Message-Id: <20260113193617.B6D4C87935@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] boot/grub2: remove stale
 IGNORE_CVES
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c88e7efaa06fb442320ed8b0187615b6651561c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since Buildroot commit [1] the CVEs are no longer matched to CPEs with
versions using '-'.

The IGNORE_CVES entries introduced in [2][3][4] are then no longer
matched to the grub2 package.

For more information, see the explanation in commit [1].

[1] 35f376d88e support/scripts/cve.py: fix CPE matching
[2] 2495630383 boot/grub2: ignore CVE-2024-1048
[3] e2f46ed03d boot/grub2: ignore CVE-2023-4001
[4] a490687571 boot/grub2: ignore the last 3 remaining CVEs

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2a2184f317faa41049cba4095fde42e87628091e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 boot/grub2/grub2.mk | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index aa66e48790..5de2afcc32 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -15,17 +15,6 @@ HOST_GRUB2_DEPENDENCIES = host-bison host-flex host-gawk \
 	$(BR2_PYTHON3_HOST_DEPENDENCY)
 GRUB2_INSTALL_IMAGES = YES
 
-# CVE-2019-14865 is about a flaw in the grub2-set-bootflag tool, which
-# doesn't exist upstream, but is added by the Redhat/Fedora
-# packaging. Not applicable to Buildroot.
-GRUB2_IGNORE_CVES += CVE-2019-14865
-# vulnerability is specific to the Redhat distribution, affects a
-# downstream change from Redhat related to password authentication
-GRUB2_IGNORE_CVES += CVE-2023-4001
-# vulnerability is specific to the Redhat distribution, affects the
-# grub2-set-bootflag tool, which doesn't exist upstream
-GRUB2_IGNORE_CVES += CVE-2024-1048
-
 # 0004-fs-hfs-Fix-stack-OOB-write-with-grub_strcpy.patch (yes, two
 # CVEs are fixed by this patch)
 GRUB2_IGNORE_CVES += CVE-2024-45782
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
