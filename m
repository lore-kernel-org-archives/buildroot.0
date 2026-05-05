Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5426CD3427
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 19:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70CC740790;
	Tue,  5 May 2026 19:54:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j4k8ivURoWkr; Tue,  5 May 2026 19:54:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28D264084A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778010842;
	bh=6PpBgpO6AXR/WaqV3qXIlX2ycaS5wIFn3RAdo9xfym4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dWoecM2/HztVB9gFLl30eQthC5s3O9qYyf0YVzMoitsZ1NfJVdLA9mll3FoAGnIQd
	 02uwWm6RuXzUYG70BPTrC37uDDMREknTzH+R99UFML2mWvcobanE6JXQUTkyoALBJs
	 YACWabuQXTYutQg+bbHLJ0qwEtAd+SUD1lFr/yv0qLd9lUsehtJ0ih1TFrZckm9P1i
	 9PVgLlid9l9n/9d25eJFEBHs1VKuaurNeJbCN/metSb6B6tR7N/qNgVPUb3S7prgi0
	 gde+KCImHTzKI9uJdDUYlUMuS56umbrNgY88Jwud9mCvdmsDdfP5rpNRI63geEgTs5
	 MmxrPWSTFsvIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28D264084A;
	Tue,  5 May 2026 19:54:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 234872A8
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 099A7405B2
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:53:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LVj-wIrG1w1i for <buildroot@buildroot.org>;
 Tue,  5 May 2026 19:53:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B81D140BA9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B81D140BA9
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:53:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF69084648; Tue,  5 May 2026 19:53:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 5 May 2026 21:53:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 77a464969c77f7c2a4feb9ec2d2ec3814c2dcb4e
X-Git-Newrev: 7961bd10b968cce52b118aedfeda09af1bd296ba
X-Patchwork-Hint: ignore
Message-Id: <20260505195355.CF69084648@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: format upstream
 URL info consistently in HTML
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7961bd10b968cce52b118aedfeda09af1bd296ba
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Use only one of the classes for "error" or "warning" status so they
look different, and format the error/warning text for both. Do not
make the text a link if the URL is None.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
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
