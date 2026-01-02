Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2EAFA3758
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 20:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55B068142B;
	Fri,  2 Jan 2026 20:53:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R3yJwU87BBhm; Fri,  2 Jan 2026 20:53:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B45688125E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767387210;
	bh=5O47qPLIXGRaaxX1zGwPgZ7zP0g/xVe0xY19NpaENLI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JXYlBJCsanwsmbRXDp3JwBovtWiRH8ErnkXqwZz+chtV3D+aC+oVpqUvQh+d4Usz2
	 S6vtsHnOFQPQ+30KwHTrl7o4kqS/9yGH6YZCLOrvMdryeASYD1+wG6IPhdh8Z67/2z
	 /A9cQ/7Nb8DZudDxFu5VmaQo7Pqk+GHlmguhwTeSUo3E9uwHQWSdKdTP1+p6YvipzM
	 DARxYwCNrD6N/k1ti4okwrHH0dqi6uHioRnPXcnKJ9s0islcKNfcK5Sk/raTBfXry/
	 G6JjiYd/JQMx51une4IUWML2Dfr44zAWJWHelw1DFcAHMQlK3FMdiTMk0M/3tRCnwd
	 CXB1jiICKld3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B45688125E;
	Fri,  2 Jan 2026 20:53:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D02FC202
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE0B740888
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:53:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DTU6bS_aEqmg for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 20:53:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED0BB4068F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED0BB4068F
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:53:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD9DF88098; Fri,  2 Jan 2026 20:53:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 21:51:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ba59c12e9190772bfbf25374fe6a66611b43a79
X-Git-Newrev: 675f31751f2683a1c36e168c3e66aba56c5cb045
X-Patchwork-Hint: ignore
Message-Id: <20260102205328.DD9DF88098@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcorrect: fix build with cmake 4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=675f31751f2683a1c36e168c3e66aba56c5cb045
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://autobuild.buildroot.net/results/44b/44b881a3455ff6a77f29532f25c12c40c34ceac4/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ped-cmake_minimum_required-to-Version-3.5.patch | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/package/libcorrect/0001-bumped-cmake_minimum_required-to-Version-3.5.patch b/package/libcorrect/0001-bumped-cmake_minimum_required-to-Version-3.5.patch
new file mode 100644
index 0000000000..95e76ee43f
--- /dev/null
+++ b/package/libcorrect/0001-bumped-cmake_minimum_required-to-Version-3.5.patch
@@ -0,0 +1,24 @@
+From 8e779493cd1597b8a9c50ff48f97d4e5d10f96d6 Mon Sep 17 00:00:00 2001
+From: Tobias Wellnitz <tobias@dh1tw.de>
+Date: Sat, 27 Sep 2025 23:51:48 +0200
+Subject: [PATCH] bumped cmake_minimum_required to Version 3.5
+
+Modern Cmake versions require cmake_mininum_required to be at least Version 3.5
+
+Upstream: https://github.com/quiet/libcorrect/pull/50
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 2e8e07e..67ea044 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.5)
+ project(Correct C)
+ include(CheckLibraryExists)
+ include(CheckIncludeFiles)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
