Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91203C19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 21:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D82F60F8E;
	Sat,  6 Aug 2022 21:57:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D82F60F8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rKBcUotCfw93; Sat,  6 Aug 2022 21:57:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA82660F84;
	Sat,  6 Aug 2022 21:57:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA82660F84
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 169E61BF3FF
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 21:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2ADC41732
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 21:56:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2ADC41732
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VdtgNsWHDY08 for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 21:56:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F02D441553
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F02D441553
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 21:56:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 1A9BC1C0002;
 Sat,  6 Aug 2022 21:56:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat,  6 Aug 2022 23:56:41 +0200
Message-Id: <20220806215641.471770-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220806215641.471770-1-thomas.petazzoni@bootlin.com>
References: <20220806215641.471770-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659823007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BCWX8NjVMkilwZPkEqdrnpHCWq1tMWju3chs0eJXbzY=;
 b=p6jjoZeED8UhcWZXN1NGjOBY2AHyWq2z6tlcgrfQLm5x0i1N7pjYH3WRWp9/vfMmcMFjgt
 wceeEycPk9VCes3CrFRLKwSvd2NuSwCJiymRD+wlTQn+dYEZYPMyMf7iaAvguPU2KMO62O
 1BmDYibmkX27wtKAqRkqYqiVyO2cfI0uZAt0d9vT3HeZ5HfzgXcqoLJHERwn9d0VeXLi+4
 NHc/ePmckx24ISMxMbMCTypE/PDN11lYNaXyAHN1WN3FroUCLCsvO4yTuXM9/ajIUVcVaD
 Yo1ygQPJSYEm81WxYjpzJjPG4VvAYE0JBjqZFVMptoy/VecGv3/RzyUXL/merg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=p6jjoZeE
Subject: [Buildroot] [PATCH 2/2] support/scripts/pkg-stats: remove remaining
 double quote escaping
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
Cc: Sen Hastings <sen@phobosdpl.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is done either by switching to single quoted f-strings, triple
double quoted f-strings when needed, or simply single-quoted strings.

The renderer HTML is exactly identical before/after this commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 67 +++++++++++++++++++--------------------
 1 file changed, 32 insertions(+), 35 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 572757b7ea..aa3b49c809 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1010,13 +1010,12 @@ def dump_html_pkg(f, pkg):
         if pkg.latest_version['version'] is None:
             latest_version_text = "<b>Found, but no version</b>"
         else:
-            latest_version_text = "<a href=\"https://release-monitoring.org/project/%s\"><b>%s</b></a>" % \
-                (pkg.latest_version['id'], str(pkg.latest_version['version']))
+            latest_version_text = f"""<a href="https://release-monitoring.org/project/{pkg.latest_version['id']}"><b>{str(pkg.latest_version['version'])}</b></a>"""
 
         latest_version_text += "<br/>"
 
         if pkg.latest_version['status'] == RM_API_STATUS_FOUND_BY_DISTRO:
-            latest_version_text += "found by <a href=\"https://release-monitoring.org/distro/Buildroot/\">distro</a>"
+            latest_version_text += f'found by <a href="https://release-monitoring.org/distro/Buildroot/">distro</a>'
         else:
             latest_version_text += "found by guess"
 
@@ -1041,10 +1040,10 @@ def dump_html_pkg(f, pkg):
         div_class.append("missing_url")
     if pkg.status['url'][0] == "error":
         div_class.append("invalid_url")
-        url_str = "<a href=\"%s\">%s</a>" % (pkg.url, pkg.status['url'][1])
+        url_str = f"""<a href="{pkg.url}">{pkg.status['url'][1]}</a>"""
     else:
         div_class.append("good_url")
-        url_str = "<a href=\"%s\">Link</a>" % pkg.url
+        url_str = f'<a href="{pkg.url}">Link</a>'
     f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)}">{url_str}</div>\n')
 
     # CVEs
@@ -1068,11 +1067,11 @@ def dump_html_pkg(f, pkg):
         class="see-more centered cve_ignored">see all ({cve_total}) &#9662;</div>\n')
     if pkg.is_status_error("cve"):
         for cve in pkg.cves:
