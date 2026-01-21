Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A798C44536
	for <buildroot@archiver.kernel.org>; Wed, 21 Jan 2026 20:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AC8140C6A;
	Wed, 21 Jan 2026 20:44:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n5HuZQ6A6R5v; Wed, 21 Jan 2026 20:44:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B53240C6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769028290;
	bh=aLXDHWR4v6rjfObZrcUZ2LUzV2XxOznqO19htCGmsK0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OYIOIWliK48ScQlaoGE2QGKPN/RH2vA/VRie022Cmtc95gwmxLvmpl5RGbyosOuhL
	 GknMUy8P5ql0k8Ko3dqN//5zaLmaBZws0N7vvo3m2oc1fVnokxIP7zLqMfoZE01Ea0
	 L5VtvCY1k4AJXKkadUmVs8J+xrGv4KV+2d66n8hrTyW+gYU7bUwzrRPwzucQRJn3Wb
	 dTOOl7AlgWcO+kWGnDxpEp5m742wJ3aGYS307fP3OJ/pewEOTbPWC6f50g5qkg3w4R
	 cx8smA+aBLsUQbzP5nQmqiTJrGvS+5qtES71f/FZwumVh41xHwA70p2wDaJN2gJC3t
	 B1QY2aj+6X1ag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B53240C6C;
	Wed, 21 Jan 2026 20:44:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A3E474DF
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 20:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9473B60B52
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 20:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e7pg4lkYjgz7 for <buildroot@buildroot.org>;
 Wed, 21 Jan 2026 20:44:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4A2560B51
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4A2560B51
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 20:44:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BFFC6874AC; Wed, 21 Jan 2026 20:44:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Jan 2026 21:05:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 29e962d87b924d3ef49444321f9e0c675c6f15ad
X-Git-Newrev: 3fa9c7c3f0c0059828eecb5ea7e498a3546a2ea2
X-Patchwork-Hint: ignore
Message-Id: <20260121204445.BFFC6874AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiohttp-sse: fix build with
 python 3.14
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3fa9c7c3f0c0059828eecb5ea7e498a3546a2ea2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-Fix-build-with-python-3.14.patch          | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/python-aiohttp-sse/0001-Fix-build-with-python-3.14.patch b/package/python-aiohttp-sse/0001-Fix-build-with-python-3.14.patch
new file mode 100644
index 0000000000..76b595c7de
--- /dev/null
+++ b/package/python-aiohttp-sse/0001-Fix-build-with-python-3.14.patch
@@ -0,0 +1,35 @@
+From 7a649de6561ec181208a9c4fa712aed614a224d4 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Mon, 8 Dec 2025 18:03:03 +0100
+Subject: [PATCH] Fix build with python 3.14
+
+ast.Str was deprecated in python 3.12 and removed in 3.14. It inherited
+from ast.Constant, `Str.s` was equivalent to `Constant.value`, so we can
+use the latter on both old and newer python versions.
+
+Patch was inspired by
+https://hg-edge.mozilla.org/mozilla-central/rev/dbf9702ed87e
+
+Upstream: https://github.com/aio-libs/aiohttp-sse/commit/9eec5f5b0355bb3853d0e4f2af6486c9a5887e38
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 6843260..fa41025 100644
+--- a/setup.py
++++ b/setup.py
+@@ -25,7 +25,7 @@ class VersionFinder(ast.NodeVisitor):
+     def visit_Assign(self, node):
+         if not self.version:
+             if node.targets[0].id == "__version__":
+-                self.version = node.value.s
++                self.version = node.value.value
+ 
+ 
+ def read_version():
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
