Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B70CAC5B8
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 19:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B44114184F;
	Fri, 26 Sep 2025 19:36:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IlRHWnJzJoMi; Fri, 26 Sep 2025 19:36:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ADE341686
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8ADE341686;
	Fri, 26 Sep 2025 19:36:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A2AA12D
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 19:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C30140723
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 19:36:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QrAcq4MWsUfX for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 19:36:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FDF440717
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FDF440717
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 19:36:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4DBDE86502; Fri, 26 Sep 2025 19:36:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Sep 2025 21:16:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93977c592d6e6a817ac61c9d063b775d31c47409
X-Git-Newrev: 740412aefc57770cd5be71012c19eec8bc576637
X-Patchwork-Hint: ignore
Message-Id: <20250926193633.4DBDE86502@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tiff: ignore CVE-2025-8851
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

commit: https://git.buildroot.net/buildroot/commit/?id=740412aefc57770cd5be71012c19eec8bc576637
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The CVE-2025-8851 [1] has been fixed in upstream commit [2] that is part
of the v4.7.0 release.

Because the NVD reference includes the version '<2024-08-11' most of CVE
checker will fail to compare it against 4.7.0 and report it as a
positive.

[1] https://nvd.nist.gov//vuln/detail/CVE-2025-8851
[2] https://gitlab.com/libtiff/libtiff/-/commit/8a7a48d7a645992ca83062b3a1873c951661e2b3

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
