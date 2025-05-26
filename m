Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C431C5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 17:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CF9740A55;
	Sat, 31 May 2025 17:06:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L0rpRM0dwWzz; Sat, 31 May 2025 17:06:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83EE240C28
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83EE240C28;
	Sat, 31 May 2025 17:06:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 106AD127
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29EE483BAF
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:06:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RxqG4YP3UZBQ for <buildroot@buildroot.org>;
 Sat, 31 May 2025 17:06:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D8E383BC2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D8E383BC2
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:06:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5BA8587806; Sat, 31 May 2025 17:06:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 May 2025 17:50:35 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 1a8ed4da70bb795b4a35f774f65321bf4a943b05
X-Git-Newrev: ff7ae5911320c5c85e6823fc586c7d8ccd8a7411
X-Patchwork-Hint: ignore
Message-Id: <20250531170619.5BA8587806@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/scripts/cve.py:
 remove unused each_product()
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
Content-Type: multipart/mixed; boundary="===============4180270256323396542=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4180270256323396542==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ff7ae5911320c5c85e6823fc586c7d8ccd8a7411
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The last usage of each_product() was removed in commit
52ae092046696f099397d3b0a8206262e8203f40 ("support/scripts/cve.py: use
the JSON data in 1.1 schema").

Since it's now unused, remove it.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d0a7a468130bcae54d40a6e9f3c7c72664803324)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/scripts/cve.py | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index 5af6e0c43f..18fda8e1a1 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -111,12 +111,6 @@ class CVE:
                     with open(os.path.join(dirpath, filename), "rb") as f:
                         yield cls(json.load(f))
 
-    def each_product(self):
-        """Iterate over each product section of this cve"""
-        for vendor in self.nvd_cve['cve']['affects']['vendor']['vendor_data']:
-            for product in vendor['product']['product_data']:
-                yield product
-
     def parse_node(self, node):
         """
         Parse the node inside the configurations section to extract the

--===============4180270256323396542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4180270256323396542==--
