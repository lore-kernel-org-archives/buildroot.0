Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9902CD4F4A
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 20:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8341409AF;
	Mon, 18 May 2026 20:23:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fpfArZWFfD2g; Mon, 18 May 2026 20:23:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE585409B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779135797;
	bh=Vr3NpBxdkvQLN+H3+2oysPGtyTBkNM3xFqo1qJYTEfQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Xs4TtX3AJ5/lAKNnwTqaV7soF5Aoyj7XfyteHyrIovlEg5KkbFL3t5W26iwguHxp+
	 td/gRsmsDJq6xDGccn6RNtPDwN9JHumocUOG/h5EHDp6h0fLSDN4y4TsExS64kpZYZ
	 oIzu/B70BaWQHFfpf/jmgs66KwVdMJNX8zoPSJMOy+WerHmn2wgd1TKLE/fUwM6XFt
	 k9SKt1hrYHGoeT1jJc9Uu7biALbaJk1R5EYB6yakTJStGLqozPGBJS1PAh2KAR/rL4
	 EpdEuKwYQgIJUVlcecKvWPANqv5jJEAk8j9q3Hphwjsu7+iSojc2U/yxZ3sYedKkxE
	 mxqKqU763MYng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE585409B0;
	Mon, 18 May 2026 20:23:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 38FA0282
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A9BA401D2
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:23:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NEdWvTQbNAB4 for <buildroot@buildroot.org>;
 Mon, 18 May 2026 20:23:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 864C6401C2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 864C6401C2
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:23:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 42F5E866F5; Mon, 18 May 2026 20:23:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 18 May 2026 22:18:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 12a6a7d1c664b8739832b5e8e113048d3f1654bc
X-Git-Newrev: 009b044a449d8905ab8a0a3f8063aead5286c016
X-Patchwork-Hint: ignore
Message-Id: <20260518202308.42F5E866F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/htop: bump to version 3.5.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/009b044a449d8905ab8a0a3f8063aead5286c016
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This patch updates htop from version 3.5.0 to 3.5.1, a minor bugfix
release.

Changelog:
- https://github.com/htop-dev/htop/blob/main/ChangeLog

Builds Tested Using:
- utils/test-pkg -a -p htop

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/htop/htop.hash | 4 ++--
 package/htop/htop.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/htop/htop.hash b/package/htop/htop.hash
index f452d57a88..3d015c6a9d 100644
--- a/package/htop/htop.hash
+++ b/package/htop/htop.hash
@@ -1,5 +1,5 @@
-# From https://github.com/htop-dev/htop/releases/download/3.5.0/htop-3.5.0.tar.xz.sha256
-sha256  b6586e405c5223ebe5ac7828df21edad45cbf90288088bd1b18ad8fa700ffa05  htop-3.5.0.tar.xz
+# From https://github.com/htop-dev/htop/releases/download/3.5.1/htop-3.5.1.tar.xz.sha256
+sha256  526cecd62870aa8d14d2a79a35ea197e4e2b5317d275b567cee0574b2ddb2e9a  htop-3.5.1.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 2b99637366..f42d7bee36 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTOP_VERSION = 3.5.0
+HTOP_VERSION = 3.5.1
 HTOP_SOURCE = htop-$(HTOP_VERSION).tar.xz
 HTOP_SITE = https://github.com/htop-dev/htop/releases/download/$(HTOP_VERSION)
 HTOP_DEPENDENCIES = ncurses
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