-            f.write("   <a href=\"https://security-tracker.debian.org/tracker/%s\">%s</a><br/>\n" % (cve, cve))
+            f.write(f'   <a href="https://security-tracker.debian.org/tracker/{cve}">{cve}</a><br/>\n')
         for cve in pkg.unsure_cves:
-            f.write("   <a href=\"https://security-tracker.debian.org/tracker/%s\">%s <i>(unsure)</i></a><br/>\n" % (cve, cve))
+            f.write(f'   <a href="https://security-tracker.debian.org/tracker/{cve}">{cve} <i>(unsure)</i></a><br/>\n')
     elif pkg.is_status_na("cve"):
-        f.write("    %s" % pkg.status['cve'][1])
+        f.write(f"""    {pkg.status['cve'][1]}""")
     else:
         f.write("    N/A\n")
     f.write("  </div>\n")
@@ -1085,7 +1084,7 @@ def dump_html_pkg(f, pkg):
         div_class.append("cve_ignored")
     f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)}">\n')
     for ignored_cve in pkg.ignored_cves:
-        f.write("    <a href=\"https://security-tracker.debian.org/tracker/%s\">%s</a><br/>\n" % (ignored_cve, ignored_cve))
+        f.write(f'    <a href="https://security-tracker.debian.org/tracker/{ignored_cve}">{ignored_cve}</a><br/>\n')
     f.write("  </div>\n")
 
     # CPE ID
@@ -1108,11 +1107,9 @@ def dump_html_pkg(f, pkg):
     if not pkg.is_status_ok("cpe"):
         if pkg.is_actual_package and pkg.current_version:
             if pkg.cpeid:
-                f.write("  <br/>%s <a href=\"https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=%s\">(Search)</a>\n" %  # noqa: E501
-                        (pkg.status['cpe'][1], ":".join(pkg.cpeid.split(":")[0:5])))
+                f.write(f"""  <br/>{pkg.status['cpe'][1]} <a href="https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword={":".join(pkg.cpeid.split(":")[0:5])}">(Search)</a>\n""") # noqa: E501
             else:
-                f.write("  %s <a href=\"https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=%s\">(Search)</a>\n" %  # noqa: E501
-                        (pkg.status['cpe'][1], pkg.name))
+                f.write(f"""  {pkg.status['cpe'][1]} <a href="https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword={pkg.name}">(Search)</a>\n""")  # noqa: E501
         else:
             f.write("  %s\n" % pkg.status['cpe'][1])
 
@@ -1155,49 +1152,49 @@ def dump_html_all_pkgs(f, packages):
 
 
 def dump_html_stats(f, stats):
-    f.write("<a id=\"results\"></a>\n")
-    f.write("<div class=\"data\" id=\"results-grid\">\n")
+    f.write('<a id="results"></a>\n')
+    f.write('<div class="data" id="results-grid">\n')
     infras = [infra[6:] for infra in stats.keys() if infra.startswith("infra-")]
     for infra in infras:
