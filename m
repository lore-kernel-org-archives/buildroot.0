Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46CEC5DF95
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DC59811E9;
	Fri, 21 Aug 2026 15:07:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2lD8U1ZXgW55; Fri, 21 Aug 2026 15:07:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787324840;
	bh=pwuBmw8Gp/Yrh6HesYHq2Xaq+HhgjTKbGVo/up7Vqpw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SP6J1S3XHUphotkYicSbEQLGuoZP+eFekNS8fxkCNq7QHdZL3vORGt2a9kUMZSmKl
	 emWtIV1+zP76VLsUQLpa7eEoxpz1MbdamHucTeFMrSgdDGVobtfDHOoTgCyyG6CWjr
	 kvVXlafX0AtiCU3tBRuUBljjcFOaOqWAAZNOckspVIIE8/PC2tSkV9kKPUKWTWgv6G
	 3PgQzstdtHN4hLPtBaMQ0zq9cqQe42g+zeT1hSTtKID9gUYTurq/FRLMebspt3dHZc
	 cjau5GxbSCGrlbBeRNvaS86rnRbyYFlVkRKtk/U3JLxiou1AXdyB5DCvWRWnkcpXL7
	 md/ycM30Qj5nQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25BA2811FC;
	Fri, 21 Aug 2026 15:07:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D7182EA3
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8F6140BD1
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BFeF-Y8Nnlpr for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:07:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57FEB40A15
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BFE818E183; Fri, 21 Aug 2026 15:06:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 17:03:36 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8487fd20f10e48d92b5c2bbab153dfe45804b0f7
X-Git-Newrev: a0ac9811437eb947ae252e3145904fb8f09e546a
X-Patchwork-Hint: ignore
Message-Id: <20260821150613.BFE818E183@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/busybox:
 re-introduce IGNORE_CVES for CVE-2023-42366
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a0ac9811437eb947ae252e3145904fb8f09e546a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The patch `0008-awk.c-fix-CVE-2023-42366-bug-15874.patch` was introduced
in [1]. The IGNORE_CVES entry was removed while the patch is still
present in [2].

Re-introduce this IGNORE_CVES entry.

[1] 75c594d446 package/busybox: fix pending CVEs
[2] f88537c46b package/busybox: drop stale IGNORE_CVES entries

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
(alternative to commit 092abbe0352d62af8c17167e4f48e76aeea7ce99)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/busybox/busybox.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 6c0f945e01..092fd5d1e1 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -15,6 +15,10 @@ BUSYBOX_CPE_ID_VENDOR = busybox
 # 0004-nslookup-sanitize-all-printed-strings-with-printable.patch
 BUSYBOX_IGNORE_CVES += CVE-2022-28391
 
+# This is not stale just wrong NVD entry.
+# 0008-awk.c-fix-CVE-2023-42366-bug-15874.patch
+BUSYBOX_IGNORE_CVES += CVE-2023-42366
+
 # 0012-archival-libarchive-sanitize-filenames-on-output.patch
 # 0013-testsuite-tar-tests-fix-test-after-cve-2025-46394.patch
 BUSYBOX_IGNORE_CVES += CVE-2025-46394
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
