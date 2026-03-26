Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1912E10ED64F
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 10:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6F78416A3;
	Fri, 27 Mar 2026 10:01:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tJvOZTSNayjj; Fri, 27 Mar 2026 10:01:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D8FB4167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605704;
	bh=gQcjBq+IL8bW6qDjHVEBWdtknDPmmLdF8mrdn98ddXA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kHdek+6B6mFxerv1bhX7RzNDA+uplh1z2yDMryUPPaFfkVEdTZ2EMZjGSJv6EByGh
	 3CkIWgIDvvdzu109iTylXrWNe1boyN2LWSSuVgb932F1gNMSWmJ+NMe2NjjZeMKmzc
	 YYDLsGh1fJWgoeLa+U1WWPkREOIo3dGZbT3j5+DYvkwfVgGCPcZBYmf5NDy1qTNjas
	 PY/hPST6U13m4KLbmpcmioPPg0Xkc34pS6Pft6vZg41AOplLKT/m7n5EGF7lb6ZFOb
	 uiKu+LAwJvjyNUMK3TeFtyLjZvIilc+kS62ctSxluU8geaI4uwzAIxoUxH0iYUO5y8
	 qiM7aU5s4210w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D8FB4167D;
	Fri, 27 Mar 2026 10:01:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AFE68249
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE186416A2
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l7xaBJqF8ah1 for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 10:01:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 092B8415D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 092B8415D1
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 502767FBBB; Fri, 27 Mar 2026 10:01:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Mar 2026 17:07:41 +0100
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: a533d160c02f4c617ed947f0218a03661832e601
X-Git-Newrev: 2294bcbc275794b2ff848bd83cfcbb285cd33e8f
X-Patchwork-Hint: ignore
Message-Id: <20260327100141.502767FBBB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] cve-check: fix CVE URL
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2294bcbc275794b2ff848bd83cfcbb285cd33e8f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
