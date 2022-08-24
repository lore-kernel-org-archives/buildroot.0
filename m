Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E56DC6FA83
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 09:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09D7440BC2;
	Sun, 11 Sep 2022 09:11:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09D7440BC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q7Vo_cNY8gZy; Sun, 11 Sep 2022 09:11:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C292640B88;
	Sun, 11 Sep 2022 09:11:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C292640B88
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 15C031BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E38881384
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E38881384
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zjnShbsanawG for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A917B81301
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A917B81301
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9767583518; Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 24 Aug 2022 13:35:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 472b628a1450524e4e32079518067414948b5e11
X-Git-Newrev: 98a3fba9402a84d00762eeeeb7086f855d8a0d0f
X-Patchwork-Hint: ignore
Message-Id: <20220911084827.9767583518@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: remove useless
 escaping of double quotes
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=98a3fba9402a84d00762eeeeb7086f855d8a0d0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Within single-quoted f-strings, and within triple double quoted
strings, escaping all the double quotes is completely useless and
makes the code more difficult to read. Get rid of all this useless
escaping.

The renderer HTML is exactly identical before/after this commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-By: Sen Hastings <sen@phobosdpl.com>
Acked-By: Sen Hastings <sen@phobosdpl.com>
---
 support/scripts/pkg-stats | 100 +++++++++++++++++++++++-----------------------
 1 file changed, 50 insertions(+), 50 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index d32abd7225..572757b7ea 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -886,7 +886,7 @@ function expandField(fieldId){
 
 <body>
 
-<a href=\"#results\">Results</a><br/>
+<a href="#results">Results</a><br/>
 
 """  # noqa - tabs and spaces
 
@@ -920,8 +920,8 @@ def boolean_str(b):
 
 def dump_html_pkg(f, pkg):
     pkg_css_class = pkg.path.replace("/", "_")[:-3]
-    f.write(f'<div id=\"package__{pkg_css_class}\" \
-        class=\"package data _{pkg_css_class}\">{pkg.path}</div>\n')
+    f.write(f'<div id="package__{pkg_css_class}" \
+        class="package data _{pkg_css_class}">{pkg.path}</div>\n')
     # Patch count
     data_field_id = f'patch_count__{pkg_css_class}'
     div_class = ["centered patch_count data"]
@@ -932,8 +932,8 @@ def dump_html_pkg(f, pkg):
         div_class.append("somepatches")
     else:
         div_class.append("lotsofpatches")
-    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
-        \">{str(pkg.patch_count)}</div>\n')
+    f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)} \
+        ">{str(pkg.patch_count)}</div>\n')
 
     # Infrastructure
     data_field_id = f'infrastructure__{pkg_css_class}'
@@ -944,8 +944,8 @@ def dump_html_pkg(f, pkg):
         div_class.append("wrong")
     else:
         div_class.append("correct")
-    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
-        \">{infra_str(pkg.infras)}</div>\n')
+    f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)} \
+        ">{infra_str(pkg.infras)}</div>\n')
 
     # License
     data_field_id = f'license__{pkg_css_class}'
@@ -955,8 +955,8 @@ def dump_html_pkg(f, pkg):
         div_class.append("correct")
     else:
         div_class.append("wrong")
-    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
-        \">{boolean_str(pkg.is_status_ok("license"))}</div>\n')
+    f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)} \
+        ">{boolean_str(pkg.is_status_ok("license"))}</div>\n')
 
     # License files
     data_field_id = f'license_files__{pkg_css_class}'
@@ -966,8 +966,8 @@ def dump_html_pkg(f, pkg):
         div_class.append("correct")
     else:
         div_class.append("wrong")
-    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
-        \">{boolean_str(pkg.is_status_ok("license-files"))}</div>\n')
+    f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)} \
+        ">{boolean_str(pkg.is_status_ok("license-files"))}</div>\n')
 
     # Hash
     data_field_id = f'hash_file__{pkg_css_class}'
@@ -977,8 +977,8 @@ def dump_html_pkg(f, pkg):
         div_class.append("correct")
     else:
         div_class.append("wrong")
-    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
-        \">{boolean_str(pkg.is_status_ok("hash"))}</div>\n')
+    f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)} \
+        ">{boolean_str(pkg.is_status_ok("hash"))}</div>\n')
 
     # Current version
     data_field_id = f'current_version__{pkg_css_class}'
@@ -986,8 +986,8 @@ def dump_html_pkg(f, pkg):
         current_version = pkg.current_version[:20] + "..."
     else:
         current_version = pkg.current_version
-    f.write(f'  <div id=\"{data_field_id}\" \
-        class=\"centered current_version data _{pkg_css_class}\">{current_version}</div>\n')
+    f.write(f'  <div id="{data_field_id}" \
+        class="centered current_version data _{pkg_css_class}">{current_version}</div>\n')
 
     # Latest version
     data_field_id = f'latest_version__{pkg_css_class}'
@@ -1020,7 +1020,7 @@ def dump_html_pkg(f, pkg):
         else:
             latest_version_text += "found by guess"
 
-    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">{latest_version_text}</div>\n')
+    f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)}">{latest_version_text}</div>\n')
 
     # Warnings
     data_field_id = f'warnings__{pkg_css_class}'
@@ -1030,7 +1030,7 @@ def dump_html_pkg(f, pkg):
         div_class.append("correct")
     else:
         div_class.append("wrong")
-    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">{pkg.warnings}</div>\n')
+    f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)}">{pkg.warnings}</div>\n')
 
     # URL status
     data_field_id = f'upstream_url__{pkg_css_class}'
@@ -1045,7 +1045,7 @@ def dump_html_pkg(f, pkg):
     else:
         div_class.append("good_url")
         url_str = "<a href=\"%s\">Link</a>" % pkg.url
-    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">{url_str}</div>\n')
+    f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)}">{url_str}</div>\n')
 
     # CVEs
     data_field_id = f'cves__{pkg_css_class}'
@@ -1061,11 +1061,11 @@ def dump_html_pkg(f, pkg):
         div_class.append("cve-ok")
     else:
         div_class.append("cve-unknown")
-    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">\n')
+    f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)}">\n')
     if len(pkg.cves) > 10:
         cve_total = len(pkg.cves) + 1
-        f.write(f' <div onclick=\"expandField(\'{data_field_id}\')\" \
-        class=\"see-more centered cve_ignored\">see all ({cve_total}) &#9662;</div>\n')
+        f.write(f' <div onclick="expandField(\'{data_field_id}\')" \
+        class="see-more centered cve_ignored">see all ({cve_total}) &#9662;</div>\n')
     if pkg.is_status_error("cve"):
         for cve in pkg.cves:
             f.write("   <a href=\"https://security-tracker.debian.org/tracker/%s\">%s</a><br/>\n" % (cve, cve))
@@ -1083,7 +1083,7 @@ def dump_html_pkg(f, pkg):
     div_class.append(f'_{pkg_css_class}')
     if pkg.ignored_cves:
         div_class.append("cve_ignored")
-    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">\n')
+    f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)}">\n')
     for ignored_cve in pkg.ignored_cves:
         f.write("    <a href=\"https://security-tracker.debian.org/tracker/%s\">%s</a><br/>\n" % (ignored_cve, ignored_cve))
     f.write("  </div>\n")
@@ -1100,7 +1100,7 @@ def dump_html_pkg(f, pkg):
         div_class.append("cpe-ok")
     else:
         div_class.append("cpe-unknown")
-    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">\n')
+    f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)}">\n')
     if pkg.cpeid:
         cpeid_begin = ":".join(pkg.cpeid.split(":")[0:4]) + ":"
         cpeid_formatted = pkg.cpeid.replace(cpeid_begin, cpeid_begin + "<wbr>")
@@ -1121,33 +1121,33 @@ def dump_html_pkg(f, pkg):
 
 def dump_html_all_pkgs(f, packages):
     f.write("""
-<div id=\"package-grid\">
-<div style="grid-column: 1;" onclick="sortGrid(this.id)" id=\"package\"
-     class=\"package data label\"><span>Package</span><span></span></div>
-<div style="grid-column: 2;" onclick="sortGrid(this.id)" id=\"patch_count\"
-     class=\"centered patch_count data label\"><span>Patch count</span><span></span></div>
-<div style="grid-column: 3;" onclick="sortGrid(this.id)" id=\"infrastructure\"
-     class=\"centered infrastructure data label\">Infrastructure<span></span></div>
-<div style="grid-column: 4;" onclick="sortGrid(this.id)" id=\"license\"
-     class=\"centered license data label\"><span>License</span><span></span></div>
-<div style="grid-column: 5;" onclick="sortGrid(this.id)" id=\"license_files\"
-     class=\"centered license_files data label\"><span>License files</span><span></span></div>
-<div style="grid-column: 6;" onclick="sortGrid(this.id)" id=\"hash_file\"
-     class=\"centered hash_file data label\"><span>Hash file</span><span></span></div>
-<div style="grid-column: 7;" onclick="sortGrid(this.id)" id=\"current_version\"
-     class=\"centered current_version data label\"><span>Current version</span><span></span></div>
-<div style="grid-column: 8;" onclick="sortGrid(this.id)" id=\"latest_version\"
-     class=\"centered latest_version data label\"><span>Latest version</span><span></span></div>
-<div style="grid-column: 9;" onclick="sortGrid(this.id)" id=\"warnings\"
-     class=\"centered warnings data label\"><span>Warnings</span><span></span></div>
-<div style="grid-column: 10;" onclick="sortGrid(this.id)" id=\"upstream_url\"
-     class=\"centered upstream_url data label\"><span>Upstream URL</span><span></span></div>
-<div style="grid-column: 11;" onclick="sortGrid(this.id)" id=\"cves\"
-     class=\"centered cves data label\"><span>CVEs</span><span></span></div>
-<div style="grid-column: 12;" onclick="sortGrid(this.id)" id=\"ignored_cves\"
-     class=\"centered ignored_cves data label\"><span>CVEs Ignored</span><span></span></div>
-<div style="grid-column: 13;" onclick="sortGrid(this.id)" id=\"cpe_id\"
-     class=\"centered cpe_id data label\"><span>CPE ID</span><span></span></div>
+<div id="package-grid">
+<div style="grid-column: 1;" onclick="sortGrid(this.id)" id="package"
+     class="package data label"><span>Package</span><span></span></div>
+<div style="grid-column: 2;" onclick="sortGrid(this.id)" id="patch_count"
+     class="centered patch_count data label"><span>Patch count</span><span></span></div>
+<div style="grid-column: 3;" onclick="sortGrid(this.id)" id="infrastructure"
+     class="centered infrastructure data label">Infrastructure<span></span></div>
+<div style="grid-column: 4;" onclick="sortGrid(this.id)" id="license"
+     class="centered license data label"><span>License</span><span></span></div>
+<div style="grid-column: 5;" onclick="sortGrid(this.id)" id="license_files"
+     class="centered license_files data label"><span>License files</span><span></span></div>
+<div style="grid-column: 6;" onclick="sortGrid(this.id)" id="hash_file"
+     class="centered hash_file data label"><span>Hash file</span><span></span></div>
+<div style="grid-column: 7;" onclick="sortGrid(this.id)" id="current_version"
+     class="centered current_version data label"><span>Current version</span><span></span></div>
+<div style="grid-column: 8;" onclick="sortGrid(this.id)" id="latest_version"
+     class="centered latest_version data label"><span>Latest version</span><span></span></div>
+<div style="grid-column: 9;" onclick="sortGrid(this.id)" id="warnings"
+     class="centered warnings data label"><span>Warnings</span><span></span></div>
+<div style="grid-column: 10;" onclick="sortGrid(this.id)" id="upstream_url"
+     class="centered upstream_url data label"><span>Upstream URL</span><span></span></div>
+<div style="grid-column: 11;" onclick="sortGrid(this.id)" id="cves"
+     class="centered cves data label"><span>CVEs</span><span></span></div>
+<div style="grid-column: 12;" onclick="sortGrid(this.id)" id="ignored_cves"
+     class="centered ignored_cves data label"><span>CVEs Ignored</span><span></span></div>
+<div style="grid-column: 13;" onclick="sortGrid(this.id)" id="cpe_id"
+     class="centered cpe_id data label"><span>CPE ID</span><span></span></div>
 """)
     for pkg in sorted(packages):
         dump_html_pkg(f, pkg)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
