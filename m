Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C9AF428F5
	for <buildroot@archiver.kernel.org>; Wed, 15 Apr 2026 20:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BABBD42883;
	Wed, 15 Apr 2026 20:42:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZUn8odpbKTkS; Wed, 15 Apr 2026 20:42:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9FF942A50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776285766;
	bh=1nyDmyBde2IrlZxetlZHGNZIC+T9G/cDv8O+rghIZ6M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YRnV+XiybgIOuwV0XaqiMAS4D5wH/v2sc/eI1KRiGihcYgtK+mkRmUdhUdT0JG1VV
	 TkIDh81PiBYTDAB3URwibXYuK7htL3Mt/M0B/C+GiltOrVhwKr/F+4M5GwkqrWMEE8
	 dIGu8HROPAWrK3mpXEpSynYkzAig1pvo9HymqE11FXpiykb+S8uC+B2UrjGriPnwvB
	 mZUD8jmumnaNzhqSdttYPRE5f/gPEWHP1JYCw9Ij7Hglo/UxWpV5xwZ1rC75sEWNd+
	 sgRZ0e7s3a2GJwnqX1aN57GPOiQh/fufyTKlKxJY5oeXHKAXUhD9NeYhGNZAFT4rfS
	 Xa0L8JOWMLgbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9FF942A50;
	Wed, 15 Apr 2026 20:42:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 69658283
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 20:42:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F83D40639
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 20:42:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i6JUCmz608xZ for <buildroot@buildroot.org>;
 Wed, 15 Apr 2026 20:42:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7358A400A7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7358A400A7
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 20:42:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 17AB0816A4; Wed, 15 Apr 2026 20:42:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 15 Apr 2026 21:59:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 63ef731ba3138f2ef78719869735193b4ccf02c3
X-Git-Newrev: 0e2b7e2bee7ea2b40b82a43beaf161cb7fbf3d23
X-Patchwork-Hint: ignore
Message-Id: <20260415204242.17AB0816A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bat: remove no longer needed patch
 for gcc15 compat
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0e2b7e2bee7ea2b40b82a43beaf161cb7fbf3d23
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The bat 0.26.0 already depends on a newer version of the onig_sys crate,
so the problem that patch is fixing was no already no longer present.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ex-onig-by-regex-fancy-in-minimal-applica.patch | 47 ----------------------
 1 file changed, 47 deletions(-)

diff --git a/package/bat/0001-Replace-regex-onig-by-regex-fancy-in-minimal-applica.patch b/package/bat/0001-Replace-regex-onig-by-regex-fancy-in-minimal-applica.patch
deleted file mode 100644
index de6a3fc70c..0000000000
--- a/package/bat/0001-Replace-regex-onig-by-regex-fancy-in-minimal-applica.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 9b6727df25e45222b3863dbe5f5bc58237b68ab9 Mon Sep 17 00:00:00 2001
-From: El Mehdi YOUNES <elmehdi.younes@smile.fr>
-Date: Tue, 2 Sep 2025 14:02:11 +0200
-Subject: [PATCH] Replace regex-onig by regex-fancy in minimal-application
-
-The default "application" feature enables "minimal-application", which
-in turn pulls in the "regex-onig" feature of syntect. This brings in the
-onig crate (version 6.4.0) and its dependency onig_sys, which fail to
-build with GCC 15 due to C23 keyword conflicts.
-
-It is not possible to simply update the onig crate from bat itself,
-since its version is pinned indirectly by syntect. To avoid this
-dependency and fix the build, replace "regex-onig" with "regex-fancy" in
-"minimal-application". This makes bat use the pure-Rust fancy-regex
-engine instead of Oniguruma, removing the need for onig_sys and allowing
-the package to build with GCC 15.
-
-There is an an ongoing discussion about removing Oniguruma from bat
-since Oniguruma has been declared archived:
-
-see https://github.com/sharkdp/bat/issues/3285
-
-The Upstream project for now is refusing to use fancy-regex as default.
-
-Upstream: not submitted
-
-Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
----
- Cargo.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Cargo.toml b/Cargo.toml
-index 80d19321..93a07a1d 100644
---- a/Cargo.toml
-+++ b/Cargo.toml
-@@ -29,7 +29,7 @@ minimal-application = [
-     "clap",
-     "etcetera",
-     "paging",
--    "regex-onig",
-+    "regex-fancy",
-     "wild",
- ]
- git = ["git2"] # Support indicating git modifications
--- 
-2.43.0
-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
