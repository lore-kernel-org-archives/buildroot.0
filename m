Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCF6D3B7E7
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 21:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6F5540572;
	Sun,  7 Dec 2025 21:27:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JoI36eI9K7CX; Sun,  7 Dec 2025 21:27:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79A0F407C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765142878;
	bh=wRXzgG6bV+2pJ6oXr3ZHOQM/eJz/mJxxxxQIir18NK4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Y+V3iXya+bMNld4p0wWa07F1BLRXVqiI2auAu+vsjTQFCitCCBXZ1jv9Sia6KNE61
	 LwMYjuIggZn/JJ4TQ9t5DCs9xBPeVfsWXZnSf//5BnQwLwn/XrYxBR0H/rJV1KsbGi
	 bP/QYPMu2GGJN5kat8ChevDF7EbydMvb9pJDoA7MnonRdPCceYBqYKy9M2O7MCHx8H
	 fK/FBykcBQnt7NMDDYI0ms0zUR+kqwKRP/Rdq752sKZ6TiHKbnvqbcVbGT0WzXXQ5w
	 8vhXWjryD6LyTfaXZxzcDTC8trVVSSpLn441BS0xJHCdmgFfzotucMXL3id30xYTUR
	 oKE6hQCPYQnwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79A0F407C6;
	Sun,  7 Dec 2025 21:27:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B2682F0
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 21:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DB5440514
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 21:27:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ua_cTF1Lo0mU for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 21:27:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4A0C4040D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4A0C4040D
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 21:27:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F12A86894; Sun,  7 Dec 2025 21:27:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 21:31:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ce3e04d02aa6b8f1841b6faafa14260085fc350
X-Git-Newrev: 8b740cee42c8dd41db735021c02abc91874fc9eb
X-Patchwork-Hint: ignore
Message-Id: <20251207212751.9F12A86894@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/cve-check: fix typos and
 grammar
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8b740cee42c8dd41db735021c02abc91874fc9eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/cve-check | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/support/scripts/cve-check b/support/scripts/cve-check
index 6442b2e72c..a72547ab38 100755
--- a/support/scripts/cve-check
+++ b/support/scripts/cve-check
@@ -4,7 +4,7 @@
 # Enriches the input CycloneDX SBOM with vulnerability information from the NVD
 # database.
 #
-# The nvd database is cloned using a mirror of it and the content is compared
+# The NVD database is cloned using a mirror of it and the content is compared
 # locally.
 #
 # Example usage:
@@ -121,7 +121,7 @@ def nvd_cve_references_to_cdx(references):
 def nvd_cve_to_cdx_vulnerability(nvd_cve):
     """
     Turns the CVE object fetched from the NVD API into a CycloneDX
-    vulnerability that fit the spec (see [1]).
+    vulnerability that fits the spec (see [1]).
 
     [1] https://cyclonedx.org/docs/1.6/json/#vulnerabilities
     """
@@ -153,19 +153,19 @@ def nvd_cve_to_cdx_vulnerability(nvd_cve):
     return vulnerability
 
 
-def vuln_append_or_update_affects_if_exist(vulnerabilities, vulnerability):
+def vuln_append_or_update_affects_if_exists(vulnerabilities, vulnerability):
     """
     Append 'vulnerability' passed as argument to the 'vulnerabilities' argument
-    if an entry with the same 'id' don't exist yet.
-    If an entry already exist the input reference is added to the 'affects'
-    list of the existing vulnerability.
+    if an entry with the same 'id' doesn't exist yet.
+    If the vulnerability already exists, the input reference is added to the
+    'affects' list of the existing entry.
 
     Args:
         vulnerabilities (list): The vulnerabilities array reference retrieved
             from the input CycloneDX SBOM
         vulnerability (dict): Vulnerability to add to the 'vulnerabilities' list.
     """
-    # Search if a vulnerability with the same identifier already exist in the
+    # Search if a vulnerability with the same identifier already exists in the
     # SBOM vulnerability list.
     matching_vuln = next(
         (vuln for vuln in vulnerabilities if vuln.get("id") == vulnerability["id"]),
@@ -173,6 +173,7 @@ def vuln_append_or_update_affects_if_exist(vulnerabilities, vulnerability):
     )
 
     # bom-ref to the component is passed to the affects of the vulnerability
+    # passed as argument
     bom_ref = next((a["ref"] for a in vulnerability.get("affects", [])), None)
 
     if matching_vuln is not None:
@@ -181,7 +182,7 @@ def vuln_append_or_update_affects_if_exist(vulnerabilities, vulnerability):
             del vulnerability["affects"]
 
         if matching_vuln.get("analysis") is not None and "analysis" in vulnerability:
-            # We don't update vulnerability that already have an
+            # We don't update vulnerabilities that already have an
             # 'analysis'.
             # Buildroot ignored vulnerabilities will already have
             # an analysis and need to remain as such.
@@ -228,13 +229,13 @@ def check_package_cve_affects(cve: cvecheck.CVE, cpe_product_pkgs, sbom, opt: Op
                 "ref": comp["bom-ref"]
             }]
 
-            vuln_append_or_update_affects_if_exist(vulnerabilities, vulnerability)
+            vuln_append_or_update_affects_if_exists(vulnerabilities, vulnerability)
 
 
 def check_package_cves(nvd_path: Path, sbom, opt: Options):
     """
-    Iterate over every entries of the NDV API mirror. Each vulnerability is
-    compared to the set of component passed as argument in the 'sbom'.
+    Iterate over every entry of the NVD API mirror. Each vulnerability is
+    compared to the set of components passed as argument in the 'sbom'.
     The vulnerabilities set of that 'sbom' argument is enriched with analysis
     of vulnerabilities that match that set of components.
 
@@ -257,7 +258,7 @@ def check_package_cves(nvd_path: Path, sbom, opt: Options):
 def enrich_vulnerabilities(nvd_path: Path, sbom):
     """
     Iterate over the vulnerabilities present in the 'sbom' passed as arguments
-    and enrich the vulnerability with content from the NDV API mirror.
+    and enrich the vulnerability with content from the NVD API mirror.
 
     Args:
         nvd_path (Path): Path of the mirror of the NVD API.
@@ -274,7 +275,7 @@ def enrich_vulnerabilities(nvd_path: Path, sbom):
 
         vulnerability = nvd_cve_to_cdx_vulnerability(cve.nvd_cve)
 
-        vuln_append_or_update_affects_if_exist(vulnerabilities, vulnerability)
+        vuln_append_or_update_affects_if_exists(vulnerabilities, vulnerability)
 
 
 def main():
@@ -288,8 +289,8 @@ def main():
                         help='Path to the local NVD database',
                         type=lambda p: Path(p).expanduser().resolve())
     parser.add_argument("--enrich-only", default=False, action='store_true',
-                        help="Only update metadata to the vulnerability currently present " +
-                        "on the input CycloneDX SBOM. Don't do an analysis.")
+                        help="Only update metadata for the vulnerabilities currently present " +
+                        "in the input CycloneDX SBOM. Don't do an analysis.")
     parser.add_argument("--include-resolved", default=False, action='store_true',
                         help="Add vulnerabilities already 'resolved' that don't affect a " +
                         "component to the output CycloneDX vulnerabilities analysis.")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
