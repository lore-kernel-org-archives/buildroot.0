Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BAAFF8855
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 19:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C165C81270;
	Tue,  5 May 2026 19:54:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qlv2X-gOZuaQ; Tue,  5 May 2026 19:54:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB38781324
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778010839;
	bh=O5BUfbvClrT/d6GfV2ADlKXup4HmuVd7RHCULexMvP0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SmHrTfCJkWYXsl7eoA57J0q/QuB/CBpUHSqRwjy4rRkT4KyItxYOQ4TwEv8asf+6r
	 /qZBYBv/wx6bRnqOHCC2jniyY9A+vUAgA+cfj043Abev5hhVZIeMmDr4lEBEFzI8iN
	 8GwfCXpRWxmtTVKBaCZ5xht9FdylmZL8BUO/i4z82XIm63+U5T0gOzO8SNIIgjLB1h
	 0vfeGOsBbBfJoV9+KfRZxM/TI1BRMFEXiz8Zf/+BqpSRbG18LLdYEzYGscMawo0+JH
	 5gRRYCm0o/aWjk7tyx3T5t1PtkMNGWOi27mTL1GGgSKZXAP2Lhw3J2kXA1I2pGeI40
	 XwNyQBGcuGmpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB38781324;
	Tue,  5 May 2026 19:53:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8756B2A8
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D656403FA
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:53:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IeH0MNXYJQA9 for <buildroot@buildroot.org>;
 Tue,  5 May 2026 19:53:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2DD4403F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2DD4403F1
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:53:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C82538463D; Tue,  5 May 2026 19:53:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 5 May 2026 21:53:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d58449b225a25b56f0f92634818e74c79b02754e
X-Git-Newrev: 77a464969c77f7c2a4feb9ec2d2ec3814c2dcb4e
X-Patchwork-Hint: ignore
Message-Id: <20260505195355.C82538463D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: search only
 Config.in{, .host} for URL
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/77a464969c77f7c2a4feb9ec2d2ec3814c2dcb4e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The previous Config.* glob also caught linux/Config.ext.in and
package/php/Config.ext, as well as some backup files created by
editors (e.g. Config.in~ after editing a Config.in file in Emacs),
leading to wrong results depending on directory listing order.

Also use "with" to automatically close the file when the block is
left, even on error.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 support/scripts/pkg-stats | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 55aa63c861..efb85a7405 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -148,17 +148,17 @@ class Package:
         Fills in the .url field
         """
         self.status['url'] = ("warning", "no Config.in")
-        for filename in os.listdir(self.pkgdir):
-            if fnmatch.fnmatch(filename, 'Config.*'):
-                fp = open(os.path.join(self.pkgdir, filename), "r")
-                for config_line in fp:
-                    if URL_RE.match(config_line):
-                        self.url = config_line.strip()
-                        self.status['url'] = ("ok", "found")
-                        fp.close()
-                        return
-                self.status['url'] = ("error", "missing")
-                fp.close()
+        for filename in ('Config.in', 'Config.in.host'):
+            try:
+                with open(os.path.join(self.pkgdir, filename), "r") as fp:
+                    for config_line in fp:
+                        if URL_RE.match(config_line):
+                            self.url = config_line.strip()
+                            self.status['url'] = ("ok", "found")
+                            return
+                    self.status['url'] = ("error", "missing")
+            except FileNotFoundError:
+                continue
 
     @property
     def patch_count(self):
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
