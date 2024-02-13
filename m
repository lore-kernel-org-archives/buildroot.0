Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA74C48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 12:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAEB240517;
	Tue, 13 Feb 2024 12:10:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pq7JJ3fdt6Dp; Tue, 13 Feb 2024 12:10:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B21F44117B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B21F44117B;
	Tue, 13 Feb 2024 12:10:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 34F051BF2FC
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 12:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22A458203D
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 12:10:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FTA7Y8NNmS_R for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 12:10:48 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=64.142.111.50;
 helo=d.mail.sonic.net; envelope-from=sen@hastings.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 376CD82032
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 376CD82032
Received: from d.mail.sonic.net (d.mail.sonic.net [64.142.111.50])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 376CD82032
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 12:10:47 +0000 (UTC)
Received: from localhost.localdomain (host-92-28-179-191.as13285.net
 [92.28.179.191]) (authenticated bits=0)
 by d.mail.sonic.net (8.16.1/8.16.1) with ESMTPSA id 41DBxbIF009980
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 13 Feb 2024 03:59:38 -0800
From: Sen Hastings <sen@hastings.org>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 11:59:14 +0000
Message-Id: <20240213115914.392552-1-sen@hastings.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Sonic-CAuth: UmFuZG9tSVYrg2Mtl4YBr5H7lztk3ZxdfwHiAGaO/JEFaZQ8ORQzTOVnzfzniQ8wZ2vpfqTHq23CMzopab2/09AZXwOnk+86
X-Sonic-ID: C;ngY8XGfK7hGbhJsCP63e0g== M;VkLeXGfK7hGbhJsCP63e0g==
X-Sonic-Spam-Details: -0.0/5.0 by cerberusd
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=hastings.org
Subject: [Buildroot] [PATCH 1/1] make current version cell scrollable
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
Cc: Sen Hastings <sen@hastings.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I realized that instead of truncating the version number,
we could simply make the cell horizontally scrollable.
This of course allows us to have a fixed cell width,
while preserving the full version number.

A demo is available here:
https://sen-h.codeberg.page/pkg-stats-demos/@pages/make-current-version-cell-scrollable.html

Signed-off-by: Sen Hastings <sen@hastings.org>
---
 support/scripts/pkg-stats | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 7835cb3d62..9307992d29 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -845,6 +845,13 @@ function expandField(fieldId){
 .centered {
   text-align: center;
 }
+
+ .current_version {
+   overflow: scroll;
+   width: 21ch;
+   padding: 10px 2px 10px 2px;
+ }
+
  .correct, .nopatches, .good_url, .version-good, .cpe-ok, .cve-ok {
    background: #d2ffc4;
  }
@@ -964,10 +971,7 @@ def dump_html_pkg(f, pkg):
 
     # Current version
     data_field_id = f'current_version__{pkg_css_class}'
-    if len(pkg.current_version) > 20:
-        current_version = pkg.current_version[:20] + "..."
-    else:
-        current_version = pkg.current_version
+    current_version = pkg.current_version
     f.write(f'  <div id="{data_field_id}" \
         class="centered current_version data _{pkg_css_class}">{current_version}</div>\n')
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
