Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F88CD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58C63410AE;
	Fri,  5 Jun 2026 12:39:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fD4XO_24ODpn; Fri,  5 Jun 2026 12:39:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 527BF4112F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663164;
	bh=3BlpUWIEklANbYGpxT5+qfBTX0DH3rT1WHmv7ikAh3E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=l0cvca60cDvbuhRLGj0pwShLVB+9rCKOUBqC+okAj5z4CglbORqby39m5WUIFzjhE
	 TRjkeTbSlf5bazODIm1AhT6HF76zO/pwfcBDW2sibYaW3trhVC588nqrZkZxrkT4r2
	 I/vjIbVhOqjROinkOVLkuhjAxZeeFgX3564BGfI7anTXVDwQhsAwqYLiGD+XF6t6Xf
	 wGtoQrfTreI7eGugAFgNqH7AyCpqRY9aUJA4ybkJJeT5IeOUC3JYwtAz6YVW/NHFUT
	 fdWqQMgqK1BzkXMpIaP5kykD4mOrao1KKWI+WCGwAqaRZjWPfzF1+fPqW57ZjMpx6W
	 9Ku204mt4Iciw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 527BF4112F;
	Fri,  5 Jun 2026 12:39:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 02FF8F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5719A41032
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZVedBfIzWk_j for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D831140FB3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D831140FB3
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E74387B22; Fri,  5 Jun 2026 12:38:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:03:26 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: ee0ee0b33e906391a5bc6462548c0ddf7f043f84
X-Git-Newrev: df418f0675f9da16fc5f88377be2084465813b2a
X-Patchwork-Hint: ignore
Message-Id: <20260605123835.0E74387B22@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x]
 support/scripts/cve-check: fix vulnerability timestamp to RFC 3339
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/df418f0675f9da16fc5f88377be2084465813b2a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Normalize vulnerability timestamps to RFC 3339 format with explicit UTC
timezone suffix for CycloneDX 1.6 compliance.
This fixes validation errors in sbom-utility and makes the generated
SBOM with vulnerabilities compatible with DependencyTrack VEX parsers.

The NVD JSON data feeds provide timestamps in ISO 8601 format without timezone
information (e.g., "1999-01-01T05:00:00.000"), but CycloneDX 1.6 requires
RFC 3339 format with explicit timezone designation (e.g.,
"1999-01-01T05:00:00.000Z").

Add nvd_datetime_to_rfc3339() helper function to convert timestamps before
serialization.

Validation results:

Before fix:
  $ sbom-utility validate -i cve/cve_report_current.json
  [INFO] BOM valid against JSON schema: 'false'
  [INFO] (234) schema errors detected.

  Error example:
  {
    "type": "format",
    "field": "vulnerabilities.0.updated",
    "context": "(root).vulnerabilities.0.updated",
    "description": "Does not match format 'date-time'",
    "value": "2025-04-03T01:03:51.193"
  }

After fix:
  $ sbom-utility validate -i cve/cve_report_update.json
  [INFO] BOM valid against JSON schema: 'true'

Tested-with: sbom-utility v0.18.1
Co-authored-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e46783d3a0f56c93c2ad28236162ff4b05c134df)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/scripts/cve-check | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/support/scripts/cve-check b/support/scripts/cve-check
index bcd970bad8..5047523ade 100755
--- a/support/scripts/cve-check
+++ b/support/scripts/cve-check
@@ -12,10 +12,10 @@
 from collections import defaultdict
 from pathlib import Path
 from typing import TypedDict
+from datetime import datetime, timezone
 import argparse
 import sys
 import json
-
 import cve as cvecheck
 
 
@@ -35,6 +35,24 @@ locally.
 brpath = Path(__file__).parent.parent.parent
 
 
+def datetime_to_rfc3339(dt_string):
+    """Normalize datetime string to RFC 3339 format with Z suffix.
+
+    NVD dates are already in ISO format, just need to add the Z suffix.
+
+    Input:  "1999-01-01T05:00:00.000"
+    Output: "1999-01-01T05:00:00.000Z"
+    """
+    dt = datetime.fromisoformat(dt_string.replace('Z', '+00:00'))
+
+    if dt.tzinfo is None:
+        dt = dt.replace(tzinfo=timezone.utc)
+    else:
+        dt = dt.astimezone(timezone.utc)
+
+    return dt.isoformat().replace('+00:00', 'Z')
+
+
 def cve_api_get_lang_from_list(values, lang="en") -> (str | None):
     for x in values:
         if x.get("lang") == lang:
@@ -134,10 +152,10 @@ def nvd_cve_to_cdx_vulnerability(nvd_cve):
             "url": f"https://nvd.nist.gov/vuln/detail/{nvd_cve['id']}"
         },
         **({
-            "published": nvd_cve["published"],
+            "published": datetime_to_rfc3339(nvd_cve["published"]),
         } if "published" in nvd_cve else {}),
         **({
-            "updated": nvd_cve["lastModified"],
+            "updated": datetime_to_rfc3339(nvd_cve["lastModified"]),
         } if "lastModified" in nvd_cve else {}),
         **({
             "cwes": nvd_cve_weaknesses_to_cdx(nvd_cve["weaknesses"]),
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
