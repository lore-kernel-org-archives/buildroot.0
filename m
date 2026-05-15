Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 817BFCD4F47
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F8C28453F;
	Fri, 15 May 2026 17:45:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2PY7wKQkt1gA; Fri, 15 May 2026 17:45:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F7348416C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867101;
	bh=7tQgIT++0jcJ+WWkOEa1sui5E3+zdXszrwwQD+q78cg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lNXkL0tWYfWLuNsuT9j3DhE6ZeLajNl8Ty7o33hmyuQnFL3dU73jiDjNtfaqHJ6vz
	 gGN1rYlL+qL2keXN0d9vgCS2YJYmhRDbBAVD6w0AOUjT6sKIvqxvVZYYoJq5Nyf9//
	 DUyzwjYbw3/ALscaMDGFSo+6mDFeWJMemXgXV7THaPZ+WtHsdRljUm21Mj5zRfdwzT
	 4CSi4OvJK9AT8C3hVZLtL9HuVvluHs3hczIwHcopLMtqumPpIDedPSE7I3mJ704hIw
	 D7xMvplqymKv2IMhf+/mUzpPoskgOWoVbb4jip6YMK5mm7LqbbPKmk8mHmX+ULfU4c
	 rQTKPtwesikmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F7348416C;
	Fri, 15 May 2026 17:45:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 47F5345B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB86A616A1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EYJ9KslC6Fbj for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:44:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEAE66169A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEAE66169A
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 363EC863D5; Fri, 15 May 2026 17:44:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:59:15 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e5fde3d4bfd6a67b52613fa092156b09cd95beac
X-Git-Newrev: 59e81d40902ab650533094c3f16caede77669c50
X-Patchwork-Hint: ignore
Message-Id: <20260515174449.363EC863D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 support/scripts/pkg-stats: format upstream URL info consistently in HTML
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/59e81d40902ab650533094c3f16caede77669c50
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Use only one of the classes for "error" or "warning" status so they
look different, and format the error/warning text for both. Do not
make the text a link if the URL is None.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 7961bd10b968cce52b118aedfeda09af1bd296ba)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/scripts/pkg-stats | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index efb85a7405..a87bb23a8e 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1057,14 +1057,19 @@ def dump_html_pkg(f, pkg):
     div_class = ["centered upstream_url data"]
     div_class.append(f'_{pkg_css_class}')
     url_str = pkg.status['url'][1]
-    if pkg.status['url'][0] in ("error", "warning"):
-        div_class.append("missing_url")
-    if pkg.status['url'][0] == "error":
-        div_class.append("invalid_url")
-        url_str = f"""<a href="{pkg.url}">{pkg.status['url'][1]}</a>"""
-    else:
+    if pkg.status['url'][0] == "ok":
         div_class.append("good_url")
         url_str = f'<a href="{pkg.url}">Link</a>'
+    else:
+        if pkg.status['url'][0] == "warning":
+            div_class.append("missing_url")
+        else:
+            # "error" status
+            div_class.append("invalid_url")
+        if pkg.url is not None:
+            url_str = f"""<a href="{pkg.url}">{pkg.status['url'][1]}</a>"""
+        else:
+            url_str = pkg.status['url'][1]
     f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)}">{url_str}</div>\n')
 
     # CVEs
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
