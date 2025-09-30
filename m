Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CCFCCA471
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 20:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38D3D4148A;
	Wed,  1 Oct 2025 20:53:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kNU6OTYKu8f1; Wed,  1 Oct 2025 20:53:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54F3D4148B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54F3D4148B;
	Wed,  1 Oct 2025 20:53:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 01112CC0
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EB3141439
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:52:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S1PVTzdS3Bmq for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 20:52:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 205EE4145C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 205EE4145C
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:52:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E4E1866F1; Wed,  1 Oct 2025 20:52:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 11:12:32 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 3067d64f9e2b2ee51c3500dc37ffcb410ce1d2e7
X-Git-Newrev: 4ed2fe7ecf90b787e26eea73c999beb67a0ae7d0
X-Patchwork-Hint: ignore
Message-Id: <20251001205233.1E4E1866F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/tiff: ignore
 CVE-2025-8851
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

commit: https://git.buildroot.net/buildroot/commit/?id=4ed2fe7ecf90b787e26eea73c999beb67a0ae7d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

The CVE-2025-8851 [1] has been fixed in upstream commit [2] that is part
of the v4.7.0 release.

Because the NVD reference includes the version '<2024-08-11' most of CVE
checker will fail to compare it against 4.7.0 and report it as a
positive.

[1] https://nvd.nist.gov//vuln/detail/CVE-2025-8851
[2] https://gitlab.com/libtiff/libtiff/-/commit/8a7a48d7a645992ca83062b3a1873c951661e2b3

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 740412aefc57770cd5be71012c19eec8bc576637)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/tiff/tiff.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 3d426fad4d..dd23c2bd43 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -19,6 +19,9 @@ TIFF_IGNORE_CVES += CVE-2025-8176
 # 0004-fix-for-thumbnail-issue.patch
 TIFF_IGNORE_CVES += CVE-2025-8177
 
+# Fixed in 4.7.0
+TIFF_IGNORE_CVES += CVE-2025-8851
+
 # webp has a (optional) dependency on tiff, so we can't have webp
 # support in tiff, or that would create a circular dependency.
 TIFF_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
