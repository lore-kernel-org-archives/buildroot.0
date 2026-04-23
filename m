Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01478FED3F1
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C93ED84C99;
	Fri, 24 Apr 2026 16:38:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9XKNPPr-Uf0n; Fri, 24 Apr 2026 16:38:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3CBC84DE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048723;
	bh=afggYvZ19/n/3C8o/ZxfOjkr5hD8S504h7ptAVt6mwk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bQNs9wuV+/TvqJas4KYY0V1z0/wjCFY2cYjtwdN6ESqvDZP0UyIMKvTXooZUFkVys
	 YgqvHeX9DvKuD2q50mqNRoCqvbwBbYHxBXnRoTxPW4SaC8uEnAIPn7hign/z8+Y+Jz
	 RlLN/z5EP3XEYlPZmsfY7EVpC9rDnZv0vuXygfkgoazwpUXbygFUgPr6KYk1mhoW3/
	 ocJSZgkD94I8GDPS04N6TgLmxPtwRzV+E1TySNs/DTe6oQkOGDjwjsVM6xvloq6mu6
	 gci2Em90WwXFRdZ/1oxrcAuGaFqXSXsrC7a9SmJtDu4oXEL3ifKOX+aj7uwgNRMK+j
	 X+LOaPVdOu16g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3CBC84DE8;
	Fri, 24 Apr 2026 16:38:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A2B0231
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0355F61C35
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:38:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eYgiXlPjQ63l for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:38:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C895261C38
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C895261C38
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:38:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6567182B2F; Fri, 24 Apr 2026 16:38:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Apr 2026 14:23:09 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: d1c44f8cdf61bdce0567cd86f47d04ab0ac9df3f
X-Git-Newrev: 2e3c080b9874a6858a7d2054de7d97fa5489aaae
X-Patchwork-Hint: ignore
Message-Id: <20260424163825.6567182B2F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/bat: remove no
 longer needed patch for gcc15 compat
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2e3c080b9874a6858a7d2054de7d97fa5489aaae
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

The bat 0.26.0 already depends on a newer version of the onig_sys crate,
so the problem that patch is fixing was no already no longer present.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0e2b7e2bee7ea2b40b82a43beaf161cb7fbf3d23)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
