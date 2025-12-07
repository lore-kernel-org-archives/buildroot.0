Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1889ED43370
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA6BF8403E;
	Fri, 12 Dec 2025 07:58:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3tn9U31tLDJm; Fri, 12 Dec 2025 07:58:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A20AA83D9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526256;
	bh=A+RhERnm62mVAHSqhD5957qQfVp3WYdHybkSb0JtJgU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GSR7GWVUtAoqd23cu6Om/QOP2D+uTMOynxQicpAGSBRv6Cif8KKCYAH8zjNydm/TK
	 j+U3u28Uekh5/Emxi04tiCg2T3Kix7brLkfVdmRJOPjfI7Spf2eUr/RPHH6TI1Z+XN
	 BWonTcdbgV3xglP/ZfWOuikQVVPZcOOGxu1Pau37VM8b4P4m5hKAjgDmhEAryvifGt
	 t3PC4T61y9UtvnIMfm+vYvdukhce3XQTkx2QvlGtDT8pgyE6iGe8HBapZcPl4B+fTl
	 j7h6CT3Buc1swoJxP577EGkx+niaFA/r9kMYLyASP5Vp5lwtF5NSSnhY/3TJBra357
	 jC2dO/wEX7IyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A20AA83D9C;
	Fri, 12 Dec 2025 07:57:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15D1A2C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74BFD4115F
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dbQh2HPzA1tY for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56C6D41160
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56C6D41160
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 55EE081674; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 14:16:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf82c2e0540511a7b40602da283eab5a3eacd220
X-Git-Newrev: cb2e7531df00a4307841794df75489102f04d654
X-Patchwork-Hint: ignore
Message-Id: <20251212075537.55EE081674@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bullet: fix cmake 4 compatibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=cb2e7531df00a4307841794df75489102f04d654
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-update-CMake-required-version.patch       | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/package/bullet/0001-update-CMake-required-version.patch b/package/bullet/0001-update-CMake-required-version.patch
new file mode 100644
index 0000000000..f2805c90cf
--- /dev/null
+++ b/package/bullet/0001-update-CMake-required-version.patch
@@ -0,0 +1,22 @@
+From d1a4256b3a019117f2bb6cb8c63d6367aaf512e2 Mon Sep 17 00:00:00 2001
+From: Erwin Coumans <erwincoumans@gmail.com>
+Date: Wed, 23 Apr 2025 14:17:20 -0700
+Subject: [PATCH] update CMake required version
+
+Upstream: https://github.com/bulletphysics/bullet3/commit/d1a4256b3a019117f2bb6cb8c63d6367aaf512e2
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index a695b71726..e7a58e6d67 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.4.3)
++cmake_minimum_required(VERSION 3.5)
+ set(CMAKE_ALLOW_LOOSE_LOOP_CONSTRUCTS true)
+ cmake_policy(SET CMP0017 NEW)
+ #this line has to appear before 'PROJECT' in order to be able to disable incremental linking
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
