Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537F1C53219
	for <buildroot@archiver.kernel.org>; Tue, 28 Jul 2026 19:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04D7140909;
	Tue, 28 Jul 2026 19:39:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PS4-L4KRguqN; Tue, 28 Jul 2026 19:39:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D51840A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785267571;
	bh=IHCjfWSjFkuXkbCnvOOgXMqN3X6KUl9SfOrBxYrHKAM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=koEdfefjIXubAc1Xf0bKw/DzHoK84EQ3QNCF1+9ah1bEdGkIsZOtl1fefdd1iRfX+
	 +V25rST3mtmWXF+hypVOBgb8a1fQGWxjxg4Gu65Wg1FLfevgx69HFiHpab2rIS386E
	 J2b7ZVYoZ27fAwi/D2sV2CcLkmz9oLZad9YNXGEr5Ps0km8bfs47ZGj/6WWbT9u1Eq
	 732Vne1/c2OmeH7mxm/UNW/PkEAZox8JeRvAYvAGpLTHme5nO7WiVpaW8WspAJW/bK
	 Fd9jbAuEV7zfImlpWjsSy6vG9KbUCWsZ4/9OIesi/y7AAwO9akW8bja2D38kBdBFsP
	 +znvnWaqR/k4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D51840A4E;
	Tue, 28 Jul 2026 19:39:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F22245B
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 19:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3916440099
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 19:39:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UKg6EuaGO9ER for <buildroot@buildroot.org>;
 Tue, 28 Jul 2026 19:39:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A7E440097
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A7E440097
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 19:39:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B57AD8A53A; Tue, 28 Jul 2026 19:38:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Jul 2026 21:25:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1f92ba142c7fda465ebac7f182c5e01c0fba9b22
X-Git-Newrev: 79ca651aa6d6f2ef2d040cba5260b81eec61a904
X-Patchwork-Hint: ignore
Message-Id: <20260728193847.B57AD8A53A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ustreamer: bump version to 6.61
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/79ca651aa6d6f2ef2d040cba5260b81eec61a904
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog:
https://github.com/pikvm/ustreamer/compare/v6.52...v6.61

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ustreamer/ustreamer.hash | 2 +-
 package/ustreamer/ustreamer.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ustreamer/ustreamer.hash b/package/ustreamer/ustreamer.hash
index f5351e4f9c..1e69272722 100644
--- a/package/ustreamer/ustreamer.hash
+++ b/package/ustreamer/ustreamer.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  db00adfa02acfbdf6682ffae8e418b582d623e1971672d5df19858e02e2f3b0e  ustreamer-6.52.tar.gz
+sha256  d280f260c2c8cf1bf029ac5a0eb79af4c36e7ec0d47b33b37dff7a1c245384c6  ustreamer-6.61.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/ustreamer/ustreamer.mk b/package/ustreamer/ustreamer.mk
index b699b30c84..b9f0e8aafa 100644
--- a/package/ustreamer/ustreamer.mk
+++ b/package/ustreamer/ustreamer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USTREAMER_VERSION = 6.52
+USTREAMER_VERSION = 6.61
 USTREAMER_SITE = $(call github,pikvm,ustreamer,v$(USTREAMER_VERSION))
 USTREAMER_LICENSE = GPL-3.0+
 USTREAMER_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
