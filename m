Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71F8FF6E6B
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 21:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B80FD606C9;
	Tue, 17 Mar 2026 21:16:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WLHFfRKd_Qza; Tue, 17 Mar 2026 21:16:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEA97606DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773782214;
	bh=Pr9kfPdt2ahmqwLcMqMHIt4kNRgzYdErJrBm3JzwWxc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Xyaz4BoM9Rd5cRT3/kv+Zf9+cWXA0LVHYf2oIQPoRZS/STZlaL1xBAQfSQpdyTjpQ
	 nbCHjDv6yujeP1Z406mSPZQjCOI2T/Z60Mwevb090sAnkPrGknLedHYYYMl1+A5rY9
	 NO54tI1u0O7h/DRqGjiujGpOU12OLjgE3CrWvhFpQB2+PJJR5BqcY5Rs4pOyIcW9hr
	 RvE/QIO6ihfExj8pLr/MVK7aF6ITGjdIYySwW+rnwczk0vdrjDEoWgF0zl7YIcGxCK
	 Pk6dbaDgqY8rS4OR6+w+8cEBpmjwGIavedYpqmyVHgk/2gvEPeFqBGaJRiiuG9yXli
	 yI3gQbs4niUVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEA97606DA;
	Tue, 17 Mar 2026 21:16:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D9CC41B6
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 21:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFD414094C
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 21:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id farG1by0JzOL for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 21:16:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E181E40875
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E181E40875
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 21:16:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0449D836BE; Tue, 17 Mar 2026 21:16:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 17 Mar 2026 22:13:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ac466d4b1a0584fec0274085d2be4e2356f552b8
X-Git-Newrev: 3a5e70d1d123d8fd0f1843de47fc1cd7a66ae445
X-Patchwork-Hint: ignore
Message-Id: <20260317211651.0449D836BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/generate-cyclonedx: add
 source attribute to CVEs
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3a5e70d1d123d8fd0f1843de47fc1cd7a66ae445
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add 'source' attribute to each CVE in vulnerabilities node, including NVD
URL reference to enable proper import into Dependency-Track.

Dependency-Track's VEX importer requires the source attribute to
properly process vulnerability entries. Without it, vulnerabilities are
skipped during import with "does not have an ID and / or source" warnings.

Include the full NVD URL following the CycloneDX 1.6 documentation format:
https://nvd.nist.gov/vuln/detail/{CVE-ID}

Test Environment:
- Buildroot: 2025.02.11 (or master)
- Dependency-Track: v4.13.6

Test Results - BEFORE (without source attribute):
apiserver_1  | 2026-02-23 16:05:40,890 INFO [VexUploadProcessingTask] Processing CycloneDX VEX uploaded to project: e43fe185-c0a3-4e3a-a908-667344a66a9c
apiserver_1  | 2026-02-23 16:05:40,941 WARN [CycloneDXVexImporter] VEX vulnerability at position #0 does not have an ID and / or source; Skipping it
apiserver_1  | 2026-02-23 16:05:40,941 WARN [CycloneDXVexImporter] VEX vulnerability at position #1 does not have an ID and / or source; Skipping it
...
apiserver_1  | 2026-02-23 16:05:40,941 WARN [CycloneDXVexImporter] VEX vulnerability at position #19 does not have an ID and / or source; Skipping it
apiserver_1  | 2026-02-23 16:05:40,941 INFO [CycloneDXVexImporter] The uploaded VEX does not contain any applicable vulnerabilities; Skipping VEX import

Test Results - AFTER (with source):
apiserver_1  | 2026-02-23 16:17:13,492 INFO [VexUploadProcessingTask] Processing CycloneDX VEX uploaded to project: e43fe185-c0a3-4e3a-a908-667344a66a9c
apiserver_1  | 2026-02-23 16:17:14,054 INFO [VexUploadProcessingTask] Completed processing of CycloneDX VEX for project: e43fe185-c0a3-4e3a-a908-667344a66a9c

CVEs are correctly imported in Dependency-Track

Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Acked-By: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 utils/generate-cyclonedx | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 2b6c6d63d3..35198a47cf 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -327,6 +327,10 @@ def cyclonedx_vulnerabilities(show_info_dict):
 
     return [{
         "id": cve,
+        "source": {
+            "name": "NVD",
+            "url": "https://nvd.nist.gov/vuln/detail/" + cve
+        },
         "analysis": {
             "state": "resolved_with_pedigree" if cve in VULN_WITH_PEDIGREE else "in_triage",
             "detail": f"The CVE '{cve}' has been marked as ignored by Buildroot"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
