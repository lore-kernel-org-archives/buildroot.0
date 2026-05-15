Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 629B4CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D72D813DC;
	Fri, 15 May 2026 17:47:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UOQyVqCVP7BE; Fri, 15 May 2026 17:47:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 712D981343
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867257;
	bh=19kmpUt9HSaDMwdNDLeSBpVR0xIedokBPNwSfda2wv8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=osQ8Tkwi3iuWY3XCCIJh7sw+Vuu+qfJgy3KxQJkW57sLaFosZBnVF40D+EwUSVgK1
	 /pOxseL3YB7yW/QyloZC2/8PsLXNthRqmRdHRWXs3ImfYjPe7hRNyHDvxUFM8c1fKY
	 GQmRmXEvyoDHG469EP21f8+EYqkQIyGvlh0/IOjbIJSHGuO1dTk92emaGq94O6FGFS
	 5kxgYwV5imqq1wuhA84hgMP+jr1DHETCscpiQt2gIwxvwkkwYL1XFkWI5uBh0Z9zL9
	 0fRkndZ3ngT4ooQigoGC8eUyvVa1pab/xbZ+0wNtkgg8mRkUo49uuN5Q2OVDy41Fgc
	 GYAqvepSadJrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 712D981343;
	Fri, 15 May 2026 17:47:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AAFDD23F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9206540FAC
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tfV26DH4awWS for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2F8140FA4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2F8140FA4
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F12DD863D7; Fri, 15 May 2026 17:46:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:21:12 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 9a29752770cb72d5d5e1d5923cd285de07b4e99e
X-Git-Newrev: 54a773003349512e986cc0c09e5889d10f936db8
X-Patchwork-Hint: ignore
Message-Id: <20260515174639.F12DD863D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x]
 support/scripts/pkg-stats: search only Config.in{, .host} for URL
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/54a773003349512e986cc0c09e5889d10f936db8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

The previous Config.* glob also caught linux/Config.ext.in and
package/php/Config.ext, as well as some backup files created by
editors (e.g. Config.in~ after editing a Config.in file in Emacs),
leading to wrong results depending on directory listing order.

Also use "with" to automatically close the file when the block is
left, even on error.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 77a464969c77f7c2a4feb9ec2d2ec3814c2dcb4e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
