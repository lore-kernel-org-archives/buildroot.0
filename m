Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0504D3B7E2
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 16:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B18040738;
	Sun,  7 Dec 2025 16:02:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lisklKxN39T3; Sun,  7 Dec 2025 16:02:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3413A4072C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765123357;
	bh=5tIcUA4us7f1eGSDq1xGsIMrPfVUHdxfzHqhn2WWbWk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oi833R8pxu5yzhbVPGzyl7z5KFZYnPxJSEADDSzHkl0sKiv7+UmFX2mn5qgcTOLsl
	 R/CL5F3Spy6XqILTqH9/vK99nOSH+8ayatMDmcBZCSqgkIrGlf0wCO22H/b2i/iXf/
	 CMpDS5C/SWYHIGFOzW4XPfbA2uT3IhEcLas63UFyBLPNLGNzP88RvwblLzlCNh4a+i
	 Dph1n5HTd6MMYW1mOgTBGY9PfAVbybYv5m0CHMXxJ8Wbi76agp4+0MeJzwEwrG3lht
	 GOCH7owHZGJFepBl06sfxymoaZzKQ+47oN2H7oAXFQYWHAbDT8ILIwl13cGGX0EgPY
	 ZwUiClUZkZwPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3413A4072C;
	Sun,  7 Dec 2025 16:02:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AC7952F0
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3AA444063C
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F3jXxmvoxNa7 for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 771624066E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 771624066E
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 739F786717; Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 16:05:54 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ca863d787047dc6cf1f2d20ee60b08e82439642b
X-Git-Newrev: cf00a0a1a1dcdc331f0d4b249d9aa867f773a780
X-Patchwork-Hint: ignore
Message-Id: <20251207160225.739F786717@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libmatroska: fix cmake
 4 compatibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf00a0a1a1dcdc331f0d4b249d9aa867f773a780
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-drop-CMake-older-than-3.5.patch           | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/libmatroska/0001-drop-CMake-older-than-3.5.patch b/package/libmatroska/0001-drop-CMake-older-than-3.5.patch
new file mode 100644
index 0000000000..25e09ed7bc
--- /dev/null
+++ b/package/libmatroska/0001-drop-CMake-older-than-3.5.patch
@@ -0,0 +1,29 @@
+From dc80e194e93e6f0e25c8ad3e015d83aca2a99e10 Mon Sep 17 00:00:00 2001
+From: Steve Lhomme <slhomme@matroska.org>
+Date: Sat, 24 Feb 2024 08:38:00 +0100
+Subject: [PATCH] drop CMake older than 3.5
+
+It generates a warning with newer versions of CMake.
+3.4 was released in 2015. We require C++17 with compilers only available in 2017/2018.
+If your CMake is older than your toolchain, you have a problem.
+
+There's no need to support legacy CMake going forward in libebml 2/libmatroska 2.
+
+Upstream: https://github.com/Matroska-Org/libmatroska/commit/dc80e194e93e6f0e25c8ad3e015d83aca2a99e10
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[backported to version 1.7.1]
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 221c8ac6..97b392e0 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.1.2)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(matroska VERSION 1.7.1)
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
