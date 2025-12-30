Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF01E95A74
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 10:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FE2560B3F;
	Tue, 30 Dec 2025 10:57:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4xeCzWux2Fle; Tue, 30 Dec 2025 10:57:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31BFE60B15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767092261;
	bh=+YhjPjobEic5GOYrcOcm2Hy1/Ci0Sw4HN1E9/Kbidjg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CVgDGschaeGCQYMWRSigrmtBnSSk3VvRAd5xpFLSprHhjM3J+7VZDnL12Lm/4ioW8
	 rJ3CecIsvaO75C+Wfuh9b9SRbQjO/T7bcUr/ntWbBmQY3cD/nV8sqe1fVg6+IndFZX
	 HG6JSe+SKoe0Rb35nt5pazThIMZV+hF/aZyWb4gBekvT8nX2+yMxGHeCsvxnAvRhic
	 hK6K3ws82AWNh8oJA4RXDmDa8tzgsB5YScwRp2HocVI1NioLxlqT8CQ4QbboktLYfM
	 0YYxGE8k0Mi37EYOPdDlH7TaxhlPemqcU/ifWSQMiNQUc8yai7Gvq36UwNtX81u77d
	 IQYrKJ7J0ILQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31BFE60B15;
	Tue, 30 Dec 2025 10:57:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 19921372
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0045E40360
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:57:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9mo5kC0WzgRF for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 10:57:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 255A540363
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 255A540363
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:57:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 16FFD87BD1; Tue, 30 Dec 2025 10:57:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 11:54:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b155395a52e50327db98e9bcfc62410e5eb109cd
X-Git-Newrev: 2a2184f317faa41049cba4095fde42e87628091e
X-Patchwork-Hint: ignore
Message-Id: <20251230105735.16FFD87BD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/grub2: remove stale IGNORE_CVES
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a2184f317faa41049cba4095fde42e87628091e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 boot/grub2/grub2.mk | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index f543c53cd8..fdf274d9aa 100644
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
