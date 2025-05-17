Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB83C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 15:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EB28409ED;
	Sat, 17 May 2025 15:28:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ICqYV8xwz-YH; Sat, 17 May 2025 15:28:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53E5B40662
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53E5B40662;
	Sat, 17 May 2025 15:28:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 775F81DE
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DC41409D7
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:28:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OgmW9oVfpqnA for <buildroot@buildroot.org>;
 Sat, 17 May 2025 15:28:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6191940662
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6191940662
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:28:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1FDCE86F8B; Sat, 17 May 2025 15:28:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 17:28:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c7087f2ee87e4b5e1df050b2c75ea969ce4e954
X-Git-Newrev: d0a7a468130bcae54d40a6e9f3c7c72664803324
X-Patchwork-Hint: ignore
Message-Id: <20250517152849.1FDCE86F8B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/cve.py: remove unused
 each_product()
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4639207277454378543=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4639207277454378543==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d0a7a468130bcae54d40a6e9f3c7c72664803324
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The last usage of each_product() was removed in commit
52ae092046696f099397d3b0a8206262e8203f40 ("support/scripts/cve.py: use
the JSON data in 1.1 schema").

Since it's now unused, remove it.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

--===============4639207277454378543==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4639207277454378543==--
