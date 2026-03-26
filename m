Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D96610ED64F
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 10:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75180416B6;
	Fri, 27 Mar 2026 10:01:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d3i5KH5i9F4F; Fri, 27 Mar 2026 10:01:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B44B416C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605711;
	bh=a+BvnmhBQ/r9u/pciXZNAXAx4kPh3x9Etk7VZr1EA/4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lDw0z0C8ldwlJYi0MQ1lQV1+BXpPhETuF5IV7IuvSKIFqHpoD1QjKyedlzdaBisbV
	 W4/df1f8ZkUwIBVdnKLZo+uxig/YmbHwFTJ9I10KyPIMIWt7u63sQItdCsGn55lJGA
	 yD63lnYbFYowv2L5l0qrj4kqXux5adQNuLAfGQMkzJgQGqYnIFZx093wnwwcmkrax2
	 NGkmgiasEbEXNqCwfywxbBriRDbcfH6gj/zUlH7WMOh7DBUuzEyXRVOt2Ifkt71uwb
	 lvE+MMe6dAUg9RDFjP3RmAjCJqgIhausY7Cl0c+WJ78IHsIu6DnRKit0XvQtwE+WKj
	 fCT67MFYIHApw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B44B416C2;
	Fri, 27 Mar 2026 10:01:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 612E8353
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1A1C405EB
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fgkNskL-8kPc for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 10:01:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0783340BD7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0783340BD7
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A9377FBBE; Fri, 27 Mar 2026 10:01:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Mar 2026 17:07:43 +0100
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 2294bcbc275794b2ff848bd83cfcbb285cd33e8f
X-Git-Newrev: 6980799e92d2ab8ffbb780f90834f06d1c3c8f93
X-Patchwork-Hint: ignore
Message-Id: <20260327100141.5A9377FBBE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x]
 support/scripts/generate-cyclonedx: add source attribute to CVEs
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6980799e92d2ab8ffbb780f90834f06d1c3c8f93
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
(cherry picked from commit 3a5e70d1d123d8fd0f1843de47fc1cd7a66ae445)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
