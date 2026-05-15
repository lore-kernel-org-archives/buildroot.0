Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF4ECD8CA8
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7D7485613;
	Tue,  9 Jun 2026 13:01:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G2z23ksRbeVz; Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53EE2855DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010098;
	bh=7j6RWQe4zbgkV0HYfbs7ubbZPoZiKJPfqqqs67lUiNY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TWjRgKIic1nAgr5runp8YEU6ym1Gsro1ZxJVF7jswEoRAXprpPQzh09Qa87WAAyXo
	 JHw0fVTDe+zYuTH5srZ3QeohXoxNzu2lYjhGyf3se0CwuQkbRHKofao68VJGC7g9Gq
	 n8f10chvkWU3bsmhIkboSI57MO+5VBE/qk+wReXd2uyjRHN5C8TtXjMDdRqIrT3Oul
	 8CpJpSHyXVbFq2rRCxJ5wjhwuPMnm6SwKmpzroFZc1+MunK1eEB86iRKAnscosBQTx
	 /q4ncxR7ooeZbRFCGn4tr9YQIAMVOHesUJ2YZsS26UYYBeMVGhUMgTJkRqQASHm8YE
	 EEE9JCUW6GCmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53EE2855DD;
	Tue,  9 Jun 2026 13:01:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0491C2EE
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE50D423C1
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0_7mrEtkKUYJ for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FEF4423C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FEF4423C0
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4FA7E87E8D; Tue,  9 Jun 2026 13:01:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 11:13:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1254fd5c0e90d666abdb6daf60331d4afe065709
X-Git-Newrev: 1c5730ebb5e8b9a67433aa9997e5cfd6cae18cfe
X-Patchwork-Hint: ignore
Message-Id: <20260609130107.4FA7E87E8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/taglib: bump version to 2.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1c5730ebb5e8b9a67433aa9997e5cfd6cae18cfe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/taglib/taglib/blob/v2.3/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/taglib/taglib.hash | 4 ++--
 package/taglib/taglib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/taglib/taglib.hash b/package/taglib/taglib.hash
index 0db3cfa8d6..b118f610ec 100644
--- a/package/taglib/taglib.hash
+++ b/package/taglib/taglib.hash
@@ -1,5 +1,5 @@
-# From https://github.com/taglib/taglib/releases/tag/v2.2.1
-sha256  7e76b5299dcef427c486bffe455098470c8da91cf3ccb9ea804893df57389b5e  taglib-2.2.1.tar.gz
+# From https://github.com/taglib/taglib/releases/tag/v2.3
+sha256  7349f6fd942418bc7009ebe743eb7c9d055f02921ec56fa436ec25007c47fd38  taglib-2.3.tar.gz
 # Locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256  53692a2ed6c6a2c6ec9b32dd0b820dfae91e0a1fcdf625ca9ed0bdf8705fcc4f  COPYING.MPL
diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
index cac9f924fc..924d3f339d 100644
--- a/package/taglib/taglib.mk
+++ b/package/taglib/taglib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TAGLIB_VERSION = 2.2.1
+TAGLIB_VERSION = 2.3
 TAGLIB_SITE = https://taglib.org/releases
 TAGLIB_INSTALL_STAGING = YES
 TAGLIB_DEPENDENCIES = utfcpp
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
