Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CA6D3B7E2
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 16:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C690C60B55;
	Sun,  7 Dec 2025 16:02:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VRasZEbObV8Q; Sun,  7 Dec 2025 16:02:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30F1760762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765123348;
	bh=QYYwBxp+vbFnW3cVUc2wyjhihRAlVSP5gTi6g8PaBmE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IAFJyX1ZCR+XA6IwR1xRvTPOhvoON8aVD4PX/E596Cxf4hn3KP78vVWtih85RudX3
	 jsd+2PQt5+kzeInUcGHvEp29QwNEs4qgQZ6j35xTzqit5kX3cQ1CAeQ1olX65Xvr9T
	 i1+AHjTU5z+jDbl4OtBuXKtzD3+q0NY4egSL6r6GOlNZvG4HKklr1mMY1hBJ60SuOU
	 Xd09XREtYolxV4zpvOIDmviVwwVNaOD8pAD2DwL/3Ltukpf8QtzDsXCe1Y+vYyyL0e
	 cZXi73dD1dugiC+j5NM/S1/XlAFgVxmKvaI5Af2iy0yKqnf3o8pn3HxAhkly9Ysl2m
	 1h0BdxsfI7/dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30F1760762;
	Sun,  7 Dec 2025 16:02:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CD382F0
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 107A040681
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dmdHEV83sZXc for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43F7F40669
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43F7F40669
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F4E17FA39; Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 14:21:53 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fa5f4abdc34e8749babbf82847dcbaf4ec5650ba
X-Git-Newrev: c7770112edc91a8cafb8a96e65ff4db01c402686
X-Patchwork-Hint: ignore
Message-Id: <20251207160225.3F4E17FA39@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/flare-engine: fix
 cmake 4 compatibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=c7770112edc91a8cafb8a96e65ff4db01c402686
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-Minimum-CMake-version-3.5.patch           | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/flare-engine/0001-Minimum-CMake-version-3.5.patch b/package/flare-engine/0001-Minimum-CMake-version-3.5.patch
new file mode 100644
index 0000000000..ca7c1d500c
--- /dev/null
+++ b/package/flare-engine/0001-Minimum-CMake-version-3.5.patch
@@ -0,0 +1,26 @@
+From 9500379f886484382bba2f893faf49865de9f2c0 Mon Sep 17 00:00:00 2001
+From: Justin Jacobs <jajdorkster@gmail.com>
+Date: Sat, 5 Apr 2025 18:27:55 -0400
+Subject: [PATCH] Minimum CMake version = 3.5
+
+From the CMake 4.0 release notes:
+> Compatibility with versions of CMake older than 3.5 has been removed.
+
+Upstream: https://github.com/flareteam/flare-engine/commit/9500379f886484382bba2f893faf49865de9f2c0
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 897c19c3d..def8121c4 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ Project (Flare)
+-cmake_minimum_required (VERSION 2.8.12)
++cmake_minimum_required (VERSION 3.5)
+ 
+ Set (PACKAGE "FLARE")
+ Set (VERSION "1.14")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
