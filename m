Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C005CC43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 17:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E32F84BE7;
	Sat, 23 Jul 2022 17:47:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E32F84BE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HqMeiPcL7OIe; Sat, 23 Jul 2022 17:47:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FF1084BB2;
	Sat, 23 Jul 2022 17:47:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FF1084BB2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B3C811BF5DE
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8604140515
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:47:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8604140515
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j7CDK3T6J6aV for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 17:47:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA6B74049F
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 17:47:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA6B74049F
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6B3D381434; Sat, 23 Jul 2022 17:33:51 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 19:47:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1e88048fab32990cc0d493f1b48af01e337c257d
X-Git-Newrev: bf178754efbb8cc32f2aacc94327d34484e1d738
X-Patchwork-Hint: ignore
Message-Id: <20220723173351.6B3D381434@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: fix flake8
 errors
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf178754efbb8cc32f2aacc94327d34484e1d738
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit f1bcb2a45c4ba42d8dea3ba7c3413cb1d0fcab93 introduced a number of
flake8 errors. Fix these by:
- adding noqa to the multi-line string containing tabs;
- replacing other tabs with spaces;
- removing space after opening parenthesis;
- splitting the long lines.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/scripts/pkg-stats | 61 ++++++++++++++++++++++++++++-------------------
 1 file changed, 37 insertions(+), 24 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 6dc206d2bc..a4bb5ae599 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -828,7 +828,7 @@ function sortGrid(sortLabel){
 <a href=\"#results\">Results</a><br/>
 
 <p id=\"sortable_hint\"></p>
-"""
+"""  # noqa - tabs and spaces
 
 
 html_footer = """
@@ -865,8 +865,8 @@ def boolean_str(b):
 
 
 def dump_html_pkg(f, pkg):
-    f.write( f'<div id=\"package_{pkg.name}\" \
-	class=\"package data {pkg.name}\">{pkg.path}</div>\n')
+    f.write(f'<div id=\"package_{pkg.name}\" \
+        class=\"package data {pkg.name}\">{pkg.path}</div>\n')
     # Patch count
     data_field_id = f'patch_count_{pkg.name}'
     div_class = ["centered patch_count data"]
@@ -877,8 +877,8 @@ def dump_html_pkg(f, pkg):
         div_class.append("somepatches")
     else:
         div_class.append("lotsofpatches")
-    f.write( f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
-	\">{str(pkg.patch_count)}</div>\n')
+    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
+        \">{str(pkg.patch_count)}</div>\n')
 
     # Infrastructure
     data_field_id = f'infrastructure_{pkg.name}'
@@ -889,8 +889,8 @@ def dump_html_pkg(f, pkg):
         div_class.append("wrong")
     else:
         div_class.append("correct")
-    f.write( f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
-	\">{infra_str(pkg.infras)}</div>\n')
+    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
+        \">{infra_str(pkg.infras)}</div>\n')
 
     # License
     data_field_id = f'license_{pkg.name}'
@@ -901,7 +901,7 @@ def dump_html_pkg(f, pkg):
     else:
         div_class.append("wrong")
     f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
-	\">{boolean_str(pkg.is_status_ok("license"))}</div>\n')
+        \">{boolean_str(pkg.is_status_ok("license"))}</div>\n')
 
     # License files
     data_field_id = f'license_files_{pkg.name}'
@@ -912,7 +912,7 @@ def dump_html_pkg(f, pkg):
     else:
         div_class.append("wrong")
     f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
-	\">{boolean_str(pkg.is_status_ok("license-files"))}</div>\n')
+        \">{boolean_str(pkg.is_status_ok("license-files"))}</div>\n')
 
     # Hash
     data_field_id = f'hash_file_{pkg.name}'
@@ -923,7 +923,7 @@ def dump_html_pkg(f, pkg):
     else:
         div_class.append("wrong")
     f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
-	\">{boolean_str(pkg.is_status_ok("hash"))}</div>\n')
+        \">{boolean_str(pkg.is_status_ok("hash"))}</div>\n')
 
     # Current version
     data_field_id = f'current_version_{pkg.name}'
@@ -932,7 +932,7 @@ def dump_html_pkg(f, pkg):
     else:
         current_version = pkg.current_version
     f.write(f'  <div id=\"{data_field_id}\" \
-	class=\"centered current_version data {pkg.name}\">{current_version}</div>\n')
+        class=\"centered current_version data {pkg.name}\">{current_version}</div>\n')
 
     # Latest version
     data_field_id = f'latest_version_{pkg.name}'
@@ -1059,19 +1059,32 @@ def dump_html_pkg(f, pkg):
 def dump_html_all_pkgs(f, packages):
     f.write("""
 <div id=\"package-grid\">
-<div style="grid-column: 1;" onclick="sortGrid(this.id)" id=\"package\" class=\"package data label\"><span>Package</span><span></span></div>
-<div style="grid-column: 2;" onclick="sortGrid(this.id)" id=\"patch_count\" class=\"centered patch_count data label\"><span>Patch count</span><span></span></div>
-<div style="grid-column: 3;" onclick="sortGrid(this.id)" id=\"infrastructure\" class=\"centered infrastructure data label\">Infrastructure<span></span></div>
-<div style="grid-column: 4;" onclick="sortGrid(this.id)" id=\"license\" class=\"centered license data label\"><span>License</span><span></span></div>
-<div style="grid-column: 5;" onclick="sortGrid(this.id)" id=\"license_files\" class=\"centered license_files data label\"><span>License files</span><span></span></div>
-<div style="grid-column: 6;" onclick="sortGrid(this.id)" id=\"hash_file\" class=\"centered hash_file data label\"><span>Hash file</span><span></span></div>
-<div style="grid-column: 7;" onclick="sortGrid(this.id)" id=\"current_version\" class=\"centered current_version data label\"><span>Current version</span><span></span></div>
-<div style="grid-column: 8;" onclick="sortGrid(this.id)" id=\"latest_version\" class=\"centered latest_version data label\"><span>Latest version</span><span></span></div>
-<div style="grid-column: 9;" onclick="sortGrid(this.id)" id=\"warnings\" class=\"centered warnings data label\"><span>Warnings</span><span></span></div>
-<div style="grid-column: 10;" onclick="sortGrid(this.id)" id=\"upstream_url\" class=\"centered upstream_url data label\"><span>Upstream URL</span><span></span></div>
-<div style="grid-column: 11;" onclick="sortGrid(this.id)" id=\"cves\" class=\"centered cves data label\"><span>CVEs</span><span></span></div>
-<div style="grid-column: 12;" onclick="sortGrid(this.id)" id=\"ignored_cves\" class=\"centered ignored_cves data label\"><span>CVEs Ignored</span><span></span></div>
-<div style="grid-column: 13;" onclick="sortGrid(this.id)" id=\"cpe_id\" class=\"centered cpe_id data label\"><span>CPE ID</span><span></span></div>
+<div style="grid-column: 1;" onclick="sortGrid(this.id)" id=\"package\"
+     class=\"package data label\"><span>Package</span><span></span></div>
+<div style="grid-column: 2;" onclick="sortGrid(this.id)" id=\"patch_count\"
+     class=\"centered patch_count data label\"><span>Patch count</span><span></span></div>
+<div style="grid-column: 3;" onclick="sortGrid(this.id)" id=\"infrastructure\"
+     class=\"centered infrastructure data label\">Infrastructure<span></span></div>
+<div style="grid-column: 4;" onclick="sortGrid(this.id)" id=\"license\"
+     class=\"centered license data label\"><span>License</span><span></span></div>
+<div style="grid-column: 5;" onclick="sortGrid(this.id)" id=\"license_files\"
+     class=\"centered license_files data label\"><span>License files</span><span></span></div>
+<div style="grid-column: 6;" onclick="sortGrid(this.id)" id=\"hash_file\"
+     class=\"centered hash_file data label\"><span>Hash file</span><span></span></div>
+<div style="grid-column: 7;" onclick="sortGrid(this.id)" id=\"current_version\"
+     class=\"centered current_version data label\"><span>Current version</span><span></span></div>
+<div style="grid-column: 8;" onclick="sortGrid(this.id)" id=\"latest_version\"
+     class=\"centered latest_version data label\"><span>Latest version</span><span></span></div>
+<div style="grid-column: 9;" onclick="sortGrid(this.id)" id=\"warnings\"
+     class=\"centered warnings data label\"><span>Warnings</span><span></span></div>
+<div style="grid-column: 10;" onclick="sortGrid(this.id)" id=\"upstream_url\"
+     class=\"centered upstream_url data label\"><span>Upstream URL</span><span></span></div>
+<div style="grid-column: 11;" onclick="sortGrid(this.id)" id=\"cves\"
+     class=\"centered cves data label\"><span>CVEs</span><span></span></div>
+<div style="grid-column: 12;" onclick="sortGrid(this.id)" id=\"ignored_cves\"
+     class=\"centered ignored_cves data label\"><span>CVEs Ignored</span><span></span></div>
+<div style="grid-column: 13;" onclick="sortGrid(this.id)" id=\"cpe_id\"
+     class=\"centered cpe_id data label\"><span>CPE ID</span><span></span></div>
 """)
     for pkg in sorted(packages):
         dump_html_pkg(f, pkg)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
