Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11D1D2F32D
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 873BA40B5F;
	Tue, 13 Jan 2026 19:40:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gt4S_VJOUrkj; Tue, 13 Jan 2026 19:40:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1B1C40B61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333248;
	bh=YjO70b5yxUMW8s4bVK2tiQWfWHPjCBx1tSnjanI0awU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sUm5TMU+bg1oi+ak0k48GRe91INfM6KPpCmD+iSpMnY6tBtHEmeAHYYV8XwaBzJXW
	 N0v0Oslr55bPOT9JCKAP5mX68+TSckh/oJ25mW+L62PDI3aTFyvxfxfHHylyHkmTvR
	 5dP0odNPULFqpHyOIhxcvKE52az+jkjwqL3/7w3E7LxwGhDDiFnPLkai8v8rhdfZep
	 Ah61yzbAePY/HkIOjSAhrv4//oTWv4mDU9vxnxWZaeoYII4V6HJ9nNvF7mHWg6U9QX
	 AFrC1zmRLgql7W7V0TczbGzNV7GbpbnUrNdErrz8C3hgUwg6edKhr09eQqrw4LNO/V
	 Tmq/B9sUHmh8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1B1C40B61;
	Tue, 13 Jan 2026 19:40:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FA352CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36F8E82AA7
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jhq4Jk0oVRG8 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D58382AA2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D58382AA2
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6ABF686E70; Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:04:05 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: af8b9d3635b102f13de58036d145be528f3444a0
X-Git-Newrev: 50dcf7107f0d8b330a435a1f9dd10f1177245cec
X-Patchwork-Hint: ignore
Message-Id: <20260113194032.6ABF686E70@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] boot/grub2: remove stale
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

commit: https://git.buildroot.net/buildroot/commit/?id=50dcf7107f0d8b330a435a1f9dd10f1177245cec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

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
