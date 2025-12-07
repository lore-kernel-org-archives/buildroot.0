Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4D2D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 16:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60EBB60D9A;
	Sun,  7 Dec 2025 16:02:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vnH0-arUq6Te; Sun,  7 Dec 2025 16:02:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A97D60B52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765123366;
	bh=7/zlMcRY0o2F4V0YsjFU2P3zOgMvnMMOD7d5aeOC+Sw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=o2dmLzb0aBx+gBX5Y9VPDQ1Ir3ovPtfpjbKuj3YpgDXyB88kI3Izd4P8++ViPmAQ/
	 GU+wKMcMwB1nA/eGwXcOXpeUI1/Ixgs27e/oPOXOTuovl5bqktX+Xg+KyrVUKZJqye
	 E6TySE7RqsfQsb61cy7ZZKrxkCezOgfGAOA5OzMT4yzvf41pY8JQ0XKb3i8nx75xLj
	 r8yrq5qMrC9mv0PtSWhADr5HByrDcbpB0AY1LqduMee7WcjLN2VR17st2gqsEsTeRI
	 bpXnXkgwW7LtIfPuklZBZj5H6Ob+pFHjXcTKwEQFwsMZ8pR5Nt8/RJQNDBKUEV3Jtx
	 PCJ1Cl6ATxILA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A97D60B52;
	Sun,  7 Dec 2025 16:02:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D1650151
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96B8940296
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f3ghmJZRe4Cl for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D0DB403CB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D0DB403CB
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6ADE886715; Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 16:05:54 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 330be1e4c1375e3b1a0e4f84013fe96531edce7c
X-Git-Newrev: ca863d787047dc6cf1f2d20ee60b08e82439642b
X-Patchwork-Hint: ignore
Message-Id: <20251207160225.6ADE886715@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libebml: fix cmake 4
 compatibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=ca863d787047dc6cf1f2d20ee60b08e82439642b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../libebml/0001-drop-CMake-older-than-3.5.patch   | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/libebml/0001-drop-CMake-older-than-3.5.patch b/package/libebml/0001-drop-CMake-older-than-3.5.patch
new file mode 100644
index 0000000000..3a9098f6b3
--- /dev/null
+++ b/package/libebml/0001-drop-CMake-older-than-3.5.patch
@@ -0,0 +1,29 @@
+From 6725c5f0169981cb0bd2ee124fbf0d8ca30b762d Mon Sep 17 00:00:00 2001
+From: Steve Lhomme <slhomme@matroska.org>
+Date: Sat, 24 Feb 2024 08:33:56 +0100
+Subject: [PATCH] drop CMake older than 3.5
+
+It generates a warning with newer versions of CMake.
+3.4 was released in 2015. We require C++17 with compilers only available in 2017/2018.
+If your CMake is older than your toolchain, you have a problem.
+
+There's no need to support legacy CMake going forward in libebml 2.
+
+Upstream: https://github.com/Matroska-Org/libebml/commit/6725c5f0169981cb0bd2ee124fbf0d8ca30b762d
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[backported to version 1.4.5]
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 11ee059a..c7b969a8 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.1.2)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(ebml VERSION 1.4.5)
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
