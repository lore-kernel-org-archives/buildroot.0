Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D892BCD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B097D410E7;
	Fri,  5 Jun 2026 12:40:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9MxwYait0ep8; Fri,  5 Jun 2026 12:40:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD786412A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663216;
	bh=Na+AKVmQ4MgKCHi4i7wNHSG5nusPL/NR2dP4HyeFtTM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IvA4Yg4YN+QI1erORZgNV/yr0ZDXsm6qjt6l7FGLupyDYqao4UtxnUXl6hA1+YVBB
	 TaW8jE/mQPaDYvxs+Mc3aF9xZA4yjUH4a9D8fvLt3wpkDFv3yLNLgiIvHeWb30Yi6u
	 rxD4Pb440vzFFPUndFBKhVssMe9n7d6g2tfWHOOiB0RbtpN+47zaK9ZAJtfcebv0C5
	 q33E21vN5z1oFpV9Yva9o5NA7HMOBra71MRaKEcfGcCeJlipqzFirQus0N0fDu8LBL
	 +IDn2vGYghDZI5gknaxh2bnx1D7/y2nzicR5chqbIUAC41xh9eom3NtMrmyKT7+ioA
	 wbGw6QuSoki+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD786412A1;
	Fri,  5 Jun 2026 12:40:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F8DC3B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DDDF4106D
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0WGD1maq2-GY for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B35204104E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B35204104E
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC3D387B2F; Fri,  5 Jun 2026 12:38:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:53:42 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: ed8b0b51c803d25cbb8045e4dfc69af77f72f5e3
X-Git-Newrev: c4a08102a4f3edf01cc56bc012f05c5194dd10ef
X-Patchwork-Hint: ignore
Message-Id: <20260605123836.DC3D387B2F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libgit2: add CPE
 vendor
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c4a08102a4f3edf01cc56bc012f05c5194dd10ef
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

The CPE "cpe:2.3:a:libgit2:libgit2:*:*:*:*:*:*:*:*" is valid for this
package.

The previous CPE hasn't been used since 2016 while the new one has 10
new CVEs assigned to it.

See the GHSA [1] and the associated CVE [2].

[1] https://github.com/libgit2/libgit2/security/advisories/GHSA-j2v7-4f6v-gpg8
[2] https://nvd.nist.gov/vuln/detail/cve-2024-24577

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e166708e1e686491d5555578380a2923e21f6c28)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libgit2/libgit2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 34cb67929e..02af500a65 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -15,7 +15,7 @@ LIBGIT2_LICENSE = \
 	BSD-2-Clause (basename_r), \
 	LGPL-2.1+ (libxdiff)
 LIBGIT2_LICENSE_FILES = COPYING
-LIBGIT2_CPE_ID_VALID = YES
+LIBGIT2_CPE_ID_VENDOR = libgit2
 LIBGIT2_INSTALL_STAGING = YES
 
 LIBGIT2_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
