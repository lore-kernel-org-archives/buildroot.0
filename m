Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25E8D0D152
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 955D940E48;
	Wed,  7 Jan 2026 18:01:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z3ogR0VGl9l9; Wed,  7 Jan 2026 18:01:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A12F040E93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808883;
	bh=YhcHITUmYzEmn2FS/puw34kmEvUGGN38VHeaBN6hToc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XMZo1X6j0mNOPA5mXJlM8tXrIl2bhArxdqo13qTRci/ZLdKWQUCJKtmSAz9h9VvLF
	 kydk/Erkv5q8oqsk1cG0ycz+hU8mzIVoWfxiodx1U6SPcKKJjWyIPAqkJJWvhKAE2q
	 +GZzSNJ+aKtxrGO/ELBJxwOz9ILeMaGYTULjJvydtptYMcTJ7I//D7cQGySxbYVkeW
	 I8k6jcbPFSsejiVZcakLafnBIUbZG3GRYdG9o+1MDUo0UiBYk09nPrlHT439/wxDFn
	 dqYMS6pdWeDD+cBwx59kE4F0DMDsd0v8Xs8Yk79OJ+THnU7UCA58qTbyL30cLOWFEq
	 LphLKW98j5eaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A12F040E93;
	Wed,  7 Jan 2026 18:01:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2014D9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95D5180C85
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yHkjWp4YiekF for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1E2F80C8D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1E2F80C8D
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F0E8488353; Wed,  7 Jan 2026 18:01:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 17:32:52 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 14e37d02782411e1888ae2ad927926979e91f9c8
X-Git-Newrev: b9238d89a4e732f3bd4abd6918ebacdc29070998
X-Patchwork-Hint: ignore
Message-Id: <20260107180110.F0E8488353@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/linenoise:
 security bump to version e26268de5e
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

commit: https://git.buildroot.net/buildroot/commit/?id=b9238d89a4e732f3bd4abd6918ebacdc29070998
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Fixes:
CVE-2025-9810: TOCTOU in linenoiseHistorySave
https://www.cve.org/CVERecord?id=CVE-2025-9810

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3c7cbf97d707e22d07c27894dc8ab3004ad86564)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/linenoise/linenoise.hash | 2 +-
 package/linenoise/linenoise.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linenoise/linenoise.hash b/package/linenoise/linenoise.hash
index 9a1436eb8b..3f82ba0ff9 100644
--- a/package/linenoise/linenoise.hash
+++ b/package/linenoise/linenoise.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1086f82fbf30b0618b1953b05d33db62c68fc7ce49391ce1374192f776fde72d  linenoise-97d2850af13c339369093b78abe5265845d78220.tar.gz
+sha256  d5e702e7e04f0fcd09393bd4c010ce2bb19b4d137e22f2dd6064e848f4a6b5b2  linenoise-e26268de5e56bfaad773786471844578fe9f7f4b.tar.gz
 sha256  efe1692aa5b869edaa0ac88f95eb0276c1125304ffc636a299db3ebbab47f62b  LICENSE
diff --git a/package/linenoise/linenoise.mk b/package/linenoise/linenoise.mk
index fd2c4c7035..05f8aa4845 100644
--- a/package/linenoise/linenoise.mk
+++ b/package/linenoise/linenoise.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINENOISE_VERSION = 97d2850af13c339369093b78abe5265845d78220
+LINENOISE_VERSION = e26268de5e56bfaad773786471844578fe9f7f4b
 LINENOISE_SITE = $(call github,antirez,linenoise,$(LINENOISE_VERSION))
 LINENOISE_LICENSE = BSD-2-Clause
 LINENOISE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
