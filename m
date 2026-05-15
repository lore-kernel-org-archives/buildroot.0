Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C98DCD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02542809F5;
	Fri, 15 May 2026 17:47:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B1RXhOBT9ozd; Fri, 15 May 2026 17:47:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A53C8473B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867247;
	bh=feLxubQI+PfbKnKwHCWh/ASQzSR1iH+ntcj91ocNDhk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=so6JNFJzk4rTiCvhAOlBA7aozV40tAp3xN+ng9YBTLEeyW2gGxfPBkZ10YD9d0amd
	 4rbBYE9pqN35e4OO7YnWTzNoKEf4yeFnCqjsWHn998UB3WW73UDu3dfmIGozDkqQII
	 rO+zdBlk/nuQj3qn2vOKpwDM00hD6A2Jgs1KyIbm90RBy2kwvwrs4vIdoVy6BB/Nx9
	 04ydEfP4fEnMkmw36xhxX8NX9veq9if7fRaMxc4Bfpz8TtEh4gxpI2cbhQCoyDRUas
	 Ieall0iwpUheacQpU3Up+oYdL/CHmpRyqWPBfaA2Oh6niwTBU8r9rBzNNSxNcQ/hoY
	 cvGTWfTuAEPJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A53C8473B;
	Fri, 15 May 2026 17:47:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 07C3445B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADD7141DA5
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PFWCUSiXZiTf for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C148541D9D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C148541D9D
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B378863DA; Fri, 15 May 2026 17:46:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:21:43 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 54a773003349512e986cc0c09e5889d10f936db8
X-Git-Newrev: 056588171daf829cd4ce72ea234aa1da27f43f1d
X-Patchwork-Hint: ignore
Message-Id: <20260515174640.0B378863DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x]
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/056588171daf829cd4ce72ea234aa1da27f43f1d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
