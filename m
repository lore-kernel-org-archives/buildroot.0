Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD2A10ED64F
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 09:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D63A9416B6;
	Fri, 27 Mar 2026 09:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GUpo6oNXhU8N; Fri, 27 Mar 2026 09:59:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5235416C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605576;
	bh=I+BwHR87I/HoUWr9He+8ckYb3PqtS65D8Gsx18QX/8U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jZR1hJxDJKA3m1MnjVHvmpOQObRNiki4UAmPyf7r825nYu633t0WhNdcoH1e5UCmg
	 +j0TwzOk0NQgC/ddVNZjfz/FbI4YIrGY7xp9DVgE14rZlnmAnw3C0VqrvnlTTRv2pH
	 7cCYeW6g25q5ikn+STtKiCTmfC30VF4ztqTluJR4EdlIXxduUcQIacqcqheYfECxpi
	 H9nAxPFZP5RdkOpNdXJark80f5/wCsN63CB/CWUeOrQ8bmWoiidYSlA/tlD8MwFNqk
	 yBPxx1Xf9TU/iUa7+KGZFfzio+LiQrQzx7KSPp1aaSquACPXbmBGZw/qsJLXlzcXeX
	 Q+C4EbyE37P7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5235416C6;
	Fri, 27 Mar 2026 09:59:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C9A51D3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85C8683D20
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:59:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9XUln30r00gJ for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 09:59:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4913C83D7E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4913C83D7E
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:59:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9076A7FBBB; Fri, 27 Mar 2026 09:59:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 27 Mar 2026 10:57:25 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 469311dfc52fddd48cb50219dd8ac111305498cd
X-Git-Newrev: 6f98e60eef6555aa8bfe4610085fa7db9191e93f
X-Patchwork-Hint: ignore
Message-Id: <20260327095916.9076A7FBBB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] cve-check: fix CVE URL
 format
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6f98e60eef6555aa8bfe4610085fa7db9191e93f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Update NVD source to full URL format following CycloneDC 1.6
specification [1].

Before: "url": "https://nvd.nist.gov/"
After:  "url": "https://nvd.nist.gov/vuln/detail/CVE-XXXX"

[1] https://cyclonedx.org/docs/1.6/json/#vulnerabilities_items_source_url

Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Acked-By: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit ac466d4b1a0584fec0274085d2be4e2356f552b8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/scripts/cve-check | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/cve-check b/support/scripts/cve-check
index ff14e4b238..bcd970bad8 100755
--- a/support/scripts/cve-check
+++ b/support/scripts/cve-check
@@ -131,7 +131,7 @@ def nvd_cve_to_cdx_vulnerability(nvd_cve):
         "description": cve_api_get_lang_from_list(nvd_cve.get("descriptions", [])) or "",
         "source": {
             "name": "NVD",
-            "url": "https://nvd.nist.gov/"
+            "url": f"https://nvd.nist.gov/vuln/detail/{nvd_cve['id']}"
         },
         **({
             "published": nvd_cve["published"],
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
