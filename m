Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD2210ED64F
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 09:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1744F6133C;
	Fri, 27 Mar 2026 09:59:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zWK4RnLZnZ6w; Fri, 27 Mar 2026 09:59:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D14446132B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605577;
	bh=tn96M1/mC3ef0mkPbwxqU0EpTamkwvR3fwZvJYRO4EI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lG6Gg06zj/obymYY5EoJE+Ow9lPfP/83diml6X9PFfwYQeXdxBDd9PN5LJoGunj7d
	 gKH51rj+SE9cLc5GVHdH4aVQDR9L+1cQD9k+9zM09ble5LWfeTArNIJpWuQTQocWiM
	 EVqF72eQhyEuhv9XhYpHGKbyzJJ7P9OIR6StsicMsIXmwhyhJswnysv1fDLUBJpZ7o
	 1FwvuNGLF0YVBRWS6/koI4xCM5haD5NHtenWqVvb6TGPu9c6UUTYxOpo1K4y22a2Nu
	 GyKB/6PnGAq4b8F3U97UIcvwqar/C4T8kSt8mWJfS0G5XGx45fDFsvOjVIYFu0XyUK
	 qNjamXWcSs2RA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D14446132B;
	Fri, 27 Mar 2026 09:59:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E048249
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B93B683D5E
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:59:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7SuSV5OaIqVY for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 09:59:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4468483D66
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4468483D66
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:59:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 984617FB6C; Fri, 27 Mar 2026 09:59:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 27 Mar 2026 10:57:27 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6f98e60eef6555aa8bfe4610085fa7db9191e93f
X-Git-Newrev: e034a325c4b678116cfa60d2e42d176086128319
X-Patchwork-Hint: ignore
Message-Id: <20260327095916.984617FB6C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e034a325c4b678116cfa60d2e42d176086128319
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
