Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062E3EF99FF
	for <buildroot@archiver.kernel.org>; Sat, 14 Feb 2026 11:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B43F140AFB;
	Sat, 14 Feb 2026 11:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cmUSXV_bjzHs; Sat, 14 Feb 2026 11:47:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4C4840AE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771069664;
	bh=9fWGL9rcAuc1v3XJuGVsGzUtvT0mwKs7eWo3qUJx+Go=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=m20DPlqkweTjYpQbjcpRMNFX1FOuDvKtCw82H40VlxABji/tVvwziqQfH8Vu11quK
	 9slvL9mf5j8LsfRfKLZjDmfvJ0eYhvaMpsxn/oZobUQ6/UD/834mphVDgQJUTLNlA9
	 UgMJlMSUb300mlhtC+pSf1VDmm7+l1xHy0oRCxRPyvx4YVy67g2luSemC28INrXy/j
	 qQsTYky4HtfbL4mocXMxLQKPgiR7dueoj5bVG7Tb4f7Pl9zdDcougNXOVtcWTxjx8W
	 U68/saH5tGaSFjV5BEHd+xIxp2SAic6Yoo/nTFUpVGpL3HzrDp7HFRa3YieObVfiSs
	 HyQJWYFt1zfyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4C4840AE5;
	Sat, 14 Feb 2026 11:47:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6576E69
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 11:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AFC8403CC
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 11:47:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cZaAfHtO1Ydd for <buildroot@buildroot.org>;
 Sat, 14 Feb 2026 11:47:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87AB9403CB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87AB9403CB
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 11:47:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 64F7586D2E; Sat, 14 Feb 2026 11:47:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Feb 2026 12:43:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c01c53f5e8ea212c826e9c276d69a900dfbbbace
X-Git-Newrev: 42a63f9eae72d4898ddfbad7a9dd320f548a409c
X-Patchwork-Hint: ignore
Message-Id: <20260214114741.64F7586D2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/frr: update CPE
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/42a63f9eae72d4898ddfbad7a9dd320f548a409c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The CPE `linuxfoundation:free_range_routing` introduced in commit [1]
has a single CVE associated to it [2].

By looking at the Debian Security tracker for this package [3], the CVE
associated are using the `frrouting:frrouting` CPE.

This commit update the CPE accordingly.

[1] c4c11c2e1a package/frr: add CPE variables
[2] https://nvd.nist.gov/vuln/detail/cve-2020-12831
[3] https://security-tracker.debian.org/tracker/source-package/frr

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/frr/frr.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index 4886837245..04282442fb 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -20,8 +20,8 @@ FRR_LICENSE_FILES = \
 # tools/gcc-plugins/frr-format.[ch] is not enabled by frr's ./configure, so gcc's
 # GPLv3 does not apply
 #	doc/licenses/GPL-3.0
-FRR_CPE_ID_VENDOR = linuxfoundation
-FRR_CPE_ID_PRODUCT = free_range_routing
+FRR_CPE_ID_VENDOR = frrouting
+FRR_CPE_ID_PRODUCT = frrouting
 FRR_AUTORECONF = YES
 FRR_INSTALL_STAGING = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