-        f.write(" <div class=\"data\">Packages using the <i>%s</i> infrastructure</div><div class=\"data\">%s</div>\n" %
+        f.write(' <div class="data">Packages using the <i>%s</i> infrastructure</div><div class="data">%s</div>\n' %
                 (infra, stats["infra-%s" % infra]))
-    f.write(" <div class=\"data\">Packages having license information</div><div class=\"data\">%s</div>\n" %
+    f.write(' <div class="data">Packages having license information</div><div class="data">%s</div>\n' %
             stats["license"])
-    f.write(" <div class=\"data\">Packages not having license information</div><div class=\"data\">%s</div>\n" %
+    f.write(' <div class="data">Packages not having license information</div><div class="data">%s</div>\n' %
             stats["no-license"])
-    f.write(" <div class=\"data\">Packages having license files information</div><div class=\"data\">%s</div>\n" %
+    f.write(' <div class="data">Packages having license files information</div><div class="data">%s</div>\n' %
             stats["license-files"])
-    f.write(" <div class=\"data\">Packages not having license files information</div><div class=\"data\">%s</div>\n" %
+    f.write(' <div class="data">Packages not having license files information</div><div class="data">%s</div>\n' %
             stats["no-license-files"])
-    f.write(" <div class=\"data\">Packages having a hash file</div><div class=\"data\">%s</div>\n" %
+    f.write(' <div class="data">Packages having a hash file</div><div class="data">%s</div>\n' %
             stats["hash"])
-    f.write(" <div class=\"data\">Packages not having a hash file</div><div class=\"data\">%s</div>\n" %
+    f.write(' <div class="data">Packages not having a hash file</div><div class="data">%s</div>\n' %
             stats["no-hash"])
-    f.write(" <div class=\"data\">Total number of patches</div><div class=\"data\">%s</div>\n" %
+    f.write(' <div class="data">Total number of patches</div><div class="data">%s</div>\n' %
             stats["patches"])
-    f.write("<div class=\"data\">Packages having a mapping on <i>release-monitoring.org</i></div><div class=\"data\">%s</div>\n" %
+    f.write('<div class="data">Packages having a mapping on <i>release-monitoring.org</i></div><div class="data">%s</div>\n' %
             stats["rmo-mapping"])
-    f.write("<div class=\"data\">Packages lacking a mapping on <i>release-monitoring.org</i></div><div class=\"data\">%s</div>\n" %
+    f.write('<div class="data">Packages lacking a mapping on <i>release-monitoring.org</i></div><div class="data">%s</div>\n' %
             stats["rmo-no-mapping"])
-    f.write("<div class=\"data\">Packages that are up-to-date</div><div class=\"data\">%s</div>\n" %
+    f.write('<div class="data">Packages that are up-to-date</div><div class="data">%s</div>\n' %
             stats["version-uptodate"])
-    f.write("<div class=\"data\">Packages that are not up-to-date</div><div class=\"data\">%s</div>\n" %
+    f.write('<div class="data">Packages that are not up-to-date</div><div class="data">%s</div>\n' %
             stats["version-not-uptodate"])
-    f.write("<div class=\"data\">Packages with no known upstream version</div><div class=\"data\">%s</div>\n" %
+    f.write('<div class="data">Packages with no known upstream version</div><div class="data">%s</div>\n' %
             stats["version-unknown"])
-    f.write("<div class=\"data\">Packages affected by CVEs</div><div class=\"data\">%s</div>\n" %
+    f.write('<div class="data">Packages affected by CVEs</div><div class="data">%s</div>\n' %
             stats["pkg-cves"])
-    f.write("<div class=\"data\">Total number of CVEs affecting all packages</div><div class=\"data\">%s</div>\n" %
+    f.write('<div class="data">Total number of CVEs affecting all packages</div><div class="data">%s</div>\n' %
             stats["total-cves"])
-    f.write("<div class=\"data\">Packages affected by unsure CVEs</div><div class=\"data\">%s</div>\n" %
+    f.write('<div class="data">Packages affected by unsure CVEs</div><div class="data">%s</div>\n' %
             stats["pkg-unsure-cves"])
-    f.write("<div class=\"data\">Total number of unsure CVEs affecting all packages</div><div class=\"data\">%s</div>\n" %
+    f.write('<div class="data">Total number of unsure CVEs affecting all packages</div><div class="data">%s</div>\n' %
             stats["total-unsure-cves"])
-    f.write("<div class=\"data\">Packages with CPE ID</div><div class=\"data\">%s</div>\n" %
+    f.write('<div class="data">Packages with CPE ID</div><div class="data">%s</div>\n' %
             stats["cpe-id"])
-    f.write("<div class=\"data\">Packages without CPE ID</div><div class=\"data\">%s</div>\n" %
+    f.write('<div class="data">Packages without CPE ID</div><div class="data">%s</div>\n' %
             stats["no-cpe-id"])
-    f.write("</div>\n")
+    f.write('</div>\n')
 
 
 def dump_html_gen_info(f, date, commit):
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
