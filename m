Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419D9CD6E52
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 17:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAB6D84FCE;
	Sun, 31 May 2026 17:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y7AOflt1XAB3; Sun, 31 May 2026 17:38:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1395384FD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780249132;
	bh=+80N2O3dXxtPGQVWXj5vNYnRLGOcp6liHGNXIShpS04=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CGFJQFAUXHZuuh1Y7G4Y2a1SFjg27xZ3bKB8h35Kd6WrjXSSCV/gU3GjnWc8tv55K
	 SRR5/3Bp3uHCTU/6nhxBl4kyP530jfYnWHqjUKkmujrcB8UxhsXYrYn1pR6aVbZ1fo
	 jSIkRC/rbAG10rAEbCDb4F48gxYxYmonW9GvGs2SkQwOo3GkNq3E7jiz4Y1lH4t2H2
	 GIXyJ62TRqBf4v5oheQKqnL3vb5P/nI2wFYY7CbIY9WpSCMXeFQMnelRASwLYU/QjJ
	 grvhBEzavEYAycKDon8/k7UkjQqWcnuxyaZxTsLDlxDlgyFCRegJDB2VR2EqMMWTex
	 wgW0kL7G0avOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1395384FD0;
	Sun, 31 May 2026 17:38:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DD847F4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C319740232
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:38:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gv9L20LZWO44 for <buildroot@buildroot.org>;
 Sun, 31 May 2026 17:38:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B207401E9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B207401E9
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:38:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85827876F4; Sun, 31 May 2026 17:38:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 19:38:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a72da6d7f5bba1113d5b6962498f2f8540ac31fa
X-Git-Newrev: 2bfe1da97054413814d26e4d1705fb2fc77cffa8
X-Patchwork-Hint: ignore
Message-Id: <20260531173836.85827876F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cppdb: remove stale patch
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2bfe1da97054413814d26e4d1705fb2fc77cffa8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Remove a stale patch which was not removed when the cppdb package was
removed by buildroot commit b7143b2e22dc6d5f6bc0f7fe745118db7dbcb787.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...eLists.txt-fix-compatibility-with-CMake-4.patch | 24 ----------------------
 1 file changed, 24 deletions(-)

diff --git a/package/cppdb/0002-CMakeLists.txt-fix-compatibility-with-CMake-4.patch b/package/cppdb/0002-CMakeLists.txt-fix-compatibility-with-CMake-4.patch
deleted file mode 100644
index 3bba81f563..0000000000
--- a/package/cppdb/0002-CMakeLists.txt-fix-compatibility-with-CMake-4.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 27003c60a05dd3921538323a53b1650e289cba8c Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Wed, 17 Dec 2025 22:27:33 +0100
-Subject: [PATCH] CMakeLists.txt: fix compatibility with CMake 4
-
-Upstream: N/A, dead upstream
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 5e81b09..32ff3a6 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 2.6)
-+cmake_minimum_required(VERSION 3.5)
- project(cppdb)
- 
- set(CPPDB_MAJOR 0)
--- 
-2.52.0
-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
