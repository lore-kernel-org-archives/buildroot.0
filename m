Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31A8AC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:14:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E620160EE8
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:14:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E620160EE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C26D683046;
	Tue,  3 Aug 2021 22:14:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9b6CnvJq9qix; Tue,  3 Aug 2021 22:14:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1738C82F13;
	Tue,  3 Aug 2021 22:14:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 14BF61BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F1F74036B
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pd7-OAliSqQo for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04644403F0
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 557D687516; Tue,  3 Aug 2021 21:09:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 19 May 2021 10:21:28 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9368f3f23d2e86084018811b2df293d5e129e4ed
X-Git-Newrev: 50791af71fd33cc7048ae2ad85ee02fd2a227ae0
X-Patchwork-Hint: ignore
Message-Id: <20210803210941.557D687516@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/scripts/pkg-stats:
 clarify when a CVE/CPE should report as N/A
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=50791af71fd33cc7048ae2ad85ee02fd2a227ae0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- If a package doesn't have any versioning, ignore and state that
 - If a package is virtual, CVE=ignore and CPE state virtual
 - For any of these NA cases, don't provide search link and color box
   green

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Matthew Weber <matthew.weber@collins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/pkg-stats | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 0c34388066..cc91d13167 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -229,7 +229,10 @@ class Package:
         """
         var = self.pkgvar()
         if not self.is_actual_package:
-            self.status['cpe'] = ("na", "no valid package infra")
+            self.status['cpe'] = ("na", "N/A - virtual pkg")
+            return
+        if not self.current_version:
+            self.status['cpe'] = ("na", "no version information available")
             return
 
         if var in self.all_cpeids:
@@ -587,7 +590,7 @@ def check_package_cves(nvd_path, packages):
     cpe_product_pkgs = defaultdict(list)
     for pkg in packages:
         if not pkg.is_actual_package:
-            pkg.status['cve'] = ("na", "no valid package infra")
+            pkg.status['cve'] = ("na", "N/A")
             continue
         if not pkg.current_version:
             pkg.status['cve'] = ("na", "no version information available")
@@ -909,6 +912,8 @@ def dump_html_pkg(f, pkg):
         td_class.append("cve-ok")
     elif pkg.is_status_error("cve"):
         td_class.append("cve-nok")
+    elif pkg.is_status_na("cve") and not pkg.is_actual_package:
+        td_class.append("cve-ok")
     else:
         td_class.append("cve-unknown")
     f.write("  <td class=\"%s\">\n" % " ".join(td_class))
@@ -936,18 +941,23 @@ def dump_html_pkg(f, pkg):
         td_class.append("cpe-ok")
     elif pkg.is_status_error("cpe"):
         td_class.append("cpe-nok")
+    elif pkg.is_status_na("cpe") and not pkg.is_actual_package:
+        td_class.append("cpe-ok")
     else:
         td_class.append("cpe-unknown")
     f.write("  <td class=\"%s\">\n" % " ".join(td_class))
     if pkg.cpeid:
         f.write("  <code>%s</code>\n" % pkg.cpeid)
     if not pkg.is_status_ok("cpe"):
-        if pkg.cpeid:
-            f.write("  <br/>%s <a href=\"https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=%s\">(Search)</a>\n" %  # noqa: E501
-                    (pkg.status['cpe'][1], ":".join(pkg.cpeid.split(":")[0:5])))
+        if pkg.is_actual_package and pkg.current_version:
+            if pkg.cpeid:
+                f.write("  <br/>%s <a href=\"https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=%s\">(Search)</a>\n" %  # noqa: E501
+                        (pkg.status['cpe'][1], ":".join(pkg.cpeid.split(":")[0:5])))
+            else:
+                f.write("  %s <a href=\"https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=%s\">(Search)</a>\n" %  # noqa: E501
+                        (pkg.status['cpe'][1], pkg.name))
         else:
-            f.write("  %s <a href=\"https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=%s\">(Search)</a>\n" %
-                    (pkg.status['cpe'][1], pkg.name))
+            f.write("  %s\n" % pkg.status['cpe'][1])
 
     f.write("  </td>\n")
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
