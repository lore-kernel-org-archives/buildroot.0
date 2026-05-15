Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694BECD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D9A684577;
	Fri, 15 May 2026 17:45:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eRjpFEZj0SuU; Fri, 15 May 2026 17:45:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB86184569
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867108;
	bh=08bFj0qjUrIjiPmCJT9wafz37Kd6oR03zwU2pIJrGfw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U5E1rsqvB/VCWJBLv43RtplQMCbhMl/bPu+ZuC3GWOYsJ1eebKReqZc/LlOl8oyEr
	 PNUDlUY3xsPgM8Gj9EpJiJAHdTHUvrNaMEuH2A7wXH3SrJEFT9DS9RH3I9TtT9BWmT
	 Nr625NrMEyFjE7UNybig4JzqipupXQHnXlMxkoINFr02f63yK5iA+k7of/RWfaVEX9
	 Fh8cLb5Z5PCwJUehXjx1h7nZGgLQ5dAEDW9YeSOBHRAZ7Y3vtRt0hrGmqi+7Jd1NbB
	 OkvdujPIKXEePU+BfS2XqiWpfm2SSwZixoy8yzQlwhBqK+dmRiNkmTUnVaROaAH8mN
	 A3DdiP0SM5p7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB86184569;
	Fri, 15 May 2026 17:45:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A91423F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 658E06169D
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eOMeijM7aEQK for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:44:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD78161698
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD78161698
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27C41863B4; Fri, 15 May 2026 17:44:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:59:13 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: bca59419d984ea64b0495169020907e45dd5de66
X-Git-Newrev: e5fde3d4bfd6a67b52613fa092156b09cd95beac
X-Patchwork-Hint: ignore
Message-Id: <20260515174449.27C41863B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e5fde3d4bfd6a67b52613fa092156b09cd95beac
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
