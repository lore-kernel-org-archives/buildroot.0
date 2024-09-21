Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D633FCF9C69
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 18:49:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5AEF419E1;
	Sat, 21 Sep 2024 18:49:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ac9XHvMjkq00; Sat, 21 Sep 2024 18:49:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A17F241A67
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A17F241A67;
	Sat, 21 Sep 2024 18:49:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E012B1BF59E
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 18:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C38476066C
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 18:48:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uorSK4le0vxK for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 18:48:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E09B60699
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E09B60699
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 18:48:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 679EC83D95; Sat, 21 Sep 2024 18:48:12 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 20:39:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 146c1d38defee5114f994e1e6d3f80ce63e117bd
X-Git-Newrev: da0d6d5834b64df84a4e713d971c4c7d52bf06e7
X-Patchwork-Hint: ignore
Message-Id: <20240921184812.679EC83D95@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/cve.py: fix 'useful' typo
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=da0d6d5834b64df84a4e713d971c4c7d52bf06e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/cve.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index e25825581e..5af6e0c43f 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -120,7 +120,7 @@ class CVE:
     def parse_node(self, node):
         """
         Parse the node inside the configurations section to extract the
-        cpe information usefull to know if a product is affected by
+        cpe information useful to know if a product is affected by
         the CVE. Actually only the product name and the version
         descriptor are needed, but we also provide the vendor name.
         """
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
