Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D4DEFF6E82
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 21:12:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33CDF60E26;
	Tue, 17 Mar 2026 21:12:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CEdoDLIEi1Dk; Tue, 17 Mar 2026 21:12:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB1626069A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773781922;
	bh=km7xT+6TabILAqQxktqY4HcIO+nF0BZ4/SuF+yMLElE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=n0sJZtAS2Ip+KYGzM0/pILDG+sj1LQlkbIKOH7Tbsbjqo0AUPpTUm0mKDox9hZ7Ok
	 IOMNdwYhv8q/ao7AGhugcneKLqKGSB1DZcaULSavKLXHckRP+J8bTAJcZSw/WBJYbg
	 wl4KYhXTVeTNRrpf5hQ1KlYs3EFiO9fjuFlBabn0A42w7jC3/qO42xq4t1Vkqm3FD6
	 zUQP5X4kxg/5eJHAnzWWkwNuO5tOm9OowIRZ0qUub23ksD8k0Kdno9IrCm7+CJsDkp
	 +ATqt0/x1AssmWzxjx+C0UjO9QQxFFOoBIY07Hhetofi5U/Yj+XRHexv5QymeKp06O
	 WcNnYn0nFqgLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB1626069A;
	Tue, 17 Mar 2026 21:12:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BB2681B6
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 21:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACDCF83BA9
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 21:12:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GIDToggyU8Z0 for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 21:12:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D906F83B6C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D906F83B6C
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 21:12:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EF50B84685; Tue, 17 Mar 2026 21:11:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 17 Mar 2026 22:09:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4cc0e959ffa9e5c57aacaaa3d868252a21f62c99
X-Git-Newrev: ac466d4b1a0584fec0274085d2be4e2356f552b8
X-Patchwork-Hint: ignore
Message-Id: <20260317211159.EF50B84685@busybox.osuosl.org>
Subject: [Buildroot] [git commit] cve-check: fix CVE URL format
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ac466d4b1a0584fec0274085d2be4e2356f552b8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update NVD source to full URL format following CycloneDC 1.6
specification [1].

Before: "url": "https://nvd.nist.gov/"
After:  "url": "https://nvd.nist.gov/vuln/detail/CVE-XXXX"

[1] https://cyclonedx.org/docs/1.6/json/#vulnerabilities_items_source_url

Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Acked-By: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
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
