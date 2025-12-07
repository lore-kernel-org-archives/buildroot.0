Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCF8D3B7E2
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 16:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1E9F40703;
	Sun,  7 Dec 2025 16:02:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 577I4h3XePJT; Sun,  7 Dec 2025 16:02:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EED0840730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765123361;
	bh=Sg6iGWQVPW6YeWjlX/fyUNtoheYoA7tg+lHJhxBrXpc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YbjPN0mdZNEcYrgw6MMtKpZtWfpzkDcatsgey41S8DclzMWc+3NoPpdLxCzDZeeUx
	 9L76pP8OhL5BoDlswPeT6f7PWXzLYZ1PvfvYoBc0w0cc6Ko104WT3g42pDyPgIHm3u
	 9khhY6s005e6nxJu/4gy4kDzyefYKeckngWvkwnoXmUKsnP3ZA97jysHgt1maIoS1p
	 puAi2nR41ljkKBtZ1/3umVQXp8Tuyjt4R2uLnit5XE7mUVvE16FXLh6bq4JVMu3nwo
	 M7zLSmwFc956+6Q7I+/LxsClBO4emuQnwP6ir0KWSe97wA1V2C6D/TUsoKqaQGmCQa
	 JLIMqslg12p5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EED0840730;
	Sun,  7 Dec 2025 16:02:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B9ED42F0
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 897304066E
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ULeksSso1IeS for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADCF74067B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADCF74067B
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB0C086717; Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 16:43:17 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d5cccad9a3931f4ffe1be3f6f7d2feeb8eec519d
X-Git-Newrev: 3ee507df7c9bbed54a2c3b4deac7fc9ab151a7c7
X-Patchwork-Hint: ignore
Message-Id: <20251207160225.AB0C086717@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qhull: fix cmake 4
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ee507df7c9bbed54a2c3b4deac7fc9ab151a7c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/qhull/0001-Cmake-improvements.patch | 37 +++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/qhull/0001-Cmake-improvements.patch b/package/qhull/0001-Cmake-improvements.patch
new file mode 100644
index 0000000000..c75bb7932b
--- /dev/null
+++ b/package/qhull/0001-Cmake-improvements.patch
@@ -0,0 +1,37 @@
+From 62ccc56af071eaa478bef6ed41fd7a55d3bb2d80 Mon Sep 17 00:00:00 2001
+From: Cristian Le <github@lecris.me>
+Date: Wed, 2 Jul 2025 15:07:37 +0200
+Subject: [PATCH] Cmake improvements (#158)
+
+* Bump CMake policies -- Add higher policy bound (it is not the maximum version of CMake that can build, it's an indication that the lower bound can be bumped up to that version without degradation)
+
+* Use GNUInstallDirs -- This has been the standard install interface since CMake 3.0
+
+* Use more common design for the Config.cmake
+
+* Use `target_include_directories` -- Use target_include_directories to propagate the include directory.  Note: I don't know how the user consumes the package as #include <file.h> or #include <dir/file.h>, it is the latter in this implementation.
+
+[cbbarber] user_eg_r.c uses
+     #include "libqhull_r/qhull_ra.h"
+
+Upstream: https://github.com/qhull/qhull/commit/62ccc56af071eaa478bef6ed41fd7a55d3bb2d80
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[removed other parts of the patch, kept cmake bump, rebased for 8.0.2]
+---
+ CMakeLists.txt        | 105 ++++++++++++++++++++++++------------------
+ 3 files changed, 63 insertions(+), 48 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index b2060f49..28714b15 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -68,7 +68,7 @@
+ # $DateTime: 2020/09/03 21:26:22 $$Author: bbarber $
+ 
+ project(qhull)
+-cmake_minimum_required(VERSION 3.0)
++cmake_minimum_required(VERSION 3.5...4.0)
+ 
+ # Define qhull_VERSION in README.txt, Announce.txt, qh-get.htm, CMakeLists.txt
+ #   qhull-zip.sh (twice), qhull-wiki.md, qhull-news.htm, File_id.diz, index.htm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
